#!/bin/bash

WINDOW1=2.5mM_270K 
WINDOW2=2.5mM_280K 
WINDOW3=2.5mM_300K 
WINDOW4=2.5mM_310K
WINDOW5=2.5mM_340K
WINDOW6=2.5mM_370K

for window in $(echo ${WINDOW1} ${WINDOW2} ${WINDOW3} ${WINDOW4} ${WINDOW5} ${WINDOW6} )
do

	cd $window
	
	gmx rdf -selrpos mol_com -seltype res_com -ref 'group 7' -sel 'group 8' -n ../system.ndx -o rdf_COM_AAm.xvg -f traj_A.gro -s traj_A.tpr -bin 0.05 -rmax 10 -tu us -b 2 -e 7

	gmx rdf -selrpos mol_com -seltype res_com -ref 'group 7' -sel 'group 3' -n ../system.ndx -o rdf_COM_BMDO.xvg -f traj_A.gro -s traj_A.tpr -bin 0.05 -rmax 10 -tu us -b 2 -e 7
       
	


	rm *#
	
	cd ../

done 

