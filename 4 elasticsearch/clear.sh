
#!/bin/sh  
      
#  
#elasticsearch的清理+优化倒排索引脚本    
#  
#  
      
curator --host 127.0.0.1 delete indices --index .logstash- --older-than 7 --time-unit days --timestring %Y.%m.%d  // 这一行就是删除7天前的数据
      
curator --timeout 36000 --host 127.0.0.1 optimize --max_num_segments 1 indices --older-than 1 --time-unit days --timestring '%Y.%m.%d' --prefix logstash-    //这一行是优化当天的倒排索引文件，提高搜索效率

echo "delete successed!"
