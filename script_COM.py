#!/usr/bin/env python

liste_name = ["rdf_COM_AAm.xvg", "rdf_COM_BMDO.xvg", "rdf_AAm_W_mr.xvg", "rdf_AAm_W_mm.xvg", "rdf_AAm_W_ma.xvg", "rdf_BB1_W_mr.xvg", "rdf_BB1_W_mm.xvg", "rdf_BB1_W_ma.xvg", "rdf_COM_AAm.xvg", "rdf_COM_BMDO.xvg"]

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
            if '      0.000' in line:
                index2 = lines1.index(line)
        for j in range(index2,index2+len(lines1[index2:])):
            X.append(float(lines1[j][1:12]))
            Y1.append((float(lines1[j][13:21])+float(lines2[j][13:21]))/2)
        for k in range(0,len(X)):
            line = '      {}    {}\n'.format(X[k],Y1[k])
            output_file.write(line)
        fichier1.close()
        fichier2.close()
        output_file.close()
