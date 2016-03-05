start_file_name=$1
end_file_name=$2
filename=$4
num_files=`expr $end_file_name - $start_file_name`
echo number of files is $num_files
dir_name=$3
i=$start_file_name;
for (( j=1; j <= $num_files; j++ ))
do
echo "pushing file number $i in directory $dir_name with filename as $dir_name/file${i}"
hdfs dfs -put $filename $dir_name/file${i}
i=`expr $i + 1`
done 
