#!/bin/bash
cd ../

WINDOW1=2.5mM_270K_1 
WINDOW2=2.5mM_280K_1 
WINDOW3=2.5mM_300K 
WINDOW4=2.5mM_310K

for window in $(echo ${WINDOW1} ${WINDOW2} ${WINDOW3} ${WINDOW4})
do

	cd $window/maxclust_ps/
	b=2000000
	e=7000000
	d=1000
	#rm NN*.dat
	for ((t = $b; t <= $e; t = $t+1000))
		do
		     	let "tb=$t-$d"
		     	let "te=$t"
		        file=./NM_$te
		     	for num in $(<"$file");
		       	do
			 	if ((num>1680));
			       	then
			 	paste -d' ' <(echo "$te") <(echo "$((num/140-1/140))") <(echo "$((24-num/140+1/140))") >> NN.dat
			        fi
		     	done 
		done
done
