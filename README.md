# ELK_Tutorial
ELK日志收集（UDP+LVS）集群的部署教程

为了更好的收集线上服务器的应用日志，迅速定位集群中的问题服务器，我们采用了```logstash + elasticsearch + kibana``` 的方案，
利用```log4j``` 的```appender``` 将远程服务器的日志以UDP协议实时发送到日志服务器，并通过```LVS+Keepalived``` 方式做负载均衡，建立一个可横向扩展的高可用日志分析系统。我们利用这个系统，排查出很多在生产环境下出现的应用错误，并通过对ELK的调优，使得单台机器支持亿级别的日志全文搜索。同时还编写自动程序定期从elasticsearch中获取数据，当某一时段内错误数达到一定的值时，统计错误类型，绘制相关图表，汇总集群服务器出错情况，会执行邮件报警通知相关人员，并给出快速的解决方案。

集群架构图如下：

![](http://renhua91.github.io/images/jiagoutu.jpg)

最终的效果图如下：
![](http://renhua91.github.io/images/tongji.png)
