#!/usr/bin/env python3

import sys


#Container for key alignment information to be tested when building graph components
class AlignmentNode:
	def __init__(self,intID,rStart,rEnd,rOrientation,qStart,qEnd,qOrientation):
		self.intID=intID
		self.rStart=rStart
		self.rEnd=rEnd
		self.rOrientation=rOrientation
		self.qStart=qStart
		self.qEnd=qEnd
		self.qOrientation=qOrientation



#Old version - Unsused
def parseComponents(coordFile):
        with open(coordFile,"r") as coordsFile:
                coordsList=coordsFile.read().splitlines()
                #Create Dict containing all alignment coords string as keys and the component as value
                componentsDict={}
                groupedDict={}
                componentID=1
                groupID=0

                #Set initial values for previous entry (invalid values to ensure first entry gets assigned to component 1)
                prevKey=""
                prevRefChrom=""
                prevRefDir=-2
                prevRefStart=-1
                prevRefEnd=-1
                prevRefSVLen=-1

                #Process each sorted alignment coordinate line to identify those that refer to same repeated subsequence
                for entry in coordsList:
                        currentFields = entry.split(' ')
                        refChrom=currentFields[0]
                        refDir=currentFields[1]
                        refStart=currentFields[2]
                        refEnd=currentFields[3]
                        qryChrom=currentFields[4]
                        qryDir=currentFields[5]
                        qryStart=currentFields[6]
                        qryEnd=currentFields[7]
                        svLen=currentFields[8]
                        similarityScore=currentFields[9]

                        #Check if alignments overlap, assign same component if they do or a new component if distinct
                        if(refChrom == prevRefChrom and prevRefStart <= refStart <= prevRefEnd and prevRefStart<= refEnd <= prevRefEnd):
                                componentsDict[entry]=componentsDict[prevKey]
                                groupedDict[groupID].append(currentFields)
                        else:
                                componentsDict[str(entry)]=componentID
                                componentID=componentID+1
                                groupID=groupID+1
                                groupedDict[groupID] = [currentFields]
                                #groupedDict[groupID].append(currentFields)

                        prevKey=entry
                        prevRefChrom=refChrom
                        prevRefDir=refDir
                        prevRefStart=refStart
                        prevRefEnd=refEnd
                        prevRefSVLen=svLen

        return componentsDict,groupedDict

#Old version - unused
def parseComponentsSubset(coordFile):
        with open(coordFile,"r") as coordsFile:
                coordsList=coordsFile.read().splitlines()
                #Create Dict containing all alignment coords string as keys and the component as value
                componentsDict={}
                groupedDict={}
                matchesDict={}
                componentID=1
                groupID=0

                #Set initial values for previous entry (invalid values to ensure first entry gets assigned to component 1)
                prevKey=""
                prevRefChrom=""
                prevRefDir=-2
                prevRefStart=-1
                prevRefEnd=-1
                prevRefSVLen=-1

                #Process each sorted alignment coordinate line to identify those that refer to same repeated subsequence
                for entry in coordsList:
                        currentFields = entry.split(' ')
                        refChrom=currentFields[0]
                        refDir=currentFields[1]
                        refStart=int(currentFields[2])
                        refEnd=int(currentFields[3])
                        qryChrom=currentFields[4]
                        qryDir=currentFields[5]
                        qryStart=int(currentFields[6])
                        qryEnd=int(currentFields[7])
                        svLen=int(currentFields[8])
                        #similarityScore=currentFields[9]

                        keyVal=(refChrom,int(refStart),int(refEnd))
                        qryMatch=(qryChrom,int(qryStart),int(qryEnd))

                        #Check if alignments overlap, assign same component if they do or a new component if distinct
                        if(refChrom == prevRefChrom and prevRefStart == refStart and  refEnd == prevRefEnd):
                                componentsDict[keyVal]=componentsDict[prevKey]
                                #groupedDict[groupID].append(currentFields)
                                groupedDict[groupID].append(keyVal)
                                matchesDict[keyVal].append(qryMatch)
                        else:
                                componentsDict[keyVal]=componentID
                                componentID=componentID+1
                                groupID=groupID+1
                                #groupedDict[groupID] = [currentFields]
                                groupedDict[groupID] = [keyVal]
                                matchesDict[keyVal] = [qryMatch]


                        prevKey=keyVal
                        prevRefChrom=refChrom
                        prevRefDir=refDir
                        prevRefStart=refStart
                        prevRefEnd=refEnd
                        prevRefSVLen=svLen

        return componentsDict,groupedDict,matchesDict




def buildKeyEntryDict(keySeqID,coordsFile,matchSeqID):
        #Create Dict containing all alignment coords string grouped by a key based on the reference position
        keysDict={}
        matchesDict={}
        with open(coordsFile,"r") as coordsFileHandle:
                coordsList=coordsFileHandle.read().splitlines()

                #Set initial values for previous entry (invalid values to ensure first entry gets assigned to component 1)
                prevEntry=""
                prevKey=""
                prevRefChrom=""
                prevRefDir=-2
                prevRefStart=-1
                prevRefEnd=-1
                prevRefSVLen=-1

                #Process each sorted alignment coordinate line to identify those that refer to same repeated subsequence
                for entry in coordsList:
                        currentFields = entry.split(' ')
                        refChrom=currentFields[0]
                        refDir=currentFields[1]
                        refStart=int(currentFields[2])
                        refEnd=int(currentFields[3])
                        qryChrom=currentFields[4]
                        qryDir=currentFields[5]
                        qryStart=int(currentFields[6])
                        qryEnd=int(currentFields[7])
                        svLen=int(currentFields[8])

                        #Extract Key values for later pairing into components
                        keyVal=(keySeqID,refChrom,int(refStart),int(refEnd))
                        qryMatch=(matchSeqID,qryChrom,int(qryStart),int(qryEnd))

                        #Map entries to shared key values for all entries that refer to same reference location
                        if(keyVal not in keysDict.keys()):
                               keysDict[keyVal]=[entry]
                        else:
                               keysDict[keyVal].append(entry)

                        if(keyVal not in matchesDict.keys()):
                               matchesDict[keyVal]=[qryMatch]
                        else:
                               matchesDict[keyVal].append(qryMatch)

        return keysDict,matchesDict

#Logic Flaw
def recursiveDepthFirstLabeller(labelsDict,currentKey,componentID,refMatches,qryMatches):
		labelsDict[currentKey]=componentID #Set label for current component
		#Determine next Dict to extract matyches from based on current key
		if(currentKey[0] == "Ref"):
			targetDict=refMatches
		else:
			targetDict=qryMatches
		#Process each match recursively
		for matchKey in targetDict[currentKey]:
			#Process each match recursively if unassigned
			if( (matchKey in labelsDict.keys()) and (labelsDict[matchKey]==-1)): #If matchKey is not present, then it can't expand component anyway
				recursiveDepthFirstLabeller(labelsDict,matchKey,componentID,refMatches,qryMatches)

#Logic Flaw
def buildComponents(refKeyedEntries,refMatchingKeys,qryKeyedEntries,qryMatchingKeys):
	matchedKeys= list(refKeyedEntries.keys()) + list(qryKeyedEntries.keys())
	#for key in matchedKeys:
	#	print(key)
	componentID=1
	keyComponentLabels={}

	#Sett all components to -1
	for currKey in matchedKeys:
		#print(currKey)
		keyComponentLabels[currKey]=-1

	for currKey in matchedKeys:
		if keyComponentLabels[currKey] == -1:
			recursiveDepthFirstLabeller(keyComponentLabels,currKey,componentID,refMatchingKeys,qryMatchingKeys)
		componentID=componentID+1

	return keyComponentLabels

def swapKeyValInDict(targetDict):
	swappedDict={}
	for key in targetDict.keys():
		swappedDict[targetDict[key]] = key

	return swappedDict


#def listComparisonAttempt(refMatches, qryMatches):
#
#	valuesList=list(refmatches.values())
#	for index in range(len(refMatches.values()):
#		currentEntry = valuesList[index]
#		for onward in range(index,len(refMatches.values()):
#			futureEntry=valuesList 



def main(argv):
	refCoordsFile=argv[0]
	qryCoordsFile=argv[1]

	refKeysToEntries, refKeysToMatches = buildKeyEntryDict("Ref",refCoordsFile,"Qry")
	qryKeysToEntries, qryKeysToMatches = buildKeyEntryDict("Qry",qryCoordsFile,"Ref")

	labelledComponents = buildComponents(refKeysToEntries,refKeysToMatches,qryKeysToEntries,qryKeysToMatches)
	groupedComponentDict= swapKeyValInDict(labelledComponents)

	#Debugging
	for key in qryKeysToMatches.keys():
		#if(len(refGroupsDict[key])>1):
		#	print(key, ":",refGroupsDict[key])
		print(key, ":",qryKeysToMatches[key])
	for key in groupedComponentDict.keys():
		print(key,":",groupedComponentDict[key])


#Join related Ref and Qry components to joint


	print("Jobs done!..")


if __name__ == "__main__":
        main(sys.argv[1:])





