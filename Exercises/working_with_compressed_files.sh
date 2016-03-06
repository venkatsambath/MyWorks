
impala-shell -q "create external table if not exists large_uncompressed_table(creation_ts string, creator string, deletion_timestamp string, deletor string, subject string, predicate string, object string, language string) row format delimited fields terminated by \",\" location '$dir_name';"

 
