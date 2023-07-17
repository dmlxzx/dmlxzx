##00YGS_y.sh 事前作業_外部ファイル
#!/bin/bash
i=0
e=0
ygs=YGS00
dir2=/ygswork/2/YGS/00_事前作業/横浜銀行_外部ファイル
ten=/ygswork/3/YGS/00/tenpfile
log=`date "+%Y%m%d"`
time=`date "+%Y%m%d %H:%M:%S"`
host=/home/appcomm
bin=/data/infra/script/comm/bin

#==処理開始==
if [ ! -d $ten ]; then
   mkdir -p $ten
else
   echo "$ten存在します"
   y,n入れて次の処理する--------
fi

cd $dir2

if [ -f $host/$ygs".txt" ]; then
   rm -f $host/$ygs".txt"
fi

ls -1 >> $host/$ygs".txt"
tar=`cat $host/$ygs".txt" | grep '.tar$' >> $host/$ygs"tar.txt"`
memo=`cat $host/$ygs".txt" | grep -v '.tar$' >> $host/$ygs"memo.txt"`
n=`wc -l < $host/$ygs"tar.txt"`
cpm=`wc -l < $host/$ygs"memo.txt"`

while [ $i -ne $n ]
do
   i=`expr 1 + $i`
   g=`cat $host/$ygs"tar.txt" | head -n $i | tail -n 1`
   ##解凍
   echo "$g解凍処理開始"
   $bin/ygstar xvf $g -C $ten
   echo "  "
   echo "$g解凍処理完了"

   if
     正常処理
     else 
      error
      
done

##コピー移動処理
while [ $e -ne $cpm ]
do
   e=`expr 1 + $e`
   p=`cat $host/$ygs"memo.txt" | head -n $i | tail -n 1`
   echo "$pコピー移動処理開始"
   if [ -d $dir2/$p ]; then
      cp -pir $p $ten
      echo "$pコピー移動処理完了"
   else
      cp -pi $p/*.txt $ten
      echo "上書きの場合はyを入力してください。"
      echo "$pコピー移動処理完了"
   fi
   
      if
     正常処理
     else 
      error
      
      
done

rm 

log 出力時間、一つひとつ処理の時間