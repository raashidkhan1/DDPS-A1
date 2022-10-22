module load gcc
module load slurm
module add prun


#JAVA
export JAVA_HOME=/var/scratch/$USER/jdk-11.0.2;
export PATH=${JAVA_HOME}/bin:${PATH};
alias java="$JAVA_HOME/bin/java"

#SPARK
export SPARK_HOME=/var/scratch/$USER/spark;
export PATH=${SPARK_HOME}/bin:${PATH};
EOF
source .bashrc