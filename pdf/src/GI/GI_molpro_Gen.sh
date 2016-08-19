python Geom_Inter.py
for name in `ls *.com`
do
        cat Head $name Tail > tmp
        mv tmp $name
done
