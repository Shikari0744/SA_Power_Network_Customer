namespace: MyLearningScheduleToClickFSE
operation:
  name: SetScheduleLocation
  inputs:
    - scheduleName
    - fileLocation
  python_action:
    use_jython: false
    script: "def execute(scheduleName, fileLocation):\n    \n    schedule_fileLocation = fileLocation + scheduleName\n    travel_fileLocation = fileLocation + \"Depot Travel Time.xlsx\"\n    \n    return{\"schedule_fileLocation\":schedule_fileLocation,\"travel_fileLocation\":travel_fileLocation}"
  outputs:
    - schedule_fileLocation
    - travel_fileLocation
  results:
    - SUCCESS
