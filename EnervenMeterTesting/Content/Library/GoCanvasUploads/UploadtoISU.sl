namespace: GoCanvasUploads
operation:
  name: UploadtoISU
  inputs:
  - log_file: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Enerven
      Meter Testing\Bulk Upload of Go Canvas Results\2021\Bulk Upload of Meter Testing
      Results.xlsx
  sequential_action:
    gav: com.microfocus.seq:GoCanvasUploads.UploadtoISU:1.0.0
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
        object_path: loggingFile = Parameter("log_file")
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
        object_path: Set objWorkbook = objExcel.Workbooks.open(loggingFile)
    - step:
        id: '5'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(1)
    - step:
        id: '6'
        action: Script
        object_path: count = objSheet.UsedRange.Rows.Count
    - step:
        id: '7'
        action: Script
        object_path: For x = 2 To count
    - step:
        id: '8'
        action: Script
        object_path: check = objSheet.cells(x,10).value
    - step:
        id: '9'
        action: Script
        object_path: If check = "" Then
    - step:
        id: '10'
        action: Script
        object_path: nmi = objSheet.cells(x,1).value
    - step:
        id: '11'
        action: Script
        object_path: testType = objSheet.cells(x,2).value
    - step:
        id: '12'
        action: Script
        object_path: ctb = objSheet.cells(x,3).value
    - step:
        id: '13'
        action: Script
        object_path: ctr = objSheet.cells(x,4).value
    - step:
        id: '14'
        action: Script
        object_path: ctw = objSheet.cells(x,5).value
    - step:
        id: '15'
        action: Script
        object_path: meterserial = objSheet.cells(x,6).value
    - step:
        id: '16'
        action: Script
        object_path: dateoftest = objSheet.cells(x,7).value
    - step:
        id: '17'
        action: Script
        object_path: pdfname = objSheet.cells(x,8).value
    - step:
        id: '18'
        action: Script
        object_path: location = objSheet.cells(x,9).value
    - step:
        id: '19'
        action: Script
        object_path: If testType = "Type 5" Then
    - step:
        id: '20'
        action: Script
        object_path: Call UploadPDF(ctb, nmi, dateoftest, pdfname, location, x)
    - step:
        id: '21'
        action: Script
        object_path: Call UploadPDF(ctr, nmi, dateoftest, pdfname, location, x)
    - step:
        id: '22'
        action: Script
        object_path: Call UploadPDF(ctw, nmi, dateoftest, pdfname, location, x)
    - step:
        id: '23'
        action: Script
        object_path: ElseIf testType = "Type 6" Then
    - step:
        id: '24'
        action: Script
        object_path: Call UploadPDF(meterserial, nmi, dateoftest, pdfname, location,
          x)
    - step:
        id: '25'
        action: Script
        object_path: End If
    - step:
        id: '26'
        action: Script
        object_path: End If
    - step:
        id: '27'
        action: Script
        object_path: Next
    - step:
        id: '28'
        object_path: objWorkbook
        action: Close
    - step:
        id: '29'
        object_path: objExcel
        action: Quit
    - step:
        id: '30'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '31'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '32'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '33'
        action: Script
        object_path: Function UploadPDF(meterserial, nmi, dateoftest, name, location,
          row)
    - step:
        id: '34'
        action: Script
        object_path: If meterserial = "" Then
    - step:
        id: '35'
        action: Script
        object_path: t = objSheet.cells(row,10).value
    - step:
        id: '36'
        object_path: objSheet.cells(row,10)
        action: value
        args: = t & "- "
    - step:
        id: '37'
        action: Script
        object_path: ElseIf InStr(meterserial,"NOT") Then
    - step:
        id: '38'
        action: Script
        object_path: t = objSheet.cells(row,10).value
    - step:
        id: '39'
        object_path: objSheet.cells(row,10)
        action: value
        args: = t & "N "
    - step:
        id: '40'
        action: Script
        object_path: Else
    - step:
        id: '41'
        action: Script
        object_path: info = Split(meterserial,"/")
    - step:
        id: '42'
        action: Script
        object_path: material = info(0)
    - step:
        id: '43'
        action: Script
        object_path: serial = info(1)
    - step:
        id: '44'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Activate
    - step:
        id: '45'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Maximize
    - step:
        id: '46'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIQ02"'
    - step:
        id: '47'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiButton("Enter")
        action: Click
    - step:
        id: '48'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Material")
        action: Set
        args: material
    - step:
        id: '49'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Serial
          Number")
        action: Set
        args: serial
    - step:
        id: '50'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Serial
          Number")
        action: SetFocus
    - step:
        id: '51'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '52'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiStatusBar("StatusBar").Exist(3)
          Then
    - step:
        id: '53'
        action: Script
        object_path: t = objSheet.cells(row,10).value
    - step:
        id: '54'
        object_path: objSheet.cells(row,10)
        action: value
        args: = t & "N "
    - step:
        id: '55'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '56'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '57'
        action: Script
        object_path: Else
    - step:
        id: '58'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Documents"'
    - step:
        id: '59'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiToolbar("GridToolbar")
        action: PressButton
        args: '"ICON_CREATE"'
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '-1'
    - step:
        id: '60'
        action: Script
        object_path: If len(dateoftest) = 5 Then
    - step:
        id: '61'
        action: Script
        object_path: testdate = "0"&dateoftest
    - step:
        id: '62'
        action: Script
        object_path: Else
    - step:
        id: '63'
        action: Script
        object_path: testdate = dateoftest
    - step:
        id: '64'
        action: Script
        object_path: End If
    - step:
        id: '65'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiEdit("Description")
        action: Set
        args: material & " " & serial & " " & nmi & " " & testdate
        snapshot: .\Snapshots\ssf12.png
        highlight_id: '7'
    - step:
        id: '66'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '67'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("Directory")
        action: Set
        args: location
    - step:
        id: '68'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("File
          Name")
        action: Set
        args: pdfname
        snapshot: .\Snapshots\ssf13.png
        highlight_id: '5'
    - step:
        id: '69'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '70'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiButton("Save")
        action: Click
    - step:
        id: '71'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '72'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '73'
        action: Script
        object_path: t = objSheet.cells(row,10).value
    - step:
        id: '74'
        object_path: objSheet.cells(row,10)
        action: value
        args: = t & "Y "
    - step:
        id: '75'
        action: Script
        object_path: End If
    - step:
        id: '76'
        action: Script
        object_path: End If
    - step:
        id: '77'
        object_path: objWorkbook
        action: Save
    - step:
        id: '78'
        action: Script
        object_path: End Function
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
      last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
      last_update_time: Tuesday, 14 February 2023 9:10:09 AM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: 'ZDM_VM_C_MEXTCT: Display'
          properties:
          - property:
              value:
                value: SE16N
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
                value: SAPLSE16N
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
                    value: wnd[0]/usr/cntlRESULT_LIST/shellcont/shell
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Open File
          properties:
          - property:
              value:
                value: IQ02
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
                value: SAPLSFES
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: File Name
              properties:
              - property:
                  value:
                    value: DY_FILENAME
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
                    value: wnd[1]/usr/ctxtDY_FILENAME
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Directory
              properties:
              - property:
                  value:
                    value: DY_PATH
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
                    value: wnd[1]/usr/ctxtDY_PATH
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: General Table Display
          properties:
          - property:
              value:
                value: SE16N
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
                value: SAPLSE16N
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
          child_objects:
          - object:
              class: SAPGuiTable
              name: Selection Criteria
              properties:
              - property:
                  value:
                    value: SAPLSE16NSELFIELDS_TC
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
                    value: wnd[0]/usr/tblSAPLSE16NSELFIELDS_TC
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Table
              properties:
              - property:
                  value:
                    value: GD-TAB
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
                    value: wnd[0]/usr/ctxtGD-TAB
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Get Field
              properties:
              - property:
                  value:
                    value: GD_ADD_COLUMN
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
                    value: wnd[0]/usr/ctxtGD_ADD_COLUMN
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Online   (F8)
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Enter Parameter Values
          properties:
          - property:
              value:
                value: SE16N
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Document: Basic'
          properties:
          - property:
              value:
                value: CV03N
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '101'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLCV110
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
          child_objects:
          - object:
              class: SAPGuiTree
              name: TableTreeControl
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
                    value: SAPGuiTree
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '200'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/tabsTAB_MAIN/tabpTSMAIN/ssubSCR_MAIN:SAPLCV110:0102/cntlCTL_FILES1/shellcont/shell/shellcont[1]/shell
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Display <-> Change   (Shift+F8
              properties:
              - property:
                  value:
                    value: btn[20]
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
                    value: wnd[0]/tbar[1]/btn[20]
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Material Serial_3
          properties:
          - property:
              value:
                value: IQ02
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Description
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
                    value: '31'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/sub:SAPLSPO4:0300/txtSVALD-VALUE[1,21]
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Material Serial_2
          properties:
          - property:
              value:
                value: IQ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '101'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMIEQ0
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
                    value: usr/tabsTABSTRIP/tabpT\06/ssubSUB_DATA:SAPLITO0:0109/subSUB_0109A:SAPLITO0:1100/subSUB_1100A:SAPLCV140:0204/subDOC_ALV:SAPLCV140:0206/cntlALV_CUST_DOC/shellcont/shell
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
                    value: wnd[0]/usr/tabsTABSTRIP/tabpT\06/ssubSUB_DATA:SAPLITO0:0109/subSUB_0109A:SAPLITO0:1100/subSUB_1100A:SAPLCV140:0204/subDOC_ALV:SAPLCV140:0206/cntlALV_CUST_DOC/shellcont/shell
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Material Serial
          properties:
          - property:
              value:
                value: IQ02
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
                value: SAPMIEQ0
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
          last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Serial Number
              properties:
              - property:
                  value:
                    value: RISA0-SERNR
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
                    value: wnd[0]/usr/ctxtRISA0-SERNR
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Material
              properties:
              - property:
                  value:
                    value: RISA0-MATNR
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
                    value: wnd[0]/usr/ctxtRISA0-MATNR
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
              last_update_time: Tuesday, 14 February 2023 9:10:09 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
