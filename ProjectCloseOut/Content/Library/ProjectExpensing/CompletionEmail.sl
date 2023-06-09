namespace: ProjectExpensing
operation:
  name: CompletionEmail
  inputs:
  - ToEmail: Tarek.Elkady@sapowernetworks.com.au
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.CompletionEmail:1.0.0
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
        args: = "Project Close Out Automation Update"
    - step:
        id: '3'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '4'
        object_path: MyEmail
        action: To
        args: = Parameter("ToEmail")
    - step:
        id: '5'
        object_path: MyEmail
        action: TextBody
        args: '= "Hi,"&vbNewLine&vbNewLine&"All listed Projects have been expensed
          and settled."&vbNewLine&vbNewLine&"Please check the ''Projects To Be Expensed
          Tabs'' to see the result of each step per project."&vbNewLine&vbNewLine&"See
          documents in SAPN: Project Accounting Teams Group for updated Support File
          and Journals."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT Automation Team"'
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
