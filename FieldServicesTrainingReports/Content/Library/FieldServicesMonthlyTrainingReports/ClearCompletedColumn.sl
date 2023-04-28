namespace: FieldServicesMonthlyTrainingReports
operation:
  name: ClearCompletedColumn
  inputs:
    - groupSplit
  python_action:
    use_jython: false
    script: "def execute(groupSplit):\r\n    from openpyxl import load_workbook\r\n\r\n    wb = load_workbook(filename=groupSplit,read_only=False)\r\n    ws = wb.active\r\n    rowCount = ws.max_row + 1\r\n    \r\n    for x in range(2,rowCount):\r\n        ws[\"K\"+str(x)].value = \"\"\r\n    wb.save(groupSplit)\r\n    wb.close()"
  results:
    - SUCCESS
