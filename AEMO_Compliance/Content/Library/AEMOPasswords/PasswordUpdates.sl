namespace: AEMOPasswords
operation:
  name: PasswordUpdates
  inputs:
  - old_password: Hello_789!
  sequential_action:
    gav: com.microfocus.seq:AEMOPasswords.PasswordUpdates:1.0.0
    skills:
    - SAP
    - Web
    - WPF
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
        object_path: Dim intMax, iLoop, k, intValue, strChar, new_password, intNum
    - step:
        id: '2'
        action: Script
        object_path: Const lowCaseChar = "abcdefghijklmnopqrstuvwxyz"
    - step:
        id: '3'
        action: Script
        object_path: Const uppCaseChar = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    - step:
        id: '4'
        action: Script
        object_path: Const numbers = "1234567890"
    - step:
        id: '5'
        action: Script
        object_path: Const randomChar = "<>_-!@#$%^&*?"
    - step:
        id: '6'
        action: Script
        object_path: new_password = ""
    - step:
        id: '7'
        action: Script
        object_path: Randomize()
    - step:
        id: '8'
        action: Script
        object_path: For iLoop = 1 To 1
    - step:
        id: '9'
        action: Script
        object_path: For k = 1 To 5
    - step:
        id: '10'
        action: Script
        object_path: intValue = Fix(26 * Rnd())
    - step:
        id: '11'
        action: Script
        object_path: strChar = Mid(lowCaseChar, intValue + 1, 1)
    - step:
        id: '12'
        action: Script
        object_path: new_password = new_password & strChar
    - step:
        id: '13'
        action: Script
        object_path: Next
    - step:
        id: '14'
        action: Script
        object_path: For k = 1 To 5
    - step:
        id: '15'
        action: Script
        object_path: intValue = Fix(26 * Rnd())
    - step:
        id: '16'
        action: Script
        object_path: strChar = Mid(uppCaseChar, intValue + 1, 1)
    - step:
        id: '17'
        action: Script
        object_path: new_password = new_password & strChar
    - step:
        id: '18'
        action: Script
        object_path: Next
    - step:
        id: '19'
        action: Script
        object_path: For k = 1 To 2
    - step:
        id: '20'
        action: Script
        object_path: intValue = Fix(10 * Rnd())
    - step:
        id: '21'
        action: Script
        object_path: strChar = Mid(numbers, intValue + 1, 1)
    - step:
        id: '22'
        action: Script
        object_path: new_password = new_password & strChar
    - step:
        id: '23'
        action: Script
        object_path: Next
    - step:
        id: '24'
        action: Script
        object_path: For k = 1 To 2
    - step:
        id: '25'
        action: Script
        object_path: intValue = Fix(13 * Rnd())
    - step:
        id: '26'
        action: Script
        object_path: strChar = Mid(randomChar, intValue + 1, 1)
    - step:
        id: '27'
        action: Script
        object_path: new_password = new_password & strChar
    - step:
        id: '28'
        action: Script
        object_path: Next
    - step:
        id: '29'
        action: Script
        object_path: Next
    - step:
        id: '30'
        action: Script
        object_path: Parameter("new_password") = new_password
    - step:
        id: '31'
        action: Script
        object_path: preproduction_url = "https://msats.preprod.nemnet.net.au/msats/index.jsp"
    - step:
        id: '32'
        action: Script
        object_path: production_url = "https://msats.prod.nemnet.net.au/msats/index.jsp"
    - step:
        id: '33'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '34'
        object_path: mySendKeys
        action: Run
        args: '"chrome -url "&preproduction_url'
    - step:
        id: '35'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '36'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '37'
        action: Script
        object_path: preproduction_usernames = Array("RMBOT1","RMBOT0","LNSPBOT1","MPBBOT1","MDPBOT1","RPBOT1")
    - step:
        id: '38'
        action: Script
        object_path: production_usernames = Array("RMBBOT1","RMBOT0","LNSPBOT1","MPBBOT1","MDPBOT1","RPBOT1")
    - step:
        id: '39'
        action: Script
        object_path: For Each username in preproduction_usernames
    - step:
        id: '40'
        object_path: Browser("Login").Page("Login").WebEdit("userID")
        action: Set
        args: username
    - step:
        id: '41'
        object_path: Browser("Login").Page("Login").WebEdit("password")
        action: Set
        args: Parameter("old_password")
    - step:
        id: '42'
        object_path: Browser("Login").Page("Login").Image("Login")
        action: Click
    - step:
        id: '43'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Link("Change Password")
        action: Click
    - step:
        id: '44'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebEdit("password")
        action: Set
        args: Parameter("old_password")
    - step:
        id: '45'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebEdit("newPassword")
        action: Set
        args: Parameter("new_password")
    - step:
        id: '46'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebEdit("retypeNewPassword")
        action: Set
        args: Parameter("new_password")
    - step:
        id: '47'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebButton("Save")
        action: Click
    - step:
        id: '48'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '49'
        action: Script
        object_path: status = Browser("Login").Page("MSATS").Frame("DETAIL").WebElement("Result").GetROProperty("innertext")
    - step:
        id: '50'
        action: Script
        object_path: If status <> "Successfully changed password " Then
    - step:
        id: '51'
        action: Script
        object_path: Parameter("preprod_results") = username & " error. "
    - step:
        id: '52'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Image("Logout")
        action: Click
    - step:
        id: '53'
        action: Script
        object_path: Else
    - step:
        id: '54'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Image("Logout")
        action: Click
    - step:
        id: '55'
        action: Script
        object_path: End If
    - step:
        id: '56'
        action: Script
        object_path: Next
    - step:
        id: '57'
        object_path: SystemUtil
        action: CloseProcessByName
        args: '"chrome.exe"'
    - step:
        id: '58'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '59'
        object_path: mySendKeys
        action: Run
        args: '"chrome -url "&production_url'
    - step:
        id: '60'
        action: Script
        object_path: Set mySendKeys = NOTHING
    - step:
        id: '61'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '62'
        action: Script
        object_path: For Each username in production_usernames
    - step:
        id: '63'
        object_path: Browser("Login").Page("Login").WebEdit("userID")
        action: Set
        args: username
    - step:
        id: '64'
        object_path: Browser("Login").Page("Login").WebEdit("password")
        action: Set
        args: Parameter("old_password")
    - step:
        id: '65'
        object_path: Browser("Login").Page("Login").Image("Login")
        action: Click
    - step:
        id: '66'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Link("Change Password")
        action: Click
    - step:
        id: '67'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebEdit("password")
        action: Set
        args: Parameter("old_password")
    - step:
        id: '68'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebEdit("newPassword")
        action: Set
        args: Parameter("new_password")
    - step:
        id: '69'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebEdit("retypeNewPassword")
        action: Set
        args: Parameter("new_password")
    - step:
        id: '70'
        object_path: Browser("Login").Page("MSATS").Frame("DETAIL").WebButton("Save")
        action: Click
    - step:
        id: '71'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '72'
        action: Script
        object_path: status = Browser("Login").Page("MSATS").Frame("DETAIL").WebElement("Result").GetROProperty("innertext")
    - step:
        id: '73'
        action: Script
        object_path: If status <> "Successfully changed password " Then
    - step:
        id: '74'
        action: Script
        object_path: Parameter("prod_results") = username & " error. "
    - step:
        id: '75'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Image("Logout")
        action: Click
    - step:
        id: '76'
        action: Script
        object_path: Else
    - step:
        id: '77'
        object_path: Browser("Login").Page("MSATS").Frame("toc").Image("Logout")
        action: Click
    - step:
        id: '78'
        action: Script
        object_path: End If
    - step:
        id: '79'
        action: Script
        object_path: Next
    - step:
        id: '80'
        action: Script
        object_path: If Parameter("preprod_results") <> "" or Parameter("prod_results")
          <> "" Then
    - step:
        id: '81'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Error occurred during password change", "Error occurred during
          password change"
    - step:
        id: '82'
        action: Script
        object_path: ExitTest
    - step:
        id: '83'
        action: Script
        object_path: Else
    - step:
        id: '84'
        action: Script
        object_path: If Parameter("preprod_results") = "" Then
    - step:
        id: '85'
        action: Script
        object_path: Parameter("preprod_results") = "all passwords reset"
    - step:
        id: '86'
        action: Script
        object_path: End If
    - step:
        id: '87'
        action: Script
        object_path: If Parameter("prod_results") = "" Then
    - step:
        id: '88'
        action: Script
        object_path: Parameter("prod_results") = "all passwords reset"
    - step:
        id: '89'
        action: Script
        object_path: End If
    - step:
        id: '90'
        action: Script
        object_path: End If
  outputs:
  - preprod_results:
      robot: true
      value: ${preprod_results}
  - prod_results:
      robot: true
      value: ${prod_results}
  - new_password:
      robot: true
      value: ${new_password}
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
      name: Login
      properties:
      - property:
          value:
            value: Login
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://msats.prod.nemnet.net.au/msats/default.jsp
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: MSATS
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
            value: Login
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
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, 21 March 2023 10:33:32 AM
      child_objects:
      - object:
          class: Page
          name: MSATS
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
                value: https://msats.preprod.nemnet.net.au/msats/default.jsp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://msats.preprod.nemnet.net.au/msats/default.jsp
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: MSATS
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
                value: '10048'
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
          last_update_time: Tuesday, 21 March 2023 10:33:32 AM
          child_objects:
          - object:
              class: Frame
              name: toc
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
                    value: https://msats.preprod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/MSATSTOC.jsp
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS Table of contents
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
                    value: toc
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
              last_update_time: Tuesday, 21 March 2023 10:33:32 AM
              child_objects:
              - object:
                  class: Link
                  name: Change Password
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
                        value: //DIV[27]/A[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '94'
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
                        value: '373'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '16'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: Change Password
                        regular_expression: false
                      name: text
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: Change Password
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
                        value: https://msats.preprod.nemnet.net.au/msats/FW915_UserProfileChangePassword.jsp?action=retrieve
                        regular_expression: false
                      name: href
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '13'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                  - property:
                      value:
                        value: '476'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '16'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                  last_update_time: Tuesday, 21 March 2023 10:33:32 AM
                  child_objects: []
              - object:
                  class: Image
                  name: Logout
                  properties:
                  - property:
                      value:
                        value: Image
                        regular_expression: false
                      name: micclass
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: //DIV[33]/A[1]/IMG[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '149'
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
                        value: '530'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '4'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: Image
                        regular_expression: false
                      name: name
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: Image Link
                        regular_expression: false
                      name: image type
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: IMG
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
                        value: '16'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: button_logout.gif
                        regular_expression: false
                      name: file name
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
                        value: Logout
                        regular_expression: false
                      name: alt
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: '633'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '4'
                        regular_expression: false
                      name: abs_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  basic_identification:
                    property_ref:
                    - micclass
                    - _xpath
                    - image type
                    - html tag
                    - alt
                    ordinal_identifier: ''
                  smart_identification:
                    base_filter:
                      property_ref:
                      - micclass
                      - html tag
                    optional_filter:
                      property_ref:
                      - alt
                      - image type
                      - html id
                      - name
                      - file name
                      - class
                      - visible
                    algorithm: Mercury.TolerantPriority
                    active: true
                  custom_replay: ''
                  comments: ''
                  visual_relations: ''
                  last_update_time: Tuesday, 21 March 2023 10:33:32 AM
                  child_objects: []
          - object:
              class: Frame
              name: DETAIL
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
                    value: https://msats.preprod.nemnet.net.au/msats/FW915_UserProfileChangePassword.jsp
                    regular_expression: false
                  name: url without form data
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://msats.preprod.nemnet.net.au/msats/FW915_UserProfileChangePassword.jsp?action=retrieve
                    regular_expression: false
                  name: url
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: MSATS
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
                    value: DETAIL
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
              last_update_time: Tuesday, 21 March 2023 10:33:32 AM
              child_objects:
              - object:
                  class: WebElement
                  name: Result
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
                        value: Invalid credentials supplied
                        regular_expression: false
                      name: innertext
                      hidden: false
                      read_only: false
                      type: STRING
                  - property:
                      value:
                        value: TD
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
                        value: //TABLE[1]/TBODY[1]/TR[1]/TD[1]
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
                  last_update_time: Tuesday, 21 March 2023 10:33:32 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: retypeNewPassword
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
                        value: //TR[4]/TD[2]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '150'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '143'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1021'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: password
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
                        value: ''
                        regular_expression: false
                      name: placeholder
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: retypeNewPassword
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
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '19'
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
                  - property:
                      value:
                        value: '246'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1021'
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
                  last_update_time: Tuesday, 21 March 2023 10:33:32 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: password
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
                        value: //TR[2]/TD[2]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '150'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '93'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1021'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: password
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
                        value: ''
                        regular_expression: false
                      name: placeholder
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: password
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
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '19'
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
                  - property:
                      value:
                        value: '196'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1021'
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
                  last_update_time: Tuesday, 21 March 2023 10:33:32 AM
                  child_objects: []
              - object:
                  class: WebEdit
                  name: newPassword
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
                        value: //TR[normalize-space()="New Password (*):"]/TD[2]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '150'
                        regular_expression: false
                      name: width
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '118'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1021'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: password
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
                        value: ''
                        regular_expression: false
                      name: placeholder
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: newPassword
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
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '19'
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
                  - property:
                      value:
                        value: '221'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '1021'
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
                  last_update_time: Tuesday, 21 March 2023 10:33:32 AM
                  child_objects: []
              - object:
                  class: WebButton
                  name: Save
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
                        value: //TR[2]/TD[1]/TABLE[2]/TBODY[1]/TR[1]/TD[1]/INPUT[1]
                        regular_expression: false
                      name: _xpath
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '42'
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
                        value: '183'
                        regular_expression: false
                      name: view_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '172'
                        regular_expression: false
                      name: view_x
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: Save
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
                        value: Save
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
                        value: ''
                        regular_expression: false
                      name: html id
                      hidden: true
                      read_only: true
                      type: STRING
                  - property:
                      value:
                        value: '19'
                        regular_expression: false
                      name: height
                      hidden: true
                      read_only: true
                      type: NUMBER
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
                  - property:
                      value:
                        value: '286'
                        regular_expression: false
                      name: abs_y
                      hidden: true
                      read_only: true
                      type: NUMBER
                  - property:
                      value:
                        value: '172'
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
                  last_update_time: Tuesday, 21 March 2023 10:33:32 AM
                  child_objects: []
      - object:
          class: Page
          name: Login
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
                value: https://msats.preprod.nemnet.net.au/msats/index.jsp
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://msats.preprod.nemnet.net.au/msats/index.jsp
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Login
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
                value: '10048'
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
          last_update_time: Tuesday, 21 March 2023 10:33:32 AM
          child_objects:
          - object:
              class: WebEdit
              name: userID
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
                    value: //TR[normalize-space()="UserID (*):"]/TD[2]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '150'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '146'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: text
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
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: userID
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '15'
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
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '19'
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
              - property:
                  value:
                    value: '249'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
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
              last_update_time: Tuesday, 21 March 2023 10:33:32 AM
              child_objects: []
          - object:
              class: WebEdit
              name: password
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
                    value: //TR[normalize-space()="Password (*):"]/TD[2]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '150'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '177'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: password
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
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: password
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
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '19'
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
              - property:
                  value:
                    value: '280'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
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
              last_update_time: Tuesday, 21 March 2023 10:33:32 AM
              child_objects: []
          - object:
              class: Image
              name: Login
              properties:
              - property:
                  value:
                    value: Image
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //INPUT[@id="image"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '74'
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
                    value: '208'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Image
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Image Button
                    regular_expression: false
                  name: image type
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
                    value: image
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '16'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: button_login.gif
                    regular_expression: false
                  name: file name
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
                    value: Login
                    regular_expression: false
                  name: alt
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '311'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '871'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - image type
                - html tag
                - alt
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - alt
                  - image type
                  - html id
                  - name
                  - file name
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 21 March 2023 10:33:32 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
