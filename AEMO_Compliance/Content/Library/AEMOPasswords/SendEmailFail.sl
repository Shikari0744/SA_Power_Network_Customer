namespace: AEMOPasswords
operation:
  name: SendEmailFail
  inputs:
  - new_password: Aemo_112233@
  - preprod_error
  - prod_error
  sequential_action:
    gav: com.microfocus.seq:AEMOPasswords.SendEmailFail:1.0.0
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
        args: = "Jasmin.Haas@sapowernetworks.com.au,Sai.Chamarthi@sapowernetworks.com.au,Mohammed.Ripon@sapowernetworks.com.au"
    - step:
        id: '3'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '4'
        object_path: MyEmail
        action: Subject
        args: = "AEMO MSATS Passwords Reset - Error Occurred"
    - step:
        id: '5'
        object_path: MyEmail
        action: TextBody
        args: '= "Hi Team,"&vbNewLine&vbNewLine&"MSATS account passwords (preproduction
          and production) have been reset to the below password:"&vbNewLine&vbNewLine&Parameter("new_password")&vbNewLine&vbNewLine&"Errors
          have occurred. Please see below:"&vbNewLine&vbNewLine&"PreProduction Errors:
          "&Parameter("preprod_error")&vbNewLine&"Production: "&Parameter("prod_error")&vbNewLine&vbNewLine&"Please
          investigate these issues, update the Configuration Items in RPA Central
          and delete this message."&vbNewLine&vbNewLine&"Thanks"'
    - step:
        id: '6'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '7'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '8'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '9'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '10'
        object_path: MyEmail
        action: Send
    - step:
        id: '11'
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
