
import http from '@/util/http'


export default {
    // 登录
    getData : params => {
        return http.get("/business/article/page/list", params);
    },
    // 保存
    save : params => {
        return http.post("/business/article/save", params)
    },

    // 批量删除
    batchDelete : ids => {
        return http.post("/business/article/delete", ids)
    },


}
