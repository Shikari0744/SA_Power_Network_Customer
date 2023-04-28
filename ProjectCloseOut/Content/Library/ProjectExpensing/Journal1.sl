namespace: ProjectExpensing
operation:
  name: Journal1
  inputs:
  - hoursJournal: 1. Hours Journal.xlsm
  - hoursJournalNumber: '04'
  - filePath: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\Project Close Out\
  - supportFile: Project Expensing Support File.xlsm
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.Journal1:1.0.2
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
        object_path: '''STEP 4: UPDATE JOURNAL1'
    - step:
        id: '2'
        action: Script
        object_path: '''CREATE EXCEL OBJECT'
    - step:
        id: '3'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '4'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '5'
        action: Script
        object_path: '''OPEN HOURS JOURNAL FILE'
    - step:
        id: '6'
        action: Script
        object_path: Set objHoursJournal = objExcel.Workbooks.open(Parameter("filePath")&Parameter("hoursJournal"))
    - step:
        id: '7'
        action: Script
        object_path: '''OPEN JOURNAL1 TAB'
    - step:
        id: '8'
        action: Script
        object_path: Set objJournal1 = objHoursJournal.Worksheets("Journals")
    - step:
        id: '9'
        action: Script
        object_path: '''CLEAR JOURNAL'
    - step:
        id: '10'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '11'
        object_path: Window("Excel").WinObject("Ribbon").WinTab("Ribbon Tabs")
        action: Select
        args: '"Home"'
    - step:
        id: '12'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '13'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '14'
        object_path: mySendKeys
        action: SendKeys
        args: '"^+{N}"'
    - step:
        id: '15'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '16'
        object_path: Window("Excel").Dialog("Microsoft Excel").WinButton("Yes")
        action: Click
    - step:
        id: '17'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '18'
        action: Script
        object_path: '''OPEN PROJECT EXPENSING SUPPORT FILE'
    - step:
        id: '19'
        action: Script
        object_path: Set objSupportFile = objExcel.Workbooks.open(Parameter("filePath")&Parameter("supportFile"))
    - step:
        id: '20'
        action: Script
        object_path: '''OPEN COMPUTATION TAB'
    - step:
        id: '21'
        action: Script
        object_path: Set objComputation = objSupportFile.Worksheets("Computation Tab")
    - step:
        id: '22'
        action: Script
        object_path: '''FIND BOTTOM OF THE JOURNAL1 TAB'
    - step:
        id: '23'
        action: Script
        object_path: endOfJournal = objJournal1.Range("A1048576").End(-4162).Row +
          1
    - step:
        id: '24'
        action: Script
        object_path: '''FIND BOTTOM OF THE COMPUTATION TAB'
    - step:
        id: '25'
        action: Script
        object_path: compRow = objComputation.Range("A1048576").End(-4162).Row
    - step:
        id: '26'
        action: Script
        object_path: '''UPDATE DATE ON JOURNAL TAB'
    - step:
        id: '27'
        object_path: objJournal1.cells(3,9)
        action: value
        args: = Date
    - step:
        id: '28'
        action: Script
        object_path: '''GET MONTH NUMBER FOR JOURNAL DESCRIPTION'
    - step:
        id: '29'
        action: Script
        object_path: monthNumber = month(Date)
    - step:
        id: '30'
        action: Script
        object_path: If len(monthNumber) = 1 Then
    - step:
        id: '31'
        action: Script
        object_path: monthNumber = "0" & monthNumber
    - step:
        id: '32'
        action: Script
        object_path: End If
    - step:
        id: '33'
        action: Script
        object_path: '''UPDATE JOURNAL INFORMATION'
    - step:
        id: '34'
        object_path: objJournal1.cells(3,9)
        action: value
        args: = Date
    - step:
        id: '35'
        object_path: objJournal1.cells(4,9)
        action: value
        args: = Date
    - step:
        id: '36'
        action: Script
        object_path: desc = "N-"&monthNumber&"-"&Parameter("hoursJournalNumber")&"-A
          Project Expense DL"
    - step:
        id: '37'
        object_path: objJournal1.cells(6,2)
        action: value
        args: = desc
    - step:
        id: '38'
        action: Script
        object_path: Parameter("desc") = desc
    - step:
        id: '39'
        action: Script
        object_path: o = 11
    - step:
        id: '40'
        object_path: objHoursJournal
        action: save
    - step:
        id: '41'
        action: Script
        object_path: '''DO RECEIVER ORDER FIRST'
    - step:
        id: '42'
        action: Script
        object_path: For i = 2 To compRow
    - step:
        id: '43'
        action: Script
        object_path: '''GRAB DATA FROM COMPUTATION TAB'
    - step:
        id: '44'
        action: Script
        object_path: 'costCentre = objComputation.cells(i,8).value '
        comment: new cost centre
    - step:
        id: '45'
        action: Script
        object_path: 'receiverOrder = objComputation.cells(i,4).value '
        comment: new order 700 order
    - step:
        id: '46'
        action: Script
        object_path: 'activityType = objComputation.cells(i,5).value '
        comment: par activity
    - step:
        id: '47'
        action: Script
        object_path: 'hoursValue = objComputation.cells(i,11).value '
        comment: rounded hours value
    - step:
        id: '48'
        action: Script
        object_path: If hoursValue = "" Then
    - step:
        id: '49'
        action: Script
        object_path: hoursValue = 0
    - step:
        id: '50'
        action: Script
        object_path: End If
    - step:
        id: '51'
        action: Script
        object_path: 'quantityPositive = objComputation.cells(i,12).value '
        comment: 700 order quantity
    - step:
        id: '52'
        action: Script
        object_path: '''DO RECEIVER ORDER FIRST,ADD DATA TO JOURNAL1 TAB,IF HOURSVALUE
          IS NOT NULL'
    - step:
        id: '53'
        action: Script
        object_path: If quantityPositive <> 0 Then
    - step:
        id: '54'
        object_path: objJournal1.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '55'
        object_path: objJournal1.cells(o,4)
        action: value
        args: = activityType
    - step:
        id: '56'
        object_path: objJournal1.cells(o,5)
        action: value
        args: = receiverOrder
    - step:
        id: '57'
        object_path: objJournal1.cells(o,6)
        action: value
        args: = quantityPositive
    - step:
        id: '58'
        object_path: objJournal1.cells(o,7)
        action: value
        args: = "H"
    - step:
        id: '59'
        object_path: objJournal1.cells(o,8)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("hoursJournalNumber")&"-A Project Expense
          DL"
    - step:
        id: '60'
        action: Script
        object_path: o = o + 1
    - step:
        id: '61'
        action: Script
        object_path: End If
    - step:
        id: '62'
        action: Script
        object_path: Next
    - step:
        id: '63'
        action: Script
        object_path: '''FIND BOTTOM OF THE JOURNAL1 TAB'
    - step:
        id: '64'
        action: Script
        object_path: endOfJournal = objJournal1.Range("A1048576").End(-4162).Row +
          1
    - step:
        id: '65'
        action: Script
        object_path: o = endOfJournal
    - step:
        id: '66'
        action: Script
        object_path: '''DO RECEIVER NETWORK NEXT'
    - step:
        id: '67'
        action: Script
        object_path: For i = 2 To compRow
    - step:
        id: '68'
        action: Script
        object_path: '''GRAB DATA FROM COMPUTATION TAB'
    - step:
        id: '69'
        action: Script
        object_path: 'costCentre = objComputation.cells(i,8).value '
        comment: new cost centre
    - step:
        id: '70'
        action: Script
        object_path: 'receiverNetwork = objComputation.cells(i,2).value '
        comment: order 8000 order
    - step:
        id: '71'
        action: Script
        object_path: 'receiverOperation = objComputation.cells(i,3).value '
        comment: network activity
    - step:
        id: '72'
        action: Script
        object_path: 'activityType = objComputation.cells(i,5).value '
        comment: par activity
    - step:
        id: '73'
        action: Script
        object_path: 'hoursValue = objComputation.cells(i,11).value '
        comment: rounded hours value
    - step:
        id: '74'
        action: Script
        object_path: If hoursValue = "" Then
    - step:
        id: '75'
        action: Script
        object_path: hoursValue = 0
    - step:
        id: '76'
        action: Script
        object_path: End If
    - step:
        id: '77'
        action: Script
        object_path: 'quantityNegative = objComputation.cells(i,13).value '
        comment: 8000 order quantity
    - step:
        id: '78'
        action: Script
        object_path: '''DO RECEIVER NETWORK NEXT,ADD DATA TO JOURNAL1 TAB,IF HOURSVALUE
          IS NOT NULL'
    - step:
        id: '79'
        action: Script
        object_path: If quantityNegative <> 0 Then
    - step:
        id: '80'
        action: Script
        object_path: If Instr(receiverNetwork,"8") = 1 Then
    - step:
        id: '81'
        object_path: objJournal1.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '82'
        object_path: objJournal1.cells(o,2)
        action: value
        args: = receiverNetwork
    - step:
        id: '83'
        object_path: objJournal1.cells(o,3)
        action: value
        args: = receiverOperation
    - step:
        id: '84'
        object_path: objJournal1.cells(o,4)
        action: value
        args: = activityType
    - step:
        id: '85'
        object_path: objJournal1.cells(o,6)
        action: value
        args: = quantityNegative
    - step:
        id: '86'
        object_path: objJournal1.cells(o,7)
        action: value
        args: = "H"
    - step:
        id: '87'
        object_path: objJournal1.cells(o,8)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("hoursJournalNumber")&"-A Project Expense
          DL"
    - step:
        id: '88'
        action: Script
        object_path: o = o + 1
    - step:
        id: '89'
        action: Script
        object_path: End If
    - step:
        id: '90'
        action: Script
        object_path: End If
    - step:
        id: '91'
        action: Script
        object_path: Next
    - step:
        id: '92'
        action: Script
        object_path: '''FIND BOTTOM OF THE JOURNAL1 TAB'
    - step:
        id: '93'
        action: Script
        object_path: endOfJournal = objJournal1.Range("A1048576").End(-4162).Row +
          1
    - step:
        id: '94'
        action: Script
        object_path: o = endOfJournal
    - step:
        id: '95'
        action: Script
        object_path: '''DO RECEIVER NETWORK NEXT'
    - step:
        id: '96'
        action: Script
        object_path: For i = 2 To compRow
    - step:
        id: '97'
        action: Script
        object_path: '''GRAB DATA FROM COMPUTATION TAB'
    - step:
        id: '98'
        action: Script
        object_path: 'costCentre = objComputation.cells(i,8).value '
        comment: new cost centre
    - step:
        id: '99'
        action: Script
        object_path: 'receiverNetwork = objComputation.cells(i,2).value '
        comment: order 3000 or 9000 order
    - step:
        id: '100'
        action: Script
        object_path: 'receiverOperation = objComputation.cells(i,3).value '
        comment: network activity
    - step:
        id: '101'
        action: Script
        object_path: 'activityType = objComputation.cells(i,5).value '
        comment: par activity
    - step:
        id: '102'
        action: Script
        object_path: 'hoursValue = objComputation.cells(i,11).value '
        comment: rounded hours value
    - step:
        id: '103'
        action: Script
        object_path: If hoursValue = "" Then
    - step:
        id: '104'
        action: Script
        object_path: hoursValue = 0
    - step:
        id: '105'
        action: Script
        object_path: End If
    - step:
        id: '106'
        action: Script
        object_path: 'quantityNegative = objComputation.cells(i,13).value '
        comment: 3000 or 9000 order quantity
    - step:
        id: '107'
        action: Script
        object_path: '''DO RECEIVER NETWORK NEXT,ADD DATA TO JOURNAL1 TAB,IF HOURSVALUE
          IS NOT NULL'
    - step:
        id: '108'
        action: Script
        object_path: If quantityNegative <> 0 Then
    - step:
        id: '109'
        action: Script
        object_path: If Instr(receiverNetwork,"3") = 1 or Instr(receiverNetwork,"9")
          = 1 Then
    - step:
        id: '110'
        object_path: objJournal1.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '111'
        object_path: objJournal1.cells(o,5)
        action: value
        args: = receiverNetwork
    - step:
        id: '112'
        object_path: objJournal1.cells(o,3)
        action: value
        args: = receiverOperation
    - step:
        id: '113'
        object_path: objJournal1.cells(o,4)
        action: value
        args: = activityType
    - step:
        id: '114'
        object_path: objJournal1.cells(o,6)
        action: value
        args: = quantityNegative
    - step:
        id: '115'
        object_path: objJournal1.cells(o,7)
        action: value
        args: = "H"
    - step:
        id: '116'
        object_path: objJournal1.cells(o,8)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("hoursJournalNumber")&"-A Project Expense
          DL"
    - step:
        id: '117'
        action: Script
        object_path: o = o + 1
    - step:
        id: '118'
        action: Script
        object_path: End If
    - step:
        id: '119'
        action: Script
        object_path: End If
    - step:
        id: '120'
        action: Script
        object_path: Next
    - step:
        id: '121'
        action: Script
        object_path: '''SAVE AND CLOSE SUPPORT FILE'
    - step:
        id: '122'
        object_path: objSupportFile
        action: save
    - step:
        id: '123'
        object_path: objSupportFile
        action: close
    - step:
        id: '124'
        action: Script
        object_path: '''SAVE AND CLOSE JOURNAL'
    - step:
        id: '125'
        object_path: objHoursJournal
        action: save
    - step:
        id: '126'
        object_path: objHoursJournal
        action: close
    - step:
        id: '127'
        object_path: objExcel
        action: Quit
    - step:
        id: '128'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '129'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '130'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '131'
        action: Script
        object_path: Set objComputation = Nothing
    - step:
        id: '132'
        action: Script
        object_path: Set objHoursJournal = Nothing
    - step:
        id: '133'
        action: Script
        object_path: Set objJournal1 = Nothing
  outputs:
  - desc:
      robot: true
      value: ${desc}
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
      name: Excel
      properties:
      - property:
          value:
            value: Excel
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: XLMAIN
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
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: XLMAIN
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Thursday, 12 January 2023 9:02:26 AM
      child_objects:
      - object:
          class: WinObject
          name: Ribbon
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Ribbon
                regular_expression: false
              name: acc_name
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects:
          - object:
              class: WinTab
              name: Ribbon Tabs
              properties:
              - property:
                  value:
                    value: page tab list
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Ribbon Tabs
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: page tab list
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
      - object:
          class: Window
          name: Print Requirements
          properties:
          - property:
              value:
                value: Print Requirements
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: ThunderDFrame
                regular_expression: false
              name: regexpwndclass
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
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: ThunderDFrame
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
      - object:
          class: Dialog
          name: SAP Logon at ERP - PRD
          properties:
          - property:
              value:
                value: SAP Logon at ERP - PRD - Production
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects:
          - object:
              class: WinEdit
              name: User
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
                    value: '&User'
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
          - object:
              class: WinEdit
              name: Password
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
                    value: '&Password'
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
          - object:
              class: WinEdit
              name: Language
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
                    value: '&Language'
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
          - object:
              class: WinEdit
              name: Client
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
                    value: '&Client'
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
          - object:
              class: WinButton
              name: OK
              properties:
              - property:
                  value:
                    value: '&OK'
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
      - object:
          class: Dialog
          name: SAP Logon
          properties:
          - property:
              value:
                value: SAP Logon
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects:
          - object:
              class: WinList
              name: ListBox
              properties:
              - property:
                  value:
                    value: ListBox
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
                  value: ListBox
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
          - object:
              class: WinButton
              name: OK
              properties:
              - property:
                  value:
                    value: '&OK'
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
      - object:
          class: Dialog
          name: Microsoft Visual Basic
          properties:
          - property:
              value:
                value: Microsoft Visual Basic
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects:
          - object:
              class: WinButton
              name: End
              properties:
              - property:
                  value:
                    value: '&End'
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
          - object:
              class: Static
              name: RunTime Error
              properties:
              - property:
                  value:
                    value: '4803'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: Static
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Static
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
      - object:
          class: Dialog
          name: Microsoft Excel
          properties:
          - property:
              value:
                value: Microsoft Excel
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects:
          - object:
              class: WinButton
              name: 'Yes'
              properties:
              - property:
                  value:
                    value: '&Yes'
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
          - object:
              class: WinButton
              name: OK
              properties:
              - property:
                  value:
                    value: OK
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
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
          - object:
              class: Static
              name: Error - There are incorrect
              properties:
              - property:
                  value:
                    value: '65535'
                    regular_expression: false
                  name: window id
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: Static
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - window id
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Static
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 12 January 2023 9:02:26 AM
              child_objects: []
  - object:
      class: Dialog
      name: SAP Logon at ERP - QAS
      properties:
      - property:
          value:
            value: SAP Logon at ERP - QAS - Quality Assurance
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
      last_update_time: Thursday, 12 January 2023 9:02:26 AM
      child_objects:
      - object:
          class: WinEdit
          name: User
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
                value: '&User'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
      - object:
          class: WinEdit
          name: Password
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
                value: '&Password'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
      - object:
          class: WinEdit
          name: Client
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
                value: '&Client'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
      - object:
          class: WinButton
          name: OK
          properties:
          - property:
              value:
                value: '&OK'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
  - object:
      class: Dialog
      name: SAP Logon at ERP - PRD
      properties:
      - property:
          value:
            value: SAP Logon at ERP - PRD - Production
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
      last_update_time: Thursday, 12 January 2023 9:02:26 AM
      child_objects:
      - object:
          class: WinEdit
          name: User
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
                value: '&User'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
      - object:
          class: WinEdit
          name: Password
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
                value: '&Password'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
      - object:
          class: WinEdit
          name: Client
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
                value: '&Client'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
      - object:
          class: WinButton
          name: OK
          properties:
          - property:
              value:
                value: '&OK'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
  - object:
      class: Dialog
      name: SAP Logon
      properties:
      - property:
          value:
            value: SAP Logon
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
      last_update_time: Thursday, 12 January 2023 9:02:26 AM
      child_objects:
      - object:
          class: WinList
          name: ListBox
          properties:
          - property:
              value:
                value: ListBox
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
              value: ListBox
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
      - object:
          class: WinButton
          name: OK
          properties:
          - property:
              value:
                value: '&OK'
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
          last_update_time: Thursday, 12 January 2023 9:02:26 AM
          child_objects: []
  check_points_and_outputs: []
  parameters: []
