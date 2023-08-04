#!/usr/bin/env python

liste_name = ["SAS_all.xvg"]

liste_temperature_aggreg =["/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Aggregate/2.5mM_270K","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Aggregate/2.5mM_280K","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Aggregate/2.5mM_300K","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Aggregate/2.5mM_310K","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Aggregate/2.5mM_340K","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Aggregate/2.5mM_370K"]

liste_temperature_dissolution =["/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Dissolution/2.5mM_270K_D","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Dissolution/2.5mM_280K_D","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Dissolution/2.5mM_300K_D","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Dissolution/2.5mM_310K_D","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Dissolution/2.5mM_340K_D","/media/ping/Anastazia/Ping/UCST_prodrug/AAm-BMDO-P14/Mapping2/Solution-mapping2/P4_N4a_noions/Dissolution/2.5mM_370K_D"]


for index,aggreg_temperature in enumerate(liste_temperature_aggreg):
    str_temperature = aggreg_temperature[-4] + aggreg_temperature[-3] + aggreg_temperature[-2] + aggreg_temperature[-1]
#    output_file = open("{}_average_".format(str_temperature)+i, "w")
    disso_temperature = liste_temperature_dissolution[index]
    for i in liste_name:
        X = []
        Y1 = []
        Y2 = []
        Y3 = []
        output_file = open("{}_average_".format(str_temperature)+i, "w")

        fichier1 = open(aggreg_temperature + "/" + i, "r")
        fichier2 = open(disso_temperature + "/" +  i, "r")

       
        lines1 = fichier1.readlines()
        lines2 = fichier2.readlines()

        for line in lines1:
            if '2000000.000' in line:
                index2 = lines1.index(line)
        for j in range(index2,index2+len(lines1[index2:])):
            X.append(float(lines1[j][0:12]))
            Y1.append(round((float(lines1[j][12:21])+float(lines2[j][12:21]))/2,1))
            Y2.append(round((float(lines1[j][21:30])+float(lines2[j][21:30]))/2,1))
            Y3.append(round((float(lines1[j][31:39])+float(lines2[j][31:39]))/2,1))
        for k in range(0,len(X)):
            line = '{}   {}   {}   {}\n'.format(X[k],Y1[k],Y2[k],Y3[k])
            output_file.write(line)
        fichier1.close()
        fichier2.close()
        output_file.close()
