namespace: ITAzureChargeBack
operation:
  name: noProjectManagerFound
  inputs:
  - projectName: project
  - pmFirstName: pm
  - azureFailImage: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\ITAM Azure Cost
      Management\Azure - billing and crm release 2 environmet - July.png
  - pmLastName
  sequential_action:
    gav: com.microfocus.seq:ITAzureChargeBack.noProjectManagerFound:1.2.0
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
        object_path: projectName = Parameter("projectName")
    - step:
        id: '2'
        action: Script
        object_path: firstName = Parameter("pmFirstName")
    - step:
        id: '3'
        action: Script
        object_path: lastName = Parameter("pmLastName")
    - step:
        id: '4'
        action: Script
        object_path: projectManager = firstName &" "&lastName
    - step:
        id: '5'
        action: Script
        object_path: screenshot = Parameter("azureFailImage")
    - step:
        id: '6'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '7'
        object_path: MyEmail
        action: To
        args: = "DL_ITAssetManagement@sapowernetworks.com.au"
    - step:
        id: '8'
        object_path: MyEmail
        comment: generic email adress from us, do not change
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '9'
        object_path: MyEmail
        action: Subject
        args: = "Project Unable to be Journaled - Automation Update"
    - step:
        id: '10'
        object_path: MyEmail
        action: TextBody
        args: = "Hi ITAM,"&vbNewLine&vbNewLine&"When trying to journal the costs for
          "&projectName&", a failure has occurred, potentially due to the Project
          Manager "&projectManager&" not being found. Please see screenshot."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '11'
        object_path: MyEmail
        action: AddAttachment
        args: screenshot
    - step:
        id: '12'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '13'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '14'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '15'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '16'
        object_path: MyEmail
        action: Send
    - step:
        id: '17'
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
