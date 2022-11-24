# Distributed Data Processing Systems-Assignment1
A reproducibility study on Resilient distributed datasets: A fault-tolerant abstraction for in-memory cluster computing.
Experimentation on Spark and Hadoop for iterative machine learning applications and PageRank algorithm.
 
## Steps for running:
1. Clone the repo in the DAS5 home/$user directory
2. Install a virtual python environment and provide the path to ~/.bashrc using the template from the repo.
3. Sets path for Spark, Hadoop, JVM and Yarn as per their location referencing from the template.
4. Allocate nodes with scripts under [](https://github.com/raashidkhan1/DDPS-A1/tree/main/das5) or modify for number of nodes and time
5. Check if nodes are allocated with below command- 
```
preserve -llist
```

6. Upload data to HDFS with below command-
For Spark-
```
hdfs dfs -put <path to data> /
```

For Hadoop-
```
hdfs dfs -put <path to data> /input
```

7. PageRank algorithm can be run with below command-
```
spark-submit --master yarn --num-executors <no of nodes> --deploy-mode <client/cluster> ./Page_Rank_All/Spark_Page_Rank.py
```

8. For running hadoop script, make sure the data is available on hdfs using below command-
```
hdfs dfs -ls /input
```

9. Make sure the paths are same as the Hadoop shell script and it can be executed with with below command-
Make it executable
```
chmod 777 run_hadoop_pagerank.sh
```
Run
```
./run_hadoop_pagerank.sh
```

10. The second experiment with insufficient memory can be ran with a alternate file for Spark_Page_Rank.py and changing line number 72 with-
```
links = lines.map(lambda urls: parseNeighbors(urls)).distinct().groupByKey().persist(StorageLevel.MEMORY_AND_DISK)
```
The StorageLevel can be modified as per her [pyspark.StorageLevel](https://spark.apache.org/docs/latest/api/python/reference/api/pyspark.StorageLevel.html)
