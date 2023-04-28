########################################################################################################################
#!!
#! @result CUSTOM: command is empty
#!!#
########################################################################################################################
namespace: AEMOSnapshots
operation:
  name: GetFailedCommand
  inputs:
    - fileLocation
  python_action:
    use_jython: false
    script: "def execute(fileLocation):\n    import os \n    \n    command = \"\"\n    fileN = \"\"\n    \n    for folder in os.listdir(fileLocation):\n        for file in os.listdir(fileLocation+folder):\n            with open(fileLocation+folder+\"/\"+file, \"r\") as r:\n                lines = r.readlines()    \n                fileN = folder+\"/\"+file\n            command = lines[0]\n            break\n        if command != \"\":\n            break\n    \n    return{\"command\":command,\"fileName\":fileN}"
  outputs:
    - command
    - fileName
  results:
    - CUSTOM: '${command == ""}'
    - SUCCESS
