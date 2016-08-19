awk '/CI vector/{p=1}/TOTAL ENERGIES/{p=0}p' *.out |
sed -e '1,3d' -e '/^ *$/d' |
awk '{print $1,$5*$5}' > c2_tmp
#mode A
awk '/^ab......|^ba....../{s+=$2}END{print 4*s,"mode A_co"}' c2_tmp >> mode_tmp
awk '/^02......|^20....../{s+=$2}END{print 4*s,"mode A_io"}' c2_tmp >> mode_tmp
#mode B
awk '/^a..b....|^b..a..../{s+=$2}END{print 4*s,"mode B_co"}' c2_tmp >> mode_tmp
awk '/^0..2....|^2..0..../{s+=$2}END{print 4*s,"mode B_io"}' c2_tmp >> mode_tmp
#mode C
awk '/^a...b...|^b...a.../{s+=$2}END{print 4*s,"mode C_co"}' c2_tmp >> mode_tmp
awk '/^0...2...|^2...0.../{s+=$2}END{print 4*s,"mode C_io"}' c2_tmp >> mode_tmp
#mode D
awk '/^a.....b.|^b.....a./{s+=$2}END{print 4*s,"mode D_co"}' c2_tmp >> mode_tmp
awk '/^0.....2.|^2.....0./{s+=$2}END{print 4*s,"mode D_io"}' c2_tmp >> mode_tmp
#mode a
awk '/^a....b..|^b....a../{s+=$2}END{print 2*s,"mode a_co"}' c2_tmp >> mode_tmp
awk '/^0....2..|^2....0../{s+=$2}END{print 2*s,"mode a_io"}' c2_tmp >> mode_tmp
#mode b
awk '/^a.b.....|^b.a...../{s+=$2}END{print 2*s,"mode b_co"}' c2_tmp >> mode_tmp
awk '/^0.2.....|^2.0...../{s+=$2}END{print 2*s,"mode b_io"}' c2_tmp >> mode_tmp
#mode c
awk '/^a......b|^b......a/{s+=$2}END{print 2*s,"mode c_co"}' c2_tmp >> mode_tmp
awk '/^0......2|^2......0/{s+=$2}END{print 2*s,"mode c_io"}' c2_tmp >> mode_tmp
#mode α
awk '/^.a.b....|^.b.a..../{s+=$2}END{print 2*s,"mode α_co"}' c2_tmp >> mode_tmp
awk '/^.0.2....|^.2.0..../{s+=$2}END{print 2*s,"mode α_io"}' c2_tmp >> mode_tmp
#mode β
awk '/^.a..b...|^.b..a.../{s+=$2}END{print 2*s,"mode β_co"}' c2_tmp >> mode_tmp
awk '/^.0..2...|^.2..0.../{s+=$2}END{print 2*s,"mode β_io"}' c2_tmp >> mode_tmp
#mode γ
awk '/^.a....b.|^.b....a./{s+=$2}END{print 2*s,"mode γ_co"}' c2_tmp >> mode_tmp
awk '/^.0....2.|^.2....0./{s+=$2}END{print 2*s,"mode γ_io"}' c2_tmp >> mode_tmp
sort -r mode_tmp
rm *_tmp
