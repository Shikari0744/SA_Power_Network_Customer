namespace: AEMOSnapshotsToOracle
operation:
  name: GetCommand
  inputs:
    - path
    - folderNumber:
        required: false
    - x
  python_action:
    use_jython: false
    script: "def execute(path,folderNumber,x):\n    \n    if folderNumber == \"\":\n        file = open(path + folderNumber +\"/\" + x + \".txt\")\n    else:\n        file = open(path + x + \".txt\")\n        \n    command = file.readlines()\n    content = command[1]\n    \n    #return{\"command\":command}\n    return{\"content\":content}"
  outputs:
    - content
  results:
    - FAILURE: '${content == ""}'
    - SUCCESS
