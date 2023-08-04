# Equil 
#gmx grompp -f equilibration.mdp -c minimization.gro -p system.top -o equilibration.tpr -n system.ndx
#gmx mdrun -deffnm equilibration -v

gmx grompp -f equilibration2.mdp -c  equilibration.gro -p system.top -o equilibration2.tpr -n system.ndx

gmx mdrun -deffnm equilibration2 -v


