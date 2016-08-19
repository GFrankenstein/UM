for i in {1..1}
do
	./get_GeomgH.sh
	./format_new.sh
	python IRD.py > result_tmp
	sed 's/\[/ /g' result_tmp | sed 's/\]/ /g' > coord_tmp
	python Geom_Gen.py > molpro_geom_$i
	cat molpro_head molpro_geom_$i molpro_tail > freq.com
	rm *_tmp
done
