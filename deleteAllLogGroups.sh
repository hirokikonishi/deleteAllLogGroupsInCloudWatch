#!/bin/sh

aws logs describe-log-groups | jq -r .logGroups[].logGroupName > cloudwatchlogs-loggroupname.txt
while read loggroupname
do
  aws logs delete-log-group --log-group-name $loggroupname
done < ${1}
