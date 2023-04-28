namespace: MyLearningScheduleToClickFSE
operation:
  name: MyLearningReportUpdateFail
  inputs:
    - fileName
    - personnelNumber
  python_action:
    use_jython: false
    script: "def execute(fileName,personnelNumber): \r\n    from datetime import datetime \r\n    from base64 import b64encode\r\n    from openpyxl import load_workbook\r\n    import pandas as pd    \r\n    from calendar import monthrange\r\n    \r\n    pd_xl_file = pd.ExcelFile(fileName)\r\n    df = pd_xl_file.parse(\"Sheet 1\")\r\n    count = df.shape\r\n    rowCount = count[0]\r\n    \r\n    wb = load_workbook(filename=fileName,read_only=False)\r\n    ws = wb.active\r\n    \r\n    for emp in range(1,rowCount):\r\n        personnelNo = ws[\"C\"+str(emp)].value\r\n        if personnelNo == personnelNumber:\r\n            updated1 = ws[\"T\"+str(emp)].value\r\n            if updated1 == None:\r\n                ws[\"T\"+str(emp)] = \"Error occurred\"\r\n                break\r\n    wb.save(fileName)\r\n    wb.close()\r\n    return{\"currentRow\":emp}"
  outputs:
    - currentRow
  results:
    - SUCCESS
