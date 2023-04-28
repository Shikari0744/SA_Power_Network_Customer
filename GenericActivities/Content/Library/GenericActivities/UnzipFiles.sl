namespace: GenericActivities
operation:
  name: UnzipFiles
  inputs:
    - mypath
  python_action:
    use_jython: false
    script: "def execute(mypath):\n    import zipfile\n    from os import listdir\n    from os.path import isfile, join\n    \n    onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]\n    \n    for file in onlyfiles:\n        print(file)\n        with zipfile.ZipFile(mypath+file, 'r') as zip_ref:\n            zip_ref.extractall(mypath)"
  results:
    - SUCCESS
