namespace: AEMOSnapshots
operation:
  name: GetLoopCount
  inputs:
    - folder
  python_action:
    use_jython: false
    script: "def execute(folder):\n    temp = folder.split(\"|\")    \n    folderName = temp[0]\n    resultsfound = temp[1]\n\n    x = 0\n    loopCount = \"\"\n    while x < int(resultsfound):\n        loopCount = loopCount + \",1\"\n        x = x + 1\n    loopCount = loopCount.replace(\",\",\"\",1)  \n    \n    return{\"folderName\":folderName,\"loopCount\":loopCount}"
  outputs:
    - folderName
    - loopCount
  results:
    - SUCCESS
