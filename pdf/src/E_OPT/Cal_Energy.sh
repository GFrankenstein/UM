sed -i 's/\[/ /g' Geom_tmp
sed -i 's/\]/ /g' Geom_tmp
awk '{print $1,$2}' GeomO >atom_tmp
paste atom_tmp Geom_tmp >Geom
rm *_tmp
cat Head Geom Tail >MRMP_OPT.inp
awk '/NATURAL ORBITALS OF MCSCF/{p=1}/OPTIMIZED MCSCF MO-S/{p=0}p' /home/zxqu/scr/MRMP_OPT.dat | sed '1,3d' >>MRMP_OPT.inp
$gms MRMP_OPT.inp 00 16 >MRMP_OPT.out
tac MRMP_OPT.out | grep -m 1 -B 4 ' STATE #    3  ENERGY =' >>CHECK
tac MRMP_OPT.out | grep -m 1 ' STATE #    3  ENERGY =' | awk '{print $6}'
