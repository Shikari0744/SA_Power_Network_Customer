namespace: GoCanvasUploads
operation:
  name: ExtractMeterSerial
  inputs:
  - pdf_location: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Enerven
      Meter Testing\Bulk Upload of Go Canvas Results\2021\
  - log_file: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Enerven
      Meter Testing\Bulk Upload of Go Canvas Results\2021\Bulk Upload of Meter Testing
      Results.xlsx
  sequential_action:
    gav: com.microfocus.seq:GoCanvasUploads.ExtractMeterSerial:1.0.0
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
        object_path: ''' updated 2'
    - step:
        id: '2'
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '3'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '4'
        action: Script
        object_path: pdflocation = Parameter("pdf_location")
    - step:
        id: '5'
        action: Script
        object_path: loggingFile = Parameter("log_file")
    - step:
        id: '6'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '7'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '8'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(loggingFile)
    - step:
        id: '9'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(1)
    - step:
        id: '10'
        action: Script
        object_path: x = objSheet.UsedRange.Rows.Count
    - step:
        id: '11'
        action: Script
        object_path: '''x = 2'
    - step:
        id: '12'
        action: Script
        object_path: '''Set objFSO = CreateObject("Scripting.FileSystemObject")'
    - step:
        id: '13'
        action: Script
        object_path: '''Set objFolder = objFSO.GetFolder(pdflocation)'
    - step:
        id: '14'
        action: Script
        object_path: '''Set objSubfolder = objFolder.SubFolders'
    - step:
        id: '15'
        action: Script
        object_path: '''''get all NMIs into the excel'
    - step:
        id: '16'
        action: Script
        object_path: '''For Each subfolder in objSubfolder'
    - step:
        id: '17'
        action: Script
        object_path: "'\tSet objSubFolderMain = objFSO.GetFolder(pdflocation&subfolder.name)"
    - step:
        id: '18'
        action: Script
        object_path: "'\tSet objSheets = objSubFolderMain.Files"
    - step:
        id: '19'
        action: Script
        object_path: "'\tFor Each sheet in objSheets"
    - step:
        id: '20'
        action: Script
        object_path: "'\t\tIf subfolder.name = \"Type 5\" Then"
    - step:
        id: '21'
        action: Script
        object_path: "'\t\t\ttestSheetName = Split(sheet.name, \"_\")"
    - step:
        id: '22'
        action: Script
        object_path: "'\t\t\tnmi = testSheetName(0)"
    - step:
        id: '23'
        action: Script
        object_path: "'\t\t\tdateoftest = testSheetName(1)"
    - step:
        id: '24'
        action: Script
        object_path: "'\t\tElseIf subfolder.name = \"Type 6\" Then"
    - step:
        id: '25'
        action: Script
        object_path: "'\t\t\ttestSheetName = Split(sheet.name, \"_\")"
    - step:
        id: '26'
        action: Script
        object_path: "'\t\t\tnmi = testSheetName(3)"
    - step:
        id: '27'
        action: Script
        object_path: "'\t\t\tdateoftest = testSheetName(0) & testSheetName(1) & Right(testSheetName(2),\
          \ Len(testSheetName(2)) - 2)"
    - step:
        id: '28'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '29'
        action: Script
        object_path: "'\t\tobjSheet.cells(x,1).value = nmi"
    - step:
        id: '30'
        action: Script
        object_path: "'\t\tobjSheet.cells(x,2).value = subfolder.name"
    - step:
        id: '31'
        action: Script
        object_path: "'\t\tobjSheet.cells(x,7).value = dateoftest"
    - step:
        id: '32'
        action: Script
        object_path: "'\t\tobjSheet.cells(x,8).value = sheet.name"
    - step:
        id: '33'
        action: Script
        object_path: "'\t\tobjSheet.cells(x,9).value = pdflocation&subfolder.name&\"\
          \\\""
    - step:
        id: '34'
        action: Script
        object_path: "'\t\tx = x + 1"
    - step:
        id: '35'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '36'
        action: Script
        object_path: '''Next'
    - step:
        id: '37'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Activate
    - step:
        id: '38'
        action: Script
        object_path: '''for each NMI retrieve the material serial number'
    - step:
        id: '39'
        action: Script
        object_path: For y = 2 To x
    - step:
        id: '40'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nSE16n"'
    - step:
        id: '41'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiButton("Enter")
        action: Click
    - step:
        id: '42'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiEdit("Table")
        action: Set
        args: '"ZDM_VM_C_MEXTCT"'
    - step:
        id: '43'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiEdit("Get
          Field")
        action: SetFocus
    - step:
        id: '44'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display")
        action: SendKey
        args: F2
    - step:
        id: '45'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection
          Criteria")
        action: ClickCell
        args: 7,"Option"
    - step:
        id: '46'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose option").SAPGuiGrid("GridViewCtrl")
        action: SelectRow
        args: '1'
    - step:
        id: '47'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose option").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '48'
        action: Script
        object_path: nmi = objSheet.cells(y,1).value
    - step:
        id: '49'
        action: Script
        object_path: typeOftest = objSheet.cells(y,2).value
    - step:
        id: '50'
        action: Script
        object_path: '''if NMI is 10 digit, search for the range of 0-9'
    - step:
        id: '51'
        action: Script
        object_path: If len(nmi) = 10 Then
    - step:
        id: '52'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection
          Criteria")
        action: SetCellData
        args: 7,"Fr.Value",nmi&"0"
    - step:
        id: '53'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection
          Criteria")
        action: SetCellData
        args: 7,"To value",nmi&"9"
    - step:
        id: '54'
        action: Script
        object_path: Else
    - step:
        id: '55'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection
          Criteria")
        action: SetCellData
        args: 7,"Fr.Value",nmi
    - step:
        id: '56'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiTable("Selection
          Criteria")
        action: SetCellData
        args: 7,"To value",nmi
    - step:
        id: '57'
        action: Script
        object_path: End If
    - step:
        id: '58'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiButton("Online   (F8)")
        action: Click
    - step:
        id: '59'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Enter Parameter Values").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '60'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '61'
        action: Script
        object_path: If typeOftest = "Type 5" Then
    - step:
        id: '62'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiStatusBar("StatusBar").Exist(3)
          Then
    - step:
        id: '63'
        object_path: objSheet.cells(y,3)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '64'
        object_path: objSheet.cells(y,4)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '65'
        object_path: objSheet.cells(y,5)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '66'
        object_path: objWorkbook
        action: Save
    - step:
        id: '67'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '68'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display")
        action: SendKey
        args: ENTER
    - step:
        id: '69'
        action: Script
        object_path: Else
    - step:
        id: '70'
        action: Script
        object_path: 'tableRow = SAPGuiSession("Session").SAPGuiWindow("ZDM_VM_C_MEXTCT:
          Display").SAPGuiGrid("GridViewCtrl").RowCount'
    - step:
        id: '71'
        action: Script
        object_path: If tableRow = "" or tableRow = 0 Then
    - step:
        id: '72'
        object_path: objSheet.cells(y,3)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '73'
        object_path: objSheet.cells(y,4)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '74'
        object_path: objSheet.cells(y,5)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '75'
        action: Script
        object_path: Else
    - step:
        id: '76'
        action: Script
        object_path: For r = 1 To tableRow
    - step:
        id: '77'
        action: Script
        object_path: 'extract = SAPGuiSession("Session").SAPGuiWindow("ZDM_VM_C_MEXTCT:
          Display").SAPGuiGrid("GridViewCtrl").GetCellData(r, "STOCKDETAILS")'
    - step:
        id: '78'
        action: Script
        object_path: If InStr(extract,"CTB") Then
    - step:
        id: '79'
        object_path: objSheet.cells(y,3)
        action: value
        args: = extract
    - step:
        id: '80'
        action: Script
        object_path: End If
    - step:
        id: '81'
        action: Script
        object_path: If InStr(extract,"CTR") Then
    - step:
        id: '82'
        object_path: objSheet.cells(y,4)
        action: value
        args: = extract
    - step:
        id: '83'
        action: Script
        object_path: End If
    - step:
        id: '84'
        action: Script
        object_path: If InStr(extract,"CTW") Then
    - step:
        id: '85'
        object_path: objSheet.cells(y,5)
        action: value
        args: = extract
    - step:
        id: '86'
        action: Script
        object_path: End If
    - step:
        id: '87'
        action: Script
        object_path: If r = tableRow and objSheet.cells(y,3).value = "" and objSheet.cells(y,4).value
          = "" and objSheet.cells(y,5).value = "" Then
    - step:
        id: '88'
        object_path: objSheet.cells(y,3)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '89'
        object_path: objSheet.cells(y,4)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '90'
        object_path: objSheet.cells(y,5)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '91'
        action: Script
        object_path: End If
    - step:
        id: '92'
        action: Script
        object_path: Next
    - step:
        id: '93'
        action: Script
        object_path: End If
    - step:
        id: '94'
        object_path: objWorkbook
        action: Save
    - step:
        id: '95'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("ZDM_VM_C_MEXTCT: Display").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n"'
    - step:
        id: '96'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("ZDM_VM_C_MEXTCT: Display")'
        action: SendKey
        args: ENTER
    - step:
        id: '97'
        action: Script
        object_path: End If
    - step:
        id: '98'
        action: Script
        object_path: ElseIf typeOftest = "Type 6" Then
    - step:
        id: '99'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiStatusBar("StatusBar").Exist(3)
          Then
    - step:
        id: '100'
        object_path: objSheet.cells(y,6)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '101'
        object_path: objWorkbook
        action: Save
    - step:
        id: '102'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '103'
        object_path: SAPGuiSession("Session").SAPGuiWindow("General Table Display")
        action: SendKey
        args: ENTER
    - step:
        id: '104'
        action: Script
        object_path: Else
    - step:
        id: '105'
        action: Script
        object_path: 'tableRow = SAPGuiSession("Session").SAPGuiWindow("ZDM_VM_C_MEXTCT:
          Display").SAPGuiGrid("GridViewCtrl").RowCount'
    - step:
        id: '106'
        action: Script
        object_path: If tableRow = "" or tableRow = 0 Then
    - step:
        id: '107'
        object_path: objSheet.cells(y,6)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '108'
        object_path: objWorkbook
        action: Save
    - step:
        id: '109'
        action: Script
        object_path: Else
    - step:
        id: '110'
        action: Script
        object_path: For r = 1 To tableRow
    - step:
        id: '111'
        action: Script
        object_path: 'extract = SAPGuiSession("Session").SAPGuiWindow("ZDM_VM_C_MEXTCT:
          Display").SAPGuiGrid("GridViewCtrl").GetCellData(r, "STOCKDETAILS")'
    - step:
        id: '112'
        action: Script
        object_path: If InStr(extract,"YA") or InStr(extract,"YS") or InStr(extract,"YC")
          Then
    - step:
        id: '113'
        object_path: objSheet.cells(y,6)
        action: value
        args: = extract
    - step:
        id: '114'
        action: Script
        object_path: End If
    - step:
        id: '115'
        action: Script
        object_path: If r = tableRow and objSheet.cells(y,6).value = "" Then
    - step:
        id: '116'
        object_path: objSheet.cells(y,6)
        action: value
        args: = "NOT FOUND"
    - step:
        id: '117'
        action: Script
        object_path: End If
    - step:
        id: '118'
        action: Script
        object_path: Next
    - step:
        id: '119'
        action: Script
        object_path: End If
    - step:
        id: '120'
        object_path: objWorkbook
        action: Save
    - step:
        id: '121'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("ZDM_VM_C_MEXTCT: Display").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n"'
    - step:
        id: '122'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("ZDM_VM_C_MEXTCT: Display")'
        action: SendKey
        args: ENTER
    - step:
        id: '123'
        action: Script
        object_path: End If
    - step:
        id: '124'
        action: Script
        object_path: End If
    - step:
        id: '125'
        action: Script
        object_path: Next
    - step:
        id: '126'
        object_path: objWorkbook
        action: Save
    - step:
        id: '127'
        object_path: objWorkbook
        action: Close
    - step:
        id: '128'
        object_path: objExcel
        action: Quit
    - step:
        id: '129'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '130'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '131'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '132'
        action: Script
        object_path: ExitTest
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
      last_update_time: Friday, 10 February 2023 6:18:00 PM
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
      last_update_time: Friday, 10 February 2023 6:18:00 PM
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back   (F3)
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Choose option
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
                value: '500'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSLVC_ITEM_SELECTION
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
          child_objects:
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
                    value: wnd[1]/usr/cntlGRID/shellcont/shell
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
          last_update_time: Friday, 10 February 2023 6:18:00 PM
          child_objects:
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
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
              last_update_time: Friday, 10 February 2023 6:18:00 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
