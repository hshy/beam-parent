<template>
    <div id="blog" class="blog">
        <el-header>
            <div class="header-box">
                <el-menu :default-active="menuActiveIndex"  class="menu-box" mode="horizontal" @select="handleSelect">
                    <el-menu-item index="index">首页</el-menu-item>
                    <el-menu-item index="about">关于</el-menu-item>
                    <el-menu-item index="friendLink">友链</el-menu-item>
                    <el-menu-item index="tool">工具</el-menu-item>
                    <el-menu-item  index="detail"></el-menu-item>
                </el-menu>
            </div>
        </el-header>
        <router-view></router-view>

    </div>
</template>

<script>
    // import bus from '../../common/bus';
    export default {
        data() {
            return {
                // menuActiveIndex:'index'
            };
        },
        computed:{
            menuActiveIndex: function () {
                return this.$store.state.menuActiveIndex;
            },
            // menuActiveIndex: function () {
            //     通过中央事件总线插件vue-bus
            //     return this.indexValue;
            // }
        },
        created() {
            // bus.$on('changeMenuActiveIndex', key => {
            //     this.indexValue = key;
            // })
        },
        methods: {
            handleSelect(key, keyPath) {
                if (key == 'index') {
                    // this.menuActiveIndex = "index";
                    this.$store.commit('changeMenuActiveIndex','index');
                    this.$router.push({path: `/blog/index`})
                } else if (key == 'about') {
                    this.$message.error("暂未开放");
                } else if (key == 'friendLink') {
                    this.$message.error("暂未开放");
                } else if (key == 'tool') {
                    this.$message.error("暂未开放");
                }
            },

        }
    }
</script>

<style>
    #blog {
        height: 100%;
        overflow-y: auto;
    }

    .header-box {
        width: 100%;
        height: 60px;
        display: flex;
        justify-content: center; /* 水平居中 */
        position: absolute;
        top: 0px;
        z-index: 1501;
    }

    .menu-box {
        width: 100%;
    }
</style>

