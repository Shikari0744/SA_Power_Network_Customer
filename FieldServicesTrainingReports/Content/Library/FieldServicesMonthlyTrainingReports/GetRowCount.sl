namespace: FieldServicesMonthlyTrainingReports
operation:
  name: GetRowCount
  inputs:
    - fileName
  python_action:
    use_jython: false
    script: "def execute(fileName):\n    import datetime\n    from openpyxl import load_workbook\n    from dateutil import relativedelta\n    \n    wb = load_workbook(fileName, read_only=True)\n    sheet = wb.active\n    rowCount = sheet.max_row + 1\n\n    x = 0\n    loopCount = \"\"\n    \n    for row in range(1,rowCount):\n        reportDone = sheet[\"K\"+str(row)].value\n        if reportDone == None:\n            loopCount = loopCount + \",1\"\n    loopCount = loopCount.replace(\",\",\"\",1)            \n            \n    mytime = datetime.datetime.now() + relativedelta.relativedelta(months=1)\n    currentYear = mytime.strftime(\"%Y\")\n    currentMonth = mytime.strftime(\"%Y %B\")\n    currentDate = mytime.strftime(\"%d-%m-%Y\")     \n    reportDate = mytime.strftime(\"%B %Y\")\n    \n    return{\"loopCount\":loopCount,\"currentYear\":currentYear,\"currentMonth\":currentMonth,\"currentDate\":currentDate,\"reportDate\":reportDate}"
  outputs:
    - loopCount
    - currentYear
    - currentMonth
    - currentDate
    - reportDate
  results:
    - SUCCESS
