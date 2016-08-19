cat > result_tmp
head -n 1 result_tmp | awk '{print $2/sqrt(12),$3/sqrt(12),$4/sqrt(12)}' 
tail -n 1 result_tmp | awk '{print $2,$3,$4}' 
