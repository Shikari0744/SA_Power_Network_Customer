namespace: AEMOSnapshots
operation:
  name: AddResultToLog
  inputs:
    - oracleLog
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
    script: "def execute(oracleLog,x,exception,return_code,return_result,update_count,output_text):\n    \n    if exception <> \"\": #only failed\n        body = \"\\nLine in TBC Queries: \"+x+\". Result: (\" + return_code + \") \" + return_result + \" - \" + output_text\n    \n    f = open(oracleLog, \"a\")\n    f.write(body)\n    f.close()"
  results:
    - SUCCESS
