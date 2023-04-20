namespace: RiverMurrayFloodDisconnections
operation:
  name: C4CEmail
  inputs:
  - c4cNotes: C:\Users\svcrpabot\OneDrive - SA Power Networks\River Murray Flood Disconnections\Flood
      Management C4C Notes.csv
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.C4CEmail:1.0.0
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
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '2'
        object_path: MyEmail
        action: To
        args: = "Leanne.Craig@sapowernetworks.com.au,Andrew.Murray@sapowernetworks.com.au"
    - step:
        id: '3'
        object_path: MyEmail
        action: Cc
        args: = "B2B@sapowernetworks.com.au"
    - step:
        id: '4'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '5'
        object_path: MyEmail
        action: Subject
        args: = "Flood Management Disconnections"
    - step:
        id: '6'
        object_path: MyEmail
        action: TextBody
        args: = "Hi Team,"&vbNewLine&vbNewLine&"Please find attached a list of disconnected
          meters. Please apply the template note to the NMI in C4C."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"B2B
          Team"
    - step:
        id: '7'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("c4cNotes")
    - step:
        id: '8'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '9'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '10'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '11'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '12'
        object_path: MyEmail
        action: Send
    - step:
        id: '13'
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
