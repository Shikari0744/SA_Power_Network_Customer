namespace: AEMOSnapshots
operation:
  name: GetLoopCounter
  inputs:
    - lines
  python_action:
    use_jython: false
    script: "def execute(lines):\n    \n    x = 1\n    loopCount = \"1\"\n    while x < int(lines):\n        x = x + 1\n        loopCount = loopCount + \",\" + str(x)\n    \n    return{\"loopCount\":loopCount}"
  outputs:
    - loopCount
  results:
    - SUCCESS
