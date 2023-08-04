#!/bin/bash

cd ../

WINDOW1=2.5mM_270K 
WINDOW2=2.5mM_280K 
WINDOW3=2.5mM_300K 
WINDOW4=2.5mM_310K

for window in $(echo ${WINDOW1} ${WINDOW2} ${WINDOW3} ${WINDOW4} ${WINDOW5} ${WINDOW6} )
do

	cd $window
	b=2000000
	e=7000000
	d=1000
	rm -r maxclust_ps
	mkdir maxclust_ps
	for ((t = $b; t <= $e; t = $t+1000))
		do
			let "tb=$t-$d"
			let "te=$t"
			echo 7  | gmx clustsize -f dynamic.xtc -s dynamic.tpr -n ../system.ndx -cut 0.6 -pbc -mcn maxclust_ps/maxclust_$te.ndx -b $te -e $te
			
			wc -l maxclust_ps/maxclust_$te.ndx > maxclust_ps/a_$te.txt 
			fb=`grep .ndx maxclust_ps/a_$te.txt | awk '{print $1}'`
			echo  $fb > maxclust_ps/NM_$te 
			
		       #rm  maxclust_ps/a_*.txt maxclust_ps/*#
		        rm  *#
		done
	cd ../
done

      
