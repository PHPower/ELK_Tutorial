elasticsearch 即为后端存储日志的地方

环境需要jdk1.7

修改config/elasticsearch.yml 
   
   1、cluster_name 保证elasticsearch 集群在本网段是唯一的
 
   2、discovery.zen.ping.timeout: 10s 修改心跳频率为10s 


通过执行bin目录下的nohup ./elasticsearch & 命令来启动程序