logstash Ϊ���ʵ�ʴ�����־�ķ���������Ҫ��������IP

���Ƚ�realserver.sh ������/etc/init.d/��,�޸����е�����ע��

ִ�� service iptables stop 

service realserver start �����ͨ��ifconfig �鿴lo:0 ������inet addr �Ƿ��Ѿ�������IP�ĵ�ַ

���logstash.conf ������logstash/binĿ¼�£��޸����е�����ע��

ִ�� nohup ./logstash -f logstash.conf > /dev/null 2>&1 &������logstashӦ��


ע�⣺logstash��Ⱥ�е�ÿ̨������ϵͳʱ��Ҫ��ȫ��һ�£���Ȼ��kibana�в�ѯ��־ʱ�����˳������������������ڵ��������������������