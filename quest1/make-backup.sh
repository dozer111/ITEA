#!/bin/bash

set -e


#Заменить в случае необходимости
MY_PROJECT_DIRECTORY="/var/www/itea/quest1"


if [[ ! $1 =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]] #check date argument
  then
     echo "InvalidArgumentException: first script argument must be date in format d-m-Y"
    exit 1
fi

DUMP_FILEPATH="$MY_PROJECT_DIRECTORY/backend/web/uploads/$1"
DUMP_FILENAME="$DUMP_FILEPATH/dump.sql"

if [ ! -d "$DUMP_FILEPATH" ]
then

    mkdir -p "$DUMP_FILEPATH"
    echo "Create new directory $DUMP_FILEPATH"


fi

touch "$DUMP_FILENAME"
zip -9 -j "$DUMP_FILEPATH/uploads.zip" "$DUMP_FILENAME"
rm  -f "$DUMP_FILENAME"
echo "DB dump from $1 success"
