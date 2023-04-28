namespace: GenericActivities
operation:
  name: DeleteOldFiles
  inputs:
    - filePath
    - numberOfDays: '14'
  python_action:
    use_jython: false
    script: "def execute(filePath,numberOfDays):\n    #deletes all files in the file path that are older than 14 days\n    from os import listdir\n    from os.path import isfile, join\n    import os\n    from datetime import datetime, timedelta\n    \n    if filePath[-1] != \"/\":\n        filePath = filePath + \"/\"\n    \n    today = datetime.now()\n    onlyfiles = [f for f in listdir(filePath) if isfile(join(filePath, f))]\n    \n    for file in onlyfiles:\n        modifiedTime = os.path.getmtime(filePath+file)\n        datetime_object = datetime.fromtimestamp(modifiedTime)\n        if datetime_object < (today - timedelta(days=int(numberOfDays))):\n            os.remove(filePath+file)"
  results:
    - SUCCESS
