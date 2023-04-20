namespace: ProjectExpensing
operation:
  name: inputCheck
  inputs:
    - hours:
        required: false
    - costs:
        required: false
    - settle:
        required: false
  python_action:
    use_jython: false
    script: "def execute(hours, costs, settle):\n    \n    if hours != \"\":\n        hours1 = hours\n    else:\n        hours1 = \"\"\n\n    if costs != \"\":\n        costs1 = costs\n    else:\n        costs1 = \"\"\n\n    if settle != \"\":\n        settle1 = settle\n    else:\n        settle1 = \"\"\n    \n    return{\"hours1\":hours1, \"costs1\":costs1, \"settle1\":settle1}"
  outputs:
    - hours1
    - costs1
    - settle1
  results:
    - SUCCESS
