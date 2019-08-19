<template>
    <el-container >
            <el-aside class="aside-left-box">
                <el-card class="category-box" :body-style="{width:'300px', padding: '14px'}" >
                    <div slot="header">
                        <span style="font-size: 1.3em;font-weight: 700;">分类</span>
                    </div>
                    <div @click="selectCategory(category.id)"   v-for="category in categoryList" :key="category.id" :class="category.id==req.cid?'category-item category-active':'category-item'">
                        {{category.name}}（{{category.articleCount}}）
                    </div>
                </el-card>
            </el-aside>
            <el-container >
                <el-main class="main-box">
                    <div class="article-list">
                        <div class="article-item"  @click="goToDetail(article.shortCode)" v-for="article in articleList">
                            <el-card :body-style="{width:'100%',height:'50%', padding: '0px'}">
                                <div style="padding: 14px;">
                                    <span>{{article.title}}</span>
                                    <div class="article-bottom clearfix">
                                        <time class="article-time">{{article.createTime}}</time>
                                        <span class="views-count">阅读 {{article.readNum}}</span>
                                    </div>
                                </div>
                            </el-card>
                        </div>
                    </div>
                </el-main>
            </el-container>
            <el-aside style="width: 500px;" class="aside-right-box">
                <el-card class="right-box-1" :body-style="{width:'500px', padding: '14px'}" >
                    <div  class="category-item">
                        <a href="https://portal.qiniu.com/signup?code=1h8cpibemhb9u">七牛云每月10G免费空间与流量</a>
                    </div>
                    <div  class="category-item">
                        <a href="https://chuangke.aliyun.com/invite?userCode=647hkjjy" target="_blank"><img src="/static/img/hot-1.gif">阿里云8月爆款限时抢，力省11000+
                        </a>
                    </div>
                </el-card>
                <el-card  class="right-box-2" >
                    <div class="user-info">
                        <img style="width: 100px;height: 100px;" src="http://img.hsshy.cn/5f3cf4da-b38f-4b0c-be54-93e35a637056.png" class="user-avator" alt="">
                        <div class="user-info-cont">
                            <div >光有工具</div>
                            <div>图片文字识别、动植物识别、车型识别、二维码生成解析、手写板等工具</div>
                        </div>
                    </div>
                </el-card>
                <el-card class="right-box-3">
                    <el-image src="http://img.hsshy.cn/cd9cb95c-1967-40b7-ae94-38ebb699e18f.png"></el-image>
                </el-card>
            </el-aside>


    </el-container>


</template>

<script>
    import BlogApi from '../../api/business/blog';

    export default {
        name: "index",
        data() {
            return {
                activeIndex: 'index',
                articleList: [],
                req:[],
                categoryList:[]

            };
        },
        created() {
            this.getArticleList();
            this.getCategoryList();
        },
        methods: {
            // 获取 easy-mock 的模拟数据
            getArticleList() {
                const loading = this.$loading({
                    lock: true,
                    text: 'Loading',
                    spinner: 'el-icon-loading',
                    background: 'rgba(0, 0, 0, 0.7)'
                });
                BlogApi.getArticleList(this.req).then((res) => {
                    if (res.error === false) {
                        loading.close();
                        this.articleList = res.data ? res.data : []
                    } else {
                        this.$message.error(res.msg);
                    }
                }, (err) => {
                    this.loading = false;
                    this.$message.error(err.msg);
                });
            },
            getCategoryList(){
                BlogApi.getCategoryList().then((res) => {
                    if (res.error === false) {
                        this.categoryList = res.data;
                    } else {
                        this.$message.error(res.msg);
                    }
                }, (err) => {
                    this.$message.error(err.msg);
                })
            },
            handleSelect(key, keyPath) {
                if(key=='index'){
                    this.$router.push({path: `/blog/index`})
                }
                else if(key=='about'){
                    this.$message.error("暂未开放");
                }
                else if(key=='friendLink'){
                    this.$message.error("暂未开放");
                }
                else if(key=='tool'){
                    this.$message.error("暂未开放");
                }
            },
            goToDetail(shortCode){
                this.$router.push({path: `/blog/detail/${shortCode}`})
            },
            selectCategory(cid){
                this.req.cid = cid;
                this.getArticleList();
            }
        }
    }
</script>

<style>

    .main-box {
        width: 100%;
        height: 100%;
        overflow-y: hidden;
    }
    .article-list {
        width: 100%;
        height: 100%;
        display: flex;
        flex-direction: column;
        justify-content: flex-start;
        align-items: center;
        margin-bottom: 300px;
    }
    .article-item {
        width: 80%;
        margin-bottom: 10px;
        cursor: pointer;
    }
    .article-time {
        font-size: 13px;
        color: #999;
    }
    .views-count{
        font-size: 12px;
        color: #999;
        float: right;
    }
    .article-bottom {
        margin-top: 13px;
        line-height: 12px;
    }
    .aside-left-box {
        display: flex;
        justify-content: center;
        height: 100%;
    }
    .aside-right-box {
        display: flex;
        justify-content: center;
        flex-direction: column;
        height: 100%;
    }
    .right-box-1 {
        height: 80%;
        width: 80%;
        margin-top: 5%;
    }
    .right-box-2 {
        height: 80%;
        width: 80%;
        margin-top: 5%;
    }
    .right-box-3 {
        height: 80%;
        width: 80%;
        margin-top: 5%;
        display: flex;
        justify-content: center;
    }
    .category-box {
        height: 80%;
        width: 80%;
        margin-top: 10%;
    }
    .category-item {
        font-size: 15px;
        padding: 10px 0;
        cursor: pointer;
    }
    .category-active {
        color: #38b7ea;
    }
    .category-item a{
        color: #38b7ea;
    }
    .user-info {
        display: flex;
        align-items: center;
        padding-bottom: 20px;
        border-bottom: 2px solid #ccc;
        margin-bottom: 20px;
    }
    .user-info-cont {
        padding-left: 50px;
        flex: 1;
        font-size: 14px;
        color: #999;
    }
</style>
