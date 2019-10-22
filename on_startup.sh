#!/usr/bin/env bash

echo "==========================================="
echo "Prepare data"

download_source() {
    git init
    git remote add origin https://github.com/phucbui95/MotorbikeGeneration
    git add -A
    git config --global user.email "you@example.com"
    git commit -m "Backup"

    git checkout -b working
    git fetch --all
    git branch --set-upstream-to=origin/master working
    git reset --hard origin/master
    git pull
}

source configure.sh
echo "Configure ROOT_DIR: $(pwd)"

download_preprocess() {
    mkdir -p $DATA_DIR
    cd $DATA_DIR
    kaggle datasets download -d phucbb/preprocesmotorbike
    unzip -o -d resized128_image preprocesmotorbike.zip > /dev/null
    cd $ROOT_DIR
}

download_source

download_preprocess

sh download.sh






