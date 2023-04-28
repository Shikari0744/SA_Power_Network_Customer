namespace: BCRM_Reports
operation:
  name: Send_Email_Failure
  inputs:
    - RunDate:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:BCRM_Reports.Send_Email_Failure:1.0.0'
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
          object_path: 'runDate = Parameter("RunDate")'
      - step:
          id: '2'
          action: Script
          object_path: 'If runDate = "" Then'
      - step:
          id: '3'
          action: Script
          object_path: runDate = Date()
      - step:
          id: '4'
          action: Script
          object_path: End If
      - step:
          id: '5'
          action: Script
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '6'
          object_path: MyEmail
          action: To
          args: '= "MDP@sapowernetworks.com.au"'
      - step:
          id: '7'
          object_path: MyEmail
          action: From
          args: '= "Process_Automation@sapowernetworks.com.au"'
      - step:
          id: '8'
          object_path: MyEmail
          action: Subject
          args: '= "MDP Settlement Reports ("&runDate&") - Automation Failure"'
      - step:
          id: '9'
          object_path: MyEmail
          action: TextBody
          args: "= \"Hi Team,\"&vbNewLine&vbNewLine&\"MDP settlement reports for \"&runDate&\" have failed.\"&vbNewLine&vbNewLine&\"Please contact the IT Automation Team if you haven't heard from them.\"&vbNewLine&vbNewLine&\"Thanks,\"&vbNewLine&\"IT Automation Team.\""
      - step:
          id: '10'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '11'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
      - step:
          id: '12'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25'
      - step:
          id: '13'
          object_path: MyEmail.Configuration.Fields
          action: Update
      - step:
          id: '14'
          object_path: MyEmail
          action: Send
      - step:
          id: '15'
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
