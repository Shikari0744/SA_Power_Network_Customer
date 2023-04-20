namespace: AssetDeletion
operation:
  name: SuccessEmail
  inputs:
    - asset_ID
    - successMessage_status
    - successMessage_storeroom:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:AssetDeletion.SuccessEmail:1.0.0'
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
          object_path: 'emailContent = Parameter("asset_ID")&" successfully updated in ServiceNow: " &Parameter("successMessage_status")&", "&Parameter("successMessage_storeroom")'
      - step:
          id: '2'
          action: Script
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '3'
          object_path: MyEmail
          action: Subject
          args: '= "ServiceNow Asset Deletion Update - Success"'
      - step:
          id: '4'
          object_path: MyEmail
          action: From
          args: '= "Process_Automation@sapowernetworks.com.au"'
      - step:
          id: '5'
          object_path: MyEmail
          action: To
          args: '= "Mohita.Kaushal@sapowernetworks.com.au,Aleksey.Bogatyrev@sapowernetworks.com.au,Amrit.Nath@sapowernetworks.com.au"'
      - step:
          id: '6'
          object_path: MyEmail
          action: TextBody
          args: = emailContent
      - step:
          id: '7'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '8'
          action: Script
          object_path: "'SMTP Server"
      - step:
          id: '9'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
      - step:
          id: '10'
          action: Script
          object_path: "'SMTP Port"
      - step:
          id: '11'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25'
      - step:
          id: '12'
          object_path: MyEmail.Configuration.Fields
          action: Update
      - step:
          id: '13'
          object_path: MyEmail
          action: Send
      - step:
          id: '14'
          action: Script
          object_path: Set MyEmail = Nothing
      - step:
          id: '15'
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
