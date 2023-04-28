namespace: FieldServicesLeaveReporting
operation:
  name: ExtractOrgStructure
  sequential_action:
    gav: com.microfocus.seq:FieldServicesLeaveReporting.ExtractOrgStructure:1.0.0
    skills:
    - Java
    - SAP NWBC Desktop
    - SAP
    - SAPUI5
    - SAPWDJ
    - SAPWebExt
    - Terminal Emulators
    - UI Automation
    - Web
    - WPF
    settings:
      sap:
        active: false
        auto_log_on: false
        close_on_exit: false
        ignore_existing_sessions: false
        remember_password: false
      windows:
        active: false
      terminal_settings:
        active: false
      web:
        active: false
        address: ''
        browser: IE64
        close_on_exit: false
    steps:
    - step:
        id: '1'
        action: Script
        object_path: '''CREATE EXCEL OBJECT'
    - step:
        id: '2'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '3'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '4'
        action: Script
        object_path: '''OPEN EXISTING EXCEL'
    - step:
        id: '5'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open("C:/Temp/SAP Organisational
          Structures.xlsx")
    - step:
        id: '6'
        action: Script
        object_path: '''OPEN SHEET'
    - step:
        id: '7'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("Email OrgStruct")
    - step:
        id: '8'
        action: Script
        object_path: '''GET ROW COUNT OF Sheet'
    - step:
        id: '9'
        action: Script
        object_path: rowCount = objSheet.usedrange.Rows.Count
    - step:
        id: '10'
        action: Script
        object_path: 'def execute():'
    - step:
        id: '11'
        action: Script
        object_path: from openpyxl import load_workbook
    - step:
        id: '12'
        action: Script
        object_path: import pandas as pd
    - step:
        id: '13'
        action: Script
        object_path: fileName = "C:/Temp/SAP Organisational Structures.xlsx"
    - step:
        id: '14'
        action: Script
        object_path: '#GET ROW COUNT'
    - step:
        id: '15'
        action: Script
        object_path: pd_xl_file = pd.ExcelFile(fileName)
    - step:
        id: '16'
        action: Script
        object_path: df = pd_xl_file.parse("Email OrgStruct")
    - step:
        id: '17'
        action: Script
        object_path: count = df.shape
    - step:
        id: '18'
        action: Script
        object_path: rowCount = count[0]
    - step:
        id: '19'
        action: Script
        object_path: rowCount = rowCount + 2
    - step:
        id: '20'
        action: Script
        object_path: wb = load_workbook(filename=fileName,read_only=False)
    - step:
        id: '21'
        action: Script
        object_path: ws = wb.active
    - step:
        id: '22'
        action: Script
        object_path: orgStructure = ""
    - step:
        id: '23'
        action: Script
        object_path: orgStructureSelection = ""
    - step:
        id: '24'
        action: Script
        object_path: orgStructureValue = ""
    - step:
        id: '25'
        action: Script
        object_path: folder = ""
    - step:
        id: '26'
        action: Script
        object_path: reportName = ""
    - step:
        id: '27'
        action: Script
        object_path: 'for x in range(1,rowCount):'
    - step:
        id: '28'
        action: Script
        object_path: reportDone = ws["E"+str(x)].value
    - step:
        id: '29'
        action: Script
        object_path: 'if reportDone == None:'
    - step:
        id: '30'
        action: Script
        object_path: orgStructure = ws["A"+str(x)].value
    - step:
        id: '31'
        action: Script
        object_path: orgStructureSelection = ws["B"+str(x)].value
    - step:
        id: '32'
        action: Script
        object_path: orgStructureValue = ws["C"+str(x)].value
    - step:
        id: '33'
        action: Script
        object_path: folder = ws["F"+str(x)].value
    - step:
        id: '34'
        action: Script
        object_path: reportName = ws["G"+str(x)].value
    - step:
        id: '35'
        action: Script
        object_path: break
    - step:
        id: '36'
        object_path: wb
        action: save(fileName)
    - step:
        id: '37'
        object_path: wb
        action: close()
    - step:
        id: '38'
        action: Script
        object_path: return{"orgStructure":orgStructure,"orgStructureSelection":orgStructureSelection,"orgStructureValue":orgStructureValue,"folder":folder,"reportName":reportName}
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
