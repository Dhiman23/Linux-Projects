#!/bin/bash


# Author SAJALDHIMAN

# 23/08/2023


BASE=/home/ubuntu/Scripts/find_command
DAYS=5
DEPTH=1
RUN=0

#check if the directory is present or not

if [[ ! -d $BASE ]]
then
        echo "directory dose not exist: $BASE"
        exit 1
fi

if [[ ! -d $BASE/archive ]]
then
         mkdir $BASE/archive


fi

for i in `find $BASE -maxdepth $DEPTH -type f -size +1MB`
do
        if  [[ $RUN -eq 0 ]]
        then
           echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
            gzip $i || exit 1
            mv $i.gz $BASE/archive || exit 1
        fi

done
