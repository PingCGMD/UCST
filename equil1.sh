# Equil 
# gmx grompp -f equilibration.mdp -c minimization.gro -p system.top -o equilibration.tpr -n system.ndx -r minimization.gro -maxwarn 1
# gmx mdrun -deffnm equilibration -v 


gmx mdrun -deffnm equilibration  -cpi  equilibration.cpt -s  equilibration.tpr -c  equilibration.gro -noappend

gmx grompp -f equilibration2.mdp -c  equilibration.gro -p system.top -o equilibration2.tpr -n system.ndx 

gmx mdrun -deffnm equilibration2 -v 

gmx mdrun -deffnm equilibration2  -cpi  equilibration2.cpt -s  equilibration2.tpr -c  equilibration2.gro -noappend
