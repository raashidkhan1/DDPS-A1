#!/bin/bash
cd /var/scratch/hadoop

bin/hdfs dfs -mkdir /input; bin/hdfs dfs -put /var/scratch/DDS/DDPS-A1/PageRank/soc-Slashdot0902.txt  /input

cd etc/hadoop

sed -i 's:</configuration>::g'  mapred-site.xml

echo '<property>
  <name>yarn.app.mapreduce.am.env</name>
  <value>HADOOP_MAPRED_HOME=/var/scratch/hadoop
</value>
</property>
<property>
  <name>mapreduce.map.env</name>
  <value>HADOOP_MAPRED_HOME=/var/scratch/hadoop</value>
</property>
<property>
  <name>mapreduce.reduce.env</name>
  <value>HADOOP_MAPRED_HOME=/var/scratch/hadoop2</value>
</property>
<property>
    <name>mapreduce.application.classpath</name>
    <value>/var/scratch/hadoop/share/hadoop/mapreduce/*,/var/scratch/hadoop/share/hadoop/mapreduce/lib/*,/var/scratch/hadoop/share/hadoop/common/*,/var/scratch/hadoop/share/hadoop/common/lib/*,/var/scratch/hadoop/share/hadoop/yarn/*,/var/scratch/hadoop/share/hadoop/yarn/lib/*,/var/scratch/hadoop/share/hadoop/hdfs/*,/var/scratch/hadoop/share/hadoop/hdfs/lib/*</value>
</property>
</configuration>' >> mapred-site.xml


chmod 777 /var/scratch/DDS/DDPS-A1/PageRank/mapper.py /var/scratch/DDS/DDPS-A1/PageRank/reducer.py

cd ../..

hadoop_performance=$(bin/mapred streaming -input /input/soc-Slashdot0902.txt  -output /ouputPR -mapper /var/scratch/DDS/DDPS-A1/PageRank/mapper.py -reducer /var/scratch/DDS/DDPS-A1/PageRank/reducer.py)
start = $SECONDS
echo $hadoop_performance >> /var/scratch/DDS/PageRank/performance_log.txt
duration = $((SECONDS - start))
echo duration
Footer