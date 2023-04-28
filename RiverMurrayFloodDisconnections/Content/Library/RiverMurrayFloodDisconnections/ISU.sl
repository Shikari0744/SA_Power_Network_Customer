namespace: RiverMurrayFloodDisconnections
operation:
  name: ISU
  inputs:
  - floodManagementSheet: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process
      Automation\River Murray Flood Disconnections\Flood Management.xlsx
  - b2bAction
  - sourceOfDeen
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.ISU:1.0.0
    skills:
    - SAP
    - SAPWebExt
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
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '2'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '3'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Maximize
    - step:
        id: '4'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("floodManagementSheet"))
    - step:
        id: '5'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("query")
    - step:
        id: '6'
        action: Script
        object_path: rowsNMI = objSheet.UsedRange.Rows.Count
    - step:
        id: '7'
        action: Script
        object_path: counter = 0
    - step:
        id: '8'
        action: Script
        object_path: For row = 2 To rowsNMI
    - step:
        id: '9'
        action: Script
        object_path: If objSheet.cells(row,2).value = Parameter("b2bAction") and objSheet.cells(row,3).value
          = Parameter("sourceOfDeen") Then
    - step:
        id: '10'
        action: Script
        object_path: counter = counter + 1
    - step:
        id: '11'
        action: Script
        object_path: If objSheet.cells(row,9).value = "" Then
    - step:
        id: '12'
        action: Script
        object_path: nmi = objSheet.cells(row,1).value
    - step:
        id: '13'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nES32"'
    - step:
        id: '14'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '15'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:").SAPGuiEdit("Installation")
        action: OpenPossibleEntries
    - step:
        id: '16'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiTabStrip("G_SELONETABSTRIP")
        action: Select
        args: '"Installation by Point of Delivery"'
    - step:
        id: '17'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiEdit("Point
          of Delivery ID")
        action: Set
        args: nmi
    - step:
        id: '18'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '19'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Installation 1 Entry").SAPGuiLabel("Found
          NMI").Exist(3) Then
    - step:
        id: '20'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Installation 1 Entry").SAPGuiLabel("Found
          NMI")
        action: SetFocus
    - step:
        id: '21'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Installation 1 Entry").SAPGuiButton("Apply   (Enter)")
        action: Click
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:")
        action: SendKey
        args: ENTER
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:_2").SAPGuiButton("FullScrn")
        action: Click
        snapshot: .\Snapshots\ssf2.png
        highlight_id: '73'
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiTabStrip("TABSTRIP_UI")
        action: Select
        args: '"Hdr"'
    - step:
        id: '25'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiTabStrip("TABSTRIP_ASSIGN")
        action: Select
        args: '"Other"'
    - step:
        id: '26'
        action: Script
        object_path: row1 = SAPGuiSession("Session").SAPGuiWindow("Display point of
          delivery:").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '27'
        action: Script
        object_path: For r = 1 To row1
    - step:
        id: '28'
        action: Script
        object_path: todate = SAPGuiSession("Session").SAPGuiWindow("Display point
          of delivery:").SAPGuiGrid("GridViewCtrl").GetCellData(r, "To-Date")
    - step:
        id: '29'
        action: Script
        object_path: If todate = "31.12.9999" Then
    - step:
        id: '30'
        action: Script
        object_path: s = SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiGrid("GridViewCtrl").GetCellData(r,
          "NMI Status")
    - step:
        id: '31'
        action: Script
        object_path: Exit for
    - step:
        id: '32'
        action: Script
        object_path: End If
    - step:
        id: '33'
        action: Script
        object_path: Next
    - step:
        id: '34'
        action: Script
        object_path: If s = "D" Then
    - step:
        id: '35'
        action: Script
        object_path: status = "DEACTIVE"
    - step:
        id: '36'
        action: Script
        object_path: ElseIf s = "X" Then
    - step:
        id: '37'
        action: Script
        object_path: status = "REMOVED"
    - step:
        id: '38'
        action: Script
        object_path: ElseIf s = "A" Then
    - step:
        id: '39'
        action: Script
        object_path: status = "ACTIVE"
    - step:
        id: '40'
        action: Script
        object_path: End If
    - step:
        id: '41'
        object_path: objSheet.cells(row,9)
        action: value
        args: = status
    - step:
        id: '42'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '43'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:")
        action: SendKey
        args: ENTER
    - step:
        id: '44'
        action: Script
        object_path: Else
    - step:
        id: '45'
        object_path: objSheet.cells(row,9)
        action: value
        args: = "INSTALLATION NOT FOUND"
    - step:
        id: '46'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiButton("Cancel   (F12)")
        action: Click
    - step:
        id: '47'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '48'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:")
        action: SendKey
        args: ENTER
    - step:
        id: '49'
        action: Script
        object_path: End If
    - step:
        id: '50'
        object_path: objWorkbook
        action: save
    - step:
        id: '51'
        action: Script
        object_path: End If
    - step:
        id: '52'
        action: Script
        object_path: End If
    - step:
        id: '53'
        action: Script
        object_path: Next
    - step:
        id: '54'
        action: Script
        object_path: Parameter("toBeActioned") = counter
    - step:
        id: '55'
        object_path: objWorkbook
        action: save
    - step:
        id: '56'
        object_path: objWorkbook
        action: close
    - step:
        id: '57'
        object_path: objExcel
        action: quit
    - step:
        id: '58'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '59'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '60'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '61'
        action: Script
        object_path: If counter = 0 Then
    - step:
        id: '62'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "no NMIs to process", "no NMIs to process"
    - step:
        id: '63'
        action: Script
        object_path: ExitTest
    - step:
        id: '64'
        action: Script
        object_path: End If
  outputs:
  - toBeActioned:
      robot: true
      value: ${toBeActioned}
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
      last_update_time: Thursday, 12 January 2023 12:59:04 PM
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
          custom_replay:
            behavior: ''
          comments: ''
          visual_relations:
            visual_relation: []
          last_update_time: Thursday, 12 January 2023 12:59:04 PM
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Restrict Value Range
          properties:
          - property:
              value:
                value: ES32
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '200'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSDH4
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
          last_update_time: Thursday, 12 January 2023 12:59:04 PM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: G_SELONETABSTRIP
              properties:
              - property:
                  value:
                    value: G_SELONETABSTRIP
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
                    value: wnd[1]/usr/tabsG_SELONETABSTRIP
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Point of Delivery ID
              properties:
              - property:
                  value:
                    value: G_SELFLD_TAB-LOW
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
                    value: wnd[1]/usr/tabsG_SELONETABSTRIP/tabpTAB002/ssubSUBSCR_PRESEL:SAPLSDH4:0220/sub:SAPLSDH4:0220/txtG_SELFLD_TAB-LOW[0,24]
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
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
                    value: wnd[1]/tbar[0]/btn[12]
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Installation 1 Entry
          properties:
          - property:
              value:
                value: ES32
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
          last_update_time: Thursday, 12 January 2023 12:59:04 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: Found NMI
              properties:
              - property:
                  value:
                    value: wnd[1]/usr/lbl[1,3]
                    regular_expression: false
                  name: relativeid
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiLabel
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '30'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/lbl[1,3]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Apply   (Enter)
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display point of delivery:'
          properties:
          - property:
              value:
                value: ES32
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
                value: SAPLEEDM_DLG_FRAME
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
          last_update_time: Thursday, 12 January 2023 12:59:04 PM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: TABSTRIP_UI
              properties:
              - property:
                  value:
                    value: TABSTRIP_UI
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
                    value: wnd[0]/usr/subFULLSCREEN_SS:SAPLEEDM_DLG_FRAME:0202/subSUBSCREEN_MAIN:SAPLEEDM_UI_DIALOG:0200/tabsTABSTRIP_UI
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TABSTRIP_ASSIGN
              properties:
              - property:
                  value:
                    value: TABSTRIP_ASSIGN
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
                    value: wnd[0]/usr/subFULLSCREEN_SS:SAPLEEDM_DLG_FRAME:0202/subSUBSCREEN_MAIN:SAPLEEDM_UI_DIALOG:0200/tabsTABSTRIP_UI/tabpHEADER/ssubTS_SUB_HEAD:SAPLEEDM_UI_DIALOG:0320/ssubTS_SUB_ASSIGN:SAPLEEDM_UI_DIALOG:0360/tabsTABSTRIP_ASSIGN
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
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
                    value: wnd[0]/usr/subFULLSCREEN_SS:SAPLEEDM_DLG_FRAME:0202/subSUBSCREEN_MAIN:SAPLEEDM_UI_DIALOG:0200/tabsTABSTRIP_UI/tabpHEADER/ssubTS_SUB_HEAD:SAPLEEDM_UI_DIALOG:0320/ssubTS_SUB_ASSIGN:SAPLEEDM_UI_DIALOG:0360/tabsTABSTRIP_ASSIGN/tabpCUST/ssubTS_SUB_CUST:SAPLEEDM_UI_DIALOG:0800/subXUSR100:ZMI_M_NMI_ENHANCEMENT:0800/cntlNMI_STATUS/shellcont/shell
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Installation:_2
          properties:
          - property:
              value:
                value: ES32
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '201'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLES30
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
          last_update_time: Thursday, 12 January 2023 12:59:04 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: FullScrn
              properties:
              - property:
                  value:
                    value: EXTUI_DISPLAY
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
                    value: wnd[0]/usr/subPODSUB:SAPLEEDM_UI_EXT_DIALOG:0100/subSUB_MAIN:SAPLEEDM_UI_EXT_SUB_DIALOG:0100/subSUB_MAIN:SAPLEEDM_UI_EXT_SUB_DIALOG:0200/btnEXTUI_DISPLAY
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Installation:'
          properties:
          - property:
              value:
                value: ES32
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '110'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLES30
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
          last_update_time: Thursday, 12 January 2023 12:59:04 PM
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Installation
              properties:
              - property:
                  value:
                    value: EANLD-ANLAGE
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
                    value: wnd[0]/usr/ctxtEANLD-ANLAGE
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter
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
                    value: wnd[0]/tbar[0]/btn[0]
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
              last_update_time: Thursday, 12 January 2023 12:59:04 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
