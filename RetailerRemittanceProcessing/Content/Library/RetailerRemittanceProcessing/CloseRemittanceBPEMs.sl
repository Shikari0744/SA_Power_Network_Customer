namespace: RetailerRemittanceProcessing
operation:
  name: CloseRemittanceBPEMs
  inputs:
  - bpemcasefile: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Retailer
      Remittance Processing\BPEM Case File.xlsx
  sequential_action:
    gav: com.microfocus.seq:RetailerRemittanceProcessing.CloseRemittanceBPEMs:1.0.0
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
        object_path: '''FI01'
    - step:
        id: '2'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '3'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '4'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("bpemcasefile"))
    - step:
        id: '5'
        action: Script
        object_path: sheetName = objWorkbook.Worksheets(1).Name
    - step:
        id: '6'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(sheetName)
    - step:
        id: '7'
        action: Script
        object_path: excelRow = objSheet.UsedRange.Rows.Count
    - step:
        id: '8'
        action: Script
        object_path: caseIDs = ""
    - step:
        id: '9'
        action: Script
        object_path: For excel = 1 To excelRow
    - step:
        id: '10'
        action: Script
        object_path: caseID = objSheet.cells(excel,1).value
    - step:
        id: '11'
        action: Script
        object_path: status = objSheet.cells(excel,2).value
    - step:
        id: '12'
        action: Script
        object_path: If caseID <> "" and status <> "COMPLETED" Then
    - step:
        id: '13'
        action: Script
        object_path: caseIDs = caseIDs & caseID & ","
    - step:
        id: '14'
        action: Script
        object_path: ElseIf caseID = "" Then
    - step:
        id: '15'
        action: Script
        object_path: Exit For
    - step:
        id: '16'
        action: Script
        object_path: End If
    - step:
        id: '17'
        action: Script
        object_path: Next
    - step:
        id: '18'
        action: Script
        object_path: caseIDs = Split(caseIDs, ",")
    - step:
        id: '19'
        action: Script
        object_path: If UBound(caseIDs) >= 0 Then
    - step:
        id: '20'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Activate
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '0'
    - step:
        id: '21'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Maximize
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nEMMACL"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '21'
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiButton("Multiple
          selection")
        action: Click
        snapshot: .\Snapshots\ssf12.png
        highlight_id: '32'
    - step:
        id: '25'
        action: Script
        object_path: row = 1
    - step:
        id: '26'
        action: Script
        object_path: For Each caseID in caseIDs
    - step:
        id: '27'
        action: Script
        object_path: If caseID <> "" Then
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTable("SAPLALDBSINGLE")
        action: SetCellData
        args: row,"Single value",caseID
    - step:
        id: '29'
        action: Script
        object_path: row = row + 1
    - step:
        id: '30'
        action: Script
        object_path: Else
    - step:
        id: '31'
        action: Script
        object_path: Exit For
    - step:
        id: '32'
        action: Script
        object_path: End If
    - step:
        id: '33'
        action: Script
        object_path: Next
        snapshot: .\Snapshots\ssf13.png
        highlight_id: '16'
    - step:
        id: '34'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Check
          entries   (Enter)")
        action: Click
        snapshot: .\Snapshots\ssf13.png
        highlight_id: '2'
    - step:
        id: '35'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Copy   (F8)")
        action: Click
    - step:
        id: '36'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiButton("Execute   (F8)")
        action: Click
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '47'
    - step:
        id: '37'
        action: Script
        object_path: bpemCase = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '38'
        action: Script
        object_path: For bpem = 1 To bpemCase
    - step:
        id: '39'
        action: Script
        object_path: processingCase = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").GetCellData(bpem,"Case")
    - step:
        id: '40'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List_2").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: bpem,"Case"
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '47'
    - step:
        id: '41'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Switch
          between Display/Change")
        action: Click
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '1'
    - step:
        id: '42'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
        snapshot: .\Snapshots\ssf7.png
        highlight_id: '46'
    - step:
        id: '43'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: SelectCell
        args: 1,"Icon"
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '48'
    - step:
        id: '44'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: SelectRow
        args: '1'
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '48'
    - step:
        id: '45'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: 1,"Icon"
        snapshot: .\Snapshots\ssf8.png
        highlight_id: '48'
    - step:
        id: '46'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("Status")
        action: SetFocus
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '33'
    - step:
        id: '47'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("Status")
        action: Select
        args: '"Completed"'
        snapshot: .\Snapshots\ssf9.png
        highlight_id: '33'
    - step:
        id: '48'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '49'
        action: Script
        object_path: For excel = 1 To excelRow
    - step:
        id: '50'
        action: Script
        object_path: excelCase = objSheet.cells(excel,1).value
    - step:
        id: '51'
        action: Script
        object_path: If excelCase = processingCase Then
    - step:
        id: '52'
        object_path: objSheet.cells(excel,2)
        action: value
        args: = "COMPLETED"
    - step:
        id: '53'
        action: Script
        object_path: Exit For
    - step:
        id: '54'
        action: Script
        object_path: End If
    - step:
        id: '55'
        action: Script
        object_path: Next
    - step:
        id: '56'
        action: Script
        object_path: Next
    - step:
        id: '57'
        action: Script
        object_path: End If
    - step:
        id: '58'
        object_path: objWorkbook
        action: save
    - step:
        id: '59'
        object_path: objWorkbook
        action: close
    - step:
        id: '60'
        object_path: objExcel
        action: Quit
    - step:
        id: '61'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '62'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '63'
        action: Script
        object_path: Set objExcel = Nothing
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
      last_update_time: Wednesday, 19 April 2023 11:19:12 AM
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
          last_update_time: Wednesday, 19 April 2023 11:19:12 AM
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Multiple Selection for
          properties:
          - property:
              value:
                value: EMMACL
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
          last_update_time: Wednesday, 19 April 2023 11:19:12 AM
          child_objects:
          - object:
              class: SAPGuiTable
              name: SAPLALDBSINGLE
              properties:
              - property:
                  value:
                    value: SAPLALDBSINGLE
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
                    value: wnd[1]/usr/tabsTAB_STRIP/tabpSIVA/ssubSCREEN_HEADER:SAPLALDB:3010/tblSAPLALDBSINGLE
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
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
                    value: wnd[1]/tbar[0]/btn[8]
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Check entries   (Enter)
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Clarification
          properties:
          - property:
              value:
                value: EMMACL
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '105'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLEMMA_CASE_TRANSACTION
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
          last_update_time: Wednesday, 19 April 2023 11:19:12 AM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: TABSTRIP
              properties:
              - property:
                  value:
                    value: TABSTRIP
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
                    value: wnd[0]/usr/tabsTABSTRIP
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: GridViewCtrl
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
                    value: wnd[0]/usr/tabsTABSTRIP/tabpBUTPROC/ssubTABSUB:SAPLEMMA_CASE_TRANSACTION:0200/cntlWORKAREA0/shellcont/shell
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
          - object:
              class: SAPGuiComboBox
              name: Status
              properties:
              - property:
                  value:
                    value: EMMAD_CASEHDR-STATUS
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
                    value: wnd[0]/usr/cmbEMMAD_CASEHDR-STATUS
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Switch between Display/Change
              properties:
              - property:
                  value:
                    value: btn[13]
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
                    value: wnd[0]/tbar[1]/btn[13]
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Clarification Case List_2
          properties:
          - property:
              value:
                value: EMMACL
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
                value: SAPLSLVC_FULLSCREEN
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
          last_update_time: Wednesday, 19 April 2023 11:19:12 AM
          child_objects:
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: GridViewCtrl
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
                    value: wnd[0]/usr/cntlGRID1/shellcont/shell
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Clarification Case List
          properties:
          - property:
              value:
                value: EMMACL
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
                value: REMMACASELIST
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
          last_update_time: Wednesday, 19 April 2023 11:19:12 AM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Multiple selection
              properties:
              - property:
                  value:
                    value: '%_CASENO_%_APP_%-VALU_PUSH'
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
                    value: wnd[0]/usr/btn%_CASENO_%_APP_%-VALU_PUSH
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
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
              last_update_time: Wednesday, 19 April 2023 11:19:12 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
