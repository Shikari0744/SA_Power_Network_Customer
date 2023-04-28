namespace: RiverMurrayFloodDisconnections
operation:
  name: CustomerText
  inputs:
    - floodManagementSheet: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/River Murray Flood Disconnections/Flood Management.xlsx'
    - sourceofDEEN: Bulk Disconnections
  sequential_action:
    gav: 'com.microfocus.seq:RiverMurrayFloodDisconnections.CustomerText:1.0.0'
    skills:
      - SAP
      - SAPWebExt
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
      web:
        active: false
        address: ''
        browser: IE64
        close_on_exit: false
    steps:
      - step:
          id: '1'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '2'
          action: Script
          object_path: 'Set fso = CreateObject("Scripting.FileSystemObject")'
      - step:
          id: '3'
          action: Script
          object_path: 'c4csheet = Replace(Parameter("floodManagementSheet"), ".xlsx", " C4C Notes.csv")'
      - step:
          id: '4'
          action: Script
          object_path: If fso.FileExists(c4csheet)Then
      - step:
          id: '5'
          object_path: fso
          action: DeleteFile(c4csheet)
      - step:
          id: '6'
          action: Script
          object_path: End If
      - step:
          id: '7'
          action: Script
          object_path: 'Set objExcel = CreateObject("Excel.Application")'
      - step:
          id: '8'
          object_path: objExcel
          action: visible
          args: = true
      - step:
          id: '9'
          action: Script
          object_path: "' CREATE C4C NOTE DOC"
      - step:
          id: '10'
          action: Script
          object_path: Set objWorkbookC4C = objExcel.Workbooks.Add()
      - step:
          id: '11'
          action: Script
          object_path: Set objSheetC4C = objWorkbookC4C.Worksheets(1)
      - step:
          id: '12'
          action: Script
          object_path: "tempC4C = Replace(c4csheet,\"/\",\"\\\")"
      - step:
          id: '13'
          object_path: objWorkbookC4C
          action: SaveAs
          args: 'tempC4C, 6'
      - step:
          id: '14'
          action: Script
          object_path: rowsC4C = objSheetC4C.UsedRange.Rows.Count
      - step:
          id: '15'
          action: Script
          object_path: y = rowsC4C
      - step:
          id: '16'
          action: Script
          object_path: "' OPEN FLOOD MANAGEMENT"
      - step:
          id: '17'
          action: Script
          object_path: 'Set objWorkbook = objExcel.Workbooks.open(Parameter("floodManagementSheet"))'
      - step:
          id: '18'
          action: Script
          object_path: 'Set objSheet = objWorkbook.Worksheets("query")'
      - step:
          id: '19'
          action: Script
          object_path: rowsNMI = objSheet.UsedRange.Rows.Count
      - step:
          id: '20'
          action: Script
          object_path: 'existingNMI = ""'
      - step:
          id: '21'
          action: Script
          object_path: For x = 2 to rowsNMI
      - step:
          id: '22'
          action: Script
          object_path: 'If objSheet.cells(x,3).value = Parameter("sourceofDEEN") and objSheet.cells(x,35).value = "Ready to upload" and objSheet.cells(x,29).value <> "Yes" and objSheet.cells(x,27).value <> "Bill reversal required" and objSheet.cells(x,9).value <> "" Then'
      - step:
          id: '23'
          action: Script
          object_path: 'nmi = objSheet.cells(x,1).value'
      - step:
          id: '24'
          action: Script
          object_path: 'processedDate = objSheet.cells(x,4).value'
      - step:
          id: '25'
          object_path: objSheetC4C
          action: 'cells(y,1)'
          args: = nmi
      - step:
          id: '26'
          object_path: objSheetC4C
          action: 'cells(y,2)'
          args: '= "B2B "&processedDate'
      - step:
          id: '27'
          object_path: objSheetC4C
          action: 'cells(y,3)'
          args: '= "Murray River Flood Management - Disconnection Date: "&processedDate&". For reconnection SA Power Networks will require a retailer requested reconnection service order. If there has been water damage of any kind, SA Power Networks will also require an eCoC on site, after electrical repairs are performed."'
      - step:
          id: '28'
          action: Script
          object_path: 'existingNMI = objSheetC4C.cells(1,4)'
      - step:
          id: '29'
          object_path: objSheetC4C
          action: 'cells(1,4)'
          args: '= existingNMI & nmi & ","'
      - step:
          id: '30'
          object_path: 'objSheet.cells(x,29)'
          action: value
          args: '= "Yes"'
      - step:
          id: '31'
          action: Script
          object_path: y = y + 1
      - step:
          id: '32'
          action: Script
          object_path: End If
      - step:
          id: '33'
          action: Script
          object_path: Next
      - step:
          id: '34'
          object_path: objWorkbookC4C
          action: save
      - step:
          id: '35'
          object_path: objWorkbookC4C
          action: close
      - step:
          id: '36'
          object_path: objWorkbook
          action: save
      - step:
          id: '37'
          object_path: objWorkbook
          action: close
      - step:
          id: '38'
          object_path: objExcel
          action: quit
      - step:
          id: '39'
          action: Script
          object_path: Set mySendKeys = Nothing
      - step:
          id: '40'
          action: Script
          object_path: Set objExcel = Nothing
      - step:
          id: '41'
          action: Script
          object_path: Set objWorkbook = Nothing
      - step:
          id: '42'
          action: Script
          object_path: Set objSheet = Nothing
      - step:
          id: '43'
          action: Script
          object_path: Set fso = Nothing
      - step:
          id: '44'
          action: Script
          object_path: 'If existingNMI <> "" Then'
      - step:
          id: '45'
          action: Script
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '46'
          object_path: MyEmail
          action: To
          args: '= "Leanne.Craig@sapowernetworks.com.au,Andrew.Murray@sapowernetworks.com.au"'
      - step:
          id: '47'
          object_path: MyEmail
          action: Cc
          args: '= "B2B@sapowernetworks.com.au"'
      - step:
          id: '48'
          object_path: MyEmail
          action: From
          args: '= "Process_Automation@sapowernetworks.com.au"'
      - step:
          id: '49'
          object_path: MyEmail
          action: Subject
          args: '= "Flood Management Disconnections"'
      - step:
          id: '50'
          object_path: MyEmail
          action: TextBody
          args: '= "Hi Team,"&vbNewLine&vbNewLine&"Please find attached a list of disconnected meters. Please apply the template note to the NMI in C4C."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"B2B Team"'
      - step:
          id: '51'
          object_path: MyEmail
          action: AddAttachment
          args: c4csheet
      - step:
          id: '52'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '53'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
      - step:
          id: '54'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25'
      - step:
          id: '55'
          object_path: MyEmail.Configuration.Fields
          action: Update
      - step:
          id: '56'
          object_path: MyEmail
          action: Send
      - step:
          id: '57'
          action: Script
          object_path: Set MyEmail = Nothing
      - step:
          id: '58'
          action: Script
          object_path: Else
      - step:
          id: '59'
          object_path: Reporter
          action: ReportEvent
          args: 'micWarning, "No NMIs processed", "No NMIs processed"'
      - step:
          id: '60'
          action: Script
          object_path: End If
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
