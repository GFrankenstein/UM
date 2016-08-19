rm trajectory.xyz
n=1 #frame number
N=`wc -l GeomO | cut -d ' ' -f 1`
for name in `ls -v *.com`
do
	echo "$N" >> trajectory.xyz
	echo "frame $n" >> trajectory.xyz
	m=`wc -l Head | cut -d ' ' -f 1`
	let m++
	mm=`expr $m + $N - 1`
	sed -n "$m,$mm p" $name | awk '{print $1,$2,$3,$4}' >> trajectory.xyz
	echo '' >> trajectory.xyz
	let n++
done
