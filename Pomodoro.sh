#!/bin/bash

read -p "how many times do you want to work? " count

work_num=1

while [ $count -gt 0 ]
do
  echo "work time! "
  sleep 10

  if [ $((work_num % 4)) -eq 0 ]
  then
    work_num=$((work_num-4))
    echo "long rest time! "
    sleep 5
  else
    echo "short rest time! "
    sleep 3
  fi
  work_num=$((work_num+1))
  count=$((count-1))
done

echo "your task is done. "




