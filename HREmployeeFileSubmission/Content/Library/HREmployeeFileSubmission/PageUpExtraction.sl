namespace: HREmployeeFileSubmission
operation:
  name: PageUpExtraction
  inputs:
  - PageUpNumber: '504249'
  - Location: C:\Users\svcrpabot\OneDrive - SA Power Networks\HR Employee File Submission\
  - FirstName: Travis
  - LastName: Bury
  - Subject: 01004754_Bury_Travis_SAPN New Secondment Letter_504249_01.04.2023
  sequential_action:
    gav: com.microfocus.seq:HREmployeeFileSubmission.PageUpExtraction:1.0.0
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
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '2'
        action: Script
        object_path: URL = "https://etsa.dc2.pageuppeople.com/dashboard"
    - step:
        id: '3'
        object_path: mySendKeys
        action: Run
        args: '"chrome -url "&URL'
    - step:
        id: '4'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '5'
        object_path: Browser("- PageUp")
        action: Maximize
    - step:
        id: '6'
        object_path: Browser("- PageUp").Page("- PageUp").WebEdit("globalQuickSearch")
        action: Set
        args: Parameter("PageUpNumber")
    - step:
        id: '7'
        object_path: Browser("- PageUp").Page("- PageUp").WebButton("Quick search")
        action: Click
    - step:
        id: '8'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '9'
        object_path: Browser("Swift - PageUp").Page("Swift - PageUp").WebElement("Position
          Title")
        action: Click
    - step:
        id: '10'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '11'
        object_path: Browser("Swift - PageUp")
        action: CloseAllTabs
    - step:
        id: '12'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '13'
        object_path: mySendKeys
        action: SendKeys
        args: '"(^+P)"'
    - step:
        id: '14'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '15'
        object_path: '''Window("Google Chrome").Dialog("Print").WinButton("Print")'
        action: Click
    - step:
        id: '16'
        object_path: mySendKeys
        action: SendKeys
        args: '"ENTER"'
    - step:
        id: '17'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '18'
        object_path: Window("Google Chrome").Dialog("Save Print Output As").WinEdit("File
          name:")
        action: Set
        args: Parameter("Location")&Parameter("Subject")&" PageUp1.pdf"
    - step:
        id: '19'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '20'
        object_path: Window("Google Chrome").Dialog("Save Print Output As").WinButton("Save")
        action: Click
    - step:
        id: '21'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '22'
        action: Script
        object_path: If Browser("- PageUp").Page("Network Operations Engineer").Link("text:="&Parameter("FirstName")&"
          "&Parameter("LastName")).Exist(3) Then
    - step:
        id: '23'
        object_path: Browser("- PageUp").Page("Network Operations Engineer").Link("text:="&Parameter("FirstName")&"
          "&Parameter("LastName"))
        action: Click
    - step:
        id: '24'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '25'
        object_path: Browser("Swift - PageUp")
        action: Maximize
    - step:
        id: '26'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '27'
        action: Script
        object_path: If Browser("Swift - PageUp").Page("Mr Travis Bury - PageUp").Link("Offer
          incomplete").Exist(3) Then
    - step:
        id: '28'
        object_path: Browser("Swift - PageUp").Page("Mr Travis Bury - PageUp").Link("Offer
          incomplete")
        action: Click
    - step:
        id: '29'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '30'
        object_path: mySendKeys
        action: SendKeys
        args: '"(^+P)"'
    - step:
        id: '31'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '32'
        object_path: Window("Google Chrome_2").Dialog("Print").WinButton("Print")
        action: Click
    - step:
        id: '33'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '34'
        object_path: Window("Google Chrome_2").Dialog("Save Print Output As").WinEdit("File
          name:")
        action: Set
        args: Parameter("Location")&Parameter("Subject")&" PageUp2.pdf"
    - step:
        id: '35'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '36'
        object_path: Window("Google Chrome_2").Dialog("Save Print Output As").WinButton("Save")
        action: Click
    - step:
        id: '37'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '38'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '39'
        action: Script
        object_path: End If
    - step:
        id: '40'
        action: Script
        object_path: End If
    - step:
        id: '41'
        object_path: SystemUtil
        action: CloseProcessByName
        args: '"chrome.exe"'
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
      class: Window
      name: Google Chrome_2
      properties:
      - property:
          value:
            value: Offer details - Google Chrome
            regular_expression: false
          name: text
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Google Chrome
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Chrome_WidgetWin_1
            regular_expression: false
          name: regexpwndclass
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is owned window
          hidden: false
          read_only: false
          type: BOOL
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is child window
          hidden: false
          read_only: false
          type: BOOL
      basic_identification:
        property_ref:
        - text
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: Chrome_WidgetWin_1
          name: simclass
          type: STRING
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Thursday, 20 April 2023 12:03:55 PM
      child_objects:
      - object:
          class: Dialog
          name: Save Print Output As
          properties:
          - property:
              value:
                value: Save Print Output As
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
          basic_identification:
            property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 20 April 2023 12:03:55 PM
          child_objects:
          - object:
              class: WinEdit
              name: 'File name:'
              properties:
              - property:
                  value:
                    value: Edit
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'File name:'
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
          - object:
              class: WinComboBox
              name: 'File name:'
              properties:
              - property:
                  value:
                    value: ComboBox
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'File name:'
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: ComboBox
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
          - object:
              class: WinButton
              name: Save
              properties:
              - property:
                  value:
                    value: '&Save'
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
      - object:
          class: Dialog
          name: Print
          properties:
          - property:
              value:
                value: Print
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
          basic_identification:
            property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 20 April 2023 12:03:55 PM
          child_objects:
          - object:
              class: WinButton
              name: Print
              properties:
              - property:
                  value:
                    value: '&Print'
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
  - object:
      class: Window
      name: Google Chrome
      properties:
      - property:
          value:
            value: '[\D]+ - PageUp People - Google Chrome'
            regular_expression: true
          name: text
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Google Chrome
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Chrome_WidgetWin_1
            regular_expression: false
          name: regexpwndclass
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is owned window
          hidden: false
          read_only: false
          type: BOOL
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is child window
          hidden: false
          read_only: false
          type: BOOL
      basic_identification:
        property_ref:
        - text
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: Chrome_WidgetWin_1
          name: simclass
          type: STRING
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations:
        visual_relation: []
      last_update_time: Thursday, 20 April 2023 12:03:55 PM
      child_objects:
      - object:
          class: Dialog
          name: Save Print Output As
          properties:
          - property:
              value:
                value: Save Print Output As
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
          basic_identification:
            property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 20 April 2023 12:03:55 PM
          child_objects:
          - object:
              class: WinEdit
              name: 'File name:'
              properties:
              - property:
                  value:
                    value: Edit
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'File name:'
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
          - object:
              class: WinButton
              name: Save
              properties:
              - property:
                  value:
                    value: '&Save'
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
      - object:
          class: Dialog
          name: Print
          properties:
          - property:
              value:
                value: Print
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
          basic_identification:
            property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 20 April 2023 12:03:55 PM
          child_objects:
          - object:
              class: WinButton
              name: Print
              properties:
              - property:
                  value:
                    value: '&Print'
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
  - object:
      class: Browser
      name: Swift - PageUp
      properties:
      - property:
          value:
            value: '[\D]+ - PageUp'
            regular_expression: true
          name: title
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: https://etsa.dc2.pageuppeople.com/swift/?q=504249
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Swift - PageUp
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
            value: Swift - PageUp
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
            value: '6'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - title
        - micclass
        ordinal_identifier:
          value: 1
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
      last_update_time: Thursday, 20 April 2023 12:03:55 PM
      child_objects:
      - object:
          class: Page
          name: Swift - PageUp
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
                value: https://etsa.dc2.pageuppeople.com/swift/
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://etsa.dc2.pageuppeople.com/swift/?q=504249
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Swift - PageUp
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
                value: '60030'
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
          last_update_time: Thursday, 20 April 2023 12:03:55 PM
          child_objects:
          - object:
              class: WebElement
              name: Position Title
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: false
                  read_only: false
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Network Operations Engineer
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[2]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/SPAN[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - visible
                - micclass
                - html tag
                - class
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
      - object:
          class: Page
          name: Mr Travis Bury - PageUp
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
                value: https://etsa.dc2.pageuppeople.com/applicant
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://etsa.dc2.pageuppeople.com/applicant?sData=UFUtVjMtC8xjudNpMLcYBoKpMW%2FRhiW8msvT4%2FkRvXoghFeTFKnWXopPmjMKWkCntxuqVdxiH4XAggk23RAYy7SOOYiRTiDefCFO%2BXChKcgKa8%2Frt1VOYC1lQr6XDkaB9UvROK2j
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '[\D]+ - PageUp'
                regular_expression: true
              name: title
              hidden: false
              read_only: false
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
                value: '90032'
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
            - title
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
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Thursday, 20 April 2023 12:03:55 PM
          child_objects:
          - object:
              class: WebButton
              name: Print
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
                    value: //BUTTON[@id="applicant-print-all"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '70'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: '20'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '563'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Print
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Print
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
                    value: applicant-print-all
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '42'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: btn btn-ctrl
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
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '85'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1106'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
                - html tag
                - acc_name
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
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
          - object:
              class: Link
              name: Offer incomplete
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //SPAN/DD/A[normalize-space()="Offer incomplete"]
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
                    value: Offer incomplete
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Offer incomplete
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
                    value: https://etsa.dc2.pageuppeople.com/v5.3/provider/manageApplicants/checkOffer.asp?sData=UFUtVjMtsHbCxOFXd3Z8JLhXhYyplaC0jTBWl8ASALJDC6SfApqMvwgCEXTi3Rm9gV39LmkO_Wu7UK2oqmS-ldp27xk0W3u-TbowRlA_TSM9HWLZ_tfI5itrVpXUVG9mucYdlsKcbaob6GsA9YeIFZOFfBBk2t1W_7nnunBl7RbjXEik7Ao~
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
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
                - text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
  - object:
      class: Browser
      name: '- PageUp'
      properties:
      - property:
          value:
            value: '- PageUp'
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://admin.dc2.pageuppeople.com/saml/authservice/?data=cyCVUbh31eRsT%2B4vRzRXHXFUMePDhBNc4SOdF1sE8dbPMex9vovmpTdxJCF2mm2zsrdgUMLXKxQI4MkP5ZJPXraE%2F2WLATt7nogv8PEGAdutGnQFM9soa64mvsyHg1wdLYIuVkYrrU%2BOdrWeK%2FVCkCncVlICd1phavoxWP6C6AuyFzEQynLNL23XRA8FPHNLVUIVcXAQp8Vq9YZpFOsQq6JVFcCY0WMe9ursa1wueXAXyZiJ%2F4QQiE1oNS9lFR5z8t%2BxFgYQsNIBxbEar5uXyGM8AupanMj%2BVu9fRiCTtr7F6ZKZuy5G1OGu2lhdK6gMlyh5kUp3zgw%2FeDTWOQUSMtepTd3hOIFF6%2BqLxtJ%2FWLqReSXSkPxnXNHbf%2BoQ3vFV71A0C4lahPw960UgeTh2VwpkBq3nQPbJ9Z6fAiw9OsfrGkHIg0V5N1zaCwNCDhnnELIGqNMn7ImqQOZx9%2BELW5Y0dUKACTcR3g9U0840sYcaRE8KONq%2FnGv%2FHNsOdkBpbm36m1ItQabUvIu1PgXH6Sehmh8Xs6jwPcc%2BA6dJUbzWRuYztg%2BpOz7n9vg%2Bl7ZfrKBnEtJs%2BBatb3f02pfVUjHwE7NR4oXenO5zOYN2nDTDWjRYJjyS3%2BYCFctSYksTmFD3fjr9En%2FbdkQ71isRuQBcBlTkG8hBoW5VMhOhk5p4ThAD8l%2Faa0TBrtGiV5vIN%2Fwz%2BpqtXVoW1SOPMBpyn01WPbj6RiaE2TPPRsxF5%2FlzFx4NpZGNbzQUjeh9fvo4VMndNtWCjy6pK0iEAwgirwpu982ZauRVqUn79Kzs9e8R3la9I62Bw6LQKLCIsaDqsUvBFlOyd2kTLyzQR6Yj%2FmBXiLR8ZgAaeVuctsvWx51Q2AQJ0sx2corC9ZGfTSBd9iO0kQWYNvmg9k%2Fh8%2FOM9EL6PGPZzuzGUX4SaERj%2FBacN3DxDTUfRfoBDln2vD28kgXPOOP6ZEASG9NhAVNGmbpgd%2BOX9a8gIjZq7pEiJRDWcC%2BunVkQJNRYDWDdyvJu7T6f%2FIY1OHiAeXEchhyJj0zCP5ovzkzn7h7aCvzz%2BukZMvHpqw86Mks%2Fl6FSCk8pfzuOn6HsAdFt24AqGQAqg3MrGCb3cig4BGlIEEZ9oc8HK%2Fp1x6fV7QARecbbAlwDaDwRtCTk%2Fs2CKRqz1wUx0SSMYm7uta6teiZ%2FOVwFIcPHqxNLUxPT4dYaj%2BxqmrximFMdvz102FtITVnig604%2FAglo0sCMUUyqvAt9qvcPMFQigOsK7svjCj2cGZ%2Fp%2BRvl9aEHpB%2FGMumkBC4NRKgxsuve%2FsYRIDvxbetB%2BmnLnc7j6ciWYifD%2FwiCw7Atc22SCjTxu5uaxcwxaIJlZUMybh%2FJbs0Dlm2Qf1Xa8XeLQlKKzC%2Fgw4X0hjyJe9wOxGU6k7gTAQRegFfroOPPjB2IJfiM5MrpQIk2%2Blq0y5V1XreI7D08Ao625WGnGqMOB0RyFSXExGiw9M4LxDWr7JdMF7%2BJtm%2FGc6FE%2BuF9KsxpOlIC7WvRVEjjdgwXb0I8qRmWyOMwnOlB5YaelQAe22m9vMgTLP99gjS8j%2FM2FElKUHAyWqFGHdSiLrfdOeFDhKMPxESeg9XkvM7uLMxtV0KENwGLnSanZiiu%2FKXtwsaKVEs4A5exk1j8rmXRAvRRYVSJauISlMEsA%2BuApiOAY436wHCRAWUDXYof%2FiphPe0S%2FdIEZ%2BMG7AjbqfHEo1w%2F6zq7kwnxDh4XAdlZk2aXrwFaCCIBwyiFIY2dhYopAIZe%2BmKGv8a1FARDJp7eg9%2Blr9FwsAIUyx6Byiq7DBfN%2BEFIkeGJd3FklxWWyG3xhU7MIs8M4XKbbLaH9pjY39vGNfVK9QQsfQa9JQQeaRRc75x%2Bw%3D%3D
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: ''
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
            value: '- PageUp'
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
      last_update_time: Thursday, 20 April 2023 12:03:55 PM
      child_objects:
      - object:
          class: Page
          name: Network Operations Engineer
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
                value: https://etsa.dc2.pageuppeople.com/v5.3/provider/manageJobs/editJob.asp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://etsa.dc2.pageuppeople.com/v5.3/provider/manageJobs/editJob.asp?sData=UFUtVjMtUCQoT8CvQ5kh0y44BCiT9e0Ebx8o0t5ZqnrFi7p3HLCbp9YYPc0Pj0FKLIsWBzmJY4pxZ6oVEsr8_gVgZFwgoxZhZvatCD8AXUORo2RXaqo%7e
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Network Operations Engineer - PageUp People
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
                value: '80032'
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
          last_update_time: Thursday, 20 April 2023 12:03:55 PM
          child_objects:
          - object:
              class: Link
              name: Travis Bury
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TABLE[@id="jobPositionTable"]/TBODY/TR/TD/A[normalize-space()="Travis
                      Bury"]
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
                    value: .*
                    regular_expression: true
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Travis Bury
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
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
                    value: https://etsa.dc2.pageuppeople.com/v5.3/provider/manageJobs/editJob.asp?sData=UFUtVjMtUCQoT8CvQ5kh0y44BCiT9e0Ebx8o0t5ZqnrFi7p3HLCbp9YYPc0Pj0FKLIsWBzmJY4pxZ6oVEsr8_gVgZFwgoxZhZvatCD8AXUORo2RXaqo~#
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: action
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
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
                - text
                - html tag
                - class
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
      - object:
          class: Page
          name: '- PageUp'
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
                value: https://etsa.dc2.pageuppeople.com/dashboard
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://etsa.dc2.pageuppeople.com/dashboard
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '- PageUp'
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
                value: '40029'
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
          last_update_time: Thursday, 20 April 2023 12:03:55 PM
          child_objects:
          - object:
              class: WebEdit
              name: globalQuickSearch
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
                    value: //INPUT[@id="globalQuickSearch"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '175'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '13'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1537'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: search
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
                    value: Quick search
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: globalQuickSearch
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
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
                    value: globalQuickSearch
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '34'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: form-control globalQuickSearch
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
              - property:
                  value:
                    value: '116'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1537'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
          - object:
              class: WebButton
              name: Quick search
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
                    value: //FORM[@id="quickSearchForm"]/BUTTON[normalize-space()="Quick
                      search"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '30'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
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
                    value: '13'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1674'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Quick search
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Quick search
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
                    value: '30'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: btn-submit
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
              - property:
                  value:
                    value: '116'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '1674'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
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
              last_update_time: Thursday, 20 April 2023 12:03:55 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
