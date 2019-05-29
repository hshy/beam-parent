echo "Stopping beam-admin-0.0.1-SNAPSHOT.jar"
pid=`ps -ef | grep beam-admin-0.0.1-SNAPSHOT.jar | grep -v grep | awk '{print $2}'`
if [ -n "$pid" ]
then
   echo "kill -9 的pid:" $pid
   kill -9 $pid
fi
echo "stop finish"
nohup java -jar /usr/local/beam/beam-admin-0.0.1-SNAPSHOT.jar &
echo "start run"
