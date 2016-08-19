####### get trajectory #######
for i in {1..15}
do
	echo '8' >> trajectory 
	echo "frame $i" >> trajectory
	cat molpro_geom_$i >> trajectory
	echo '' >> trajectory
done
mv trajectory trajectory.xyz
