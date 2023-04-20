namespace: GenericActivities
operation:
  name: OpenSAP
  inputs:
  - user: SVCPRJCLOSE
  - pass:
      sensitive: true
      default: projectCloseOut@2022
  - environment: QAS
  - system: ERP
  sequential_action:
    gav: com.microfocus.seq:GenericActivities.OpenSAP:1.0.0
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
        object_path: On Error Resume Next
    - step:
        id: '2'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '3'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '4'
        object_path: SystemUtil
        action: CloseProcessByName("saplogon.exe")
    - step:
        id: '5'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '6'
        action: Script
        object_path: If UCase(Parameter("system")) = "ISU" Then
    - step:
        id: '7'
        action: Script
        object_path: If UCase(Parameter("environment")) = "PRD" Then
    - step:
        id: '8'
        action: Script
        object_path: enviro = "SAP - ISU - EAP - Production (SSO)"
    - step:
        id: '9'
        action: Script
        object_path: client = "100"
    - step:
        id: '10'
        action: Script
        object_path: Else
    - step:
        id: '11'
        action: Script
        object_path: enviro = "SAP - ISU - EAQ (SSO)"
    - step:
        id: '12'
        action: Script
        object_path: client = "100"
    - step:
        id: '13'
        action: Script
        object_path: End If
    - step:
        id: '14'
        action: Script
        object_path: Else
    - step:
        id: '15'
        action: Script
        object_path: If UCase(Parameter("environment")) = "PRD" Then
    - step:
        id: '16'
        action: Script
        object_path: enviro = "ERP - PRD - Production"
    - step:
        id: '17'
        action: Script
        object_path: client = "410"
    - step:
        id: '18'
        action: Script
        object_path: Else
    - step:
        id: '19'
        action: Script
        object_path: enviro = "ERP - QAS - Quality Assurance"
    - step:
        id: '20'
        action: Script
        object_path: client = "410"
    - step:
        id: '21'
        action: Script
        object_path: End If
    - step:
        id: '22'
        action: Script
        object_path: End If
    - step:
        id: '23'
        object_path: SystemUtil
        action: Run("saplogon.exe")
    - step:
        id: '24'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '25'
        object_path: Reporter
        action: Filter
        args: = rfDisableAll
    - step:
        id: '26'
        object_path: SAPGuiUtil
        action: AutoLogon
        args: enviro, client, Parameter("user"), Parameter("pass"), ""
    - step:
        id: '27'
        object_path: Reporter
        action: Filter
        args: = rfEnableAll
    - step:
        id: '28'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '29'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiEdit("New
          Password").Exist(3) Then
    - step:
        id: '30'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "Password expired", "Password expired"
    - step:
        id: '31'
        action: Script
        object_path: PasswordExpiredNotification UCase(Parameter("system")), UCase(Parameter("environment")),
          UCase(Parameter("user"))
    - step:
        id: '32'
        action: Script
        object_path: ExitTest
    - step:
        id: '33'
        action: Script
        object_path: ElseIf SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").Exist(3)
          = false Then
    - step:
        id: '34'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Login Failed", "Login Failed"
    - step:
        id: '35'
        action: Script
        object_path: ExitTest
    - step:
        id: '36'
        action: Script
        object_path: ElseIf SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").Exist(3)
          Then
    - step:
        id: '37'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Maximize
    - step:
        id: '38'
        action: Script
        object_path: End If
    - step:
        id: '39'
        action: Script
        object_path: Function PasswordExpiredNotification(system, environment, account)
    - step:
        id: '40'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '41'
        object_path: MyEmail
        action: To
        args: = "DL_ITAutomationTeam@sapowernetworks.com.au"
    - step:
        id: '42'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '43'
        object_path: MyEmail
        action: Subject
        args: = "SAP "&system&" "&environment&" password expired"
    - step:
        id: '44'
        object_path: MyEmail
        action: TextBody
        args: = "Hi IT Automation Team,"&vbNewLine&vbNewLine&"The password for "&account&"
          in "&system&" "&environment&" has expired."&vbNewLine&vbNewLine&"Please
          reset and update in RPA Central."&vbNewLine&vbNewLine&"Thanks"
    - step:
        id: '45'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '46'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '47'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '48'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '49'
        object_path: MyEmail
        action: Send
    - step:
        id: '50'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '51'
        action: Script
        object_path: End Function
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: SAPGuiSession
      name: Session
      properties:
      - property:
          value:
            value: ses[0]
            regular_expression: false
          name: name
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: SAPGuiSession
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: hightlight id
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: '12'
            regular_expression: false
          name: guicomponenttype
          hidden: false
          read_only: false
          type: NUMBER
      - property:
          value:
            value: /app/con[0]/ses[0]
            regular_expression: false
          name: compidstr
          hidden: true
          read_only: true
          type: STRING
      basic_identification:
        property_ref:
        - name
        - micclass
        - guicomponenttype
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Monday, 20 February 2023 10:27:17 AM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: SAP Easy Access  -  User
          properties:
          - property:
              value:
                value: SESSION_MANAGER
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '100'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSMTR_NAVIGATION
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[0]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 20 February 2023 10:27:17 AM
          child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP
          properties:
          - property:
              value:
                value: S000
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '41'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSYST
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[1]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 20 February 2023 10:27:17 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: New Password
              properties:
              - property:
                  value:
                    value: RSYST-NCODE
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '33'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/pwdRSYST-NCODE
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 20 February 2023 10:27:17 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
