namespace: FieldServicesLeaveReporting
operation:
  name: ClearCompletedColumn
  inputs:
    - structureLocation
  python_action:
    use_jython: false
    script: "def execute(structureLocation):\r\n    from openpyxl import load_workbook\r\n    import pandas as pd    \r\n    \r\n    #GET ROW COUNT\r\n    wb = load_workbook(filename=structureLocation,read_only=False)\r\n    ws = wb.active\r\n    rowCount = ws.max_row + 1\r\n    \r\n    for x in range(1,rowCount):\r\n        done = ws[\"E\"+str(x)].value\r\n        if done == \"Done\":\r\n            ws[\"E\"+str(x)].value = \"\"\r\n    wb.save(structureLocation)\r\n    wb.close()"
  results:
    - SUCCESS
