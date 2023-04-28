namespace: RiverMurrayFloodDisconnections
operation:
  name: B2BEmail
  inputs:
  - floodManagementSheet: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\River Murray
      Flood Disconnections\Flood Management.xlsx
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.B2BEmail:1.0.0
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
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '2'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '3'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("floodManagementSheet"))
    - step:
        id: '4'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("query")
    - step:
        id: '5'
        action: Script
        object_path: rowsNMI = objSheet.UsedRange.Rows.Count
    - step:
        id: '6'
        action: Script
        object_path: body = ""
    - step:
        id: '7'
        action: Script
        object_path: emailsSent = ""
    - step:
        id: '8'
        action: Script
        object_path: For r = 2 To rowsNMI
    - step:
        id: '9'
        action: Script
        object_path: If objSheet.cells(r,27).value = "Bill reversal required" and
          objSheet.cells(r,35).value = "Ready to upload" Then
    - step:
        id: '10'
        action: Script
        object_path: nmi = objSheet.cells(r,1).value
    - step:
        id: '11'
        action: Script
        object_path: address = objSheet.cells(r,10).value
    - step:
        id: '12'
        action: Script
        object_path: meter = objSheet.cells(r,13).value
    - step:
        id: '13'
        action: Script
        object_path: body = body & nmi &" / " & address &" / "& meter & vbNewLine
    - step:
        id: '14'
        action: Script
        object_path: emailsSent = emailsSent & nmi & ","
    - step:
        id: '15'
        action: Script
        object_path: End If
    - step:
        id: '16'
        action: Script
        object_path: Next
    - step:
        id: '17'
        object_path: objWorkbook
        action: close
    - step:
        id: '18'
        object_path: objExcel
        action: quit
    - step:
        id: '19'
        action: Script
        object_path: If body <> "" Then
    - step:
        id: '20'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '21'
        object_path: MyEmail
        action: To
        args: = "B2B@sapowernetworks.com.au"
    - step:
        id: '22'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '23'
        object_path: MyEmail
        action: Subject
        args: = "Flood Management Disconnections - Bill Reservals"
    - step:
        id: '24'
        object_path: MyEmail
        action: TextBody
        args: = "Hi Team,"&vbNewLine&vbNewLine&"The below sites failed to have a disconnection
          document created due to a bill reversal requirement."&vbNewLine&vbNewLine&body&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"Low
          Code Automation Team"
    - step:
        id: '25'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '26'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '27'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '28'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '29'
        object_path: MyEmail
        action: Send
    - step:
        id: '30'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '31'
        action: Script
        object_path: Else
    - step:
        id: '32'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "No bill reversals required", "No bill reversals required"
    - step:
        id: '33'
        action: Script
        object_path: emailsSent = "No bill reversals required"
    - step:
        id: '34'
        action: Script
        object_path: End If
    - step:
        id: '35'
        action: Script
        object_path: Parameter("emailsSent") = emailsSent
    - step:
        id: '36'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '37'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '38'
        action: Script
        object_path: Set objSheet = Nothing
  outputs:
  - emailsSent:
      robot: true
      value: ${emailsSent}
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
