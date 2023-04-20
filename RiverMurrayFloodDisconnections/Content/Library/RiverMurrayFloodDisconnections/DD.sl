namespace: RiverMurrayFloodDisconnections
operation:
  name: DD
  inputs:
  - floodManagementSheet: C:/Users/svcrpabot/OneDrive - SA Power Networks/River Murray
      Flood Disconnections/Flood Management.xlsx
  - b2bAction: Imported Bulk Disconnections
  - sourceOfDeen: Bulk Disconnections
  sequential_action:
    gav: com.microfocus.seq:RiverMurrayFloodDisconnections.DD:1.0.0
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
        object_path: For row = 2 To rowsNMI
    - step:
        id: '8'
        action: Script
        object_path: If objSheet.cells(row,2).value = Parameter("b2bAction") and objSheet.cells(row,3).value
          = Parameter("sourceOfDeen") Then
    - step:
        id: '9'
        action: Script
        object_path: If objSheet.cells(row,26).value = "" and (objSheet.cells(row,9).value
          <> "REMOVED" and objSheet.cells(row,9).value <> "INSTALLATION NOT FOUND")
          Then
    - step:
        id: '10'
        action: Script
        object_path: nmi = objSheet.cells(row,1).value
    - step:
        id: '11'
        action: Script
        object_path: datetime = objSheet.cells(row,4).value
    - step:
        id: '12'
        action: Script
        object_path: discDate = FormatDateTime(datetime, 2)
    - step:
        id: '13'
        action: Script
        object_path: discTime = FormatDateTime(datetime, 4)
    - step:
        id: '14'
        action: Script
        object_path: deenMethod = objSheet.cells(row,6).value
    - step:
        id: '15'
        action: Script
        object_path: status = objSheet.cells(row,9).value
    - step:
        id: '16'
        action: Script
        object_path: If status = "ACTIVE" Then
    - step:
        id: '17'
        object_path: objSheet.cells(row,26)
        action: value
        args: = "Yes"
    - step:
        id: '18'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nEC85"'
    - step:
        id: '19'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '20'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Create Disconnection Document:").SAPGuiRadioButton("Installation")
        action: Set
    - step:
        id: '21'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Create Disconnection Document:").SAPGuiEdit("Installation")
        action: OpenPossibleEntries
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiTabStrip("G_SELONETABSTRIP")
        action: Select
        args: '"Installation by Point of Delivery"'
    - step:
        id: '23'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiEdit("Point
          of Delivery ID")
        action: Set
        args: nmi
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '25'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Installation 1 Entry").SAPGuiLabel("NMI")
        action: SetCaretPos
        args: '7'
    - step:
        id: '26'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Installation 1 Entry").SAPGuiButton("Apply   (Enter)")
        action: Click
    - step:
        id: '27'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Create Disconnection Document:").SAPGuiButton("Enter")
        action: Click
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Create Disconnection Document:_2").SAPGuiButton("Enter
          Disconnection")
        action: Click
    - step:
        id: '29'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter Disconnection").SAPGuiButton("Save")
        action: Click
    - step:
        id: '30'
        action: Script
        object_path: discDoc = SAPGuiSession("Session").SAPGuiWindow("Change/Display
          Disconnection").SAPGuiEdit("Disc. doc.").GetROProperty("value")
    - step:
        id: '31'
        object_path: objSheet.cells(row,27)
        action: value
        args: = discDoc
    - step:
        id: '32'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiEdit("Disconnec.
          date")
        action: Set
        args: Replace(discDate, "/", ".")
    - step:
        id: '33'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiEdit("Disconn.
          time")
        action: Set
        args: discTime&":00"
    - step:
        id: '34'
        action: Script
        object_path: r = SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("SAPLES34TC_DISCPOS").RowCount
    - step:
        id: '35'
        action: Script
        object_path: For x = 1 To r
    - step:
        id: '36'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("SAPLES34TC_DISCPOS").ValidRow(x)
          Then
    - step:
        id: '37'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("SAPLES34TC_DISCPOS")
        action: SetCellData
        args: x, "DiscActDa.", Replace(discDate, "/", ".")
    - step:
        id: '38'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("SAPLES34TC_DISCPOS")
        action: SetCellData
        args: x, "Time", discTime&":00"
    - step:
        id: '39'
        action: Script
        object_path: If deenMethod = "Transformer" Then
    - step:
        id: '40'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("SAPLES34TC_DISCPOS")
        action: SetCellData
        args: x, "Typ", "ZD4"
    - step:
        id: '41'
        action: Script
        object_path: Else
    - step:
        id: '42'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("SAPLES34TC_DISCPOS")
        action: SetCellData
        args: x, "Typ", "ZD2"
    - step:
        id: '43'
        action: Script
        object_path: End If
    - step:
        id: '44'
        action: Script
        object_path: Else
    - step:
        id: '45'
        action: Script
        object_path: Exit For
    - step:
        id: '46'
        action: Script
        object_path: End If
    - step:
        id: '47'
        action: Script
        object_path: Next
    - step:
        id: '48'
        action: Script
        object_path: tabs = SAPGuiSession("Session").SAPGuiWindow("Change/Display
          Disconnection").SAPGuiTabStrip("TS310").GetROProperty("allitems")
    - step:
        id: '49'
        action: Script
        object_path: If InStr(tabs,"MR") Then
    - step:
        id: '50'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTabStrip("TS310")
        action: Select
        args: '"MR"'
    - step:
        id: '51'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("Meter
          reader").Exist(1) Then
    - step:
        id: '52'
        action: Script
        object_path: r = SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("Meter
          reader").RowCount
    - step:
        id: '53'
        action: Script
        object_path: For x = 1 To r
    - step:
        id: '54'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("Meter
          reader").ValidRow(x) Then
    - step:
        id: '55'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(1)
          Then
    - step:
        id: '56'
        action: Script
        object_path: For y = 1 To r
    - step:
        id: '57'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(1)
          Then
    - step:
        id: '58'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: Next
    - step:
        id: '61'
        action: Script
        object_path: End If
    - step:
        id: '62'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("Meter
          reader").ValidRow(x) Then
    - step:
        id: '63'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiTable("Meter
          reader")
        action: SetCellData
        args: x, "Note", "NSD"
    - step:
        id: '64'
        action: Script
        object_path: End If
    - step:
        id: '65'
        action: Script
        object_path: Else
    - step:
        id: '66'
        action: Script
        object_path: Exit For
    - step:
        id: '67'
        action: Script
        object_path: End If
    - step:
        id: '68'
        action: Script
        object_path: Next
    - step:
        id: '69'
        action: Script
        object_path: End If
    - step:
        id: '70'
        action: Script
        object_path: End If
    - step:
        id: '71'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '72'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiStatusBar("StatusBar").Exist(2)
          Then
    - step:
        id: '73'
        object_path: objSheet.cells(row,27)
        action: value
        args: = "Bill reversal required"
    - step:
        id: '74'
        object_path: objSheet.cells(row,35)
        action: value
        args: = "Ready to upload"
    - step:
        id: '75'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '76'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change/Display Disconnection")
        action: SendKey
        args: ENTER
    - step:
        id: '77'
        action: Script
        object_path: Else
    - step:
        id: '78'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '79'
        action: Script
        object_path: For x = 1 To 10
    - step:
        id: '80'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(3)
          Then
    - step:
        id: '81'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '82'
        action: Script
        object_path: End If
    - step:
        id: '83'
        action: Script
        object_path: Next
    - step:
        id: '84'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Create Disconnection Document:_2").SAPGuiButton("Save")
        action: Click
    - step:
        id: '85'
        action: Script
        object_path: For x = 1 To 5
    - step:
        id: '86'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Information").Exist(3)
          Then
    - step:
        id: '87'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '88'
        action: Script
        object_path: End If
    - step:
        id: '89'
        action: Script
        object_path: Next
    - step:
        id: '90'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Create Disconnection Document:").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '91'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Create Disconnection Document:")
        action: SendKey
        args: ENTER
    - step:
        id: '92'
        action: Script
        object_path: End If
    - step:
        id: '93'
        action: Script
        object_path: ElseIf status = "DEACTIVE" Then
    - step:
        id: '94'
        object_path: objSheet.cells(row,26)
        action: value
        args: = "No - DEACTIVE Site"
    - step:
        id: '95'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nES32"'
    - step:
        id: '96'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '97'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:").SAPGuiEdit("Installation")
        action: OpenPossibleEntries
    - step:
        id: '98'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range_2").SAPGuiTabStrip("G_SELONETABSTRIP")
        action: Select
        args: '"Installation by Point of Delivery"'
    - step:
        id: '99'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range_2").SAPGuiEdit("Point
          of Delivery ID")
        action: Set
        args: nmi
    - step:
        id: '100'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Restrict Value Range_2").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '101'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Disconnection documents").SAPGuiLabel("Existing
          Disco Doc")
        action: SetFocus
    - step:
        id: '102'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Disconnection documents").SAPGuiButton("Apply   (Enter)")
        action: Click
    - step:
        id: '103'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:")
        action: SendKey
        args: ENTER
    - step:
        id: '104'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:_2").SAPGuiButton("Display
          discon. doc.")
        action: Click
    - step:
        id: '105'
        action: Script
        object_path: discDoc = SAPGuiSession("Session").SAPGuiWindow("Disconnection
          documents").SAPGuiLabel("Existing Disco Doc").GetROProperty("content")
    - step:
        id: '106'
        object_path: objSheet.cells(row,27)
        action: value
        args: = discDoc
    - step:
        id: '107'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Disconnection documents").SAPGuiButton("Cancel   (F12)")
        action: Click
    - step:
        id: '108'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:_2").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '109'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:_2")
        action: SendKey
        args: ENTER
    - step:
        id: '110'
        action: Script
        object_path: End If
    - step:
        id: '111'
        object_path: objWorkbook
        action: save
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
        object_path: Next
    - step:
        id: '115'
        object_path: objWorkbook
        action: save
    - step:
        id: '116'
        object_path: objWorkbook
        action: close
    - step:
        id: '117'
        object_path: objExcel
        action: quit
    - step:
        id: '118'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '119'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '120'
        action: Script
        object_path: Set objSheet = Nothing
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
      last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Restrict Value Range_2
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Restrict Value Range
          properties:
          - property:
              value:
                value: EC85
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Installation 1 Entry
          properties:
          - property:
              value:
                value: EC85
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: NMI
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information
          properties:
          - property:
              value:
                value: EC85
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Information Message
              properties:
              - property:
                  value:
                    value: MESSTXT1
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
                    value: wnd[1]/usr/txtMESSTXT1
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter Disconnection
          properties:
          - property:
              value:
                value: EC85
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Save
              properties:
              - property:
                  value:
                    value: BUTTON_1
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
                    value: wnd[1]/usr/btnBUTTON_1
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Installation
              properties:
              - property:
                  value:
                    value: EANLD-DISCSTAT
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
                    value: wnd[0]/usr/txtEANLD-DISCSTAT
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Display discon. doc.
              properties:
              - property:
                  value:
                    value: EANLD-DISCBUT
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
                    value: wnd[0]/usr/btnEANLD-DISCBUT
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
          child_objects:
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Disconnection documents
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: Existing Disco Doc
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Create Disconnection Document:_2
          properties:
          - property:
              value:
                value: EC85
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
                value: SAPLES34
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter Disconnection
              properties:
              - property:
                  value:
                    value: btn[6]
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
                    value: wnd[0]/tbar[1]/btn[6]
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Create Disconnection Document:'
          properties:
          - property:
              value:
                value: EC85
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
                value: SAPLEC85
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
          child_objects:
          - object:
              class: SAPGuiRadioButton
              name: Installation
              properties:
              - property:
                  value:
                    value: Installation
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: RAD_OBJ-INSTLN
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
              - property:
                  value:
                    value: wnd[0]/usr/subRSLSUB:SAPLES34SUBSCREEN:0411/radRAD_OBJ-INSTLN
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Installation
              properties:
              - property:
                  value:
                    value: EDISCD-RANLAGE
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
                    value: wnd[0]/usr/subRSLSUB:SAPLES34SUBSCREEN:0411/ctxtEDISCD-RANLAGE
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change/Display Disconnection
          properties:
          - property:
              value:
                value: EC85
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '310'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLES34
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
          last_update_time: Wednesday, 21 December 2022 4:57:42 PM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: TS310
              properties:
              - property:
                  value:
                    value: TS310
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
                    value: wnd[0]/usr/tabsTS310
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: SAPLES34TC_DISCPOS
              properties:
              - property:
                  value:
                    value: SAPLES34TC_DISCPOS
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
                    value: wnd[0]/usr/tabsTS310/tabpTAB_DOBJ/ssubTABSUB:SAPLES34:0422/tblSAPLES34TC_DISCPOS
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiTable
              name: Meter reader
              properties:
              - property:
                  value:
                    value: SAPLEL01ENTRY_SUBSCR
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
                    value: wnd[0]/usr/tabsTS310/tabpTAB_READ/ssubTABSUB:SAPLEL01:0250/tblSAPLEL01ENTRY_SUBSCR
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Disconnec. date
              properties:
              - property:
                  value:
                    value: EDISCACTS-ACTDATE
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
                    value: wnd[0]/usr/tabsTS310/tabpTAB_DOBJ/ssubTABSUB:SAPLES34:0422/ctxtEDISCACTS-ACTDATE
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Disconn. time
              properties:
              - property:
                  value:
                    value: EDISCACTS-ACTTIME
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
                    value: wnd[0]/usr/tabsTS310/tabpTAB_DOBJ/ssubTABSUB:SAPLES34:0422/ctxtEDISCACTS-ACTTIME
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Disc. doc.
              properties:
              - property:
                  value:
                    value: EDISCDOCS-DISCNO
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
                    value: wnd[0]/usr/subHAESUB:SAPLES34:0405/ctxtEDISCDOCS-DISCNO
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
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
              last_update_time: Wednesday, 21 December 2022 4:57:42 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
