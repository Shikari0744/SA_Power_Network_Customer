namespace: AEMOSnapshots
operation:
  name: DeleteLog
  inputs:
    - queryLog
  python_action:
    use_jython: false
    script: "def execute(queryLog):\n    import os\n    \n    os.remove(queryLog)\n    \n    f = open(queryLog, \"a\")\n    f.write(today)\n    f.close()"
  results:
    - SUCCESS
