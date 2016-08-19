####### get Geom, Grad and Hess #######
awk '/geometry={/{p=1}/}/{p=0}p' *.out > Geom_tmp
awk '/SA-MC GRADIENT/{p=1}/Nuclear force/{p=0}p' *.out > Grad_tmp
awk '/Force Constants/{p=1}/Atomic Masses/{p=0}p' *.out > Hess_tmp
