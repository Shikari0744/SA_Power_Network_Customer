namespace: AEMOSnapshotsToOracle
operation:
  name: SplitFailedQueries
  inputs:
    - fileLocation
    - failedQuery
  python_action:
    use_jython: false
    script: "def execute(fileLocation,failedQuery):\n    import os\n    import shutil\n    \n    location = fileLocation+\"Retries/\"\n\n    folderNumber = 0\n    queryNumber = 0\n\n    #for each 1000 queries in the failures, we split into individual queries, write to a text file in a new folder to be processed. \n\n    queries = line.split(\"INTO\")\n    folderNumber = folderNumber + 1\n    os.mkdir(location+str(folderNumber))\n    for query in queries:\n        if \"INSERT ALL\" not in query:\n            query = query.replace(\"SELECT 1 FROM DUAL\",\"\")\n            endOf = query[-1]\n            if endOf == \" \":\n                query = query.rstrip(query[-1])\n            queryNumber = queryNumber + 1\n            f = open(location+str(folderNumber)+\"/\"+str(queryNumber)+\".txt\", \"w\")\n            f.write(\"INSERT INTO\" + query)\n            f.close()\n            \n    loopCount = \"\"\n    x = 0\n    while x < queryNumber:\n       x = x + 1\n       loopCount = loopCount + \",\" + str(x)\n    loopCount = loopCount.replace(\",\",\"\",1)  \n    \n    return{\"retryLocation\":location,\"folderLocation\":folderNumber,\"loopCount\":loopCount}"
  outputs:
    - retryLocation
    - folderLocation
    - loopCount
  results:
    - SUCCESS
