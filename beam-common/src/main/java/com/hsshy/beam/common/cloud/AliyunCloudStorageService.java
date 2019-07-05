package com.hsshy.beam.common.cloud;
import com.aliyun.oss.OSSClient;
import com.hsshy.beam.common.exception.BeamException;
import org.apache.commons.lang3.StringUtils;
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.Base64;

public class AliyunCloudStorageService extends CloudStorageService {
    private OSSClient client;

    public AliyunCloudStorageService(CloudStorageConfig config){
        this.config = config;

        //初始化
        init();
    }

    private void init(){
        client = new OSSClient(config.getAliyunEndPoint(), config.getAliyunAccessKeyId(),
                config.getAliyunAccessKeySecret());
    }

    @Override
    public String upload(String pic) throws Exception {
        if(!StringUtils.isBlank(pic) && !pic.contains("http:") && !pic.contains("https:") && !pic.contains("upload")){
            if (pic.indexOf("data:image/jpeg;base64") > -1 || pic.indexOf("data:image/png;base64") > -1){
                pic = pic.substring(pic.indexOf(",") * 1 + 1, pic.length());
            }
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] data = decoder.decode(pic);
            for(int i=0;i<data.length;++i){
                if(data[i]<0){ data[i]+=256; }
            }
//            InputStream input = new ByteArrayInputStream(data);
//            OutputStream output = new ByteArrayOutputStream();
//            //图片尺寸不变，压缩图片文件大小outputQuality实现,参数1为最高质量
//            Thumbnails.of(input).scale(1f).outputQuality(0.25f).toOutputStream(output);
            return upload(data);
        }else{
            return pic;
        }
    }

    @Override
    public String upload(byte[] data) {
        return upload(data, getPath(config.getQiniuPrefix(),""));
    }

    @Override
    public String upload(byte[] data, String path) {
        return upload(new ByteArrayInputStream(data), path);
    }

    @Override
    public String upload(InputStream inputStream, String path) {
        try {
            client.putObject(config.getAliyunBucketName(), path, inputStream);
        } catch (Exception e){
            throw new BeamException("上传文件失败，请检查配置信息", e);
        }

        return config.getAliyunDomain() + "/" + path;
    }

    @Override
    public String uploadSuffix(byte[] data, String suffix) {
        return upload(data, getPath(config.getAliyunPrefix(), suffix));
    }

    @Override
    public String uploadSuffix(InputStream inputStream, String suffix) {
        return upload(inputStream, getPath(config.getAliyunPrefix(), suffix));
    }

    @Override
    public void delete(String path) {

    }
}
