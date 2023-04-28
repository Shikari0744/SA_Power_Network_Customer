namespace: AEMOSnapshots
operation:
  name: AddFailedResultToLog
  inputs:
    - retryPath
    - x
    - exception:
        required: false
    - return_code:
        required: false
    - return_result:
        required: false
    - update_count:
        required: false
    - output_text:
        required: false
  python_action:
    use_jython: false
    script: "def execute(retryPath,x,exception,return_code,return_result,update_count,output_text):\n    import os\n    \n    log = retryPath + \"Logs/Results Log.txt\"\n    \n    if exception == \"\": #successful upload\n        body = \"\\nLine in TBC Queries: \"+x+\". Result: (\" + return_code + \") \" + return_result + \" - \" + output_text\n    else: #failed upload\n        body = \"\\nLine in TBC Queries: \"+x+\". Result: (\" + return_code + \") \" + return_result + \" - \" + output_text\n        \n    os.remove(retryPath+x)\n    \n    f = open(log, \"a\")\n    f.write(body)\n    f.close()"
  results:
    - SUCCESS
