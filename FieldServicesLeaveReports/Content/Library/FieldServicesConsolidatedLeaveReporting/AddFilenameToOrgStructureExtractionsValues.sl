namespace: FieldServicesConsolidatedLeaveReporting
operation:
  name: AddFilenameToOrgStructureExtractionsValues
  inputs:
    - row
    - structureLocation
    - reportLocation
    - reportName
  python_action:
    use_jython: false
    script: "def execute(row, structureLocation,reportName,reportLocation):\n    from openpyxl import load_workbook\n    import pandas as pd    \n\n    wb = load_workbook(filename=structureLocation,read_only=False)\n    ws = wb.active\n    \n    ws[\"I\"+row].value = reportName\n    ws[\"J\"+row].value = reportLocation\n    \n    wb.save(structureLocation)\n    wb.close()"
  results:
    - SUCCESS
