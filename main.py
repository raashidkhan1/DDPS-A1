# Login
# Reserve nodes
# Allocate and deallocate nodes
# Deploy hadoop and Spark
# Run example app on both
# Print job execution time details

from pyspark import SparkConf, SparkContext

conf = SparkConf().setMaster("local").setAppName("DDPS-A1")
sc = SparkContext(conf=conf)

if __name__ == "main":
    print("Spark works")
    