namespace: FieldServicesLeaveReporting
operation:
  name: Add_PivotTable
  sequential_action:
    gav: 'com.microfocus.seq:FieldServicesLeaveReporting.Add_PivotTable:1.0.0'
    skills:
      - SAP
      - Web
    settings:
      sap:
        active: false
        auto_log_on: false
        close_on_exit: false
        ignore_existing_sessions: false
        remember_password: false
      windows:
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
          object_path: "FileName = \"C:\\ETSAData\\AEMO_Compliance_Reporting\\Excel_Reports\\Copy of MDP-2021.02.03-Week 06.xlsx\""
      - step:
          id: '2'
          action: Script
          object_path: 'Sheetname = "Pivot_Table"'
      - step:
          id: '3'
          action: Script
          object_path: 'Set appExcel = CreateObject("Excel.Application")'
      - step:
          id: '4'
          object_path: appExcel
          action: visible
          args: = False
      - step:
          id: '5'
          action: Script
          object_path: set appwkb = appExcel.workbooks.open(FileName)
      - step:
          id: '6'
          action: Script
          object_path: sheetcount = appExcel.Worksheets.count
      - step:
          id: '7'
          action: Script
          object_path: Set sheet = appwkb.Sheets.Add(appwkb.Worksheets(1))
      - step:
          id: '8'
          object_path: sheet
          action: Name
          args: = Sheetname
      - step:
          id: '9'
          object_path: sheet
          action: 'Cells(1,1)'
          args: '= "Notes"'
      - step:
          id: '10'
          object_path: sheet
          action: 'Cells(1,2)'
          args: '= "QueryID"'
      - step:
          id: '11'
          object_path: sheet
          action: 'Cells(1,3)'
          args: '= "Number"'
      - step:
          id: '12'
          action: Script
          object_path: r = 2
      - step:
          id: '13'
          action: Script
          object_path: For Each wksht in appwkb.Worksheets
      - step:
          id: '14'
          action: Script
          object_path: wkshtNameStr = wksht.Name
      - step:
          id: '15'
          action: Script
          object_path: 'If wkshtNameStr <> Sheetname Then'
      - step:
          id: '16'
          action: Script
          object_path: 'Set oDic = CreateObject("Scripting.Dictionary")'
      - step:
          id: '17'
          action: Script
          object_path: sheetRows = wksht.usedrange.rows.count
      - step:
          id: '18'
          action: Script
          object_path: For i = 2 to sheetRows
      - step:
          id: '19'
          action: Script
          object_path: 'notesText = Trim(wksht.Cells(i, 9).Value)'
      - step:
          id: '20'
          action: Script
          object_path: If oDic.Exists(notesText) Then
      - step:
          id: '21'
          object_path: oDic.Item(notesText) = oDic
          action: Item(notesText)
          args: + 1
      - step:
          id: '22'
          action: Script
          object_path: Else
      - step:
          id: '23'
          object_path: oDic
          action: add
          args: 'notesText,1'
      - step:
          id: '24'
          action: Script
          object_path: print notesText
      - step:
          id: '25'
          action: Script
          object_path: End If
      - step:
          id: '26'
          action: Script
          object_path: Next
      - step:
          id: '27'
          action: Script
          object_path: For each key in oDic
      - step:
          id: '28'
          object_path: sheet
          action: 'Cells(r,1)'
          args: = key
      - step:
          id: '29'
          object_path: sheet
          action: 'Cells(r,2)'
          args: = wkshtNameStr
      - step:
          id: '30'
          object_path: 'sheet.Cells(r,3) = oDic'
          action: item(key)
      - step:
          id: '31'
          action: Script
          object_path: r = r + 1
      - step:
          id: '32'
          action: Script
          object_path: Next
      - step:
          id: '33'
          action: Script
          object_path: Set oDic = Nothing
      - step:
          id: '34'
          action: Script
          object_path: End If
      - step:
          id: '35'
          action: Script
          object_path: Next
      - step:
          id: '36'
          action: Wait
          args: '"2"'
          default_args: '"1"'
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
