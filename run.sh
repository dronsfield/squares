#!/bin/bash

# git checkout --orphan new
# git branch -D main
# git branch -m main
# ./run.sh YYYY-MM-DD YYYY-MM-DD

start_date="$1"
end_date="$2"

start_epoch=$(date -j -f "%Y-%m-%d" "$start_date" "+%s")
end_epoch=$(date -j -f "%Y-%m-%d" "$end_date" "+%s")

current_epoch="$start_epoch"
while [ "$current_epoch" -le "$end_epoch" ]; do
    current_date=$(date -j -f "%s" "$current_epoch" "+%Y-%m-%d")
    echo "$current_date" >> lol.txt
    git add .
    git commit --date=$(date -j -f "%s" "$current_epoch" +"%Y-%m-%dT%H:%M:%S") -m "$current_date"
    current_epoch=$(($current_epoch + 86400))
done
