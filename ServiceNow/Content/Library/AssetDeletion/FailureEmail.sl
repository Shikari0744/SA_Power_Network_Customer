namespace: AssetDeletion
operation:
  name: FailureEmail
  inputs:
    - errorMessage_status:
        required: false
    - errorMessage_storeroom:
        required: false
    - asset_ID:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:AssetDeletion.FailureEmail:1.0.0'
    skills:
      - Java
      - SAP NWBC Desktop
      - SAP
      - SAPUI5
      - SAPWDJ
      - SAPWebExt
      - Terminal Emulators
      - UI Automation
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
      terminal_settings:
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
          object_path: 'If Parameter("errorMessage_status") <> "" OR Parameter("errorMessage_storeroom") <> "" Then'
      - step:
          id: '2'
          action: Script
          object_path: 'emailContent = Parameter("asset_ID")&": "&Parameter("errorMessage_status")&","&Parameter("errorMessage_storeroom")'
      - step:
          id: '3'
          action: Script
          object_path: Else
      - step:
          id: '4'
          action: Script
          object_path: 'emailContent = "No asset information entered at time of run"'
      - step:
          id: '5'
          action: Script
          object_path: End If
      - step:
          id: '6'
          action: Script
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '7'
          object_path: MyEmail
          action: Subject
          args: '= "ServiceNow Asset Deletion Update - Failure"'
      - step:
          id: '8'
          object_path: MyEmail
          action: From
          args: '= "Process_Automation@sapowernetworks.com.au"'
      - step:
          id: '9'
          object_path: MyEmail
          action: To
          args: '= "Mohita.Kaushal@sapowernetworks.com.au,Aleksey.Bogatyrev@sapowernetworks.com.au,Amrit.Nath@sapowernetworks.com.au"'
      - step:
          id: '10'
          object_path: MyEmail
          action: TextBody
          args: = emailContent
      - step:
          id: '11'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '12'
          action: Script
          object_path: "'SMTP Server"
      - step:
          id: '13'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
      - step:
          id: '14'
          action: Script
          object_path: "'SMTP Port"
      - step:
          id: '15'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25'
      - step:
          id: '16'
          object_path: MyEmail.Configuration.Fields
          action: Update
      - step:
          id: '17'
          object_path: MyEmail
          action: Send
      - step:
          id: '18'
          action: Script
          object_path: Set MyEmail = Nothing
      - step:
          id: '19'
          action: Wait
          args: '"1"'
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
