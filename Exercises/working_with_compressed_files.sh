# Args are sh working_with_compressed_files.sh /user/impala/deletions/

dir_name=$1

echo "My Table is 7GB table with uncompressed data"

echo "Lets create a table on the uncompressed data using impala-shell"
impala-shell -q "create external table if not exists large_uncompressed_table(creation_ts string, creator string, deletion_timestamp string, deletor string, subject string, predicate string, object string, language string) row format delimited fields terminated by \",\" location '$dir_name';"

#To try doing a LZO compression

#First we need to install lzo libraries

# Step1:
# Add the parcel
# https://archive.cloudera.com/gplextras5/parcels/5.6.0/

# Step2:
# Download Distribute and Activate

# Step3:
# yum install lzo


# A table containing LZO-compressed text files must be created in Hive with the following storage clause:

# STORED AS
#     INPUTFORMAT 'com.hadoop.mapred.DeprecatedLzoTextInputFormat'
#     OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat'

# 
beeline -u "jdbc:hive2://host-10-17-80-187.coe.cloudera.com:10000/default;" -n hive -p dummy -e "SET mapreduce.output.fileoutputformat.compress=true;SET hive.exec.compress.output=true;
SET mapreduce.output.fileoutputformat.compress.codec=com.hadoop.compression.lzo.LzopCodec;
CREATE TABLE large_compressed_table(creation_ts string, creator string, deletion_timestamp string, deletor string, subject string, predicate string, object string, language string) STORED AS INPUTFORMAT 'com.hadoop.mapred.DeprecatedLzoTextInputFormat' OUTPUTFORMAT 'org.apache.hadoop.hive.ql.io.HiveIgnoreKeyTextOutputFormat';
INSERT INTO TABLE large_compressed_table SELECT * FROM large_uncompressed_table;"

# To Index file
#hadoop jar /usr/lib/hadoop/lib/hadoop-lzo-cdh4-0.4.15-gplextras.jar com.hadoop.compression.lzo.DistributedLzoIndexer /hdfs_location_of_table/