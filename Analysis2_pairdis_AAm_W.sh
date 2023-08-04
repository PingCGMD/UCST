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
	
	gmx pairdist -selrpos mol_com -seltype mol_com -ref 'group 8' -sel 'group 6' -n ../system.ndx -o D_AAm_W_mm.xvg -f dynamic.xtc -s dynamic.tpr -tu us -b 2 -e 7  -pbc  

  	gmx pairdist -selrpos mol_com -seltype res_com -ref 'group 8' -sel 'group 6' -n ../system.ndx -o D_AAm_W_mr.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7 -pbc

	gmx pairdist -selrpos mol_com -seltype mol_com -ref 'group 8' -sel 'group 6' -n ../system.ndx -o D_AAm_W_mm.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7 -pbc 
       
	gmx pairdist -selrpos mol_com -seltype atom -ref 'group 8' -sel 'group 6' -n ../system.ndx -o D_AAm_W_ma.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7  -pbc

	gmx pairdist -selrpos res_com -seltype atom -ref 'group 8' -sel 'group 6' -n ../system.ndx -o D_AAm_W_ra.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7  -pbc

	gmx pairdist -selrpos res_com -seltype res_com -ref 'group 8' -sel 'group 6' -n ../system.ndx -o D_AAm_W_rr.xvg -f dynamic.xtc -s dynamic.tpr   -tu us -b 2 -e 7 -pbc  


	rm *#
	
	cd ../

done 

