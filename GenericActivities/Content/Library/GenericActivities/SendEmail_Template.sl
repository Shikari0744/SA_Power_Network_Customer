namespace: GenericActivities
operation:
  name: SendEmail_Template
  sequential_action:
    gav: com.microfocus.seq:GenericActivities.SendEmail_Template:1.0.0
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
        comment: who you are sending the email to
        action: To
        args: =
    - step:
        id: '3'
        object_path: MyEmail
        comment: generic email adress from us, do not change
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '4'
        object_path: MyEmail
        comment: subject of your email
        action: Subject
        args: =
    - step:
        id: '5'
        object_path: MyEmail
        comment: body of your email, vbNewLine for a new line
        action: TextBody
        args: =
    - step:
        id: '6'
        object_path: MyEmail
        comment: complete file location, don't include the "="
        action: AddAttachment
        args: ''
    - step:
        id: '7'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '8'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '9'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '10'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '11'
        object_path: MyEmail
        action: Send
    - step:
        id: '12'
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
