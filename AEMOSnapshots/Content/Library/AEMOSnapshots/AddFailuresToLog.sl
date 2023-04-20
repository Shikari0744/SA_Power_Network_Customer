namespace: AEMOSnapshots
operation:
  name: AddFailuresToLog
  inputs:
    - failedLog
    - command
  python_action:
    use_jython: false
    script: "def execute(failedLog,command):\n    \n    f = open(failedLog, \"a\")\n    f.write(command+\"\\n\")\n    f.close()"
  results:
    - SUCCESS
