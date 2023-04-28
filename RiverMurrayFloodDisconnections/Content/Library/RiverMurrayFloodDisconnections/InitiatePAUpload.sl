namespace: RiverMurrayFloodDisconnections
operation:
  name: InitiatePAUpload
  inputs:
    - floodManagementSheet
    - flowType
  python_action:
    use_jython: false
    script: "def execute(floodManagementSheet,flowType):\n    import shutil\n    from datetime import datetime\n    import os\n    \n    runTime = datetime.now()\n    \n    rundate = runTime.strftime(\"%d-%m-%Y %H%M\")\n    \n    newLocation = floodManagementSheet.replace(\"River Murray Flood Disconnections/\", \"River Murray Flood Disconnections/\"+flowType+\"/\")\n    backup = newLocation.replace(\".xlsx\", \" \"+str(rundate)+\".xlsx\")\n    \n    shutil.copyfile(floodManagementSheet,backup)\n    \n    os.remove(floodManagementSheet)\n    \n    return{\"backup\":backup}"
  outputs:
    - backup
  results:
    - SUCCESS
