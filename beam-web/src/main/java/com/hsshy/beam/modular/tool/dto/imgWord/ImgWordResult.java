package com.hsshy.beam.modular.tool.dto.imgWord;
import com.alibaba.fastjson.annotation.JSONField;
import java.util.List;

/**
 * @description: 图片文字识别结果
 * @author: hs
 * @create: 2019-02-19 17:00:49
 **/
public class ImgWordResult {


    /**
     * log_id : 3927909625825813235
     * words_result_num : 1
     * words_result : [{"location":{"width":545,"top":24,"left":30,"height":45},"words":"A双引擎,领跑无人车与对话式A"}]
     */

    @JSONField(name = "log_id")
    private long logId;
    @JSONField(name = "words_result_num")
    private int wordsResultNum;
    @JSONField(name = "words_result")
    private List<WordsResultBean> wordsResult;

    public long getLogId() {
        return logId;
    }

    public void setLogId(long logId) {
        this.logId = logId;
    }

    public int getWordsResultNum() {
        return wordsResultNum;
    }

    public void setWordsResultNum(int wordsResultNum) {
        this.wordsResultNum = wordsResultNum;
    }

    public List<WordsResultBean> getWordsResult() {
        return wordsResult;
    }

    public void setWordsResult(List<WordsResultBean> wordsResult) {
        this.wordsResult = wordsResult;
    }
}
