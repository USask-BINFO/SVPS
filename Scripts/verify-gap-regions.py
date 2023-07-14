#!/usr/bin/env python3

import sys


def calcAvgDepthForGap(chrom,start,end,targetOffset,depthFileName):
	#Set up file handle and jump to target offset
	depthHandle=open(depthFileName)
	depthHandle.seek(targetOffset)
	regionDepthSum=0
	regionSize=abs((start-end)+1)

	#Calculate sum of region's depth values to determine average depth in the region
	for line in depthHandle:
		currentChrom, indexPos, depthScore = line.split('\t')
		if (chrom == currentChrom) and (start<= int(indexPos) <= end):
			regionDepthSum= regionDepthSum + float(depthScore)
		elif (chrom == currentChrom) and (int(indexPos) > end):
			break

	depthHandle.close()

	return round(regionDepthSum/regionSize,4)


def findIndexOffset(targetChrom,targetIndex, indexFileName):
	#Set up variables
	indexHandle=open(indexFileName)
	indexHandle.readline() # Skip header line
	indexOffset=0

	#Scan for memory offset in the depth file
	for line in indexHandle:
		indexChrom, indexValue, offsetValue = line.split('\t')
		if (targetChrom == indexChrom) and (int(offsetValue) < targetIndex):
			indexOffset = int(offsetValue)
		elif (targetChrom == indexChrom) and (int(targetIndex) < int(offsetValue)):
			break

	return indexOffset


def main(argv):
	depthFile=argv[0]
	indexFile=argv[1]

	#Extract Chrom infor to compare against
	chromAvgDepthDict={}
	with open(argv[2], "r") as chromInfo:
		for entry in chromInfo:
			currentEntry=entry.split('\t')
			currentChrom=str(currentEntry[0])
			currentSize=currentEntry[1]
			currentAvgDepth=currentEntry[2]
			chromAvgDepthDict[currentChrom] = currentAvgDepth

	#Process gap entries
	outputFile=open(argv[3],"w")
	with open(argv[4],"r") as coordFile:
		for gap in coordFile:
			#Seperate key coordinate information
			currentGap=gap.strip().split(' ')
			print("Verifying: " + gap,end="")
			currChrom=currentGap[0]
			start=int(currentGap[2])
			end=int(currentGap[3])
			svType=currentGap[-1]

			#Calculate average depth within the alignment gap's region
			targetOffset=findIndexOffset(currChrom,start,indexFile)
			avgDepth=calcAvgDepthForGap(currChrom,start,end,targetOffset,depthFile)

			#Evaluate depth versus chromosome's average to determine if result is correct (1) or incorrect (0)
			currentGap.append(str(avgDepth))
			if(avgDepth < float(chromAvgDepthDict[currChrom])):
				currentGap.append("1")
			else:
				currentGap.append("0")
			result = "\t".join(currentGap)
			outputFile.write(result + '\n')

	#Clean up and close files
	outputFile.close()
	print("Jobs done!..")


if __name__ == "__main__":
        main(sys.argv[1:])
