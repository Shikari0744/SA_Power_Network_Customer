namespace: AEMOSnapshotsToOracle
operation:
  name: AddFailuresToLog
  inputs:
    - failedLog
    - command
    - return_code:
        required: false
    - return_result:
        required: false
    - output_text:
        required: false
  python_action:
    use_jython: false
    script: "def execute(failedLog,command,return_code,return_result,output_text):\n    \n    body = \"\\nLine in TBC Queries: \"+x+\". Result: (\" + return_code + \") \" + return_result + \" - \" + output_text\n    \n    f = open(failedLog, \"a\")\n    f.write(body)\n    f.write(command+\"\\n\")\n    f.close()"
  results:
    - SUCCESS
