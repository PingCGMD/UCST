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
        
#       gmx distance -select 'com of group 8 plus com of group 3' -n ../system.ndx -oav dis_AAm_BMDO.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7
       
#      gmx distance -select 'group 3' -n ../system.ndx -oav dis_BMDO.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7

#       gmx distance -select 'group 8' -n ../system.ndx -oav dis_AAm.xvg  -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7 

#       gmx distance -select 'com of group 8 plus com of group 6' -n ../system.ndx -oav dis_AAm_W.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7

#not work        gmx distance -select 'com of group 3 plus com of group 3' -n ../system.ndx -oav dis_BMDO_t1.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7 #got 0.00nm
        
#not work        gmx distance -selrpos mol_com -seltype atom -select 'group 7 and name BMDO plus group 7 and name AAm' -n ../system.ndx -oav dis_AAm_BMDO_t2.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7		
#	gmx distance -selrpos mol_com -seltype atom -select 'group 7 and name AAm  plus group 3' -n ../system.ndx -oav dis_AAm_BMDO_t3.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7	


#     gmx distance -selrpos mol_com -seltype atom -select 'group 3' -n ../system.ndx -oav dis_BMDO.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7 #equal to 'gmx distance -selrpos mol_com -seltype atom -select 'group 7 and name BMDO plus group 3' -n ../system.ndx -oav dis_BMDO_t2.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7'

#      gmx distance -f traj_A.gro -s traj_A.tpr -n ../system.ndx -oall Ree_all.xvg -oav Ree_av.xvg -select 'group 11' -pbc -tu us -b 2 -e 7.0

#      gmx pairdist -selrpos res_com -seltype res_com -ref 'group 8' -sel 'group 3' -n ../system.ndx -o pair_AAm_BMDO.xvg -f traj_A.gro -s traj_A.tpr -tu us -b 2 -e 7

#      gmx pairdist -selrpos res_com -seltype res_com -ref 'group 8' -sel 'group 6' -n ../system.ndx -o pair_AAm_W.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7 -pbc 

       echo 3 8 | gmx mindist -f traj_A.gro -s traj_A.tpr -n ../system.ndx  -d 0.5 -on BMDO_AAm_numcount.xvg -od BMDO_AAm_mindist.xvg -tu us -b 2.0 

       echo 3 3 | gmx mindist -f traj_A.gro -s traj_A.tpr -n ../system.ndx  -d 0.5 -on BMDO_numcount.xvg -od BMDO_mindist.xvg -tu us -b 2.0 

       echo 8 8 | gmx mindist -f traj_A.gro -s traj_A.tpr -n ../system.ndx  -d 0.5 -on AAm_numcount.xvg -od AAm_mindist.xvg -tu us -b 2.0
      

	rm *# 
	rm *_t*.xvg

	cd ../

done 

