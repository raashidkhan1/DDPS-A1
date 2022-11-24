module load gcc/4.8.3
module load slurm
module add prun
module add java/jdk-1.8.0
module add python/3.6.0

#pip3 install numpy --user
#pip3 install pyspark --user
#export PYTHONHOME=/var/scratch/ddps2204/python/python3.8.12/python
#export PATH=$PATH:/var/scratch/ddps2204/python/python3.8.12/python


#HADOOP
export HADOOP_HOME=/var/scratch/$USER/hadoop
export PATH=$PATH:$HADOOP_HOME/bin
export PATH=$PATH:$HADOOP_HOME/sbin
export HADOOP_MAPRED_HOME=${HADOOP_HOME}
export HADOOP_COMMON_HOME=${HADOOP_HOME}
export HADOOP_HDFS_HOME=${HADOOP_HOME}
export YARN_HOME=${HADOOP_HOME}
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
#SPARK
export SPARK_HOME=/var/scratch/ddps2204/spark
export PATH=$PATH:$SPARK_HOME/bin
#export LD_LIBRARY_PATH=$HADOOP_HOME/lib/native:$LD_LIBRARY_PATH
##export PYTHONPATH=$SPARK_HOME/python
export PYSPARK_PYTHON=/var/scratch/ddps2204/spark-venv/bin/python
#export PYSPARK_DRIVER_PYTHON=/usr/bin/python

