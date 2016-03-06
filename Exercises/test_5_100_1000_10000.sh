echo "Usage: sh script_name <nofiles> <dirname> <filename>"
filename=$3
nofiles=$1
dir_name=$2
i=0
for (( j=1; j <= $nofiles ; j++ ))
do
hdfs dfs -mkdir -p $dir_name
echo "pushing file number $i in directory $dir_name with filename as $dir_name/file${i}"
hdfs dfs -put $filename $dir_name/file${i}
i=`expr $i + 1`
done

impala-shell -q "CREATE DATABASE IF NOT EXISTS impala_exercises;USE impala_exercises;"
impala-shell -q "create external table if not exists filecount_test${nofiles} (id bigint, val int, zerofill string, name string,assertion boolean, city string, state string) row format delimited fields terminated by \",\" location '$dir_name';"
 
