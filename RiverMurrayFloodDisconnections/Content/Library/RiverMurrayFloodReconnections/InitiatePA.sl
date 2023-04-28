namespace: RiverMurrayFloodReconnections
operation:
  name: InitiatePA
  inputs:
    - csvlistExtract
  python_action:
    use_jython: false
    script: "def execute(csvlistExtract):\n    from datetime import datetime\n    import shutil\n    import os\n    \n    #converting csv into xlsx\n    listExtract = csvlistExtract.replace(\"csv\",\"xlsx\")\n    \n    #save a copy of the file in a new folder to trigger the PA flow to update SP list\n    runTime = datetime.now()\n    rundate = runTime.strftime(\"%d-%m-%Y %H%M\")\n    \n    newLocation = listExtract.replace(\"Disconnections\", \"Disconnections/Reconnections\")\n    backup = newLocation.replace(\".xlsx\", \" \"+str(rundate)+\".xlsx\")\n    \n    shutil.copyfile(listExtract,backup)\n    \n    #delete original files\n    os.remove(listExtract)\n    os.remove(csvlistExtract)\n    \n    return{\"backup\":backup}"
  outputs:
    - backup
  results:
    - SUCCESS
