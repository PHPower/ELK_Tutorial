logstash 为后端实际处理日志的服务器，需要配置虚拟IP

故先将realserver.sh 拷贝到/etc/init.d/下,修改其中的中文注释

执行 service iptables stop 

service realserver start 命令，后通过ifconfig 查看lo:0 网卡的inet addr 是否已经是虚拟IP的地址

最后将logstash.conf 拷贝到logstash/bin目录下，修改其中的中文注释

执行 nohup ./logstash -f logstash.conf > /dev/null 2>&1 &来启动logstash应用


注意：logstash集群中的每台机器的系统时间要求全部一致，不然从kibana中查询日志时会出现顺序出错的情况，甚至会在当天的数据中搜索不到。