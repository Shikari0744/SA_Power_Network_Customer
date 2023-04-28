namespace: FieldServicesAvailabilityRoster
operation:
  name: Send_Email_Attachments_Regional
  inputs:
  - regional
  - regionalResult
  sequential_action:
    gav: com.microfocus.seq:FieldServicesAvailabilityRoster.Send_Email_Attachments_Regional:1.0.0
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
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '2'
        object_path: MyEmail
        action: To
        args: ="Isabell.AlNahat@sapowernetworks.com.au,Maddie.Reynolds@sapowernetworks.com.au,Kaitlyn.Kotaras@sapowernetworks.com.au,Cara.Quinn@sapowernetworks.com.au,Louise.Long@sapowernetworks.com.au"
    - step:
        id: '3'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '4'
        action: Script
        object_path: If Parameter("regionalResult") = "All upload attempts failed"
          Then
    - step:
        id: '5'
        action: Script
        object_path: subject = "Weekly Availability Rosters (Regional) - Upload Failed"
    - step:
        id: '6'
        action: Script
        object_path: body = "Hello,"&vbNewLine&vbNewLine&"Please find attached the
          Weekly Availability Roster for Regional."&vbNewLine&vbNewLine&"All roster
          upload attempts failed."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT Automation
          Team"
    - step:
        id: '7'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("regional")
    - step:
        id: '8'
        action: Script
        object_path: 'ElseIf InStr(Parameter("regionalResult"), "Uploaded to BSO site:
          ") > 0 Then'
    - step:
        id: '9'
        action: Script
        object_path: subject = "Weekly Availability Rosters (Regional) - Upload Failed
          (Uploaded to BSO Leadership Team's Group)"
    - step:
        id: '10'
        action: Script
        object_path: body = "Hello,"&vbNewLine&vbNewLine&"Please find the Weekly Availability
          Roster for Regional in the Business Services Group in Team's (General >
          Weekly Availability Roster)."&vbNewLine&vbNewLine&"All roster upload attempts
          to the Weekly Availability Roster site failed."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '11'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("regional")
    - step:
        id: '12'
        action: Script
        object_path: Else
    - step:
        id: '13'
        action: Script
        object_path: subject = "Weekly Availability Rosters (Regional) - Uploaded
          Successfully"
    - step:
        id: '14'
        action: Script
        object_path: body = "Hello,"&vbNewLine&vbNewLine&"The Weekly Availability
          Roster for Regional was uploaded successfully to the SharePoint site."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '15'
        action: Script
        object_path: End If
    - step:
        id: '16'
        object_path: MyEmail
        action: Subject
        args: = subject
    - step:
        id: '17'
        object_path: MyEmail
        action: TextBody
        args: = body
    - step:
        id: '18'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '19'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '20'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '21'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '22'
        object_path: MyEmail
        action: Send
    - step:
        id: '23'
        action: Script
        object_path: Set MyEmail = Nothing
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
