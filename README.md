# ELK_Tutorial
ELK日志收集（UDP+LVS）集群的部署教程

为了更好的收集线上服务器的应用日志，迅速定位集群中的问题服务器，我们采用了```logstash + elasticsearch + kibana``` 的方案，
利用```log4j``` 的```appender``` 将远程服务器的日志以UDP协议实时发送到日志服务器，并通过```LVS+Keepalived``` 方式做负载均衡，建立一个可横向扩展的高可用日志分析系统。我们利用这个系统，排查出很多在生产环境下出现的应用错误，并通过对ELK的调优，使得单台机器支持亿级别的日志全文搜索。同时还编写自动程序定期从elasticsearch中获取数据，当某一时段内错误数达到一定的值时，统计错误类型，绘制相关图表，汇总集群服务器出错情况，会执行邮件报警通知相关人员，并给出快速的解决方案。

集群架构图如下：

![](http://renhua91.github.io/images/jiagoutu.jpg)

集群搭建方法请参考ELK_Tutorial项目各文件夹中的**安装说明.md**

最终的系统使用效果图如下：
![](http://renhua91.github.io/images/tongji.png)

客户端应用接入步骤：打开应用的**log4j.properties**文件，加入下面的配置：
```java
log4j.rootLogger=ERROR,fileout,gelf
log4j.appender.gelf=biz.paluch.logging.gelf.log4j.GelfLogAppender
log4j.appender.gelf.Threshold=ERROR
log4j.appender.gelf.Host=udp:日志收集服务器ip
log4j.appender.gelf.Port=12201
log4j.appender.gelf.Version=1.0
log4j.appender.gelf.Facility=您的应用名#您的负责人名（拼音，将用于邮件通知，多人用英文逗号隔开）
log4j.appender.gelf.TimestampPattern=yyyy-MM-dd HH:mm:ss,SSSS
log4j.appender.gelf.MaximumMessageSize=8192
log4j.appender.gelf.extractStackTrace=true
```

依赖包 **logstash-gelf-1.6.0.jar**、**json-simple-1.1.1.jar** 可以从**客户端所需jar包**文件夹中下载，也可以从maven仓库中下载
```maven
<dependency>
	<groupId>biz.paluch.logging</groupId>
	<artifactId>logstash-gelf</artifactId>
	<version>1.6.0</version>
</dependency>
```
