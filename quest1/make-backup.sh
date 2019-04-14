#!/bin/bash


#Заменить в случае необходимости
MY_PROJECT_DIRECTORY="/var/www/itea/quest1"
FINAL_FILENAME="$MY_PROJECT_DIRECTORY/dump.sql"

# По идее, данный проект УЖЕ должен быть склонирован с гита, если его нет, то сначала просто создаю под него директорию
if [ ! -d "$MY_PROJECT_DIRECTORY" ]
then
    echo "Нету проекта/некорректная директория."
    mkdir -p "$MY_PROJECT_DIRECTORY"
    echo "Создали новую директорию $MY_PROJECT_DIRECTORY, в которую нужно склонировать проект и ещё раз запустить этот скрипт"
    exit 1
fi

touch $FINAL_FILENAME;

gzip -9 $FINAL_FILENAME




