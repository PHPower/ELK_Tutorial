Keepalived + Lvs 主要是用于负载均衡


安装步骤：

yum -y install ipvsadm

yum -y install keepalived

service iptables stop

vi /etc/sysctl.conf  打开后修改里面“net.ipv4.ip_forward = 1”

保存退出，执行如下命令使设置立即生效  sysctl -p

将keepalived.conf、udp_check.sh 拷贝到/etc/keepalived目录下,修改keepalived.conf 中对应的中文注释

chmod 755 udp_check.sh

chkconfig keepalived on 
 
service keepalived start

通过ipvsadm -ln 查看目前lvs集群状态