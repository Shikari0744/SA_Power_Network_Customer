namespace: AEMOSnapshots
operation:
  name: CreateLogFile
  inputs:
    - filelocation
  python_action:
    use_jython: false
    script: "def execute(filelocation):\n    import datetime\n    \n    today1 = datetime.datetime.now()\n    today = today1.strftime(\"%d-%m-%Y %H:%M:%S\")\n    \n    oracleLog = filelocation+\"Logs/AEMO Snapshots Oracle Results.txt\"\n    \n    f = open(oracleLog, \"a\")\n    f.write(today)\n    f.close()\n    \n    downloadlog = filelocation+\"Logs/AEMO Snapshots Downloaded CSV.txt\"\n    \n    f = open(downloadlog, \"a\")\n    f.write(today)\n    f.close()    \n    \n    toBeCompletedLog = filelocation+\"Logs/AEMO Snapshots TBC Queries/\"\n    \n    #f = open(toBeCompletedLog, \"a\")\n    #f.write(today)\n    #f.close()\n    \n    failedLog = filelocation+\"Logs/AEMO Snapshots Failed Queries.txt\"\n    \n    f = open(failedLog, \"a\")\n    f.write(today)\n    f.close() \n    \n    csvLog = filelocation+\"Logs/AEMO Snapshots Combined CSV.txt\"\n    \n    f = open(csvLog, \"a\")\n    f.write(today)\n    f.close() \n    \n    return{\"oracleLog\":oracleLog,\"downloadlog\":downloadlog,\"toBeCompletedLog\":toBeCompletedLog,\"failedLog\":failedLog,\"csvLog\":csvLog}"
  outputs:
    - oracleLog
    - downloadlog
    - toBeCompletedLog
    - failedLog
    - csvLog
  results:
    - SUCCESS
