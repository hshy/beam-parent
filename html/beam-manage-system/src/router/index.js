import Vue from 'vue';
import Router from 'vue-router';

Vue.use(Router);

export default new Router({
    routes: [
        {
            path: '/',
            redirect: '/dashboard'
        },
        {
            path: '/',
            component: resolve => require(['../components/common/Home.vue'], resolve),
            meta: { title: '系统管理' },
            children:[
                {
                    path: '/dashboard',
                    component: resolve => require(['../components/page/Dashboard.vue'], resolve),
                    meta: { title: '系统首页',permission:true,perms:"sys:dashboard:info"},
                },
                {
                    // 权限页面
                    path: '/permission',
                    component: resolve => require(['../components/page/Permission.vue'], resolve),
                    meta: { title: '权限测试', permission: true }
                },
                {
                    path: '/404',
                    component: resolve => require(['../components/page/404.vue'], resolve),
                    meta: { title: '404' }
                },
                {
                    path: '/403',
                    component: resolve => require(['../components/page/403.vue'], resolve),
                    meta: { title: '403' }
                }
                ,
                {
                    path: '/sysuser',
                    component: resolve => require(['../components/sys/sysuser.vue'], resolve),
                    meta: { title: '用户管理',permission:true,perms:"sys:user:list" }
                },
                {
                    path: '/sysrole',
                    component: resolve => require(['../components/sys/sysrole.vue'], resolve),
                    meta: { title: '角色管理',permission:true,perms:"sys:role:list" }
                },
                {
                    path: '/sysmenu',
                    component: resolve => require(['../components/sys/sysmenu.vue'], resolve),
                    meta: { title: '菜单管理',permission:true,perms:"sys:menu:list" }
                },
                {
                    path: '/sysdept',
                    component: resolve => require(['../components/sys/sysdept.vue'], resolve),
                    meta: { title: '部门管理',permission:true,perms:"sys:dept:list" }
                },
                {
                    path: '/schedulejob',
                    component: resolve => require(['../components/sys/schedulejob.vue'], resolve),
                    meta: { title: '定时任务管理',permission:true,perms:"sys:schedulejob:list" }
                },
                {
                    path: '/sysdict',
                    component: resolve => require(['../components/sys/sysdict.vue'], resolve),
                    meta: { title: '字典管理',permission:true,perms:"sys:dict:list" }
                },
                {
                    path: '/loginlog',
                    component: resolve => require(['../components/sys/loginlog.vue'], resolve),
                    meta: { title: '登陆日志',permission:true,perms:"sys:loginLog:list" }
                },
                {
                    path: '/operationlog',
                    component: resolve => require(['../components/sys/operationlog.vue'], resolve),
                    meta: { title: '业务日志',permission:true,perms:"sys:operationLog:list" }
                }

            ]
        },
        {
            path: '/login',
            component: resolve => require(['../components/page/Login.vue'], resolve)
        },
        {
            path: '*',
            redirect: '/404'
        }
    ]
})
