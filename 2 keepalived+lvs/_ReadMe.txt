Keepalived + Lvs ��Ҫ�����ڸ��ؾ���


��װ���裺

yum -y install ipvsadm

yum -y install keepalived

service iptables stop

vi /etc/sysctl.conf  �򿪺��޸����桰net.ipv4.ip_forward = 1��

�����˳���ִ����������ʹ����������Ч  sysctl -p

��keepalived.conf��udp_check.sh ������/etc/keepalivedĿ¼��,�޸�keepalived.conf �ж�Ӧ������ע��

chmod 755 udp_check.sh

chkconfig keepalived on 
 
service keepalived start

ͨ��ipvsadm -ln �鿴Ŀǰlvs��Ⱥ״̬