#!/usr/bin/env python

import sys
from Bio import SeqIO
from Bio.Seq import Seq
import re

def main():
    try:
        refDict=SeqIO.to_dict(SeqIO.parse(sys.argv[1],"fasta"))
    except:
        print("Error opening provided Reference genome file!..")
        exit(1)

    try:
        qryDict=SeqIO.to_dict(SeqIO.parse(sys.argv[2],"fasta"))
    except:
        print("Error opening provided Query assembly file!..")
        exit(1)
    try:
        coordFile=open(sys.argv[3],"r")
    except:
        print("Error opening provided Reference Coords file!..")
        exit(1)
    try:
        outputFile=open(sys.argv[4],"w")
    except:
        print("Error opening target output file!..")
        exit(1)

    keptPredictions=[]
    for currentEntry in coordFile:
        splitLine=currentEntry.split()
        refChrm=splitLine[0]
        refOrientation=splitLine[1]
        refStart=int(splitLine[2])
        refEnd=int(splitLine[3])

        qryChrm=splitLine[4]
        qryOrientation=int(splitLine[5])
        qryStart=int(splitLine[6])
        qryEnd=int(splitLine[7])

        refSubSeq=str(refDict.get(refChrm).seq[refStart:refEnd+1].upper())
        qrySubSeq=str(qryDict.get(qryChrm).seq[qryStart:qryEnd+1].upper())
        if qryOrientation < 0:
            qrySubSeq=str(Seq(qrySubSeq).reverse_complement())

        nCharsPat=re.compile("N+")
        refSearch=re.search("N+", refSubSeq)
        qrySearch=re.search("N+", qrySubSeq)
        if refSearch is None and qrySearch is None :
            keptPredictions.append(currentEntry)
        #else:
        #    print(nCharsPat.findall(refSubSeq), nCharsPat.findall(qrySubSeq))

    for prediction in keptPredictions:
        outputFile.write(prediction)

    outputFile.close()
    coordFile.close()

main()
