#!/usr/bin/env python3

import sys


#Container for key alignment information to be tested when building graph components
class AlignmentNode:
	def __init__(self,intID,rChrom,rStart,rEnd,rOrientation,qChrom,qStart,qEnd,qOrientation,svLen,svType,simScore):
		self.intID=intID
		self.rChrom=rChrom
		self.rStart=rStart
		self.rEnd=rEnd
		self.rOrientation=rOrientation
		self.qChrom=qChrom
		self.qStart=qStart
		self.qEnd=qEnd
		self.qOrientation=qOrientation
		self.svLen=svLen
		self.svType=svType
		self.simScore=simScore


def parseAlignmentsToGraphNodes(coordFile):
        with open(coordFile,"r") as coordsFile:
                coordsList=coordsFile.read().splitlines()
                nodeID=0
                nodeDict={}
                compDict={}

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
                        svType=currentFields[9]
                        simScore=currentFields[10]
                        newNode=AlignmentNode(nodeID,refChrom,refStart,refEnd,refDir,qryChrom,qryStart,qryEnd,qryDir,svLen,svType,simScore)
                        nodeDict[newNode]=[] #AlignmentNode(nodeID,refChrom,refStart,refEnd,refDir,qryChrom,qryStart,qryEnd,qryDir)
                        nodeID=nodeID+1
                nodeList=list(nodeDict.keys())
                numNodes=len(nodeList)
                for i in range(numNodes):
                        for j in range(i,numNodes):
                                 if(nodeList[i] != nodeList[j]):
                                          if((nodeList[i].rChrom == nodeList[j].rChrom and nodeList[i].rStart == nodeList[j].rStart and nodeList[i].rEnd == nodeList[j].rEnd)
                                                   or (nodeList[i].qChrom == nodeList[j].qChrom and nodeList[i].qStart == nodeList[j].qStart and nodeList[i].qEnd == nodeList[j].qEnd)):
                                                         if(nodeList[j] not in nodeDict[nodeList[i]] ):
                                                               nodeDict[nodeList[i]].append(nodeList[j])
                                                         if(nodeList[i] not in nodeDict[nodeList[j]]):
                                                               nodeDict[nodeList[j]].append(nodeList[i])

        return nodeDict



def recTravHelper(startNode,visited,nodeDict):
	if startNode in visited:
		print("already visited, trouble!")
	visited.add(startNode)
	currentComp=[startNode]
	for nextNode in nodeDict[startNode]:
		if nextNode not in visited:
			currentComp = currentComp + recTravHelper(nextNode,visited,nodeDict)
	return currentComp


def recGraphTraversal(nodeDict):
	compID=1
	compDict={}
	visited=set()
	for node in nodeDict.keys():
		if node not in visited:
			currentComp = recTravHelper(node,visited,nodeDict)
			compDict[compID] = currentComp
			compID=compID+1

	return compDict


def extractUniqCoordFromComponents(compDict,nodeDict):
	uniqSeqsPerComp={}
	#For each component, process each list of nodes
	for key in compDict.keys():
		compNodes=compDict[key]
		uniqSeqsPerComp[key]={"R":[],"Q":[],"Entries":[],"CNVType":""} #Still need CNV type field?
		#For each node in list of nodes, check ref and qry sequences and store only those not found yet
		for node in compNodes:
			refKey=(node.rChrom,node.rStart,node.rEnd)
			qryKey=(node.qChrom,node.qStart,node.qEnd)
			fullEntry=[node.rChrom,node.rOrientation,node.rStart,node.rEnd,node.qChrom,node.qOrientation,node.qStart,node.qEnd,node.svLen,node.svType,node.simScore]
			if(refKey not in uniqSeqsPerComp[key]["R"]):
				uniqSeqsPerComp[key]["R"].append(refKey)
				if(fullEntry not in uniqSeqsPerComp[key]["Entries"]):
					uniqSeqsPerComp[key]["Entries"].append(fullEntry)
			if(qryKey not in uniqSeqsPerComp[key]["Q"]):
				uniqSeqsPerComp[key]["Q"].append(qryKey)
				if(fullEntry not in uniqSeqsPerComp[key]["Entries"]):
					uniqSeqsPerComp[key]["Entries"].append(fullEntry)

	return uniqSeqsPerComp


def findCompsWithImbalanceInUniqs(compSeqs):
	cnvComps={}
	for key in compSeqs.keys():
		#if len(compSeqs[key]["R"]) != len(compSeqs[key]["Q"]):
		if len(compSeqs[key]["R"]) < len(compSeqs[key]["Q"]): #Dup relates to variation where query has more copies of the region
			cnvComps[key]=compSeqs[key]
			#if(len(compSeqs[key]["R"]) > len(compSeqs[key]["Q"])):
			#	cnvComps[key]["CNVType"]="CNG"
			#else:
			#	cnvComps[key]["CNVType"]="CNL"
			#for entry in cnvComps[key]["Entries"]:
			#	entry[9]=str(entry[9]+":"+cnvComps[key]["CNVType"])

	return cnvComps



def swapKeyValInDict(targetDict):
	swappedDict={}
	for key in targetDict.keys():
		swappedDict[targetDict[key]] = key

	return swappedDict


def removeClosestEntryFromEachCNV(cnvRegions):
	cnvEntriesOnly=[]

	for key in cnvRegions.keys():
		currEntriesList=cnvRegions[key]["Entries"].copy()
		sepDistList=[]
		for entry in currEntriesList:
			refStart=entry[2]
			qryStart=entry[6]
			sepDistList.append(abs(refStart-qryStart))
		##for round in range( min( len(cnvRegions[key]["R"]),len(cnvRegions[key]["Q"]) ) ):
		#minIndex=sepDistList.index(min(sepDistList))
		#currEntriesList.pop(minIndex)
		#sepDistList.pop(minIndex)
		#cnvEntriesOnly=cnvEntriesOnly+currEntriesList

		for round in range( min( len(cnvRegions[key]["R"]),len(cnvRegions[key]["Q"]) ) ):
			minIndex=sepDistList.index(min(sepDistList))
			currRefEntries=[]
			currRefEntries.append(currEntriesList.pop(minIndex))
			sepDistList.pop(minIndex)
			cnvEntriesOnly=cnvEntriesOnly+currRefEntries

	return cnvEntriesOnly



def main(argv):
	coordsFile=argv[0]
	#qryCoordsFile=argv[1]

	nodesDict=parseAlignmentsToGraphNodes(coordsFile)
	compDict=recGraphTraversal(nodesDict)
	compSeqs=extractUniqCoordFromComponents(compDict,nodesDict)
	cnvCandidates=findCompsWithImbalanceInUniqs(compSeqs)
	cnvEntries=removeClosestEntryFromEachCNV(cnvCandidates)

	##Debugging
	#for key in nodesDict.keys():
	#	if(len(nodesDict[key])>1):
	#		print(nodesDict[key])

	#for compID in compDict.keys():
		##print(compID, ":", compDict[compID])
	#	print(compID, "Ref:", compSeqs[compID]["R"])
	#	print(compID, "Qry:", compSeqs[compID]["Q"])
	#	print(compID, "Entries:", compSeqs[compID]["Entries"])

	sumR=0
	sumQ=0
	for compID in cnvCandidates.keys():
		sumR=sumR+len(cnvCandidates[compID]["R"])
		sumQ=sumQ+len(cnvCandidates[compID]["Q"])
		print(compID, ":", len(cnvCandidates[compID]["R"]), len(cnvCandidates[compID]["Q"]), len(cnvCandidates[compID]["Entries"]) )
	#	#print(compID, "Ref:", cnvRegions[compID]["R"])
	#	#print(compID, "Qry:", cnvRegions[compID]["Q"])
		print(compID, "Entries:", cnvCandidates[compID]["Entries"])
	#	for entry in cnvRegions[compID]["Entries"]:
	#		sepDist=abs(entry[2] - entry[6])
	#		svLen=entry[8]
	#		print(compID, ":", sepDist, svLen)

	print("SumR:",sumR)
	print("SumQ:",sumQ)
	print("Total:",len(cnvCandidates.keys()))
	outputFileHandle=open(argv[1],"w")
	for entry in cnvEntries:
		#print(entry)
		#outputFileHandle.write(entry[0]+" "+entry[1]+" "+entry[2]+" "+entry[3]+" "+entry[4]+" "+entry[5]+" "+entry[6]+" "+entry[7]+" "+entry[8]+" DUP "+entry[9])
		outputFileHandle.write(" ".join(str(field) for field in entry)+"\n")
	print("Jobs done!..")


if __name__ == "__main__":
        main(sys.argv[1:])





