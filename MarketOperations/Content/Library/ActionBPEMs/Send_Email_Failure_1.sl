namespace: ActionBPEMs
operation:
  name: Send_Email_Failure_1
  inputs:
  - Attachment:
      required: false
  sequential_action:
    gav: com.microfocus.seq:ActionBPEMs.Send_Email_Failure_1:1.0.0
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
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '2'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '3'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '4'
        object_path: MyEmail
        action: Subject
        args: = "BPEM Process Execution Result - Failure"
    - step:
        id: '5'
        object_path: MyEmail
        action: From
        args: = "Process.Automation@sapowernetworks.com.au"
    - step:
        id: '6'
        object_path: MyEmail
        action: To
        args: = "LNSP@sapowernetworks.com.au"
    - step:
        id: '7'
        object_path: MyEmail
        action: TextBody
        args: = "Hi Team,"&vbNewLine&vbNewLine&"The Action MI27 and MI79 BPEMs RPA
          process has failed."&vbNewLine&vbNewLine&"Please see the attached result
          sheet for any completed BPEM's before the failure."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '8'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("Attachment")
    - step:
        id: '9'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '10'
        action: Script
        object_path: '''SMTP Server'
    - step:
        id: '11'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '12'
        action: Script
        object_path: '''SMTP Port'
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
        object_path: Set MyEmail = NOTHING
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
