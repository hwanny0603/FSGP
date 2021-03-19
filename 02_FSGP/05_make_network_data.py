#!/usr/bin/env python
import os

cells = []
infile = open("/storage/home/sehwanahn/FSGP/FSGP_L1000_Activator/etc/cell_id.txt",'r')
for line in infile.readlines():
    items = line.strip().split("\t")
    cells.append(items[0])
infile.close()

drugs = []
infile = open("/storage/home/sehwanahn/FSGP/FSGP_L1000_Activator/etc/activator_ordered.txt",'r')
for line in infile.readlines():
    items = line.strip().split("\t")
    drugs.append(items[1])
infile.close()

infile = open("/storage/home/sehwanahn/FSGP/research/result/significant_FSGP_FDR.txt",'r')
outfile = open("/storage/home/sehwanahn/FSGP/research/result/network.txt",'w')
header =0
for line in infile.readlines():
    if header==0:
        header =1
    else:
        items = line.strip().split("\t")
        gene = items[0]
        FSGP = items[2]
        row = FSGP.strip().split("], ")[0]
        row = row.replace("[[","[")
        FSGP_cell = []
        for p in row:
            if p=="[" or p=="," or p=="]" or p==" ":
                continue
            else:
                FSGP_cell.append(int(p))
        col = FSGP.strip().split("], ")[1]
        col = col.replace("]]","]")
        FSGP_drug = []
        for p in col:
           if p=="[" or p=="," or p=="]" or p==" ":
               continue
           else:
               FSGP_drug.append(int(p))
        for i in range(0,len(cells)):
            if FSGP_cell[i]==1:
                outfile.write(gene + "\t" + cells[i] + "\n")
        for j in range(0,len(drugs)):
            if FSGP_drug[j]==1:
                outfile.write(gene + "\t" + drugs[j] + "\n")
infile.close()
outfile.close()   
