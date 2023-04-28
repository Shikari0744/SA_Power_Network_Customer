namespace: ProjectExpensing
operation:
  name: CN43nExport
  inputs:
  - filePath: C:/Users/svcrpabot/OneDrive - SA Power Networks/Project Close Out/
  - supportFile: Project Expensing Support File.xlsm
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.CN43nExport:1.0.0
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
        object_path: '''STEP 1: UPDATE CN43N TAB'
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
        object_path: '''OPEN PROJECTS TO BE EXPENSED TAB'
    - step:
        id: '8'
        action: Script
        object_path: Set objProjectsToBeExpenses = objSupportFile.Worksheets("Projects
          To Be Expensed")
    - step:
        id: '9'
        action: Script
        object_path: '''OPEN CN43N EXPORT TAB'
    - step:
        id: '10'
        action: Script
        object_path: Set objCN43nExport = objSupportFile.Worksheets("CN43n Export")
    - step:
        id: '11'
        action: Script
        object_path: '''GET ROW COUNT OF PROJECTS TO BE EXPENSED'
    - step:
        id: '12'
        action: Script
        object_path: numberOfProj = objProjectsToBeExpenses.usedrange.Rows.Count
    - step:
        id: '13'
        action: Script
        object_path: '''SET ROW NUMBER TO CN43N ADDITIONS'
    - step:
        id: '14'
        action: Script
        object_path: y = 2
    - step:
        id: '15'
        action: Script
        object_path: '''LOOP THROUGH PROJECTS TO BE EXPENSED'
    - step:
        id: '16'
        action: Script
        object_path: For i = 2 To numberOfProj
    - step:
        id: '17'
        action: Script
        object_path: projNum = objProjectsToBeExpenses.cells(i,1).value
    - step:
        id: '18'
        action: Script
        object_path: cn43nCheck = objProjectsToBeExpenses.cells(i,4).value
    - step:
        id: '19'
        action: Script
        object_path: '''IF ROW IS EMPTY EXIT LOOP'
    - step:
        id: '20'
        action: Script
        object_path: If projNum <> "" Then
    - step:
        id: '21'
        action: Script
        object_path: If cn43nCheck = "" Then
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nCN43n"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '21'
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '0'
    - step:
        id: '24'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.").Exist(3) Then
    - step:
        id: '25'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile").SAPGuiEdit("Database
          prof.")
        action: Set
        args: '"000000000001"'
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '5'
    - step:
        id: '26'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter profile")
        action: SendKey
        args: ENTER
    - step:
        id: '27'
        action: Script
        object_path: End If
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '0'
    - step:
        id: '28'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS").SAPGuiEdit("Project")'
        action: Set
        args: projNum
        snapshot: .\Snapshots\ssf5.png
        highlight_id: '38'
    - step:
        id: '29'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS").SAPGuiEdit("Layout")'
        action: Set
        args: '"/SVCLAYOUT"'
    - step:
        id: '30'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS").SAPGuiButton("Execute   (F8)")'
        action: Click
    - step:
        id: '31'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(3)
          = False Then
    - step:
        id: '32'
        action: Script
        object_path: '''SET FILTER'
    - step:
        id: '33'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2")'
        action: Maximize
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '0'
    - step:
        id: '34'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2").SAPGuiToolbar("GridToolbar")'
        action: PressContextButton
        args: '"SETFILTER"'
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '-1'
    - step:
        id: '35'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2").SAPGuiToolbar("GridToolbar")'
        action: SelectMenuItemById
        args: '"CLEARFIL"'
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '-1'
    - step:
        id: '36'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2").SAPGuiToolbar("GridToolbar")'
        action: PressContextButton
        args: '"SETFILTER"'
        snapshot: .\Snapshots\ssf10.png
        highlight_id: '-1'
    - step:
        id: '37'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2").SAPGuiToolbar("GridToolbar")'
        action: SelectMenuItemById
        args: '"SETFILTER"'
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '-1'
    - step:
        id: '38'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiGrid("Column
          Set")
        action: SelectCell
        args: 2,"Column Name"
        snapshot: .\Snapshots\ssf12.png
        highlight_id: '9'
    - step:
        id: '39'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiGrid("Column
          Set")
        action: SelectRow
        args: '2'
        snapshot: .\Snapshots\ssf12.png
        highlight_id: '9'
    - step:
        id: '40'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiButton("Add
          Filter Criterion (F7)")
        action: Click
        snapshot: .\Snapshots\ssf12.png
        highlight_id: '8'
    - step:
        id: '41'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiGrid("Column
          Set")
        action: SelectRow
        args: '2'
        snapshot: .\Snapshots\ssf13.png
        highlight_id: '9'
    - step:
        id: '42'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiButton("Add
          Filter Criterion (F7)")
        action: Click
        snapshot: .\Snapshots\ssf13.png
        highlight_id: '8'
    - step:
        id: '43'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiGrid("Column
          Set")
        action: SelectCell
        args: 7,"Column Name"
        snapshot: .\Snapshots\ssf14.png
        highlight_id: '9'
    - step:
        id: '44'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiGrid("Column
          Set")
        action: SelectRow
        args: '7'
        snapshot: .\Snapshots\ssf14.png
        highlight_id: '9'
    - step:
        id: '45'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiButton("Add
          Filter Criterion (F7)")
        action: Click
        snapshot: .\Snapshots\ssf14.png
        highlight_id: '8'
    - step:
        id: '46'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Filter").SAPGuiButton("Define
          Values")
        action: Click
        snapshot: .\Snapshots\ssf15.png
        highlight_id: '6'
    - step:
        id: '47'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Determine Values for Filter").SAPGuiEdit("Level")
        action: Set
        args: '"1"'
        snapshot: .\Snapshots\ssf16.png
        highlight_id: '15'
    - step:
        id: '48'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Determine Values for Filter").SAPGuiEdit("to")
        action: Set
        args: '"1"'
        snapshot: .\Snapshots\ssf16.png
        highlight_id: '14'
    - step:
        id: '49'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Determine Values for Filter").SAPGuiEdit("to")
        action: SetFocus
        snapshot: .\Snapshots\ssf16.png
        highlight_id: '14'
    - step:
        id: '50'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Determine Values for Filter").SAPGuiButton("Multiple
          selection")
        action: Click
        snapshot: .\Snapshots\ssf16.png
        highlight_id: '12'
    - step:
        id: '51'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTabStrip("TAB_STRIP")
        action: Select
        args: '"Exclude Single Values"'
        snapshot: .\Snapshots\ssf17.png
        highlight_id: '13'
    - step:
        id: '52'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTable("SAPLALDBSINGLE_E")
        action: SetCellData
        args: 1,"Single value","*Gifted Assets*"
        snapshot: .\Snapshots\ssf18.png
        highlight_id: '15'
    - step:
        id: '53'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Copy   (F8)")
        action: Click
        snapshot: .\Snapshots\ssf18.png
        highlight_id: '11'
    - step:
        id: '54'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Determine Values for Filter").SAPGuiButton("Multiple
          selection_2")
        action: Click
        snapshot: .\Snapshots\ssf19.png
        highlight_id: '13'
    - step:
        id: '55'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTabStrip("TAB_STRIP")
        action: Select
        args: '"Exclude Single Values"'
        snapshot: .\Snapshots\ssf20.png
        highlight_id: '13'
    - step:
        id: '56'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTable("SAPLALDBSINGLE_E")
        action: SetCellData
        args: 1,"Single value","*SETC*"
        snapshot: .\Snapshots\ssf21.png
        highlight_id: '15'
    - step:
        id: '57'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Copy   (F8)")
        action: Click
        snapshot: .\Snapshots\ssf21.png
        highlight_id: '11'
    - step:
        id: '58'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Determine Values for Filter").SAPGuiButton("Execute   (Enter)")
        action: Click
        snapshot: .\Snapshots\ssf22.png
        highlight_id: '2'
    - step:
        id: '59'
        action: Script
        object_path: 'rowCount = SAPGuiSession("Session").SAPGuiWindow("Project Info
          System: WBS_2").SAPGuiGrid("Project Definitions").RowCount'
    - step:
        id: '60'
        action: Script
        object_path: If rowCount <> "" Then
    - step:
        id: '61'
        action: Script
        object_path: '''ENTER EXTRACTED DATA INTO CN43N EXPORT TAB'
    - step:
        id: '62'
        object_path: Reporter
        action: Filter
        args: = rfDisableAll
    - step:
        id: '63'
        action: Script
        object_path: On error resume next
    - step:
        id: '64'
        action: Script
        object_path: 'projdef = SAPGuiSession("Session").SAPGuiWindow("Project Info
          System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Project
          definition")'
    - step:
        id: '65'
        action: Script
        object_path: 'level = SAPGuiSession("Session").SAPGuiWindow("Project Info
          System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Level")'
    - step:
        id: '66'
        action: Script
        object_path: 'name = SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Name")'
    - step:
        id: '67'
        action: Script
        object_path: 'responCost = SAPGuiSession("Session").SAPGuiWindow("Project
          Info System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Responsible
          cost ctr")'
    - step:
        id: '68'
        action: Script
        object_path: 'personRespon = SAPGuiSession("Session").SAPGuiWindow("Project
          Info System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Person
          responsible")'
    - step:
        id: '69'
        action: Script
        object_path: 'profitCen = SAPGuiSession("Session").SAPGuiWindow("Project Info
          System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Profit
          center")'
    - step:
        id: '70'
        action: Script
        object_path: 'status = SAPGuiSession("Session").SAPGuiWindow("Project Info
          System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Status")'
    - step:
        id: '71'
        action: Script
        object_path: 'investProg = SAPGuiSession("Session").SAPGuiWindow("Project
          Info System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Investment
          program")'
    - step:
        id: '72'
        action: Script
        object_path: 'WBSelement = SAPGuiSession("Session").SAPGuiWindow("Project
          Info System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"WBS
          element")'
    - step:
        id: '73'
        action: Script
        object_path: 'floc = SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Functional location")'
    - step:
        id: '74'
        action: Script
        object_path: 'AERproj = SAPGuiSession("Session").SAPGuiWindow("Project Info
          System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"AER Program")'
    - step:
        id: '75'
        action: Script
        object_path: 'businesSub = SAPGuiSession("Session").SAPGuiWindow("Project
          Info System: WBS_2").SAPGuiGrid("Project Definitions").GetCellData(1,"Business
          Sub Category")'
    - step:
        id: '76'
        action: Script
        object_path: On error goto 0
    - step:
        id: '77'
        object_path: Reporter
        action: Filter
        args: = rfEnableAll
    - step:
        id: '78'
        object_path: objCN43nExport.cells(y,1)
        action: value
        args: = projdef
    - step:
        id: '79'
        object_path: objCN43nExport.cells(y,2)
        action: value
        args: = level
    - step:
        id: '80'
        object_path: objCN43nExport.cells(y,3)
        action: value
        args: = name
    - step:
        id: '81'
        object_path: objCN43nExport.cells(y,4)
        action: value
        args: = responCost
    - step:
        id: '82'
        object_path: objCN43nExport.cells(y,5)
        action: value
        args: = personRespon
    - step:
        id: '83'
        object_path: objCN43nExport.cells(y,6)
        action: value
        args: = profitCen
    - step:
        id: '84'
        object_path: objCN43nExport.cells(y,7)
        action: value
        args: = status
    - step:
        id: '85'
        object_path: objCN43nExport.cells(y,8)
        action: value
        args: = investProg
    - step:
        id: '86'
        object_path: objCN43nExport.cells(y,9)
        action: value
        args: = WBSelement
    - step:
        id: '87'
        object_path: objCN43nExport.cells(y,10)
        action: value
        args: = floc
    - step:
        id: '88'
        object_path: objCN43nExport.cells(y,11)
        action: value
        args: = AERproj
    - step:
        id: '89'
        object_path: objCN43nExport.cells(y,12)
        action: value
        args: = businesSub
    - step:
        id: '90'
        action: Script
        object_path: y = y + 1
    - step:
        id: '91'
        action: Script
        object_path: If (projdef <> "") or (level <> "") or (name <> "") or (responCost
          <> "") or (personRespon <> "") or (profitCen <> "") or (status <> "") or
          (investProg <> "") or (WBSelement <> "") or (floc <> "") or (AERproj <>
          "") or (businesSub <> "") Then
    - step:
        id: '92'
        object_path: objProjectsToBeExpenses.cells(i,4)
        action: value
        args: = "YES"
    - step:
        id: '93'
        action: Script
        object_path: End If
    - step:
        id: '94'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n"'
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '21'
    - step:
        id: '95'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2")'
        action: SendKey
        args: ENTER
    - step:
        id: '96'
        action: Script
        object_path: Else
    - step:
        id: '97'
        object_path: objProjectsToBeExpenses.cells(i,4)
        action: value
        args: = "NO"
    - step:
        id: '98'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n"'
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '21'
    - step:
        id: '99'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS_2")'
        action: SendKey
        args: ENTER
    - step:
        id: '100'
        action: Script
        object_path: End If
    - step:
        id: '101'
        action: Script
        object_path: Else
    - step:
        id: '102'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '0'
    - step:
        id: '103'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n"'
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '21'
    - step:
        id: '104'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Project Info System:
          WBS")'
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '0'
    - step:
        id: '105'
        action: Script
        object_path: End If
    - step:
        id: '106'
        action: Script
        object_path: End If
    - step:
        id: '107'
        action: Script
        object_path: Else
    - step:
        id: '108'
        action: Script
        object_path: Exit For
    - step:
        id: '109'
        action: Script
        object_path: End If
    - step:
        id: '110'
        action: Script
        object_path: Next
    - step:
        id: '111'
        action: Script
        object_path: '''SAVE AND CLOSE SUPPORT FILE'
    - step:
        id: '112'
        object_path: objSupportFile
        action: save
    - step:
        id: '113'
        object_path: objSupportFile
        action: close
    - step:
        id: '114'
        object_path: objExcel
        action: Quit
    - step:
        id: '115'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '116'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '117'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '118'
        action: Script
        object_path: Set objProjectsToBeExpenses = Nothing
    - step:
        id: '119'
        action: Script
        object_path: Set objCN43nExport = Nothing
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
      last_update_time: Friday, 10 February 2023 11:27:34 AM
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Project Info System: WBS_2'
          properties:
          - property:
              value:
                value: CN43N
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
                value: SAPLPSIS_SINGLE01
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
          child_objects:
          - object:
              class: SAPGuiToolbar
              name: GridToolbar
              properties:
              - property:
                  value:
                    value: shell
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '204'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: usr/cntlALVCONTAINER/shellcont/shell
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 10 February 2023 11:27:34 AM
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: Project Definitions
              properties:
              - property:
                  value:
                    value: shell
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiGrid
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '201'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/cntlALVCONTAINER/shellcont/shell
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Project Info System: WBS'
          properties:
          - property:
              value:
                value: CN43N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '1000'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: RPSISPE000
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Project
              properties:
              - property:
                  value:
                    value: CN_PROJN-LOW
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
                    value: wnd[0]/usr/ctxtCN_PROJN-LOW
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Layout
              properties:
              - property:
                  value:
                    value: P_DISVAR
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
                    value: wnd[0]/usr/ctxtP_DISVAR
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
                    value: wnd[0]/tbar[1]/btn[8]
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Multiple Selection for
          properties:
          - property:
              value:
                value: CN43N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '3000'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLALDB
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[3]
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
                value: wnd[3]
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: TAB_STRIP
              properties:
              - property:
                  value:
                    value: TAB_STRIP
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTabStrip
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '90'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[3]/usr/tabsTAB_STRIP
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: SAPLALDBSINGLE_E
              properties:
              - property:
                  value:
                    value: SAPLALDBSINGLE_E
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
                    value: wnd[3]/usr/tabsTAB_STRIP/tabpNOSV/ssubSCREEN_HEADER:SAPLALDB:3030/tblSAPLALDBSINGLE_E
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Copy   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
                    value: wnd[3]/tbar[0]/btn[8]
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information
          properties:
          - property:
              value:
                value: CN43N
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Filter
          properties:
          - property:
              value:
                value: CN43N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '1500'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSALV_CUL_CONFIGURATION
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
          child_objects:
          - object:
              class: SAPGuiGrid
              name: Column Set
              properties:
              - property:
                  value:
                    value: shell
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiGrid
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '201'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Define Values
              properties:
              - property:
                  value:
                    value: 600_BUTTON
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
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Add Filter Criterion (F7)
              properties:
              - property:
                  value:
                    value: APP_WL_SING
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
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter profile
          properties:
          - property:
              value:
                value: CN43N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '600'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCNIS
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Database prof.
              properties:
              - property:
                  value:
                    value: TCNT-PROF_DB
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
                    value: wnd[1]/usr/ctxtTCNT-PROF_DB
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Determine Values for Filter
          properties:
          - property:
              value:
                value: CN43N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '1104'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSSEL
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[2]
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
                value: wnd[2]
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: to
              properties:
              - property:
                  value:
                    value: '%%DYN001-HIGH'
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
                    value: wnd[2]/usr/ssub%_SUBSCREEN_FREESEL:SAPLSSEL:1105/ctxt%%DYN001-HIGH
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Level
              properties:
              - property:
                  value:
                    value: '%%DYN001-LOW'
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
                    value: wnd[2]/usr/ssub%_SUBSCREEN_FREESEL:SAPLSSEL:1105/ctxt%%DYN001-LOW
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Multiple selection_2
              properties:
              - property:
                  value:
                    value: '%_%%DYN003_%_APP_%-VALU_PUSH'
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
                    value: wnd[2]/usr/ssub%_SUBSCREEN_FREESEL:SAPLSSEL:1105/btn%_%%DYN003_%_APP_%-VALU_PUSH
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Multiple selection
              properties:
              - property:
                  value:
                    value: '%_%%DYN002_%_APP_%-VALU_PUSH'
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
                    value: wnd[2]/usr/ssub%_SUBSCREEN_FREESEL:SAPLSSEL:1105/btn%_%%DYN002_%_APP_%-VALU_PUSH
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute   (Enter)
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
                    value: wnd[2]/tbar[0]/btn[0]
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Define Selection Options
          properties:
          - property:
              value:
                value: CN43N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '651'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLALDB
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
          child_objects: []
      - object:
          class: SAPGuiWindow
          name: Define Filter Criteria
          properties:
          - property:
              value:
                value: CN43N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '1500'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSKBH
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
          last_update_time: Friday, 10 February 2023 11:27:34 AM
          child_objects:
          - object:
              class: SAPGuiGrid
              name: Column Set
              properties:
              - property:
                  value:
                    value: shell
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiGrid
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '201'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/subSUB_DYN0500:SAPLSKBH:0600/cntlCONTAINER1_FILT/shellcont/shell
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
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Define Values
              properties:
              - property:
                  value:
                    value: 600_BUTTON
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
                    value: wnd[1]/usr/subSUB_DYN0500:SAPLSKBH:0600/btn600_BUTTON
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Add Filter Criterion (F7)
              properties:
              - property:
                  value:
                    value: APP_WL_SING
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
                    value: wnd[1]/usr/subSUB_DYN0500:SAPLSKBH:0600/btnAPP_WL_SING
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
              last_update_time: Friday, 10 February 2023 11:27:34 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
