namespace: AEMOSnapshots
operation:
  name: DeleteOldFailedQueries
  inputs:
    - fileLocation
    - existingLoopCount:
        required: false
  python_action:
    use_jython: false
    script: "def execute(fileLocation, existingLoopCount):\n    import os\n    import shutil\n    \n    if existingLoopCount == \"\":\n        location = fileLocation+\"Retries/\"\n        \n        if os.path.exists(location):\n            shutil.rmtree(location)\n        \n        os.mkdir(location)\n        os.mkdir(location+\"Logs\")"
  results:
    - SUCCESS
