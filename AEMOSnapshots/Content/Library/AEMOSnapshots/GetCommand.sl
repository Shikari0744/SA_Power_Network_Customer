namespace: AEMOSnapshots
operation:
  name: GetCommand
  inputs:
    - path
    - row
  python_action:
    use_jython: false
    script: "def execute(path,row):\n    \n    file = open(path + row + \".txt\")\n    command = file.readlines()\n    content = command[1]\n    \n    #return{\"command\":command}\n    return{\"content\":content}"
  outputs:
    - content
  results:
    - FAILURE: '${content == ""}'
    - SUCCESS
