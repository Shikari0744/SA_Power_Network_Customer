namespace: ITAzureChargeBack
operation:
  name: addCostsToExcel
  inputs:
  - currencyConversion: '1.5'
  - estimatedUSD: '702.66'
  - actualUSD: '492.51'
  - currentProject: informatica
  - filePath: C:\Users\haasj0\OneDrive - SA Power Networks (1)\ITAM Azure Cost Management/CAPEX
      Project Azure Expenditure.xlsx
  sequential_action:
    gav: com.microfocus.seq:ITAzureChargeBack.addCostsToExcel:1.2.0
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
        object_path: '''Replace these with rpa inputs from previous steps'
    - step:
        id: '2'
        action: Script
        object_path: currencyConversion = Parameter("currencyConversion")
    - step:
        id: '3'
        action: Script
        object_path: actualUSD = Parameter("actualUSD")
    - step:
        id: '4'
        action: Script
        object_path: estimatedUSD = Parameter("estimatedUSD")
    - step:
        id: '5'
        action: Script
        object_path: currentProject = Parameter("currentProject")
    - step:
        id: '6'
        action: Script
        object_path: filePath = Parameter("filePath")
    - step:
        id: '7'
        action: Script
        object_path: currentPeriod = DateSerial(Year(Date), Month(Date), 1)
    - step:
        id: '8'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '9'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '10'
        action: Script
        object_path: Set objWorkbookCapex = objExcel.Workbooks.open(filePath)
    - step:
        id: '11'
        action: Script
        object_path: Set objSheetCapex = objWorkbookCapex.Worksheets("Data Entry")
    - step:
        id: '12'
        action: Script
        object_path: rowCount = objSheetCapex.usedrange.Rows.Count
    - step:
        id: '13'
        action: Script
        object_path: existingEntry = False
    - step:
        id: '14'
        action: Script
        object_path: '''iterate through rows to see if existing entry for project+period,
          this will occur when forecasts are entered for previous month'
    - step:
        id: '15'
        action: Script
        object_path: For i = 2 To rowCount
    - step:
        id: '16'
        action: Script
        object_path: excProject = objSheetCapex.cells(i,1).value
    - step:
        id: '17'
        action: Script
        object_path: excPeriod = objSheetCapex.cells(i,2).value
    - step:
        id: '18'
        action: Script
        object_path: If excProject = currentProject And excPeriod = currentPeriod
          Then
    - step:
        id: '19'
        action: Script
        object_path: existingEntry = True
    - step:
        id: '20'
        action: Script
        object_path: '''add actuals to existing line'
    - step:
        id: '21'
        object_path: objSheetCapex.cells(i,5)
        action: value
        args: = actualUSD
    - step:
        id: '22'
        object_path: objSheetCapex.cells(i,6)
        action: value
        args: = actualUSD * currencyConversion
    - step:
        id: '23'
        action: Script
        object_path: Exit For
    - step:
        id: '24'
        action: Script
        object_path: End If
    - step:
        id: '25'
        action: Script
        object_path: Next
    - step:
        id: '26'
        action: Script
        object_path: If existingEntry = False Then
    - step:
        id: '27'
        action: Script
        object_path: '''add new row for current month'
    - step:
        id: '28'
        object_path: objSheetCapex.cells(rowcount + 1,5)
        action: value
        args: = actualUSD
    - step:
        id: '29'
        object_path: objSheetCapex.cells(rowcount + 1,6)
        action: value
        args: = actualUSD * currencyConversion
    - step:
        id: '30'
        object_path: objSheetCapex.cells(rowcount + 1,1)
        action: value
        args: = currentProject
    - step:
        id: '31'
        object_path: objSheetCapex.cells(rowcount + 1,2)
        action: value
        args: = currentPeriod
    - step:
        id: '32'
        action: Script
        object_path: '''add new row for next month forecasts'
    - step:
        id: '33'
        object_path: objSheetCapex.cells(rowcount + 2,1)
        action: value
        args: = currentProject
    - step:
        id: '34'
        object_path: objSheetCapex.cells(rowcount + 2,2)
        action: value
        args: = DateAdd("m",1,currentPeriod)
    - step:
        id: '35'
        object_path: objSheetCapex.cells(rowcount + 2,3)
        action: value
        args: = estimatedUSD
    - step:
        id: '36'
        object_path: objSheetCapex.cells(rowcount + 2,4)
        action: value
        args: = estimatedUSD * currencyConversion
    - step:
        id: '37'
        action: Script
        object_path: Else
    - step:
        id: '38'
        action: Script
        object_path: '''add new row for next month forecasts, actuals where added
          in the row iteration step already'
    - step:
        id: '39'
        object_path: objSheetCapex.cells(rowcount + 1,1)
        action: value
        args: = currentProject
    - step:
        id: '40'
        object_path: objSheetCapex.cells(rowcount + 1,2)
        action: value
        args: = DateAdd("m",1,currentPeriod)
    - step:
        id: '41'
        object_path: objSheetCapex.cells(rowcount + 1,3)
        action: value
        args: = estimatedUSD
    - step:
        id: '42'
        object_path: objSheetCapex.cells(rowcount + 1,4)
        action: value
        args: = estimatedUSD * currencyConversion
    - step:
        id: '43'
        action: Script
        object_path: End If
    - step:
        id: '44'
        object_path: objWorkbookCapex
        action: save
    - step:
        id: '45'
        action: Script
        object_path: Set objSheetCapex = Nothing
    - step:
        id: '46'
        action: Script
        object_path: currentYear = Year(Date())
    - step:
        id: '47'
        action: Script
        object_path: For sheetNumber = 1 To objWorkbookCapex.Sheets.Count
    - step:
        id: '48'
        action: Script
        object_path: currentSheetName = objWorkbookCapex.Sheets(sheetNumber).Name
    - step:
        id: '49'
        action: Script
        object_path: If InStr(currentSheetName, "Azure") > 0 and InStr(currentSheetName,
          currentYear) > 0 and InStr(currentSheetName, "Calculations") > 0 Then
    - step:
        id: '50'
        action: Script
        object_path: Set objSheetAzure = objWorkbookCapex.Worksheets(currentSheetName)
    - step:
        id: '51'
        action: Script
        object_path: Exit For
    - step:
        id: '52'
        action: Script
        object_path: End If
    - step:
        id: '53'
        action: Script
        object_path: Next
    - step:
        id: '54'
        action: Script
        object_path: '''Set objSheetAzure = objWorkbookCapex.Worksheets("Azure 2023
          Calculations")'
    - step:
        id: '55'
        action: Script
        object_path: If Month(Date()) = 1 Then
    - step:
        id: '56'
        action: Script
        object_path: journalledMonth = "December"
    - step:
        id: '57'
        action: Script
        object_path: Else
    - step:
        id: '58'
        action: Script
        object_path: journalledMonth = MonthName(Month(Date()) -1)
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: For row = 5 To 16
    - step:
        id: '61'
        action: Script
        object_path: If objSheetAzure.cells(row,2).value =  journalledMonth Then
    - step:
        id: '62'
        action: Script
        object_path: existingQ = objSheetAzure.cells(row,4).value
    - step:
        id: '63'
        object_path: objSheetAzure.cells(row,4)
        action: value
        args: = actualUSD + existingQ
    - step:
        id: '64'
        object_path: objSheetAzure.cells(row,5)
        action: value
        args: = "=C"&row&"-D"&row
    - step:
        id: '65'
        action: Script
        object_path: Exit For
    - step:
        id: '66'
        action: Script
        object_path: End If
    - step:
        id: '67'
        action: Script
        object_path: Next
    - step:
        id: '68'
        object_path: objWorkbookCapex
        action: save
    - step:
        id: '69'
        object_path: objWorkbookCapex
        action: close
    - step:
        id: '70'
        action: Script
        object_path: Set objWorkbookCapex = Nothing
    - step:
        id: '71'
        action: Script
        object_path: Set objSheetAzure  = Nothing
    - step:
        id: '72'
        object_path: objExcel
        action: Quit
    - step:
        id: '73'
        action: Script
        object_path: Set objExcel = Nothing
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
