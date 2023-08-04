#cp PAAm9.itp and PAAm7.itp and correct the beadtypes 
#itp-file generation

polyply gen_params -f PAAmBMDO_10D.ff -seqf PAAmBMDO_100D.json -name PAAmBMDO -o PAAmBMDO_P13_gradient.itp

#Initial structure generation
polyply gen_coords  -p system.top -o P13_G.gro -name PAAmBMDO -box 31.75 31.75 31.75

#minim in vacuum
gmx grompp -f minimization-vac.mdp -c P13_G.gro -p system.top  -o minimization-vac.tpr

gmx mdrun -deffnm minimization-vac -v

#add water
gmx solvate -cp minimization-vac.gro -cs water.gro -radius 0.21 -o system_W.gro -p system.top

#Minim
gmx grompp -f minimization.mdp -c system_W.gro -p system.top  -o minimization.tpr
gmx mdrun -deffnm minimization -v
