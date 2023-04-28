namespace: GenericActivities
operation:
  name: OpenSAPProduction
  inputs:
    - SAPUser
    - SAPPassword:
        sensitive: true
    - terminateSession: 'NO'
  sequential_action:
    gav: 'com.microfocus.seq:GenericActivities.OpenSAPProduction:1.0.0'
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
          action: 'CloseProcessByName("saplogon.exe")'
      - step:
          id: '2'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '3'
          object_path: SystemUtil
          action: Run
          args: "\"C:\\Program Files (x86)\\SAP\\FrontEnd\\SapGui\\saplogon.exe\""
      - step:
          id: '4'
          action: Wait
          args: '"10"'
          default_args: '"1"'
      - step:
          id: '5'
          action: Script
          object_path: 'If Dialog("SAP Logon 760").WinComboBox("ComboBox").Exist(3) Then'
      - step:
          id: '6'
          object_path: 'Dialog("SAP Logon 760").WinComboBox("ComboBox")'
          action: Select
          args: '"List View"'
      - step:
          id: '7'
          action: Script
          object_path: Else
      - step:
          id: '8'
          object_path: 'Dialog("SAP Logon 760").WinCheckBox("Button")'
          action: Set
          args: '"ON"'
      - step:
          id: '9'
          action: Script
          object_path: End If
      - step:
          id: '10'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '11'
          action: Script
          object_path: 'If Dialog("SAP Logon 760").WinEdit("Connections").Exist(3) Then'
      - step:
          id: '12'
          object_path: 'Dialog("SAP Logon 760").WinEdit("Connections")'
          action: Set
          args: '"ERP - PRD - Production"'
      - step:
          id: '13'
          action: Script
          object_path: Else
      - step:
          id: '14'
          object_path: 'Dialog("SAP Logon 760").WinEdit("Edit")'
          action: Set
          args: '"ERP - PRD - Production"'
      - step:
          id: '15'
          action: Script
          object_path: End If
      - step:
          id: '16'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '17'
          object_path: 'Dialog("SAP Logon 760").WinButton("Log On")'
          action: Click
      - step:
          id: '18'
          action: Wait
          args: '"5"'
          default_args: '"1"'
      - step:
          id: '19'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiEdit("User")'
          action: Set
          args: 'Parameter("SAPUser")'
      - step:
          id: '20'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiEdit("Password")'
          action: SetSecure
          args: 'Parameter("SAPPassword")'
      - step:
          id: '21'
          action: Wait
          args: '"2"'
          default_args: '"1"'
      - step:
          id: '22'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP").SAPGuiEdit("Password")'
          action: SetFocus
      - step:
          id: '23'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("SAP")'
          action: SendKey
          args: ENTER
      - step:
          id: '24'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '25'
          action: Script
          object_path: 'If SAPGuiSession("Session").SAPGuiWindow("License Information for").Exist(3) Then'
      - step:
          id: '26'
          action: Script
          object_path: "'if terminateSession = yes then terminate first session and continue with this logon"
      - step:
          id: '27'
          action: Script
          object_path: 'If UCase(Parameter("terminateSession")) = "YES" Then'
      - step:
          id: '28'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("License Information for").SAPGuiRadioButton("Continue with this logon")'
          action: Set
      - step:
          id: '29'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("License Information for").SAPGuiButton("Confirm Selection   (Enter)")'
          action: Click
      - step:
          id: '30'
          action: Script
          object_path: Else
      - step:
          id: '31'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("License Information for").SAPGuiRadioButton("Terminate this logon")'
          action: Set
      - step:
          id: '32'
          object_path: 'SAPGuiSession("Session").SAPGuiWindow("License Information for").SAPGuiButton("Confirm Selection   (Enter)")'
          action: Click
      - step:
          id: '33'
          object_path: Reporter
          action: ReportEvent
          args: 'micFail, "Multiple SAP Sessions Open", "Multiple SAP sessions open for "& Parameter("SAPUser") &". Text exited"'
      - step:
          id: '34'
          action: Script
          object_path: ExitTest
      - step:
          id: '35'
          action: Script
          object_path: End If
      - step:
          id: '36'
          action: Script
          object_path: End If
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
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
                value: 'ses[0]'
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
                value: '/app/con[0]/ses[0]'
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
        last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
        child_objects:
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
                      value: '20'
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
                      value: 'wnd[0]'
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
                      value: 'wnd[0]'
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
              last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
              child_objects:
                - object:
                    class: SAPGuiEdit
                    name: User
                    properties:
                      - property:
                          value:
                            value: RSYST-BNAME
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
                            value: '31'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                      - property:
                          value:
                            value: 'wnd[0]/usr/txtRSYST-BNAME'
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
                    last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
                    child_objects: []
                - object:
                    class: SAPGuiEdit
                    name: Password
                    properties:
                      - property:
                          value:
                            value: RSYST-BCODE
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
                            value: 'wnd[0]/usr/pwdRSYST-BCODE'
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
                    last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
                    child_objects: []
          - object:
              class: SAPGuiWindow
              name: License Information for
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
                      value: '500'
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
                      value: 'wnd[1]'
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
                      value: 'wnd[1]'
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
              last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
              child_objects:
                - object:
                    class: SAPGuiRadioButton
                    name: Terminate this logon
                    properties:
                      - property:
                          value:
                            value: GuiRadioButton
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '.*Terminate this logon.*'
                            regular_expression: true
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: MULTI_LOGON_OPT3
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiRadioButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '41'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                    basic_identification:
                      property_ref:
                        - type
                        - text
                        - micclass
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations: ''
                    last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
                    child_objects: []
                - object:
                    class: SAPGuiRadioButton
                    name: Continue with this logon
                    properties:
                      - property:
                          value:
                            value: GuiRadioButton
                            regular_expression: false
                          name: type
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: 'Continue with this logon and end any other logons.*'
                            regular_expression: true
                          name: text
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: MULTI_LOGON_OPT1
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiRadioButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '41'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                    basic_identification:
                      property_ref:
                        - type
                        - text
                        - micclass
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations: ''
                    last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
                    child_objects: []
                - object:
                    class: SAPGuiButton
                    name: Confirm Selection   (Enter)
                    properties:
                      - property:
                          value:
                            value: '.*Confirm Selection.*'
                            regular_expression: true
                          name: tooltip
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: 'btn[0]'
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: SAPGuiButton
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '40'
                            regular_expression: false
                          name: guicomponenttype
                          hidden: false
                          read_only: false
                          type: NUMBER
                    basic_identification:
                      property_ref:
                        - tooltip
                        - name
                        - micclass
                      ordinal_identifier: ''
                    smart_identification: ''
                    custom_replay: ''
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations: ''
                    last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
                    child_objects: []
    - object:
        class: Dialog
        name: SAP Logon 760_2
        properties:
          - property:
              value:
                value: SAP Logon 760
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
        last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
        child_objects: []
    - object:
        class: Dialog
        name: SAP Logon 760
        properties:
          - property:
              value:
                value: 'SAP Logon [0-9]+'
                regular_expression: true
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: 'SAP Logon [0-9]+'
                regular_expression: true
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: "\\#[0-9]+"
                regular_expression: true
              name: nativeclass
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
            - nativeclass
          ordinal_identifier: ''
        smart_identification: ''
        custom_replay:
          behavior:
            value: '#32770'
            name: simclass
            type: STRING
        comments:
          comment:
            - value: ''
              name: miccommentproperty
        visual_relations:
          visual_relation: []
        last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
        child_objects:
          - object:
              class: WinEdit
              name: Edit
              properties:
                - property:
                    value:
                      value: Edit
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
              basic_identification:
                property_ref:
                  - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
              child_objects: []
          - object:
              class: WinEdit
              name: Connections
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
                      value: Connections
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
              last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
              child_objects: []
          - object:
              class: WinComboBox
              name: ComboBox
              properties:
                - property:
                    value:
                      value: ComboBox
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
              basic_identification:
                property_ref:
                  - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: ComboBox
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
              child_objects: []
          - object:
              class: WinCheckBox
              name: Button
              properties:
                - property:
                    value:
                      value: '59410'
                      regular_expression: false
                    name: window id
                    hidden: false
                    read_only: false
                    type: NUMBER
                - property:
                    value:
                      value: ''
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
                  - window id
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
              last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
              child_objects: []
          - object:
              class: WinButton
              name: Log On
              properties:
                - property:
                    value:
                      value: '&Log On'
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
              last_update_time: 'Wednesday, 17 November 2021 12:21:13 PM'
              child_objects: []
  check_points_and_outputs: []
  parameters: []
