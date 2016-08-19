####### formatting input files #######
sed '/^ *$/d' Geom_tmp | sed '1d' | awk '{print $2,$3,$4}' | awk '{printf "%s ",$0}' > Geom
sed '/^ *$/d' Grad_tmp | sed '1,2d' | awk '{print $2,$3,$4}' | awk '{printf "%s ",$0}' > Grad
sed '/^ *$/d' Hess_tmp | sed '1d' | awk '{print $2,$3,$4,$5,$6}' | sed '/^G/d' > Hess 
