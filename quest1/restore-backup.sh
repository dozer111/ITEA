#!/bin/bash

set -e

# In start, i mean that we have project, which has structure, as in quest
# Clone project from https://github.com/dozer111/ITEA/tree/master/quest1 to $MY_PROJECT_DIRECTORY


# First run make-backup.sh <d-m-Y> to create some backup file in backend/web/uploads
# then use this script for unzip needed dump

MY_PROJECT_DIRECTORY="/var/www/itea/quest1"
DUMP_FILENAME="uploads.zip"
UNZIP_DUMP_FILENAME="$1"


if [[ ! $1 =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]] #check date argument
  then
     echo "InvalidArgumentException: first script argument must be date in format d-m-Y"
    exit 1
fi
DUMP_DIRECTORY="$MY_PROJECT_DIRECTORY/backend/web/uploads/$1"
DUMP_FILEPATH="$DUMP_DIRECTORY/$DUMP_FILENAME"


# check for correct project directory
if [ ! -d "$DUMP_DIRECTORY" ]
then
    echo "Dump does not exists. Please, make sure that you create dump by $MY_PROJECT_DIRECTORY/make-backup.sh <d-m-Y>"
    exit 1
elif [ ! -f "$DUMP_FILEPATH" ] # and if we have already dump for that day, generate new dump
then
    echo "DB dump $DUMP_FILENAME does not exists in $DUMP_DIRECTORY. Please, run $MY_PROJECT_DIRECTORY/make-backup.sh <d-m-Y>"
    exit 1
fi







echo "Start creating backup"
echo "==================================================================="
if [ -f "$MY_PROJECT_DIRECTORY/$UNZIP_DUMP_FILENAME.sql" ]
  then
    COUNTER=0
    FILENAME="$UNZIP_DUMP_FILENAME.sql";
    while [ -f "$MY_PROJECT_DIRECTORY/$FILENAME" ];
    do

       COUNTER=$(($COUNTER+1))
       COUNTER_X="_$COUNTER" #just for use _ as symbol
       FILENAME="$UNZIP_DUMP_FILENAME$COUNTER_X.sql"

    done
     unzip -dq "$DUMP_FILEPATH" >  "$MY_PROJECT_DIRECTORY/$FILENAME"
    echo "File $FILENAME was created"
    echo "==================================================================="
else
     echo "CREATE $MY_PROJECT_DIRECTORY/$UNZIP_DUMP_FILENAME.sql"
     unzip -dq  "$DUMP_FILEPATH" > "$MY_PROJECT_DIRECTORY/$UNZIP_DUMP_FILENAME.sql"


fi

echo "Script run success"








