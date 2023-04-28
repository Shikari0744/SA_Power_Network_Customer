namespace: ProjectExpensing
operation:
  name: Journal2
  inputs:
  - costsJournal: 2. Costs Journal.xlsm
  - costsJournalNumber: '05'
  - filePath: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\Project Close Out\
  - supportFile: Project Expensing Support File.xlsm
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.Journal2:1.0.2
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
        object_path: '''STEP 5: UPDATE JOURNAL2'
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
        object_path: '''OPEN COSTS JOURNAL FILE'
    - step:
        id: '6'
        action: Script
        object_path: Set objCostJournal = objExcel.Workbooks.open(Parameter("filePath")&Parameter("costsJournal"))
    - step:
        id: '7'
        action: Script
        object_path: '''OPEN JOURNAL1 TAB'
    - step:
        id: '8'
        action: Script
        object_path: Set objJournal2 = objCostJournal.Worksheets("Journals")
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
        object_path: Window("Excel").Dialog("Microsoft Excel").WinButton("Yes")
        action: Click
    - step:
        id: '16'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '17'
        action: Script
        object_path: '''OPEN PROJECT EXPENSING SUPPORT FILE'
    - step:
        id: '18'
        action: Script
        object_path: Set objSupportFile = objExcel.Workbooks.open(Parameter("filePath")&Parameter("supportFile"))
    - step:
        id: '19'
        action: Script
        object_path: '''OPEN COMPUTATION TAB'
    - step:
        id: '20'
        action: Script
        object_path: Set objMatSerPivot = objSupportFile.Worksheets("Materials & Services
          Pivot")
    - step:
        id: '21'
        action: Script
        object_path: '''FIND BOTTOM OF THE JOURNAL2 TAB'
    - step:
        id: '22'
        action: Script
        object_path: endOfJournal = objJournal2.Range("A1048576").End(-4162).Row +
          1
    - step:
        id: '23'
        action: Script
        object_path: '''FIND BOTTOM OF THE COMPUTATION TAB'
    - step:
        id: '24'
        action: Script
        object_path: pivotRow = objMatSerPivot.Range("A1048576").End(-4162).Row -
          1
    - step:
        id: '25'
        action: Script
        object_path: '''GET MONTH NUMBER FOR JOURNAL DESCRIPTION'
    - step:
        id: '26'
        action: Script
        object_path: monthNumber = month(Date)
    - step:
        id: '27'
        action: Script
        object_path: If len(monthNumber) = 1 Then
    - step:
        id: '28'
        action: Script
        object_path: monthNumber = "0" & monthNumber
    - step:
        id: '29'
        action: Script
        object_path: End If
    - step:
        id: '30'
        action: Script
        object_path: '''UPDATE JOURNAL INFORMATION'
    - step:
        id: '31'
        object_path: objJournal2.cells(3,15)
        action: value
        args: = Date
    - step:
        id: '32'
        object_path: objJournal2.cells(4,15)
        action: value
        args: = Date
    - step:
        id: '33'
        object_path: objJournal2.cells(5,15)
        action: value
        args: = "RPA Bot"
    - step:
        id: '34'
        object_path: objJournal2.cells(6,15)
        action: value
        args: = "SA"
    - step:
        id: '35'
        action: Script
        object_path: desc = "N-"&monthNumber&"-"&Parameter("costsJournalNumber")&"-A
          Project Expense Other Costs"
    - step:
        id: '36'
        object_path: objJournal2.cells(6,2)
        action: value
        args: = desc
    - step:
        id: '37'
        action: Script
        object_path: Parameter("desc") = desc
    - step:
        id: '38'
        action: Script
        object_path: o = 11
    - step:
        id: '39'
        object_path: objCostJournal
        action: save
    - step:
        id: '40'
        action: Script
        object_path: '''DO RECEIVER ORDER FIRST'
    - step:
        id: '41'
        action: Script
        object_path: For i = 2 To pivotRow
    - step:
        id: '42'
        action: Script
        object_path: costCentre = objMatSerPivot.cells(i,1).value
    - step:
        id: '43'
        action: Script
        object_path: '''ONLY GRAB DATA IF NUMERIC AND NOT EMPTY'
    - step:
        id: '44'
        action: Script
        object_path: If IsNumeric(costCentre) and costCentre <> "" Then
    - step:
        id: '45'
        action: Script
        object_path: '''GRAB DATA FROM COMPUTATION TAB'
    - step:
        id: '46'
        action: Script
        object_path: 'costCentre = objMatSerPivot.cells(i,1).value '
        comment: cost centre
    - step:
        id: '47'
        action: Script
        object_path: 'receiverOrder = objMatSerPivot.cells(i,4).value '
        comment: new order 700 order
    - step:
        id: '48'
        action: Script
        object_path: 'quantity = objMatSerPivot.cells(i,5).value '
        comment: rounded sum of value tranCurr
    - step:
        id: '49'
        action: Script
        object_path: '''ADD DATA TO JOURNAL2 TAB'
    - step:
        id: '50'
        action: Script
        object_path: If quantity <> 0 Then
    - step:
        id: '51'
        action: Script
        object_path: If quantity < 0 Then
    - step:
        id: '52'
        action: Script
        object_path: quantity = quantity * -1
    - step:
        id: '53'
        object_path: objJournal2.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '54'
        object_path: objJournal2.cells(o,2)
        action: value
        args: = "=BASE(1,10,4)"
    - step:
        id: '55'
        object_path: objJournal2.cells(o,3)
        action: value
        args: = "P5"
    - step:
        id: '56'
        object_path: objJournal2.cells(o,4)
        action: value
        args: = "=BASE(2,10,4)"
    - step:
        id: '57'
        object_path: objJournal2.cells(o,7)
        action: value
        args: = receiverOrder
    - step:
        id: '58'
        object_path: objJournal2.cells(o,12)
        action: value
        args: = quantity
    - step:
        id: '59'
        object_path: objJournal2.cells(o,15)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("costsJournalNumber")&"-A Project Expense
          Other Costs"
    - step:
        id: '60'
        action: Script
        object_path: o = o + 1
    - step:
        id: '61'
        action: Script
        object_path: Else
    - step:
        id: '62'
        object_path: objJournal2.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '63'
        object_path: objJournal2.cells(o,2)
        action: value
        args: = "=BASE(1,10,4)"
    - step:
        id: '64'
        object_path: objJournal2.cells(o,3)
        action: value
        args: = "P5"
    - step:
        id: '65'
        object_path: objJournal2.cells(o,4)
        action: value
        args: = "=BASE(2,10,4)"
    - step:
        id: '66'
        object_path: objJournal2.cells(o,7)
        action: value
        args: = receiverOrder
    - step:
        id: '67'
        object_path: objJournal2.cells(o,11)
        action: value
        args: = quantity
    - step:
        id: '68'
        object_path: objJournal2.cells(o,15)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("costsJournalNumber")&"-A Project Expense
          Other Costs"
    - step:
        id: '69'
        action: Script
        object_path: o = o + 1
    - step:
        id: '70'
        action: Script
        object_path: End If
    - step:
        id: '71'
        action: Script
        object_path: End If
    - step:
        id: '72'
        action: Script
        object_path: End  If
    - step:
        id: '73'
        action: Script
        object_path: Next
    - step:
        id: '74'
        action: Script
        object_path: '''FIND BOTTOM OF THE JOURNAL2 TAB'
    - step:
        id: '75'
        action: Script
        object_path: endOfJournal = objJournal2.Range("A1048576").End(-4162).Row +
          1
    - step:
        id: '76'
        action: Script
        object_path: o = endOfJournal
    - step:
        id: '77'
        action: Script
        object_path: '''DO RECEIVER NETWORK NEXT'
    - step:
        id: '78'
        action: Script
        object_path: For i = 2 To pivotRow
    - step:
        id: '79'
        action: Script
        object_path: costCentre = objMatSerPivot.cells(i,1).value
    - step:
        id: '80'
        action: Script
        object_path: '''ONLY GRAB DATA IF NUMERIC AND NOT EMPTY'
    - step:
        id: '81'
        action: Script
        object_path: If IsNumeric(costCentre) and costCentre <> "" Then
    - step:
        id: '82'
        action: Script
        object_path: '''GRAB DATA FROM COMPUTATION TAB'
    - step:
        id: '83'
        action: Script
        object_path: 'costCentre = objMatSerPivot.cells(i,1).value '
        comment: cost centre
    - step:
        id: '84'
        action: Script
        object_path: 'receiverNetwork = objMatSerPivot.cells(i,2).value '
        comment: order 8000 order
    - step:
        id: '85'
        action: Script
        object_path: 'receiverOperation = objMatSerPivot.cells(i,3).value '
        comment: network activity
    - step:
        id: '86'
        action: Script
        object_path: 'receiverOrder = objMatSerPivot.cells(i,4).value '
        comment: new order 700 order
    - step:
        id: '87'
        action: Script
        object_path: 'quantity = objMatSerPivot.cells(i,5).value '
        comment: rounded sum of value tranCurr
    - step:
        id: '88'
        action: Script
        object_path: '''ADD DATA TO JOURNAL2 TAB'
    - step:
        id: '89'
        action: Script
        object_path: If instr(receiverNetwork,"8") = 1 Then
    - step:
        id: '90'
        action: Script
        object_path: If quantity <> 0 Then
    - step:
        id: '91'
        action: Script
        object_path: If quantity < 0 Then
    - step:
        id: '92'
        action: Script
        object_path: quantity = quantity * -1
    - step:
        id: '93'
        object_path: objJournal2.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '94'
        object_path: objJournal2.cells(o,2)
        action: value
        args: = "=BASE(1,10,4)"
    - step:
        id: '95'
        object_path: objJournal2.cells(o,3)
        action: value
        args: = "P5"
    - step:
        id: '96'
        object_path: objJournal2.cells(o,4)
        action: value
        args: = "=BASE(2,10,4)"
    - step:
        id: '97'
        object_path: objJournal2.cells(o,9)
        action: value
        args: = receiverNetwork
    - step:
        id: '98'
        object_path: objJournal2.cells(o,10)
        action: value
        args: = receiverOperation
    - step:
        id: '99'
        object_path: objJournal2.cells(o,11)
        action: value
        args: = quantity
    - step:
        id: '100'
        object_path: objJournal2.cells(o,15)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("costsJournalNumber")&"-A Project Expense
          Other Costs"
    - step:
        id: '101'
        action: Script
        object_path: o = o + 1
    - step:
        id: '102'
        action: Script
        object_path: Else
    - step:
        id: '103'
        object_path: objJournal2.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '104'
        object_path: objJournal2.cells(o,2)
        action: value
        args: = "=BASE(1,10,4)"
    - step:
        id: '105'
        object_path: objJournal2.cells(o,3)
        action: value
        args: = "P5"
    - step:
        id: '106'
        object_path: objJournal2.cells(o,4)
        action: value
        args: = "=BASE(2,10,4)"
    - step:
        id: '107'
        object_path: objJournal2.cells(o,9)
        action: value
        args: = receiverNetwork
    - step:
        id: '108'
        object_path: objJournal2.cells(o,10)
        action: value
        args: = receiverOperation
    - step:
        id: '109'
        object_path: objJournal2.cells(o,12)
        action: value
        args: = quantity
    - step:
        id: '110'
        object_path: objJournal2.cells(o,15)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("costsJournalNumber")&"-A Project Expense
          Other Costs"
    - step:
        id: '111'
        action: Script
        object_path: o = o + 1
    - step:
        id: '112'
        action: Script
        object_path: End If
    - step:
        id: '113'
        action: Script
        object_path: End If
    - step:
        id: '114'
        action: Script
        object_path: End If
    - step:
        id: '115'
        action: Script
        object_path: End  If
    - step:
        id: '116'
        action: Script
        object_path: Next
    - step:
        id: '117'
        action: Script
        object_path: '''FIND BOTTOM OF THE JOURNAL2 TAB'
    - step:
        id: '118'
        action: Script
        object_path: endOfJournal = objJournal2.Range("A1048576").End(-4162).Row +
          1
    - step:
        id: '119'
        action: Script
        object_path: o = endOfJournal
    - step:
        id: '120'
        action: Script
        object_path: '''DO RECEIVER NETWORK NEXT'
    - step:
        id: '121'
        action: Script
        object_path: For i = 2 To pivotRow
    - step:
        id: '122'
        action: Script
        object_path: costCentre = objMatSerPivot.cells(i,1).value
    - step:
        id: '123'
        action: Script
        object_path: '''ONLY GRAB DATA IF NUMERIC AND NOT EMPTY'
    - step:
        id: '124'
        action: Script
        object_path: If IsNumeric(costCentre) and costCentre <> "" Then
    - step:
        id: '125'
        action: Script
        object_path: '''GRAB DATA FROM COMPUTATION TAB'
    - step:
        id: '126'
        action: Script
        object_path: 'costCentre = objMatSerPivot.cells(i,1).value '
        comment: cost centre
    - step:
        id: '127'
        action: Script
        object_path: 'receiverNetwork = objMatSerPivot.cells(i,2).value '
        comment: order 3000 or 9000 order
    - step:
        id: '128'
        action: Script
        object_path: 'receiverOperation = objMatSerPivot.cells(i,3).value '
        comment: network activity
    - step:
        id: '129'
        action: Script
        object_path: 'receiverOrder = objMatSerPivot.cells(i,4).value '
        comment: new order 700 order
    - step:
        id: '130'
        action: Script
        object_path: 'quantity = objMatSerPivot.cells(i,5).value '
        comment: rounded sum of value tranCurr
    - step:
        id: '131'
        action: Script
        object_path: '''ADD DATA TO JOURNAL2 TAB'
    - step:
        id: '132'
        action: Script
        object_path: If Instr(receiverNetwork,"3") = 1 or Instr(receiverNetwork,"9")
          = 1 Then
    - step:
        id: '133'
        action: Script
        object_path: If quantity <> 0 Then
    - step:
        id: '134'
        action: Script
        object_path: If quantity < 0 Then
    - step:
        id: '135'
        action: Script
        object_path: quantity = quantity * -1
    - step:
        id: '136'
        object_path: objJournal2.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '137'
        object_path: objJournal2.cells(o,2)
        action: value
        args: = "=BASE(1,10,4)"
    - step:
        id: '138'
        object_path: objJournal2.cells(o,3)
        action: value
        args: = "P5"
    - step:
        id: '139'
        object_path: objJournal2.cells(o,4)
        action: value
        args: = "=BASE(2,10,4)"
    - step:
        id: '140'
        object_path: objJournal2.cells(o,6)
        action: value
        args: = receiverNetwork
    - step:
        id: '141'
        object_path: objJournal2.cells(o,11)
        action: value
        args: = quantity
    - step:
        id: '142'
        object_path: objJournal2.cells(o,15)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("costsJournalNumber")&"-A Project Expense
          Other Costs"
    - step:
        id: '143'
        action: Script
        object_path: o = o + 1
    - step:
        id: '144'
        action: Script
        object_path: Else
    - step:
        id: '145'
        object_path: objJournal2.cells(o,1)
        action: value
        args: = costCentre
    - step:
        id: '146'
        object_path: objJournal2.cells(o,2)
        action: value
        args: = "=BASE(1,10,4)"
    - step:
        id: '147'
        object_path: objJournal2.cells(o,3)
        action: value
        args: = "P5"
    - step:
        id: '148'
        object_path: objJournal2.cells(o,4)
        action: value
        args: = "=BASE(2,10,4)"
    - step:
        id: '149'
        object_path: objJournal2.cells(o,6)
        action: value
        args: = receiverNetwork
    - step:
        id: '150'
        object_path: objJournal2.cells(o,12)
        action: value
        args: = quantity
    - step:
        id: '151'
        object_path: objJournal2.cells(o,15)
        action: value
        args: = "N-"&monthNumber&"-"&Parameter("costsJournalNumber")&"-A Project Expense
          Other Costs"
    - step:
        id: '152'
        action: Script
        object_path: o = o + 1
    - step:
        id: '153'
        action: Script
        object_path: End If
    - step:
        id: '154'
        action: Script
        object_path: End If
    - step:
        id: '155'
        action: Script
        object_path: End If
    - step:
        id: '156'
        action: Script
        object_path: End  If
    - step:
        id: '157'
        action: Script
        object_path: Next
    - step:
        id: '158'
        action: Script
        object_path: '''SAVE AND CLOSE SUPPORT FILE'
    - step:
        id: '159'
        object_path: objSupportFile
        action: save
    - step:
        id: '160'
        object_path: objSupportFile
        action: close
    - step:
        id: '161'
        object_path: objCostJournal
        action: save
    - step:
        id: '162'
        action: Script
        object_path: '''SAVE AND CLOSE JOURNAL'
    - step:
        id: '163'
        object_path: objCostJournal
        action: save
    - step:
        id: '164'
        object_path: objCostJournal
        action: close
    - step:
        id: '165'
        object_path: objExcel
        action: Quit
    - step:
        id: '166'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '167'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '168'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '169'
        action: Script
        object_path: Set objCostJournal = Nothing
    - step:
        id: '170'
        action: Script
        object_path: Set objMatSerPivot = Nothing
    - step:
        id: '171'
        action: Script
        object_path: Set objJournal2 = Nothing
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
      last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
              last_update_time: Monday, 12 December 2022 12:10:03 PM
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
      last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
      last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
      last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
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
          last_update_time: Monday, 12 December 2022 12:10:03 PM
          child_objects: []
  check_points_and_outputs: []
  parameters: []
