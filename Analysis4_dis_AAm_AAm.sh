#!/bin/bash

WINDOW1=1.25mM_270K 
WINDOW2=1.25mM_280K 
WINDOW3=1.25mM_300K 
WINDOW4=1.25mM_310K
WINDOW5=1.25mM_340K
WINDOW6=1.25mM_370K

for window in $(echo ${WINDOW1} ${WINDOW2} ${WINDOW3} ${WINDOW4} ${WINDOW5} ${WINDOW6} )
do

	cd $window
	
#       gmx distance -selrpos mol_com -seltype mol_com -select 'group 8' -n ../system.ndx -oav dis_AAm_AAm_mm.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7   

# 	gmx distance -selrpos mol_com -seltype res_com -select 'group 8' -n ../system.ndx -oav dis_AAm_AAm_mr.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7 
  
#	gmx distance -selrpos mol_com -seltype atom -select 'group 8' -n ../system.ndx -oav dis_AAm_AAm_ma.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7  
#        gmx distance -selrpos atom -seltype atom -select 'group 3' -n ../system.ndx -oav dis_BMDO.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 4.5 -e 7 -pbc -oall dis_BMDO_all.xvg 

#	gmx distance -selrpos res_com -seltype atom -select 'group 8' -n ../system.ndx -oav dis_AAm_AAm_ra.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7  

#	gmx distance -selrpos res_com -seltype res_com -select 'group 8' -n ../system.ndx -oav dis_AAm_AAm_rr.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7  
 
#       gmx distance -select 'com of group 8 plus com of group 3' -n ../system.ndx -oav dis_AAm_BMDO.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 4.5 -e 7

#       gmx distance -select 'group 3' -n ../system.ndx -oav dis_BMDO.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 4.5 -e 7

#       gmx distance -select 'group 8' -n ../system.ndx -oav dis_AAm.xvg  -f dynamic.xtc -s dynamic.tpr -tu us -b 4.5 -e 7

#       gmx distance -select 'com of group 8 plus com of group 9' -n ../system.ndx -oav dis_AAm_W.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 4.5 -e 7

#       gmx distance -f traj_A.gro -s traj_A.tpr -n ../system.ndx -oall Ree_all.xvg -oav Ree_av.xvg -select 'group 10' -pbc -tu us -b 4.5 -e 7.0

#       gmx pairdist -selrpos res_com -seltype res_com -ref 'group 8' -sel 'group 3' -n ../system.ndx -o pair_AAm_BMDO.xvg -f traj_A.gro -s traj_A.tpr -tu us -b 4.5 -e 7

        echo 3 8 | gmx mindist -f traj_A.gro -s traj_A.tpr -n ../system.ndx -d 0.5 -on BMDO_AAm_numcount.xvg -od BMDO_AAm_mindist.xvg -tu us -b 4.5 -e 7 

        echo 3 3 | gmx mindist -f traj_A.gro -s traj_A.tpr -n ../system.ndx -d 0.5 -on BMDO_numcount.xvg -od BMDO_mindist.xvg -tu us -b 4.5 -e 7

	echo 8 8 | gmx mindist -f traj_A.gro -s traj_A.tpr -n ../system.ndx  -d 0.5 -on AAm_numcount.xvg -od AAm_mindist.xvg -tu us -b 4.5 -e 7

	rm *#
	rm *-t.xvg
	
	cd ../

done 

