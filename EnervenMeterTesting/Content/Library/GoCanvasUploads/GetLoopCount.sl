namespace: GoCanvasUploads
operation:
  name: GetLoopCount
  inputs:
    - filePath
  python_action:
    use_jython: false
    script: "def execute(filePath):\n    from os import listdir\n    from os.path import isfile, join\n    \n    onlyfiles = [f for f in listdir(filePath) if isfile(join(filePath, f))]\n\n    x = 1\n    loopCount = \"\"\n    while x <= len(onlyfiles):\n        loopCount = loopCount + \",1\"\n        x = x + 1\n    loopCount = loopCount.replace(\",\",\"\",1)    \n    \n    loopCount = len(onlyfiles)\n    \n    return{\"loopCount\":loopCount}"
  outputs:
    - loopCount
  results:
    - SUCCESS
