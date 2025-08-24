#!/bin/bash

if [ -z $1 ]; then
    OUTPUT_DIR=$HOME
else
    OUTPUT_DIR=$1
fi

ARCHIVE_NAME=log_archive_$(date +"%Y-%m-%d_%H-%M-%S").tar.gz
sudo tar -cvzf "$OUTPUT_DIR/$ARCHIVE_NAME" -C /var/log/ .