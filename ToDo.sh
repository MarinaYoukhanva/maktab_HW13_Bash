#!/bin/bash

echo "1) new task"
echo "2) delete task"
echo "3) improve task"
echo "4) show tasks"
echo "5) search in a specif list"
echo "6) search for status of a task"

read choice

case $choice in
1)
  read -p "task title: " title
  if [ -f "todo.txt" ] && grep -q -wi "$title" todo.txt; then
      echo "task $title already exists in 'todo list' ! "
  elif [ -f "in_progress.txt" ] && grep -q -wi "$title" in_progress.txt; then
    echo "task $title already exists in 'in_progress list' ! "
  elif [ -f "done.txt" ] && grep -q -wi "$title" done.txt; then
    echo "task $title already exists in 'done list' ! "
  else echo "$title" >> todo.txt
  fi
  ;;
2)
  read -p "enter task: " task
  if [ -f "todo.txt" ] && grep -q -wi "$task" todo.txt; then
    sed -i "/^$task$/d" todo.txt
    echo "task $task deleted from 'todo list'"
  elif [ -f "in_progress.txt" ] && grep -q -wi "$task" in_progress.txt; then
    sed -i "/^$task$/d" in_progress.txt
    echo "task $task deleted from 'in_progress list'"
  elif [ -f "done.txt" ] && grep -q -wi "$task" done.txt; then
    sed -i "/^$task$/d" done.txt
    echo "task $task deleted from 'done list'"
  else
    echo "task not found! "
  fi
  ;;
3)
    read -p "enter task: " task
    if [ -f "todo.txt" ] && grep -q -wi "$task" todo.txt; then
      sed -i "/^$task$/d" todo.txt
      echo "$task" >> in_progress.txt
      echo "task $task now is in 'in_progress list'"
    elif [ -f "in_progress.txt" ] && grep -q -wi "$task" in_progress.txt; then
      sed -i "/^$task$/d" in_progress.txt
      echo "$task" >> done.txt
      echo "task $task now is in 'done list'"
    elif [ -f "done.txt" ] && grep -q -wi "$task" done.txt; then
      echo "task $task is already done! "
    else
      echo "task not found! "
    fi
  ;;
4)
    if [ -f "todo.txt" ]; then
      sed 's/^/todo: /' todo.txt
      else echo "no task todo "
    fi
    if [ -f "in_progress.txt" ]; then
      sed 's/^/in_progress: /' in_progress.txt
      else echo "no task in progress "
    fi
    if [ -f "done.txt" ]; then
      sed 's/^/done: /' done.txt
      else echo "no task done "
    fi
    ;;
5)
    read -p "enter word: " word
    PS3="which list do you want to search in? "
    select list in "todo" "in_progress" "done"
    do
      if [ -f "$list.txt" ]; then
        grep -n "$word" $list.txt
#        cat $list.txt | grep -n $word
        break
      fi
    done
    ;;
6)
  #write a find_status method
  read -p "enter task: " task
  if [ -f "todo.txt" ] && grep -q -wi "$task" todo.txt; then
    echo "task $task is in todo list"
  elif [ -f "in_progress.txt" ] && grep -q -wi "$task" in_progress.txt; then
    echo "task $task is in progress"
  elif [ -f "done.txt" ] && grep -q -wi "$task" done.txt; then
    echo "task $task is in done"
  else echo "task not found! "
  fi
  ;;

esac


