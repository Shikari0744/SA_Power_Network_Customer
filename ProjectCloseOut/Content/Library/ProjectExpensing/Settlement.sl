namespace: ProjectExpensing
operation:
  name: Settlement
  inputs:
  - settlementRule: '2026'
  - filePath: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Project
      Close Out\
  - supportFile: Project Expensing Support File.xlsm
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.Settlement:1.0.0
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
        object_path: '''STEP 7: APPLY SETTLEMENT'
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
        object_path: '''OPEN PROJECT EXPENSING SUPPORT FILE'
    - step:
        id: '6'
        action: Script
        object_path: Set objSupportFile = objExcel.Workbooks.open(Parameter("filePath")&Parameter("supportFile"))
    - step:
        id: '7'
        action: Script
        object_path: '''OPEN OH PIVOT TAB'
    - step:
        id: '8'
        action: Script
        object_path: Set objOHPivot = objSupportFile.Worksheets("OH Pivot")
    - step:
        id: '9'
        action: Script
        object_path: '''OPEN PROJECTS TO BE EXPENSED TAB'
    - step:
        id: '10'
        action: Script
        object_path: Set objProjectsToBeExpenses = objSupportFile.Worksheets("Projects
          To Be Expensed")
    - step:
        id: '11'
        action: Script
        object_path: '''FIND BOTTOM OF THE OH PIVOT TAB'
    - step:
        id: '12'
        action: Script
        object_path: ohPivotRow = objOHPivot.Range("A1048576").End(-4162).Row - 1
    - step:
        id: '13'
        action: Script
        object_path: '''LOOP THROUGH PIVOT TABLE DATA AND ENTER INTO SAP'
    - step:
        id: '14'
        action: Script
        object_path: '''For i = 2 To ohPivotRow'
    - step:
        id: '15'
        action: Script
        object_path: "'\t'GET TO POSTING TABLE"
    - step:
        id: '16'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"SAP Easy Access\
          \  -  User\").SAPGuiOKCode(\"OKCode\").Set \"/nKB15n\""
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '21'
    - step:
        id: '17'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"SAP Easy Access\
          \  -  User\").SendKey ENTER"
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '28'
    - step:
        id: '18'
        action: Script
        object_path: "'\tIf SAPGuiSession(\"Session\").SAPGuiWindow(\"Set Controlling\
          \ Area\").SAPGuiEdit(\"Controlling Area\").Exist(3) Then"
    - step:
        id: '19'
        action: Script
        object_path: "'\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Set Controlling\
          \ Area\").SAPGuiEdit(\"Controlling Area\").Set \"1000\""
    - step:
        id: '20'
        action: Script
        object_path: "'\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Set Controlling\
          \ Area\").SendKey ENTER"
    - step:
        id: '21'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '22'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SAPGuiComboBox(\"Input Type\").Select \"List Entry\""
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '28'
    - step:
        id: '23'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SAPGuiComboBox(\"Scrn var.\").Select \"Network to Order\
          \ Reposting\""
    - step:
        id: '24'
        action: Script
        object_path: "'\t'EXTRACT DATA FROM PIVOT"
    - step:
        id: '25'
        action: Script
        object_path: "'\tcostElement =  objOHPivot.cells(i,1).value"
    - step:
        id: '26'
        action: Script
        object_path: "'\torder = objOHPivot.cells(i,2).value"
    - step:
        id: '27'
        action: Script
        object_path: "'\tnewOrder = objOHPivot.cells(i,3).value"
    - step:
        id: '28'
        action: Script
        object_path: "'\tnetworkActivity = objOHPivot.cells(i,4).value"
    - step:
        id: '29'
        action: Script
        object_path: "'\tquantity = objOHPivot.cells(i,5).value"
    - step:
        id: '30'
        action: Script
        object_path: "'\t'ENTER DATA INTO SAP TABLE"
    - step:
        id: '31'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SAPGuiTable(\"Items\").SetCellData 1, \"Cost Elem.\", costElement"
    - step:
        id: '32'
        action: Script
        object_path: "'\tIf Instr(order,\"3\") = 1 Then"
    - step:
        id: '33'
        action: Script
        object_path: "'\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual\
          \ Cost Allocation\").SAPGuiTable(\"Items\").SetCellData 1, \"Sender order\"\
          , order"
    - step:
        id: '34'
        action: Script
        object_path: "'\tElse"
    - step:
        id: '35'
        action: Script
        object_path: "'\t\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual\
          \ Cost Allocation\").SAPGuiTable(\"Items\").SetCellData 1, \"SendNetwork\"\
          , order"
    - step:
        id: '36'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '37'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SAPGuiTable(\"Items\").SetCellData 1, \"Rec. order\", newOrder"
    - step:
        id: '38'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SAPGuiTable(\"Items\").SetCellData 1, \"SOp.\", networkActivity"
    - step:
        id: '39'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SAPGuiTable(\"Items\").SetCellData 1, \"Amount\", quantity"
    - step:
        id: '40'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SAPGuiButton(\"Post   (Ctrl+S)\").Click"
    - step:
        id: '41'
        action: Script
        object_path: "'\tsuccessBar = SAPGuiSession(\"Session\").SAPGuiWindow(\"Enter\
          \ Manual Cost Allocation\").SAPGuiStatusBar(\"StatusBar\").GetROProperty(\"\
          text\")"
    - step:
        id: '42'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SAPGuiOKCode(\"OKCode\").Set \"/n\""
    - step:
        id: '43'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Enter Manual Cost\
          \ Allocation\").SendKey ENTER"
    - step:
        id: '44'
        action: Script
        object_path: '''Next'
    - step:
        id: '45'
        action: Script
        object_path: '''GET ROW COUNT OF PROJECTS TO BE EXPENSED'
    - step:
        id: '46'
        action: Script
        object_path: numberOfProj = objProjectsToBeExpenses.usedrange.Rows.Count
    - step:
        id: '47'
        action: Script
        object_path: '''LOOP THROUGH PROJECTS TO BE EXPENSED AND APPLY SETTLEMENT'
    - step:
        id: '48'
        action: Script
        object_path: For i = 2 To numberOfProj
    - step:
        id: '49'
        action: Script
        object_path: projNum = objProjectsToBeExpenses.cells(i,1).value
    - step:
        id: '50'
        action: Script
        object_path: cn43nCheck = objProjectsToBeExpenses.cells(i,4).value
    - step:
        id: '51'
        action: Script
        object_path: settlementCheck = objProjectsToBeExpenses.cells(i,8).value
    - step:
        id: '52'
        action: Script
        object_path: If projNum <> "" and cn43nCheck = "YES" Then
    - step:
        id: '53'
        action: Script
        object_path: If settlementCheck = "" Then
    - step:
        id: '54'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nCJ02"'
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '21'
    - step:
        id: '55'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '0'
    - step:
        id: '56'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: Initial").SAPGuiEdit("Project
          def.")'
        action: Set
        args: projNum
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '27'
    - step:
        id: '57'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: Initial")'
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '0'
    - step:
        id: '58'
        action: Script
        object_path: 'settlementRow = SAPGuiSession("Session").SAPGuiWindow("Change
          Project: WBS Element").SAPGuiTable("SAPLCJWBTAB_902").RowCount'
    - step:
        id: '59'
        action: Script
        object_path: For s = 1 To settlementRow
    - step:
        id: '60'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Change Project: WBS
          Element").SAPGuiTable("SAPLCJWBTAB_902").ValidRow(s) Then'
    - step:
        id: '61'
        action: Script
        object_path: 'systemStatus = SAPGuiSession("Session").SAPGuiWindow("Change
          Project: WBS Element").SAPGuiTable("SAPLCJWBTAB_902").GetCellData(s, "System
          status")'
    - step:
        id: '62'
        action: Script
        object_path: If InStr(systemStatus,"CLSD") Then
    - step:
        id: '63'
        object_path: objProjectsToBeExpenses.cells(i,8)
        action: value
        args: = "Project Closed"
    - step:
        id: '64'
        action: Script
        object_path: Exit For
    - step:
        id: '65'
        action: Script
        object_path: ElseIf InStr(systemStatus,"SETC") Then
    - step:
        id: '66'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: WBS Element").SAPGuiTable("SAPLCJWBTAB_902")'
        action: SelectRow(s)
    - step:
        id: '67'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: WBS Element").SAPGuiButton("Settlement
          Rule")'
        action: Click
    - step:
        id: '68'
        action: Script
        object_path: settlementRuleRow = SAPGuiSession("Session").SAPGuiWindow("Maintain
          Settlement Rule:").SAPGuiTable("Distribution rules").RowCount
    - step:
        id: '69'
        action: Script
        object_path: For q = 1 To settlementRuleRow
    - step:
        id: '70'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Maintain Settlement
          Rule:").SAPGuiTable("Distribution rules").ValidRow(q) Then
    - step:
        id: '71'
        action: Script
        object_path: settle = SAPGuiSession("Session").SAPGuiWindow("Maintain Settlement
          Rule:").SAPGuiTable("Distribution rules").GetCellData(q,"Settlement Receiver")
    - step:
        id: '72'
        action: Script
        object_path: If InStr(settle,"1403268") Then
    - step:
        id: '73'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Maintain Settlement Rule:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '74'
        action: Script
        object_path: Exit For
    - step:
        id: '75'
        action: Script
        object_path: ElseIf settle = "" Then
    - step:
        id: '76'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Maintain Settlement Rule:").SAPGuiTable("Distribution
          rules")
        action: SetCellData
        args: q,"Settlement Receiver","1403268-" & Parameter("settlementRule")
    - step:
        id: '77'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Maintain Settlement Rule:")
        action: SendKey
        args: ENTER
    - step:
        id: '78'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Maintain Settlement Rule:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '79'
        action: Script
        object_path: Exit For
    - step:
        id: '80'
        action: Script
        object_path: End If
    - step:
        id: '81'
        action: Script
        object_path: End If
    - step:
        id: '82'
        action: Script
        object_path: Next
    - step:
        id: '83'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Settlement rule: Display").Exist(3)
          Then'
    - step:
        id: '84'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Settlement rule: Display").SAPGuiButton("Continue   (Enter)")'
        action: Click
    - step:
        id: '85'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Maintain Settlement
          Rule:").SAPGuiButton("Cancel   (F12)").Exist(3) Then
    - step:
        id: '86'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Maintain Settlement Rule:").SAPGuiButton("Cancel   (F12)")
        action: Click
    - step:
        id: '87'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cancel").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '88'
        action: Script
        object_path: End If
    - step:
        id: '89'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: WBS Element").SAPGuiTable("SAPLCJWBTAB_902")'
        action: DeselectRow(s)
    - step:
        id: '90'
        action: Script
        object_path: Else
    - step:
        id: '91'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: WBS Element").SAPGuiTable("SAPLCJWBTAB_902")'
        action: DeselectRow(s)
    - step:
        id: '92'
        action: Script
        object_path: End If
    - step:
        id: '93'
        action: Script
        object_path: End If
    - step:
        id: '94'
        action: Script
        object_path: Else
    - step:
        id: '95'
        action: Script
        object_path: Exit For
    - step:
        id: '96'
        action: Script
        object_path: End If
    - step:
        id: '97'
        action: Script
        object_path: Next
    - step:
        id: '98'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: WBS Element").SAPGuiButton("Save   (Ctrl+S)")'
        action: Click
    - step:
        id: '99'
        action: Script
        object_path: If objProjectsToBeExpenses.cells(i,8).value = "Project Closed"
          Then
    - step:
        id: '100'
        object_path: objProjectsToBeExpenses.cells(i,8)
        action: value
        args: = "Project Closed"
    - step:
        id: '101'
        action: Script
        object_path: ElseIf SAPGuiSession("Session").SAPGuiWindow("Information").Exist(3)
          = false Then
    - step:
        id: '102'
        object_path: objProjectsToBeExpenses.cells(i,8)
        action: value
        args: = "YES"
    - step:
        id: '103'
        action: Script
        object_path: Else
    - step:
        id: '104'
        object_path: objProjectsToBeExpenses.cells(i,8)
        action: value
        args: = "NO"
    - step:
        id: '105'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '106'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: WBS Element").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '107'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cancel").SAPGuiButton("No")
        action: Click
    - step:
        id: '108'
        action: Script
        object_path: End If
    - step:
        id: '109'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '110'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: Initial").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n"'
    - step:
        id: '111'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Change Project: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '112'
        action: Script
        object_path: Else
    - step:
        id: '113'
        action: Script
        object_path: Exit For
    - step:
        id: '114'
        action: Script
        object_path: End If
    - step:
        id: '115'
        action: Script
        object_path: End If
    - step:
        id: '116'
        action: Script
        object_path: Next
    - step:
        id: '117'
        action: Script
        object_path: '''SAVE AND CLOSE SUPPORT FILE'
    - step:
        id: '118'
        object_path: objSupportFile
        action: save
    - step:
        id: '119'
        object_path: objSupportFile
        action: close
    - step:
        id: '120'
        object_path: objExcel
        action: Quit
    - step:
        id: '121'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '122'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '123'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '124'
        action: Script
        object_path: Set objOHPivot = Nothing
    - step:
        id: '125'
        action: Script
        object_path: Set objProjectsToBeExpenses = Nothing
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
      name: Window
      properties:
      - property:
          value:
            value: TaskListThumbnailWnd
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
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: TaskListThumbnailWnd
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Friday, 17 February 2023 12:55:04 PM
      child_objects: []
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
      last_update_time: Friday, 17 February 2023 12:55:04 PM
      child_objects:
      - object:
          class: WinObject
          name: Project Expensing Support
          properties:
          - property:
              value:
                value: EXCEL7
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: EXCEL7
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects: []
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
      last_update_time: Friday, 17 February 2023 12:55:04 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: 'Settlement rule: Display'
          properties:
          - property:
              value:
                value: CJ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '120'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSSY0
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[0]
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Set Controlling Area
          properties:
          - property:
              value:
                value: KB15N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '300'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSPO4
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Controlling Area
              properties:
              - property:
                  value:
                    value: SVALD-VALUE
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
                    value: '32'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/sub:SAPLSPO4:0300/ctxtSVALD-VALUE[0,21]
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiOKCode
              name: OKCode
              properties:
              - property:
                  value:
                    value: SAPGuiOKCode
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '35'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/tbar[0]/okcd
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Maintain Settlement Rule:'
          properties:
          - property:
              value:
                value: CJ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '130'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLKOBS
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: Distribution rules
              properties:
              - property:
                  value:
                    value: SAPLKOBSTC_RULES
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTable
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '80'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/tblSAPLKOBSTC_RULES
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Cancel   (F12)
              properties:
              - property:
                  value:
                    value: btn[12]
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[12]
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[3]
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information
          properties:
          - property:
              value:
                value: CJ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '10'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSDYP
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
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
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[0]
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter Manual Cost Allocation
          properties:
          - property:
              value:
                value: KB15N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '1200'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLK23F1
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: Items
              properties:
              - property:
                  value:
                    value: SAPLSTC1GENERIC_TABLE_1
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTable
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '80'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/subSUBLIST:SAPLK23F1:3000/subTABLECONTROL:SAPLSTC1:0100/tblSAPLSTC1GENERIC_TABLE_1
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
              properties:
              - property:
                  value:
                    value: SAPGuiStatusBar
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '103'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/sbar
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiOKCode
              name: OKCode
              properties:
              - property:
                  value:
                    value: SAPGuiOKCode
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '35'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/tbar[0]/okcd
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiComboBox
              name: Scrn var.
              properties:
              - property:
                  value:
                    value: COHEADER-SEND_REC_REL
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiComboBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '34'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/cmbCOHEADER-SEND_REC_REL
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiComboBox
              name: Input Type
              properties:
              - property:
                  value:
                    value: RK23F-STATUS
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiComboBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '34'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/cmbRK23F-STATUS
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Post   (Ctrl+S)
              properties:
              - property:
                  value:
                    value: btn[11]
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[11]
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Cost element group:'
          properties:
          - property:
              value:
                value: KAH3
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '120'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSSY0
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Change Project: WBS Element'
          properties:
          - property:
              value:
                value: CJ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '901'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCJWB
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: SAPLCJWBTAB_902
              properties:
              - property:
                  value:
                    value: SAPLCJWBTAB_902
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTable
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '80'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/tabsTABCJLE/tabpLEGR/ssubLISTE:SAPLCJWB:0902/tblSAPLCJWBTAB_902
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiOKCode
              name: OKCode
              properties:
              - property:
                  value:
                    value: SAPGuiOKCode
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '35'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/tbar[0]/okcd
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Settlement Rule
              properties:
              - property:
                  value:
                    value: BUTTON_ABRV
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
              - property:
                  value:
                    value: wnd[0]/usr/tabsTABCJLE/tabpLEGR/ssubLISTE:SAPLCJWB:0902/subBUTTONS:SAPLCJWB:3993/btnBUTTON_ABRV
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save   (Ctrl+S)
              properties:
              - property:
                  value:
                    value: btn[11]
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[11]
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back
              properties:
              - property:
                  value:
                    value: btn[3]
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
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[3]
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Change Project: Initial'
          properties:
          - property:
              value:
                value: CJ02
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
                value: SAPLCJWB
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiOKCode
              name: OKCode
              properties:
              - property:
                  value:
                    value: SAPGuiOKCode
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '35'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/tbar[0]/okcd
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Project def.
              properties:
              - property:
                  value:
                    value: '*PROJ-PSPID'
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
                    value: '32'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/ctxt*PROJ-PSPID
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Cancel
          properties:
          - property:
              value:
                value: CJ02
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
                value: SAPLSPO1
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
          last_update_time: Friday, 17 February 2023 12:55:04 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: 'Yes'
              properties:
              - property:
                  value:
                    value: SPOP-OPTION1
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
              - property:
                  value:
                    value: wnd[1]/usr/btnSPOP-OPTION1
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: 'No'
              properties:
              - property:
                  value:
                    value: SPOP-OPTION2
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
              - property:
                  value:
                    value: wnd[1]/usr/btnSPOP-OPTION2
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
              last_update_time: Friday, 17 February 2023 12:55:04 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
