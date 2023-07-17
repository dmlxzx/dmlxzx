#!/usr/bin/bash

i=1
today=`date "+%Y%m%d"`
hour=`date "+%Y/%m/%d %H:%M:%S"`
a1=/home/ec2-user/test1
a2=/home/ec2-user/test2
old=/home/ec2-user/test.tar

##ディレクトリが存在するか
##ディレクトリ作成
if [ ! -d $a1 ]; then
   mkdir -p $a1
   echo "mkdir -p $a1" >> $today".txt"
else
   if [ -n "$(ls -A $a1)" ]; then
      echo "出力先にフォルダが存在します。削除してください。=> $a1"
      exit 1
   fi
fi
if [ ! -d $a2 ]; then
   mkdir -p $a2
   echo "mkdir -p $a2" >> $today".txt"
else
        if [ -n "$(ls -A $a2)" ]; then
      echo "出力先にフォルダが存在します。削除してください。=> $a2"
      exit 1
   fi
fi

##tar解凍
if [ -d $a1 ]; then
   cd $a1
   echo $hour" ""test.tar 解凍" >> /home/ec2-user/$today".txt"
   tar -zxvf $old >> /home/ec2-user/$today".txt"
else
   if [ ! -d $a1 ]; then
      echo "出力先にフォルダが存在します。作成してください。=> $a1"
      exit 1
   fi
fi