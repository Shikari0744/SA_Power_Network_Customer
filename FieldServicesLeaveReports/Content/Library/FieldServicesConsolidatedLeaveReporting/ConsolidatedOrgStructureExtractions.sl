namespace: FieldServicesConsolidatedLeaveReporting
operation:
  name: ConsolidatedOrgStructureExtractions
  inputs:
    - structureLocation
    - inputRow
  python_action:
    use_jython: false
    script: "def execute(structureLocation, inputRow):\n    from openpyxl import load_workbook\n    import pandas as pd    \n\n    #GET ROW COUNT\n    wb = load_workbook(filename=structureLocation,read_only=False)\n    ws = wb.active\n    rowCount = ws.max_row + 1\n    \n    x = inputRow\n    \n    #for x in range(1,rowCount):\n    reportDone = ws[\"E\"+str(x)].value\n    if reportDone == None:\n        orgStructure = ws[\"A\"+str(x)].value\n        orgStructureSelection = ws[\"B\"+str(x)].value\n        orgStructureValue = ws[\"C\"+str(x)].value\n        reportName = ws[\"F\"+str(x)].value\n    else:\n        orgStructure = None\n    wb.save(structureLocation)\n    wb.close()\n    \n    row = str(x)\n    \n    if orgStructure == None:\n        orgStructure = \"Report completed\"\n        orgStructureSelection = \"Report completed\"\n        orgStructureValue = \"Report completed\"\n        reportName = \"Report completed\"\n    \n    return{\"row\":row,\"reportName\":reportName,\"orgStructure\":orgStructure,\"orgStructureSelection\":orgStructureSelection,\"orgStructureValue\":orgStructureValue}"
  outputs:
    - orgStructure
    - orgStructureSelection
    - orgStructureValue
    - reportName
    - row
  results:
    - CUSTOM_0: '${orgStructure == "Report completed"}'
    - SUCCESS
