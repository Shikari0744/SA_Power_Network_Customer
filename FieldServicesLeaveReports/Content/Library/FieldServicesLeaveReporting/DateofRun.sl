namespace: FieldServicesLeaveReporting
operation:
  name: DateofRun
  inputs:
    - runDate:
        required: false
    - structureLocation
  python_action:
    use_jython: false
    script: "def execute(runDate, structureLocation):\n    import datetime\n    import pandas as pd\n    \n    if runDate != \"\":\n        runDate = runDate.replace(\"-\", \"/\")\n        mytime = datetime.datetime.strptime(runDate, \"%d/%m/%Y\")\n        currentMonth = mytime.strftime(\"%Y %B\")\n        currentDate = mytime.strftime(\"%d-%m-%Y\")\n    else:\n        mytime = datetime.datetime.now()\n        currentMonth = mytime.strftime(\"%Y %B\")\n        currentDate = mytime.strftime(\"%d-%m-%Y\")\n\n    #GET ROW COUNT\n    pd_xl_file = pd.ExcelFile(structureLocation)\n    df = pd_xl_file.parse(\"Email OrgStruct\")\n    count = df.shape\n    rowCount = count[0]\n    \n    x = 1\n    loopCount = \"\"\n    while x <= rowCount:\n        x += 1\n        loopCount = loopCount + \",\" + str(x)\n    loopCount = loopCount.replace(\",\",\"\",1)\n    \n    return{\"currentMonth\":currentMonth,\"currentDate\":currentDate,\"loopCount\":loopCount}"
  outputs:
    - currentDate
    - currentMonth
    - loopCount
  results:
    - SUCCESS
