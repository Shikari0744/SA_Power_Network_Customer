namespace: ActionBPEMs
operation:
  name: Send_Email_Success
  inputs:
  - Attachment
  sequential_action:
    gav: com.microfocus.seq:ActionBPEMs.Send_Email_Success:1.0.0
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
        action: Subject
        args: = "BPEM Process Execution Result - Success"
    - step:
        id: '3'
        object_path: MyEmail
        action: From
        args: = "Process.Automation@sapowernetworks.com.au"
    - step:
        id: '4'
        object_path: MyEmail
        action: To
        args: = "LNSP@sapowernetworks.com.au"
    - step:
        id: '5'
        object_path: MyEmail
        action: TextBody
        args: = "Hi Team,"&vbNewLine&vbNewLine&"All MI27 and MI79 BPEM's have successfully
          been actioned."&vbNewLine&vbNewLine&"Please see the attached result sheet."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '6'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("Attachment")
    - step:
        id: '7'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '8'
        action: Script
        object_path: '''SMTP Server'
    - step:
        id: '9'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '10'
        action: Script
        object_path: '''SMTP Port'
    - step:
        id: '11'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
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
