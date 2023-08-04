#!/bin/bash

echo 7 | gmx convert-tpr -s dynamic.tpr -o dynamic1.tpr -n system.ndx

echo 7  | gmx clustsize -f dynamic3.2.gro -s dynamic1.tpr -mc maxclust.xvg -ac avcluste.xvg -nc nclust.xvg -cut 0.6 -n system.ndx -pbc


