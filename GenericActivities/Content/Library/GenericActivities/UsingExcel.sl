namespace: GenericActivities
operation:
  name: UsingExcel
  inputs:
    - filename
  python_action:
    use_jython: false
    script: "def execute(filename):\n    from openpyxl import load_workbook\n    \n    groupSplitWB = load_workbook(filename=filename,read_only=True)\n    groupSplitWS = groupSplitWB.active\n    rowCount = groupSplitWS.max_row + 1\n    \n    for row in range(1,rowCount):\n        reportDone = groupSplitWS[\"K\"+str(row)].value\n    groupSplitWB.close()"
  results:
    - SUCCESS
