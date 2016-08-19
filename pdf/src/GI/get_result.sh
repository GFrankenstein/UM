grep 'TOTAL ENERGIES' `ls -v *.out` |
sed 's/GI_Ener_Cal-//' |
sed 's/.out: TOTAL ENERGIES                   //'
