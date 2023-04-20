namespace: RiverMurrayFloodDisconnections
operation:
  name: LNSPEmail
  inputs:
  - floodManagementSheet: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\River Murray
      Flood Disconnections\Flood Management.xlsx
  - sourceOfDEEN: Bulk Disconnections
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.LNSPEmail:1.0.0
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
        object_path: If objSheet.cells(r,2).value = "Processed" and objSheet.cells(r,3).value
          = Parameter("sourceOfDEEN") and objSheet.cells(r,35).value = "Ready to upload"
          and objSheet.cells(r,9).value <>  ""  Then
    - step:
        id: '10'
        action: Script
        object_path: 'dateActioned = objSheet.cells(r,5).value '
        comment: must be dd/mm/yyyy
    - step:
        id: '11'
        action: Script
        object_path: 'procesedDate = objSheet.cells(r,4).value '
        comment: must be dd/mm/yyyy
    - step:
        id: '12'
        action: Script
        object_path: nmi = objSheet.cells(r,1).value
    - step:
        id: '13'
        action: Script
        object_path: address = objSheet.cells(r,10).value
    - step:
        id: '14'
        action: Script
        object_path: meter = objSheet.cells(r,13).value
    - step:
        id: '15'
        action: Script
        object_path: count = DateValue(dateActioned) - DateValue(procesedDate)
    - step:
        id: '16'
        action: Script
        object_path: count2 = count
    - step:
        id: '17'
        action: Script
        object_path: For i = 1 To count
    - step:
        id: '18'
        action: Script
        object_path: If WeekdayName(Weekday(Date() - i)) = "Saturday" or WeekdayName(Weekday(Date()
          - i)) = "Sunday" Then
    - step:
        id: '19'
        action: Script
        object_path: count2 = count2 - 1
    - step:
        id: '20'
        action: Script
        object_path: End If
    - step:
        id: '21'
        action: Script
        object_path: Next
    - step:
        id: '22'
        action: Script
        object_path: If count2 > 5 Then
    - step:
        id: '23'
        action: Script
        object_path: body = body & nmi &" / "& Replace(CStr(procesedDate),"/","-")
          &" / "& address &" / "& meter & vbNewLine
    - step:
        id: '24'
        action: Script
        object_path: emailsSent = emailsSent & nmi & ","
    - step:
        id: '25'
        action: Script
        object_path: End If
    - step:
        id: '26'
        action: Script
        object_path: End If
    - step:
        id: '27'
        action: Script
        object_path: Next
    - step:
        id: '28'
        object_path: objWorkbook
        action: close
    - step:
        id: '29'
        object_path: objExcel
        action: quit
    - step:
        id: '30'
        action: Script
        object_path: If body <> "" Then
    - step:
        id: '31'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '32'
        object_path: MyEmail
        action: To
        args: = "LNSP@sapowernetworks.com.au"
    - step:
        id: '33'
        object_path: MyEmail
        action: Cc
        args: = "B2B@sapowernetworks.com.au"
    - step:
        id: '34'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '35'
        object_path: MyEmail
        action: Subject
        args: = "Flood Management Disconnections"
    - step:
        id: '36'
        object_path: MyEmail
        action: TextBody
        args: = "Hi Team,"&vbNewLine&vbNewLine&"The below sites have been disconnected
          as part of the Murray River flood management process, where the disconnection
          in the system has occurred outside of the regulatory 5 business days from
          when the actual physical disconnection date occurred onsite."&vbNewLine&vbNewLine&body&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"B2B
          Team"
    - step:
        id: '37'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '38'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '39'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '40'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '41'
        object_path: MyEmail
        action: Send
    - step:
        id: '42'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '43'
        action: Script
        object_path: Else
    - step:
        id: '44'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "All actioned within 5 business days", "All actioned within
          5 business days"
    - step:
        id: '45'
        action: Script
        object_path: emailsSent = "All actioned within 5 business days"
    - step:
        id: '46'
        action: Script
        object_path: End If
    - step:
        id: '47'
        action: Script
        object_path: Parameter("emailsSent") = emailsSent
    - step:
        id: '48'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '49'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '50'
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
