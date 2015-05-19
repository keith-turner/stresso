# Uncomment and set if FLUO_HOME is not set in your environment
# #FLUO_HOME=/path/to/fluo-install
#
##############################
#configuration for all scripts
##############################
#Must set Fluo, Accumulo and Zookeeper jars for following two options.
export HADOOP_CLASSPATH=`$FLUO_HOME/bin/fluo classpath -a -z`
LIB_JARS=`$FLUO_HOME/bin/fluo classpath -a -z -l`
#location of the stress jar
STRESS_JAR=$BIN_DIR/../target/fluo-stress-0.0.1-SNAPSHOT.jar
#application name
test -z "$FLUO_APP_NAME" && FLUO_APP_NAME=stress
#location of Flup properties file
FLUO_PROPS=$FLUO_HOME/apps/$FLUO_APP_NAME/conf/fluo.properties

######################################
#configuration for run-test.sh follows
######################################
#Place where logs from test are placed
LOG_DIR=$BIN_DIR/../logs
#the maximum number to generate
MAX=$((10**12))
#the number of splits to create in table
SPLITS=32
#number of mappers to run for data generation, which determines how many files
#generation outputs.  The number of files determines how many mappers loading
#data will run.
MAPS=16
#Number of reduce tasks
REDUCES=16
#Number of random numbers to generate initially
GEN_INIT=$((10**9))
#Number of random numbers to generate for each incremental step.
GEN_INCR=$((10**5))
#Number of incremental steps.
ITERATIONS=150
#Seconds to sleep between incremental steps.
SLEEP=180

########################
#config for init-fluo.sh
########################
#Determines whether to attempt to build stress jar
BUILD=true
