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
        
#       echo 7 7 | gmx trjconv -f dynamic.xtc -s dynamic.tpr -n ../system.ndx -o traj_A.gro -tu us -b 2.0 -e 7.0 -pbc cluster  

#	echo 7 | gmx convert-tpr -s dynamic.tpr -n ../system.ndx -o traj_A.tpr

# 	echo 7 | gmx gyrate -f traj_A.gro -s traj_A.tpr  -o gyrate-a.xvg -n ../system.ndx -nmol 24

#        echo 7 |  gmx polystat -f dynamic.xtc -s dynamic.tpr -n ../system.ndx -tu us -b 2 -e 7

#        gmx sasa -f traj_A.gro -s traj_A.tpr -n ../system.ndx -o SAS_all.xvg -or RES_SAS_all.xvg -pbc -surface 'group 7' -output 'group 8' 'group 9'  -ndots 25 -probe 0.26 -oa

#pair distance
#        gmx rdf -selrpos res_com -seltype res_com -ref 'group 8' -sel 'group 8' -n ../system.ndx  -o rdf_self_AAm.xvg  -f traj_A.gro -s traj_A.tpr  -bin 0.05 -rmax 10
#        gmx rdf -selrpos res_com -seltype res_com -ref 'group 3' -sel 'group 3' -n ../system.ndx  -o rdf_self_BMDO.xvg -f traj_A.gro -s traj_A.tpr  -bin 0.05 -rmax 10

#location of each component
        gmx rdf -selrpos mol_com -seltype res_com -ref 'group 7' -sel 'group 8'  -n ../system.ndx -o rdf_COM_AAm.xvg  -f traj_A.gro -s traj_A.tpr -bin 0.05 -rmax 10 
        gmx rdf -selrpos mol_com -seltype res_com -ref 'group 7' -sel 'group 3'  -n ../system.ndx -o rdf_COM_BMDO.xvg -f traj_A.gro -s traj_A.tpr -bin 0.05 -rmax 10 
        gmx rdf -selrpos mol_com -seltype res_com -ref 'group 7' -sel 'group 9'  -n ../system.ndx -o rdf_COM_BB1.xvg  -f traj_A.gro -s traj_A.tpr -bin 0.05 -rmax 10
      
	rm *#
	
	cd ../

done 

