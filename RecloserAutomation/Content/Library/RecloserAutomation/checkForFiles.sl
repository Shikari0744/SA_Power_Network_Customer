namespace: RecloserAutomation
operation:
  name: checkForFiles
  inputs:
    - rundate:
        required: false
  python_action:
    use_jython: false
    script: "def execute(rundate):\r\n    from datetime import datetime, timedelta\r\n    import os\r\n\r\n    root = \"C:/Users/svcrpabot/OneDrive - SA Power Networks/Recloser Patrol Automation/\"\r\n\r\n    if rundate != None:\r\n        yesterday = datetime.strptime(rundate, '%d/%m/%Y').date() - timedelta(1)\r\n    else:\r\n        yesterday = datetime.date.today() - timedelta(1)    \r\n\r\n    note = \"\"\r\n\r\n    files = [f\"{root}ADMS Daily Incident Reports/Recloser Incidents {yesterday}.csv\",f\"{root}ADMS Daily Phase Data/Incident Phase Data {yesterday}.csv\",f\"{root}Valid Reclose Output/validRecloses_{yesterday}.csv\",f\"{root}Historical Reports/historicalRecloses_{yesterday - timedelta(1)}.csv\",f\"{root}Valid Recloses With Past Events/ReclosesWithPastEvents_{yesterday}.xlsx\",f\"{root}Historical Reports/historicalRecloses_{yesterday}.csv\"]\r\n    for file in files:\r\n        if os.path.exists(file) == False:\r\n            note = \"missing file(s)\"\r\n\r\n    return{\"note\":note}"
  outputs:
    - note
  results:
    - CUSTOM: '${note != ""}'
      CUSTOM_0: '${note == ""}'
    - SUCCESS
