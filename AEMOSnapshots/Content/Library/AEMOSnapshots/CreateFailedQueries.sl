namespace: AEMOSnapshots
operation:
  name: CreateFailedQueries
  inputs:
    - fileLocation
    - failedQueryLog
    - existingLoopCount:
        required: false
  python_action:
    use_jython: false
    script: "def execute(fileLocation,failedQueryLog,existingLoopCount):\n    import os\n    import shutil\n    \n    location = fileLocation+\"Retries/\"\n    \n    if existingLoopCount == \"\":\n        folderNumber = 0\n        queryNumber = 0\n        \n        with open(failedQueryLog, \"r\") as r:\n            lines = r.readlines()\n        \n        #for each 1000 queries in the failures\n        for line in lines:\n            # split on \"INTO\"\n            queries = line.split(\"INTO\")\n            # create folder with row number as name\n            folderNumber = folderNumber + 1\n            os.mkdir(location+str(folderNumber))\n            #for each 1 query in the 1000\n            for query in queries:\n                if \"INSERT ALL\" not in query:\n                    query = query.replace(\"SELECT 1 FROM DUAL\",\"\")\n                    endOf = query[-1]\n                    if endOf == \" \":\n                        query = query.rstrip(query[-1])\n                    # create file with name of iteration\n                    queryNumber = queryNumber + 1\n                    f = open(location+str(folderNumber)+\"/\"+str(queryNumber)+\".txt\", \"w\")\n                    f.write(\"INSERT INTO\" + query)\n                    f.close()\n    else:\n        queryNumber = existingLoopCount\n    \n    return{\"retryLocation\":location,\"totalFiles\":queryNumber}"
  outputs:
    - retryLocation
    - totalFiles
  results:
    - SUCCESS
