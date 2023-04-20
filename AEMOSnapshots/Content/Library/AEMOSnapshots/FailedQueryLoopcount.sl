namespace: AEMOSnapshots
operation:
  name: FailedQueryLoopcount
  inputs:
    - loopCount
    - loopBeginner
  python_action:
    use_jython: false
    script: "def execute(loopCount, loopBeginner):\n    \n    l = \"0\"\n    y = int(loopBeginner)\n    maxLoop = 1000000\n    x = 0\n    \n    while x < maxLoop and y < (int(loopCount) - 1):\n        x += 1\n        y += 1\n        l = l + \",\" + str(y)\n    \n    return{\"array\":l,\"nextLoop\":y}"
  outputs:
    - array
    - nextLoop
  results:
    - SUCCESS
