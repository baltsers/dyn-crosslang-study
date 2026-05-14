for i in `awk 'a[$1]++' <(dir -l orig work |awk '{print $NF}')`
do
rm -r orig/$i
rm -r work/$i
done

rm -r work/compile.log
rm -r work/test.log

sleep 100