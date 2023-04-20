namespace: ITAzureChargeBack
operation:
  name: checkProjectFound
  inputs:
    - actual:
        required: false
    - project
    - errorScreenShot:
        required: false
  sequential_action:
    gav: 'com.microfocus.seq:ITAzureChargeBack.checkProjectFound:1.0.0'
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
          object_path: 'actual = Parameter("actual")'
      - step:
          id: '2'
          action: Script
          object_path: 'project = Parameter("project")'
      - step:
          id: '3'
          action: Script
          object_path: 'errorScreenShot = Parameter("errorScreenShot")'
      - step:
          id: '4'
          action: Script
          object_path: 'If actual = "" Then'
      - step:
          id: '5'
          action: Script
          object_path: 'Set MyEmail = CreateObject("CDO.Message")'
      - step:
          id: '6'
          object_path: MyEmail
          action: To
          args: '= "DL_ITAssetManagement@sapowernetworks.com.au"'
      - step:
          id: '7'
          object_path: MyEmail
          action: From
          args: '= "Process_Automation@sapowernetworks.com.au"'
      - step:
          id: '8'
          object_path: MyEmail
          action: Subject
          args: '= "ITAM Azure Charge Back RPA Update"'
      - step:
          id: '9'
          object_path: MyEmail
          action: TextBody
          args: "= \"Hi IT Asset Management,\"&vbNewLine&vbNewLine&\"There was an issue trying to find the project tag '\"&project&\"' in Azure.\"&vbNewLine&vbNewLine&\"See screenshot. Please investigate.\"&vbNewLine&vbNewLine&\"Thanks,\"&vbNewLine&\"IT Automation Team\""
      - step:
          id: '10'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2'
      - step:
          id: '11'
          object_path: MyEmail
          action: AddAttachment
          args: errorScreenShot
      - step:
          id: '12'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"'
      - step:
          id: '13'
          object_path: MyEmail.Configuration.Fields
          action: 'Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25'
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
          object_path: Set MyEmail = Nothing
      - step:
          id: '17'
          object_path: Reporter
          action: ReportEvent
          args: 'micWarning, "Tag not found", "Tag not found"'
      - step:
          id: '18'
          action: Script
          object_path: 'Parameter("failure") = "Tag not found in Azure"'
      - step:
          id: '19'
          action: Script
          object_path: ExitTest
      - step:
          id: '20'
          action: Script
          object_path: End If
  outputs:
    - failure:
        robot: true
        value: '${failure}'
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
