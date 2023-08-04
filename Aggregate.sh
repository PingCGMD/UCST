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
	
#	echo 6 | gmx clustsize -f dynamic.xtc -s dynamic.tpr -mc maxclust.xvg  -nc nclust.xvg -cut 0.6 -n ../system.ndx -pbc 
        echo 6 | gmx clustsize -f dynamic.xtc -s dynamic.tpr -mc maxclust_l4.xvg -nc nclust_l4.xvg -cut 0.6 -n ../system.ndx -pbc -tu us -b 4.5 -e 7

	rm *#
	
	cd ../

done 

