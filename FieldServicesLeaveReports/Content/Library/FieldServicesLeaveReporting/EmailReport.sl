namespace: FieldServicesLeaveReporting
operation:
  name: EmailReport
  inputs:
    - reportLocation
    - emailRecipients
    - reportName
  sequential_action:
    gav: 'com.microfocus.seq:FieldServicesLeaveReporting.EmailReport:1.0.0'
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
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '2'
          object_path: MyEmail
          action: Subject
          args: '= Parameter("reportName")'
      - step:
          id: '3'
          object_path: MyEmail
          action: From
          args: '= "Process_Automation@sapowernetworks.com.au"'
      - step:
          id: '4'
          object_path: MyEmail
          action: To
          args: '= Parameter("emailRecipients")'
      - step:
          id: '5'
          action: Script
          object_path: 'reportName = Parameter("reportName")'
      - step:
          id: '6'
          action: Script
          object_path: 'reportName = Replace(reportName,".xlsx","")'
      - step:
          id: '7'
          object_path: MyEmail
          action: TextBody
          args: '= "Please find attached the "&reportName&" report."'
      - step:
          id: '8'
          object_path: MyEmail
          action: 'AddAttachment(Parameter("reportLocation"))'
      - step:
          id: '9'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '10'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
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
