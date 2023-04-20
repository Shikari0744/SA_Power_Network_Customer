namespace: BCRM_Reports
operation:
  name: CheckLogIfReportsWereDownloaded
  inputs:
    - location
  python_action:
    use_jython: false
    script: "def execute(location):\n    import os\n    from os.path import exists\n    lines = \"\"\n    \n    if exists(location+\"MDP Logs/Reports Downloaded.txt\"):\n        with open(location+\"MDP Logs/Reports Downloaded.txt\") as f:\n            lines = f.readlines()\n        lines = ''.join(lines)\n        if lines.find(\"No Reports Downloaded\") > 0:\n            result = \"no reports downloaded\"\n        else: \n            result = \"reports are downloaded\"\n    \n        os.remove(location+\"MDP Logs/Reports Downloaded.txt\")    \n    else:\n        result = \"no reports downloaded\"\n    return{\"result\":result}"
  outputs:
    - result
  results:
    - FAILURE: '${result == "no reports downloaded"}'
      CUSTOM_0: '${result == "no reports downloaded"}'
    - SUCCESS
