namespace: FieldServicesConsolidatedLeaveReporting
operation:
  name: UpdateOrgStructureExtractionsValues
  inputs:
    - row
    - structureLocation
  python_action:
    use_jython: false
    script: "def execute(row, structureLocation):\n    from openpyxl import load_workbook\n    import pandas as pd    \n\n    wb = load_workbook(filename=structureLocation,read_only=False)\n    ws = wb.active\n    \n    ws[\"E\"+row].value = \"Done\"\n    \n    wb.save(structureLocation)\n    wb.close()"
  results:
    - SUCCESS
