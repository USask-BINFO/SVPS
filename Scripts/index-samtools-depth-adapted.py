#!/usr/bin/env python3

"""****************************************************************************************************
Description: Basic script to index a samtools depth output file to allow for faster querying
Input: Samtools depth output, list of chromosomes, and 
Output: Index file for the samtools depth file, index by chromosome and every 100,000 base pairs
Note: Adapted from USask's BINF351 Asssignment#5 materials written by Lok Kan Lee and Brett Trost
****************************************************************************************************"""

import sys


""" Helper function to build index coordinate list to the output index file """
def buildIndexList(depthFile, avgDepthFile, chromList, indexInterval, chromIndexFile, intervalIndexFile):

	intervalIndexHandle=open(intervalIndexFile, "w")
	intervalIndexHandle.write("chrom\tindex\tbyte")

	chromIndexHandle=open(chromIndexFile, "w")

	with open(depthFile,"r") as samtoolsDepth:
		baseEntry = samtoolsDepth.readline().split("\t")
		chrom = baseEntry[0]
		indexPos = baseEntry[1]
		depthScore=baseEntry[3]

		lastIndex=indexPos
		for currentEntry in samtoolsDepth:
			entryComponents=currentEntry.split('\t')
			currentChrom=entryComponents[0]
			currentIndex=entryComponents[1]
			currentDepth=entryComponents[2]

			if chrom != currentChrom: # Reached the end of the chromosome so perform sum & avg calcs
				avgDepthChrom=depthSum/lastIndex
				chromIndexHandle.write()
				depthSum=0
			elif (currentIndex % indexInterval) == 0: # if index position reached represents an indexing interval, then write it to the indexCoordsList 
			        
				

			else: # else still within chromosome so add to counters in preparation for sum and avg calcs later
				chr
			lastIndex=currentIndex


def main(argv):
	#Files of interest
	depthFile=argv[0] # output from samtools depth
	intervalIndexFile=argv[1] # target output file for index being built
	indexInterval=argv[2] #Number of bases between each index entry to be written
	chromIndexFile=argv[3]
	chromInfoFile=argv[4] # File to store chrom info and average depth

	#Build index list
	print("Building index position list!..")
	buildIndex(depthFile, chromInfoFile, chromList, indexInterval, intervalIndexFile)

	print("Jobs done!..")


if __name__ == "__main__":
	main(sys.argv[1:])
