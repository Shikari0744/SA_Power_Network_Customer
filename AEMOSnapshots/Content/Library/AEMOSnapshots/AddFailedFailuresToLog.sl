namespace: AEMOSnapshots
operation:
  name: AddFailedFailuresToLog
  inputs:
    - retryPath
    - command
  python_action:
    use_jython: false
    script: "def execute(retryPath,command):\n    \n    log = retryPath + \"Logs/Failed Queries.txt\"\n    \n    f = open(log, \"a\")\n    f.write(command+\"\\n\")\n    f.close()"
  results:
    - SUCCESS
