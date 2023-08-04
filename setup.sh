
polyply gen_itp -f PAAm.ff -seq PAAm:4 -name PAAm4 -o PAAm4.itp
polyply gen_itp -f PAAm.ff -seq PAAm:5 -name PAAm5 -o PAAm5.itp
polyply gen_itp -f PAAm.ff -seq PAAm:9 -name PAAm9 -o PAAm9.itp

#itp-file generation

polyply gen_params -f PAAmBMDO_10D.ff -seqf PAAmBMDO_10D.json -name PAAmBMDO -o PAAmBMDO_P13.itp

#Initial structure generation
polyply gen_coords  -p system.top -o P13.gro -name PAAmBMDO -box 25.2 25.2 25.2

#minim in vacuum
gmx grompp -f minimization-vac.mdp -c P13.gro -p system.top  -o minimization-vac.tpr

gmx mdrun -deffnm minimization-vac -v

#add water
gmx solvate -cp minimization-vac.gro -cs water.gro -radius 0.21 -o system_W.gro

#add Ions
gmx grompp -f ions.mdp -c system_W.gro -p system.top -o ions.tpr

gmx genion -s ions.tpr  -p system.top  -neutral -conc 0.15 -pname NA -nname CL  -o system_WI.gro



gmx grompp -f minimization.mdp -c system_WI.gro -p system.top  -o minimization.tpr

gmx mdrun -deffnm minimization -v
