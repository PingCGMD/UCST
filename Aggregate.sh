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
	
	echo 7 | gmx clustsize -f dynamic.xtc -s dynamic.tpr -mc maxclust_l5.xvg  -nc nclust_l5.xvg -cut 0.6 -n ../system.ndx -pbc -b 2 -e 7 -tu us


	rm *#
	
	cd ../

done 

