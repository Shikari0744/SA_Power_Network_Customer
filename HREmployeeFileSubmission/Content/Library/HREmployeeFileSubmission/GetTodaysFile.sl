namespace: HREmployeeFileSubmission
operation:
  name: GetTodaysFile
  inputs:
    - dateEntry:
        required: false
    - location
  python_action:
    use_jython: false
    script: "def execute(dateEntry,location):\n    import datetime\n    \n    if dateEntry == \"\":\n        year = datetime.datetime.now().strftime(\"%Y\")\n        month = datetime.datetime.now().strftime(\"%m\")\n        day = datetime.datetime.now().strftime(\"%d\")    \n    else:\n        date = datetime.datetime.strptime(dateEntry,\"%d/%m/%Y\")\n        year = date.year\n        month = date.month\n        day = date.day\n    \n    if len(str(day)) == 1:\n        day = '0'+str(day)\n    if len(str(month)) == 1:\n        month = '0'+str(month)    \n    \n    date = str(year)+\"-\"+str(month)+\"-\"+str(day)\n    \n    file = location+date+'.xlsx'\n    \n    return{\"file\":file}"
  outputs:
    - file
  results:
    - SUCCESS
