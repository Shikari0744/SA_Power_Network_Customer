namespace: EnervenMeterTesting
operation:
  name: GetAllFilesInDirectory
  inputs:
    - mypath
  python_action:
    use_jython: false
    script: "def execute(mypath):\n    from os import listdir\n    from os.path import isfile, join\n    \n    \n    #files only\n    onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]\n    \n    for files in onlyfiles:\n        \n    \n    #files within directory\n    direc = os.listdir(mypath)\n    \n    for folder in direc:\n        folderdirec = mypath+folder+\"/\"\n        #files within the folder\n        items = os.listdir(folderdirec)\n        for xmlfile in items:"
  results:
    - SUCCESS
