#!/bin/bash

b=2000000
e=7000000
d=1000

rm volume.dat
#rm volume_*.xvg

for ((t = $b; t <= $e; t = $t+1000))
do
   let "tb=$t-$d"
   let "te=$t"
        
   file=./NM_$te

   for num in $(<"$file"); do
       if ((num>1680)); then 
	    	       	                 	      
            echo 0 | gmx sasa -f ../dynamic.xtc -s ../dynamic.tpr -n maxclust_$te.ndx -tv volume_$te.xvg -probe 0.26 -pbc -surface -b $te -e $te	   

       fi
   done 
   fe=`grep 0.000 volume_$te.xvg |  awk '{print $1, $2}'`
   echo $fe >> volume.dat
   rm  *#

done

