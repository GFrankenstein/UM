for i in {16..20}
do
	./get_MW_GeomgH.sh
	./format_new.sh
	./MassWeightedGeom.sh
        python IRD.py > result_tmp
        head -n 1 result_tmp | awk '{print $2/sqrt(12),$3/sqrt(12),$4/sqrt(12)}' >> result_tmp2
        tail -n 1 result_tmp | awk '{print $2,$3,$4}' >> result_tmp2	
	mv result_tmp2 result_tmp
	sed 's/\[/ /g' result_tmp | sed 's/\]/ /g' > coord_tmp
	python Geom_Gen.py > molpro_geom_$i
	cat molpro_head molpro_geom_$i molpro_tail > freq.com
	rm *_tmp*
	$m -n 8 freq.com
done
