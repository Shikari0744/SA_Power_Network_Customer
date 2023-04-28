namespace: SAPtoP6IntegrationAPI
operation:
  name: CompletionEmail
  inputs:
  - activitiesFile:
      required: false
  - resourcesFile:
      required: false
  - activitiesUpdatedFile:
      required: false
  sequential_action:
    gav: com.microfocus.seq:SAPtoP6IntegrationAPI.CompletionEmail:1.0.0
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
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '3'
        object_path: MyEmail
        action: To
        args: = "Eeman.Saleem@sapowernetworks.com.au,Kris.Moeljo@sapowernetworks.com.au"
    - step:
        id: '4'
        object_path: MyEmail
        action: Cc
        args: = "Rick.Irizarry@sapowernetworks.com.au"
    - step:
        id: '5'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '6'
        object_path: MyEmail
        action: Subject
        args: = "SAP to P6 Integration - Automation Update"
    - step:
        id: '7'
        object_path: MyEmail
        action: TextBody
        args: = "Hi,"&vbNewLine&vbNewLine&"Please find attached the updates from the
          SAP to Primavera automation updates."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '8'
        action: Script
        object_path: If Parameter("activitiesFile") <> "" and fso.FileExists(Parameter("activitiesFile"))
          Then
    - step:
        id: '9'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("activitiesFile")
    - step:
        id: '10'
        action: Script
        object_path: End If
    - step:
        id: '11'
        action: Script
        object_path: If Parameter("resourcesFile") <> "" and fso.FileExists(Parameter("resourcesFile"))
          Then
    - step:
        id: '12'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("resourcesFile")
    - step:
        id: '13'
        action: Script
        object_path: End If
    - step:
        id: '14'
        action: Script
        object_path: If Parameter("activitiesUpdatedFile") <> "" and fso.FileExists(Parameter("activitiesUpdatedFile"))
          Then
    - step:
        id: '15'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("activitiesUpdatedFile")
    - step:
        id: '16'
        action: Script
        object_path: End If
    - step:
        id: '17'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '18'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '19'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '20'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '21'
        object_path: MyEmail
        action: Send
    - step:
        id: '22'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '23'
        action: Script
        object_path: Set fso = Nothing
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
