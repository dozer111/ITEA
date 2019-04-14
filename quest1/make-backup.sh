#!/bin/bash


#Заменить в случае необходимости
MY_PROJECT_DIRECTORY="/var/www/itea/quest1"
FINAL_FILENAME="$MY_PROJECT_DIRECTORY/dump.sql"


if [ ! -d "$MY_PROJECT_DIRECTORY" ]
then
    mkdir -p "$MY_PROJECT_DIRECTORY"
fi

touch $FINAL_FILENAME;

gzip -9 $FINAL_FILENAME




