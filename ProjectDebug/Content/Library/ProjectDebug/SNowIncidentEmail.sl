namespace: ProjectDebug
operation:
  name: SNowIncidentEmail
  inputs:
  - environment: dev
  - processname: T02 Task Closure
  - pythonerror: description of my rpa error blah blah blah
  - customeremail: jasmin.haas@sapowernetworks.com.au
  - vbscripterror
  - epic: '52176'
  sequential_action:
    gav: com.microfocus.seq:ProjectDebug.SNowIncidentEmail:1.0.0
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
        action: Script
        object_path: If Parameter("environment") = UCase("PROD") Then
    - step:
        id: '3'
        action: Script
        object_path: toEmail = "platform1@sapowernetworks.com.au"
    - step:
        id: '4'
        action: Script
        object_path: Else
    - step:
        id: '5'
        action: Script
        object_path: toEmail = "platform1dev@sapowernetworks.com.au"
    - step:
        id: '6'
        action: Script
        object_path: End If
    - step:
        id: '7'
        object_path: MyEmail
        action: To
        args: = toEmail
    - step:
        id: '8'
        object_path: MyEmail
        action: From
        args: = "RPAFailure@sapowernetworks.com.au"
    - step:
        id: '9'
        object_path: MyEmail
        action: Subject
        args: = "RPA Automation Failure - " & Parameter("processname")
    - step:
        id: '10'
        object_path: MyEmail
        action: TextBody
        args: '= "CUSTOMER: " & Parameter("customeremail") & " CUSTEND" &vbNewLine&vbNewLine&
          "ERROR: Epic: "& Parameter("epic") &" | " & Parameter("vbscripterror") &
          Parameter("pythonerror")  & " ERROREND"'
    - step:
        id: '11'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '12'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '13'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '14'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '15'
        object_path: MyEmail
        action: Send
    - step:
        id: '16'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '17'
        action: Script
        object_path: If Parameter("environment") = UCase("PROD") Then
    - step:
        id: '18'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '19'
        object_path: MyEmail
        action: To
        args: = Parameter("customeremail")
    - step:
        id: '20'
        object_path: MyEmail
        action: From
        args: = "RPAFailure@sapowernetworks.com.au"
    - step:
        id: '21'
        object_path: MyEmail
        action: Subject
        args: = "RPA Automation Failure - " & Parameter("processname") & " (MyIT Incident
          Raised)"
    - step:
        id: '22'
        object_path: MyEmail
        action: TextBody
        args: = "Hi,"&vbNewLine&vbNewLine&"The process '" & Parameter("processname")
          & "' has failed."&vbNewLine&vbNewLine&"An incident has been raised in MyIT
          and assigned to the Enterprise Automation Team." &vbNewLine&vbNewLine&"Thanks"
    - step:
        id: '23'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '24'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '25'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '26'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '27'
        object_path: MyEmail
        action: Sendi
    - step:
        id: '28'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '29'
        action: Script
        object_path: Else
    - step:
        id: '30'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '31'
        object_path: MyEmail
        action: To
        args: = "Jasmin.Haas@sapowernetworks.com.au"
    - step:
        id: '32'
        object_path: MyEmail
        action: From
        args: = "RPAFailure@sapowernetworks.com.au"
    - step:
        id: '33'
        object_path: MyEmail
        action: Subject
        args: = "RPA Automation Failure - " & Parameter("processname") & " (MyIT Incident
          Raised)"
    - step:
        id: '34'
        object_path: MyEmail
        action: TextBody
        args: = "Hi,"&vbNewLine&vbNewLine&"The process '" & Parameter("processname")
          & "' has failed."&vbNewLine&vbNewLine&"An incident has been raised in MyIT
          and assigned to the Enterprise Automation Team." &vbNewLine&vbNewLine&"Thanks"
    - step:
        id: '35'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '36'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '37'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '38'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '39'
        object_path: MyEmail
        action: Send
    - step:
        id: '40'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '41'
        action: Script
        object_path: End If
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
