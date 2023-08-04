#!/bin/bash

WINDOW1=270 
WINDOW2=280 
WINDOW3=300 
WINDOW4=310
WINDOW5=340
WINDOW6=370

for window in $(echo ${WINDOW1} ${WINDOW2} ${WINDOW3} ${WINDOW4} ${WINDOW5} ${WINDOW6} )
do

	mkdir $window

        cp equilibration*.mdp $window
	cp dynamic.mdp $window

        cd $window

        sed "s/TEMP/$window/g" -i equilibration.mdp
        sed "s/TEMP/$window/g" -i equilibration2.mdp
        sed "s/TEMP/$window/g" -i dynamic.mdp
         
        gmx grompp -f equilibration.mdp -c ../minimization.gro -p ../system.top  -o equilibration.tpr -n ../system.ndx
	
	gmx mdrun -deffnm equilibration -v
	
	gmx grompp -f equilibration2.mdp -c equilibration.gro -p ../system.top  -o equilibration2.tpr -n ../system.ndx

        gmx mdrun -deffnm equilibration2 -v

    
	rm *#
	
	cd ../

done 

