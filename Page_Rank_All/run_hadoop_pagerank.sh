#!/bin/bash
cd /var/scratch/ddps2204/hadoop

#var_dir=$(dirname "${BASH_SOURCE[0]}")

#hdfs dfs -mkdir /input; hdfs dfs -put $var_dir/soc-Slashdot0902.txt  /input

cd etc/hadoop

sed -i 's:</configuration>::g'  mapred-site.xml

echo '<property>
  <name>yarn.app.mapreduce.am.env</name>
  <value>HADOOP_MAPRED_HOME=/var/scratch/ddps2204/hadoop/
</value>
</property>
<property>
  <name>mapreduce.map.env</name>
  <value>HADOOP_MAPRED_HOME=/var/scratch/ddps2204/hadoop/</value>
</property>
<property>
  <name>mapreduce.reduce.env</name>
  <value>HADOOP_MAPRED_HOME=/var/scratch/ddps2204/hadoop/</value>
</property>
<property>
    <name>mapreduce.application.classpath</name>
    <value>/var/scratch/ddps2204/hadoop/share/hadoop/mapreduce/*,/var/scratch/ddps2204/hadoop/share/hadoop/mapreduce/lib/*,/var/scratch/ddps2204/hadoop/share/hadoop/common/*,/var/scratch/ddps2204/hadoop/share/hadoop/common/lib/*,/var/scratch/ddps2204/hadoop/share/hadoop/yarn/*,/var/scratch/ddps2204/hadoop/share/hadoop/yarn/lib/*,/var/scratch/ddps2204/hadoop/share/hadoop/hdfs/*,/var/scratch/ddps2204/hadoop/share/hadoop/hdfs/lib/*</value>
</property>
</configuration>' >> mapred-site.xml


chmod 777 ~/DDPS-A1/Page_Rank_All/mapper.py ~/DDPS-A1/Page_Rank_All/reducer.py

cd ../..

start=`date +%s`
hadoop_performance=$(bin/mapred streaming -input /input/out.dbpedia-link  -output /outputPR -mapper ~/DDPS-A1/Page_Rank_All/mapper.py -reducer ~/DDPS-A1/Page_Rank_All/reducer.py)
echo $hadoop_performance >> ~/DDPS-A1/Page_Rank_All/performance_log.txt
end=`date +%s`
echo "Runtime was $((end-start))"