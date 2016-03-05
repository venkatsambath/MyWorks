i=0;
j=2012
while [ $i -le 5 ]
do

#impala-shell  -i nightly54-2.vpc.cloudera.com -q "alter table census add partition (year=$j);"
impala-shell  -i nightly54-2.vpc.cloudera.com -q "insert overwrite table census partition (year=$j) select name from temp1 limit 10;"
j=`expr $j + 1`
#impala-shell  -i nightly54-2.vpc.cloudera.com -q "alter table census add partition (year=$j);"
impala-shell  -i nightly54-2.vpc.cloudera.com -q "insert overwrite table census partition (year=$j) select name from temp1 limit 10;"
j=`expr $j + 1`

#impala-shell  -i nightly54-2.vpc.cloudera.com -q "insert overwrite table census partition (year=2013) select name from temp1 limit 10;"
sleep 1s
done
