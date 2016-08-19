####### formatting input files #######
sed '/^ *$/d' Geom_tmp | sed '1d' | awk '{print $2,$3,$4}' | awk '{printf "%s ",$0}' |
awk '{print $1,$2,$3,$13,$14,$15}' > Geom
sed '/^ *$/d' Grad_tmp | sed '1,2d' | awk '{print $2,$3,$4}' | awk '{printf "%s ",$0}' |
awk '{print $1,$2,$3,$13,$14,$15}' > Grad
sed '/^ *$/d' Hess_tmp | sed '1d' | awk '{print $2,$3,$4,$5,$6}' | sed '/^G/d' |
sed '4,12d' | sed '7,36d' | sed '10,31d' > Hess_1
head -n 6 Hess_1 | sed '1,3d' | awk '{print $1,$2,$3}' > Hess_p1
tail -n 3 Hess_1 | awk '{print $3,$4}' > Hess_p2
paste Hess_p1 Hess_p2 > Hess_p12
head -n 3 Hess_1 > Hess
cat Hess_p12 >> Hess
tail -n 1 Hess_1 | awk '{print $5}' >> Hess
rm Hess*[12]
