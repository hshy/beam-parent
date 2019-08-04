<template>
    <div class="table">
        <div class="crumbs">
            <el-breadcrumb separator="/">
                <el-breadcrumb-item><i class="el-icon-lx-people"></i> 管理</el-breadcrumb-item>
            </el-breadcrumb>
        </div>
        <div class="container">
            <div class="handle-box">
                <el-input style="width: 120px" v-model="req.keyword" placeholder="请输入关键字"></el-input>
                <el-button type="primary" icon="search" @click="search">搜索</el-button>
                <el-button type="danger" icon="delete" class="handle-del mr10" @click="delAll">批量删除</el-button>
                <el-button type="primary" icon="add" class="handle-del mr10" @click="handleAdd">新增</el-button>
            </div>
            <el-table :data="tableData" v-loading="loading" border class="table" ref="multipleTable"
                      @selection-change="handleSelectionChange">
                <el-table-column type="selection" width="55" align="center"></el-table-column>
                <el-table-column
                    label="标题"
                    align="center"
                    prop="title">
                </el-table-column>
                <el-table-column
                    label="作者"
                    align="center"
                    prop="author">
                </el-table-column>
                <el-table-column
                    width="160"
                    label="是否可用"
                    align="center">
                    <template slot-scope="scope">
                        <p>{{scope.row.frozen==1? '可用' : '不可用'}}</p>
                    </template>
                </el-table-column>

                <el-table-column
                    label="创建时间"
                    align="center"
                    prop="createTime">
                </el-table-column>
                <el-table-column
                    label="更新时间"
                    align="center"
                    prop="updateTime">
                </el-table-column>
                <el-table-column label="操作" width="180" align="center">
                    <template slot-scope="scope">
                        <el-button type="text" icon="el-icon-edit" @click="handleEdit(scope.$index, scope.row)">编辑
                        </el-button>
                        <el-button type="text" icon="el-icon-delete" class="red"
                                   @click="handleDelete(scope.$index, scope.row)">删除
                        </el-button>
                    </template>
                </el-table-column>
            </el-table>
            <div class="pagination">
                <el-pagination
                    background
                    :page-sizes="[10, 20, 30, 40, 50]"
                    :page-size="page.pageSize"
                    :current-page="page.pageNo"
                    @current-change="handleCurrentChange"
                    @size-change="changePageSize"
                    layout="prev, pager, next"
                    :total="page.totalRows">
                </el-pagination>
            </div>
        </div>

        <!-- 编辑弹出框 -->
        <el-dialog title="编辑" :visible.sync="editVisible" width="60%">

            <el-form ref="article" :model="article" label-width="100px">
                <el-form-item label="标题" prop="title">
                    <el-input v-model.trim="article.title"></el-input>
                </el-form-item>
                <el-form-item label="作者" prop="author">
                    <el-input v-model.trim="article.author"></el-input>
                </el-form-item>
                <el-form-item label="内容" prop="content">
                    <mavon-editor :subfield="false" defaultOpen="edit" v-model="article.content"/>
                </el-form-item>
                <el-form-item label="是否可用" prop="status">
                    <el-switch v-model="article.frozen" :active-text="article.frozen ? '可用' : '不可用'"></el-switch>
                </el-form-item>

            </el-form>
            <span slot="footer" class="dialog-footer">
                <el-button @click="editVisible = false">取 消</el-button>
                <el-button type="primary" :loading="loading" @click="saveEdit">确 定</el-button>
            </span>
        </el-dialog>

        <!-- 删除提示框 -->
        <el-dialog title="提示" :visible.sync="delVisible" width="300px" center>
            <div class="del-dialog-cnt">删除不可恢复，是否确定删除？</div>
            <span slot="footer" class="dialog-footer">
                <el-button @click="delVisible = false">取 消</el-button>
                <el-button type="primary" @click="deleteRow">确 定</el-button>
            </span>
        </el-dialog>
    </div>
</template>

<script>
    import ArticleApi from '../../api/business/article';
    import {quillRedefine} from 'vue-quill-editor-upload'//引入图片上传
    import 'quill/dist/quill.core.css';
    import 'quill/dist/quill.snow.css';
    import 'quill/dist/quill.bubble.css';
    import {quillEditor} from 'vue-quill-editor';

    import {mavonEditor} from 'mavon-editor'
    import 'mavon-editor/dist/css/index.css'

    export default {
        name: 'basetable',
        components:{
            quillEditor,
            quillRedefine,
            mavonEditor
        },
        data() {
            return {
                tableData: [],
                page: {pageNo: 1, pageSize: 20},
                multipleSelection: [],
                is_search: false,
                editVisible: false,
                delVisible: false,
                article: {},
                idx: -1,
                ids: [],
                req: {},
                accountInput: true,
                loading: false,
                editorOption: {},
            }
        },
        created() {
            this.getData();
            this.initQuillOption();


        },
        computed: {},
        methods: {
            initQuillOption(){
                this.editorOption = quillRedefine(//修改富文本编辑器图片上传路径
                    {
                        // 图片上传的设置
                        uploadConfig: {
                            name: 'file',  // 图片上传参数名
                            action: "/beam_ht/file/upload",  // 必填参数 图片上传地址
                            methods: 'POST',
                            res: (res) => {
                                console.log(res);
                                return res.data;//return图片url
                            },
                        },

                    })
            },
            handleCurrentChange(val) {
                this.page.pageNo = val;
                this.getData();
            },
            changePageSize(value) { // 修改每页条数size
                this.page.pageNo = 1
                this.page.pageSize = value
                this.tableData = null
                this.getData()
            },
            reload() {
                this.page.pageNo = 1
                this.getData()
            },
            // 获取 easy-mock 的模拟数据
            getData() {

                this.loading = true;
                this.req.currentPage = this.page.pageNo
                this.req.pageSize = this.page.pageSize
                ArticleApi.getData(this.req).then((res) => {
                    this.loading = false;
                    if (res.error === false) {
                        this.tableData = res.data.records ? res.data.records : []
                        this.page.pageNo = parseInt(res.data.current)
                        this.page.totalRows = parseInt(res.data.total)
                        this.tableData.forEach(item => {
                            item.frozen = Boolean(item.frozen)
                        })
                    } else {
                        this.$message.error(res.msg);
                    }
                }, (err) => {
                    this.loading = false;
                    this.$message.error(err.msg);
                });
            },
            search() {
                this.is_search = true;
                this.getData();
            },

            handleAdd() {
                this.article = {};
                this.editVisible = true;
            },
            handleEdit(index, row) {
                this.editVisible = true;
                this.idx = index;
                const item = this.tableData[index];
                this.article = item;

            },
            handleDelete(index, row) {
                this.ids = [row.id];
                this.delVisible = true;
            },
            delAll() {
                this.delVisible = true;
                this.ids = [];
                const length = this.multipleSelection.length;
                for (let i = 0; i < length; i++) {
                    this.ids.push(this.multipleSelection[i].id);
                }

            },
            handleSelectionChange(val) {
                this.multipleSelection = val;
            },
            // 保存编辑
            saveEdit() {
                // this.$set(this.tableData, this.idx, this.article);
                this.loading = true
                ArticleApi.save(this.article).then((res) => {
                    this.loading = false
                    if (res.error === false) {
                        this.editVisible = false
                        this.$message.success(res.msg);
                        this.reload()
                    } else {
                        this.$message.error(res.msg);
                    }
                }, (err) => {
                    this.loading = false
                    this.$message.error(err.msg);
                })

            },
            // 确定删除
            deleteRow() {
                ArticleApi.batchDelete(this.ids).then((res) => {
                    if (res.error === false) {
                        this.$message.success(res.msg);
                        this.reload()
                    } else {
                        this.$message.error(res.msg);
                    }

                }, (err) => {
                    this.$message.error(err.msg);
                })
                this.delVisible = false;
            },


        }
    }

</script>

<style scoped>
    .handle-box {
        margin-bottom: 20px;
    }

    .handle-select {
        width: 120px;
    }

    .handle-input {
        width: 300px;
        display: inline-block;
    }

    .del-dialog-cnt {
        font-size: 16px;
        text-align: center
    }

    .table {
        width: 100%;
        font-size: 14px;
    }

    .red {
        color: #ff0000;
    }
</style>
