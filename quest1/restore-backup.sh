#!/bin/bash

set -e

#Заменить в случае необходимости
MY_PROJECT_DIRECTORY="/var/www/itea/quest1"



BACKUP_DIRECTORY="backend/web/uploads"


if [[ ! $1 =~ ^[0-9]{2}-[0-9]{2}-[0-9]{4}$ ]]
  then
     echo "Введенное значение не валидно, скрипт должен вызыватся в формате ./scriptName.sh d-m-Y"
    exit 1
fi

DUMP_DIRECTORY="$MY_PROJECT_DIRECTORY/$BACKUP_DIRECTORY/$1"


mkdir -p $DUMP_DIRECTORY
gzip -d  "$MY_PROJECT_DIRECTORY/dump.sql.gz"
mv "$MY_PROJECT_DIRECTORY/dump.sql" "$DUMP_DIRECTORY/dump.sql"







