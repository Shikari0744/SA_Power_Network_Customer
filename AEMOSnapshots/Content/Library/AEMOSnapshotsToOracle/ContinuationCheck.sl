namespace: AEMOSnapshotsToOracle
operation:
  name: ContinuationCheck
  inputs:
    - filesready:
        required: false
  python_action:
    use_jython: false
    script: "def execute(filesready):\n    \n    if filesready == \"\":\n        check = \"download required\"\n    else:\n        check = \"skip download\"\n        \n    return{\"check\":check}"
  outputs:
    - check
  results:
    - CUSTOM: '${check == "download required"}'
    - SUCCESS
