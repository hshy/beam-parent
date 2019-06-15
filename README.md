# beam-parent

#### 项目介绍

#### 有需要dubbo的请移至：https://gitee.com/hsshy/beam-dubbo
- Beam基于SpringBoot 2，致力于做更简洁的后台管理系统，一款快速开发的脚手架。springmvc + shiro + MyBatis-Plus + vue。
- 基础模块：
  -  **用户管理**
  -  **角色管理** 
  -  **部门管理**
  -  **菜单模块**
  -  **定时任务**
  -  **字典管理**
  -  **登陆日志**
  -  **业务日志**
  
- 项目特点：
  - **持久层：mybatis持久化，使用MyBatis-Plus优化，减少sql开发量；Transtraction注解事务。**
  - **使用SpringBoot自动装配，MyBatis-Plus配置文件提为默认配置放在了common包的default-config.properties中，
  子项目的xml只需固定放在com/hsshy/beam/modular/\*/mapping/\*.xml，实体类固定放在com.hsshy.beam.modular.\**.entity中。
  即可使用MyBatis-Plus。若不使用默认配置，可在子工程配置文件直接写入自己的配置即可覆盖。**
  - **提出公共的模块，service、dao、entity接口和后台管理系统可共用（将相应的模块放在beam-web中），当然也可不共用，只需将相应的模块放在子工程中**
  - **接口模块已添加拦截和post请求签名，可直接使用**
  - **后端使用guns的map+wrapper返回方式返回字段的字典值**
  - **前后端分离**
  - **集成了异步插入日志**
  - **实现了用户角色菜单权限动态配置，精确到按钮级别**
  - **日志分类等**
  - **使用七牛云存储图片（注册地址：https://portal.qiniu.com/signup?code=1h8cpibemhb9u）**
  - **调度：quartz, 可以查询、修改周期、暂停、删除、新增、立即执行等。**
  - **工具类：excel导入导出，汉字转拼音，字符串工具类，数字工具类，发送邮件，redis工具类，MD5加密，HTTP工具类，防注入工具类,i18n 国际化多语言工具等等。**



#### 项目结构
````
beam-parent
├─beam-common     公共模块
│ 
├─beam-admin     管理后台
│        └─resources 
│           ├─application.yml  配置文件
│           ├─logback-spring.xml  日志配置文件
│ 
├─beam-rest        API服务 （post请求签名、token)
│             
│ 
├─beam-web  公用实体类、dao、service
│   
│ 
├─html/beam-manager-system 前端代码
│ 
├─doc  数据库sql文件
│ 
│ 
│ 
````

<br>

#### 技术选型
- 核心框架：Spring Boot 2.1.3
- 安全框架：Apache Shiro 1.4
- 视图框架：Spring MVC 5.0
- 持久层框架：MyBatis-Plus 3.0-RC1
- 定时器：Quartz 2.3
- 数据库连接池：hikari
- 页面交互：Vue2.x
- 前后端分离
- 缓存：Redis
- 图片上传：七牛云（七牛云注册便有10G免费空间，注册地址：https://portal.qiniu.com/signup?code=1h8cpibemhb9u）。

### 代码生成器
https://gitee.com/hsshy/beam-generator

#### Spring Boot其他案例：https://gitee.com/hsshy/beam-example
- 秒杀案例模块（加锁、aop加锁、redis锁、消息队列）
- 动态数据源案例模块
- Spring Boot 整合RabbitMQ案例
- Spring Boot 整合dubbo消费者
- Spring Boot 整合dubbo服务提供者
- Spring Boot 整合email发送邮件（异步发送、消息队列发送）
- Spring Boot 整合Kafka案例


#### 软件需求
- JDK1.8
- MySQL5.5+
- Maven3.0+
- Redis
- lombok插件

#### 前端地址：
beam-parent/html/beam-manage-system

#### 演示地址
http://www.hsshy.com
演示账户：test 123456

#### 常见问题
- 上传图片失败，请修改sys_config中的七牛云配置，改为自己的七牛云配置。（七牛云注册便有10G免费空间，注册地址：https://portal.qiniu.com/signup?code=1h8cpibemhb9u）。
- 提示账户验证失败，检查是否安装Redis，以及用户名密码是否正确。
- set、get报红，请安装Lombok插件。详情请参照软件需求。

#### 项目截图
##### 后台管理系统：
![image.png](https://upload-images.jianshu.io/upload_images/13498144-c83089109737709c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-900e17a18eb8812e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-c9ace30dac0edff7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-75dcb0b8fdefc926.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-c6d8f6ada98154e7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-80fd19bb42b31046.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-a1ebc7317dbf6af4.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-1b964ca56a75e1bc.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-5e2cbf66570bc962.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
![image.png](https://upload-images.jianshu.io/upload_images/13498144-cd6a59c0734ae61a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


#### 部署流程

##### 软件安装
- Java8:https://www.jianshu.com/p/dfdedff74fbc
- redis4.0.6：https://www.jianshu.com/p/500e6a205fae
- mysql5.7：https://www.jianshu.com/p/3cf566658ad6

##### 后端：
- 服务器选的是阿里云（注册地址：https://chuangke.aliyun.com/invite?userCode=647hkjjy）
- 1、使用命令行打包：在beam-parent下执行 ```mvn package -Dmaven.test.skip=true -P produce -f pom.xml```
- 2、使用idea进行打包：https://www.jianshu.com/p/32c597dd637e
- 上传：scp -r beam-admin-0.0.1-SNAPSHOT.jar root@xxx.xx.xx.xx:/usr/local/beam/
- 启动：将doc下的脚本上传到和jar包相同目录下，运行脚本(记得给脚本权限)
- 查看运行日志：tail -f xxx/log_total.log(xxx文件名为yml配置的的log.path)
##### 前端（这边是用nginx进行部署）：
- 打包：npm run build
- 上传：进入dist文件夹，scp -r * root@xx.xx.xx.xx:/etc/nginx/html/beam-manage-system/
- nginx配置请参考doc下的beam.conf文件,可直接传到服务器下的nginx/conf.d/下进行使用，记得删除默认的default.conf文件。

#### 部署可能出现的问题
- 出现表不存在（定时任务相关的表改成大写或者将数据库改成大小写不敏感）
- 脚本运行报错（执行dos2unix deploy.sh，window环境下与Linux环境下文本格式有所不同）

### 加入Java互助群
![image.png](https://upload-images.jianshu.io/upload_images/13498144-d9ab786afee34d3f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)