namespace: ITAzureChargeBack
operation:
  name: loginAzure
  inputs:
  - username: SVC-APP-COSTMANAGE
  - password: fQdpvubE!5XpCmH8#uLHAQ
  - filelocation: C:\Users\haasj0\OneDrive - SA Power Networks (1)\ITAM Azure Cost
      Management\
  sequential_action:
    gav: com.microfocus.seq:ITAzureChargeBack.loginAzure:1.2.0
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
        object_path: username = Parameter("username")
    - step:
        id: '2'
        action: Script
        object_path: password = Parameter("password")
    - step:
        id: '3'
        action: Script
        object_path: filelocation = Parameter("filelocation")
    - step:
        id: '4'
        action: Script
        object_path: filelocation = Replace(filelocation, "/", "\")
    - step:
        id: '5'
        action: Script
        object_path: currentMonth = MonthName(Month(Date()))
    - step:
        id: '6'
        action: Script
        object_path: trackingSheet = filelocation+"ITAM Azure Chargeback - "&currentMonth&".xlsx"
    - step:
        id: '7'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '8'
        action: Script
        object_path: If fso.FileExists(trackingSheet) Then
    - step:
        id: '9'
        object_path: fso
        action: DeleteFile(trackingSheet)
    - step:
        id: '10'
        action: Script
        object_path: End If
    - step:
        id: '11'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '12'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '13'
        action: Script
        object_path: URL = "https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/costanalysis/open/costanalysisv3/openedBy/AzurePortal"
    - step:
        id: '14'
        object_path: mySendKeys
        action: Run
        args: '"msedge -inprivate -url "&URL'
    - step:
        id: '15'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '16'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '17'
        object_path: Browser("Sign in to Microsoft Azure")
        action: Highlight
    - step:
        id: '18'
        object_path: Browser("Sign in to Microsoft Azure").Page("Sign in to Microsoft
          Azure").WebEdit("Email")
        action: Set
        args: username&"@sapowernetworks.com.au"
    - step:
        id: '19'
        object_path: Browser("Sign in to Microsoft Azure").Page("Sign in to Microsoft
          Azure").WebButton("Next")
        action: Click
    - step:
        id: '20'
        action: Wait
        args: '"8"'
        default_args: '"1"'
    - step:
        id: '21'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '22'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '23'
        object_path: mySendKeys
        action: SendKeys
        args: '"{TAB}"'
    - step:
        id: '24'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '25'
        object_path: mySendKeys
        action: SendKeys
        args: '"+({TAB})"'
    - step:
        id: '26'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '27'
        object_path: mySendKeys
        action: SendKeys
        args: username
    - step:
        id: '28'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '29'
        object_path: mySendKeys
        action: SendKeys
        args: '"{TAB}"'
    - step:
        id: '30'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '31'
        object_path: mySendKeys
        action: SendKeys
        args: password
    - step:
        id: '32'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '33'
        object_path: mySendKeys
        action: SendKeys
        args: '"{ENTER}"'
    - step:
        id: '34'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '35'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '36'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '37'
        action: Script
        object_path: For t = 1 To 5
    - step:
        id: '38'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '39'
        action: Script
        object_path: 'If Browser("Cost Management: SA Power").Page("Cost Management:
          SA Power").Frame("Frame").WebButton("Group by: None").Exist(3) Then'
    - step:
        id: '40'
        action: Script
        object_path: Exit For
    - step:
        id: '41'
        action: Script
        object_path: End If
    - step:
        id: '42'
        action: Script
        object_path: Next
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
      class: Browser
      name: Sign in to Microsoft Azure
      properties:
      - property:
          value:
            value: Sign in to Microsoft Azure
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize?redirect_uri=https%3A%2F%2Fportal.azure.com%2Fsignin%2Findex%2F&response_type=code%20id_token&scope=https%3A%2F%2Fmanagement.core.windows.net%2F%2Fuser_impersonation%20openid%20email%20profile&state=OpenIdConnect.AuthenticationProperties%3D5WIWN4P-0gXsFcHF5yD1cvy7qagyZHfBRUxnZCK1VL2Q0Y4cgv9bHRqbBjiF4_ISRHw8k_8277knFTLcOZ6IH5uW5aP7UOpBk_DmnCkeW43ECazRX4iPLzbKyutS1Bavo2PKECD0z2_70ZzYPeTgD0KzhQ-qvZBCIyDlsS-_H5qk3fnxTnwAYOoy6HGct3OkjWGBltzXgJ8ov3QvMIf6D7oNjDQBHnVuFvi7ryW0fxFORpGH5TdZzvlGBgEpfp1FmGCLoFePpDfVfLrtTx5cCV5kEOzZereJ03vfTFJKiyPz4IIInf5nytOsBTUi8SmBGT-oqa5WZ70AZ3hFacmZZ_QujrOi25vaTRd57dGPS8m32x-V9mZIdU_SqClYUtHA7fxAhrU8iqPoE4hS2IcyVw&response_mode=form_post&nonce=637889546886203181.YzA3YmM0NzUtZTgzYS00MDcyLWI0ZWItMmUzMDAyY2JhMDVjMGJhN2Q4YmEtNzAzYS00Mjk3LWE3NGEtOGUxM2FkODkwZGVh&client_id=c44b4083-3bb0-49c1-b47d-974e53cbdf3c&site_id=501430&client-request-id=23f483c0-42d1-4970-a545-beec23658737&x-client-SKU=ID_NET472&x-client-ver=6.16.0.0
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Sign in to Microsoft Azure
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '1'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Sign in to Microsoft Azure
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '1'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 0
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 10:11:26 AM
      child_objects:
      - object:
          class: Page
          name: Sign in to Microsoft Azure
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize?redirect_uri=https%3A%2F%2Fportal.azure.com%2Fsignin%2Findex%2F&response_type=code%20id_token&scope=https%3A%2F%2Fmanagement.core.windows.net%2F%2Fuser_impersonation%20openid%20email%20profile&state=OpenIdConnect.AuthenticationProperties%3D5WIWN4P-0gXsFcHF5yD1cvy7qagyZHfBRUxnZCK1VL2Q0Y4cgv9bHRqbBjiF4_ISRHw8k_8277knFTLcOZ6IH5uW5aP7UOpBk_DmnCkeW43ECazRX4iPLzbKyutS1Bavo2PKECD0z2_70ZzYPeTgD0KzhQ-qvZBCIyDlsS-_H5qk3fnxTnwAYOoy6HGct3OkjWGBltzXgJ8ov3QvMIf6D7oNjDQBHnVuFvi7ryW0fxFORpGH5TdZzvlGBgEpfp1FmGCLoFePpDfVfLrtTx5cCV5kEOzZereJ03vfTFJKiyPz4IIInf5nytOsBTUi8SmBGT-oqa5WZ70AZ3hFacmZZ_QujrOi25vaTRd57dGPS8m32x-V9mZIdU_SqClYUtHA7fxAhrU8iqPoE4hS2IcyVw&response_mode=form_post&nonce=637889546886203181.YzA3YmM0NzUtZTgzYS00MDcyLWI0ZWItMmUzMDAyY2JhMDVjMGJhN2Q4YmEtNzAzYS00Mjk3LWE3NGEtOGUxM2FkODkwZGVh&client_id=c44b4083-3bb0-49c1-b47d-974e53cbdf3c&site_id=501430&client-request-id=23f483c0-42d1-4970-a545-beec23658737&x-client-SKU=ID_NET472&x-client-ver=6.16.0.0
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Sign in to Microsoft Azure
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10025'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 10:11:26 AM
          child_objects:
          - object:
              class: WebEdit
              name: Email
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[2]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: email
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Email address, phone number or Skype
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: loginfmt
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '113'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: i0116
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: form-control ltr_override input ext-input text-box ext-text-box
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Enter your email address, phone number or Skype.
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 10:11:26 AM
              child_objects: []
          - object:
              class: WebButton
              name: Next
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[4]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Next
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Next
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: idSIButton9
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: win-button button_primary button ext-button primary ext-primary
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 10:11:26 AM
              child_objects: []
  - object:
      class: Browser
      name: 'Cost Management: SA Power'
      properties:
      - property:
          value:
            value: 'Cost Management: SA Power Networks - Microsoft Azure'
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://portal.azure.com/#blade/Microsoft_Azure_CostManagement/Menu/costanalysis/open/costanalysisv3/openedBy/AzurePortal
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Microsoft Azure
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '1'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: 'Cost Management: SA Power Networks - Microsoft Azure'
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '4'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 0
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 10:11:26 AM
      child_objects:
      - object:
          class: Page
          name: 'Cost Management: SA Power'
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://portal.azure.com/#view/Microsoft_Azure_CostManagement/Menu/~/costanalysis/open/costanalysisv3/openedBy/AzurePortal
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://portal.azure.com/#view/Microsoft_Azure_CostManagement/Menu/~/costanalysis/open/costanalysisv3/openedBy/AzurePortal
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'Cost Management: SA Power Networks - Microsoft Azure'
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '40030'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 10:11:26 AM
          child_objects:
          - object:
              class: Frame
              name: Frame
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: user-input in post data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: user input in get data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://costmanagement.hosting.portal.azure.net/costmanagement/Content/1.0.02144.92-20221114/CostAnalysis/cost-navigator
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://costmanagement.hosting.portal.azure.net/costmanagement/Content/1.0.02144.92-20221114/CostAnalysis/cost-navigator
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Azure Cost Management
                    regular_expression: false
                  name: title
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: non user-input in post data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: non user-input in get data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Frame
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: index
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: document size
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: all data in get method
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - name
                  - title
                  - url
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 10:11:26 AM
              child_objects:
              - object:
                  class: WebButton
                  name: 'Group by: None'
                  properties:
                  - property:
                      value:
                        value: WebButton
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '//DIV/DIV/DIV/APP-GRAPH-GROUP-BY/BUTTON[normalize-space()="Group
                          by: None"]'
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '-1'
                        regular_expression: false
                      name: visible
                      hidden: true
                      read_only: true
                      type: BOOL
                  - property:
                      value:
                        value: 'Group by: None'
                        regular_expression: false
                      name: value
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: submit
                        regular_expression: false
                      name: type
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: 'Group by: None'
                        regular_expression: false
                      name: name
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: BUTTON
                        regular_expression: false
                      name: html tag
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: d-inline-block popover-button
                        regular_expression: false
                      name: class
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: ''
                        regular_expression: false
                      name: acc_name
                      hidden: true
                      read_only: true
                      type: STRING
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - type
                    - name
                    - html tag
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - name
                      - type
                      - html id
                      - value
                      - class
                      - visible
                      - acc_name
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Monday, 3 April 2023 10:11:26 AM
                  child_objects: []
  check_points_and_outputs: []
  parameters: []
