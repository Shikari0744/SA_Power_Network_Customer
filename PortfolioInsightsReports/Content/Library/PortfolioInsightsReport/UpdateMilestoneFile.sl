namespace: PortfolioInsightsReport
operation:
  name: UpdateMilestoneFile
  inputs:
  - milestonefile: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process
      Automation\Portfolio Insights Reports\Milestone Analysis.xlsx
  sequential_action:
    gav: com.microfocus.seq:PortfolioInsightsReport.UpdateMilestoneFile:1.0.0
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
        object_path: currentMonth = MonthName(Month(Now()))
    - step:
        id: '2'
        action: Script
        object_path: currentYear = Year(Now())
    - step:
        id: '3'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '4'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '5'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("milestonefile"))
    - step:
        id: '6'
        action: Script
        object_path: Set dataSheet = objWorkbook.Worksheets("IT Graphs")
    - step:
        id: '7'
        action: Script
        object_path: For sheetNumber = 1 To objWorkbook.Sheets.Count
    - step:
        id: '8'
        action: Script
        object_path: currentSheetName = objWorkbook.Sheets(sheetNumber).Name
    - step:
        id: '9'
        action: Script
        object_path: If InStr(currentSheetName, currentMonth) > 0 and InStr(currentSheetName,
          "Planned") > 0 and InStr(currentSheetName, currentYear) > 0 Then
    - step:
        id: '10'
        action: Script
        object_path: Set plannedSheet = objWorkbook.Worksheets(currentSheetName)
    - step:
        id: '11'
        action: Script
        object_path: End If
    - step:
        id: '12'
        action: Script
        object_path: If InStr(currentSheetName, currentMonth) > 0 and InStr(currentSheetName,
          "Actual") > 0 and InStr(currentSheetName, currentYear) > 0 Then
    - step:
        id: '13'
        action: Script
        object_path: Set actualSheet = objWorkbook.Worksheets(currentSheetName)
    - step:
        id: '14'
        action: Script
        object_path: End If
    - step:
        id: '15'
        action: Script
        object_path: Next
    - step:
        id: '16'
        action: Script
        object_path: rowCount1 = dataSheet.UsedRange.Rows.Count
    - step:
        id: '17'
        action: Script
        object_path: rowCount2 = plannedSheet.UsedRange.Rows.Count
    - step:
        id: '18'
        action: Script
        object_path: rowCount3 = actualSheet.UsedRange.Rows.Count
    - step:
        id: '19'
        action: Script
        object_path: '''EXTRACT VALUE FROM EXCEL'
    - step:
        id: '20'
        action: Script
        object_path: manager = objSheet.cells(i,17).value
    - step:
        id: '21'
        action: Script
        object_path: '''ADD VALUE TO EXCEL'
    - step:
        id: '22'
        object_path: objSheet.cells(x,2)
        action: value
        args: = "abc"
    - step:
        id: '23'
        action: Script
        object_path: '''RENAME WORKBOOK'
    - step:
        id: '24'
        object_path: objWorkbook
        action: SaveAs(Parameter("milestonefile"))
    - step:
        id: '25'
        action: Script
        object_path: '''SAVE AND CLOSE REPORT'
    - step:
        id: '26'
        object_path: objWorkbook
        action: save
    - step:
        id: '27'
        object_path: objWorkbook
        action: close
    - step:
        id: '28'
        object_path: objExcel
        action: Quit
    - step:
        id: '29'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '30'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '31'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '32'
        action: Script
        object_path: Set dataSheet = Nothing
    - step:
        id: '33'
        action: Script
        object_path: Set plannedSheet = Nothing
    - step:
        id: '34'
        action: Script
        object_path: Set actualSheet = Nothing
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
