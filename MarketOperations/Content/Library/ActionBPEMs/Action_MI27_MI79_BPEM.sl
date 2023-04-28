namespace: ActionBPEMs
operation:
  name: Action_MI27_MI79_BPEM
  inputs:
  - fileName: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\Action BPEMs\Actioned_MI27_MI79_BPEM_19112022_11627_AM.xlsx
  - originalDate:
      required: false
  sequential_action:
    gav: com.microfocus.seq:ActionBPEMs.Action_MI27_MI79_BPEM:1.0.0
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
        object_path: '''Input parameters'
    - step:
        id: '2'
        action: Script
        object_path: fname = Parameter("fileName")
    - step:
        id: '3'
        action: Script
        object_path: '''Open excel document'
    - step:
        id: '4'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '5'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '6'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(fname)
    - step:
        id: '7'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("Sheet1")
    - step:
        id: '8'
        action: Script
        object_path: excelRow = objSheet.usedrange.Rows.Count + 1
    - step:
        id: '9'
        action: Script
        object_path: '''Enter "emmacl" TCode'
    - step:
        id: '10'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/o/IDXGC/PDOCMON02"'
    - step:
        id: '11'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: Enter
    - step:
        id: '12'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '13'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nemmacl"'
    - step:
        id: '14'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: Enter
    - step:
        id: '15'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '16'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List")
        action: Highlight
    - step:
        id: '17'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiButton("Multiple
          selection")
        action: Click
    - step:
        id: '18'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '19'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTable("SAPLALDBSINGLE")
        action: SetCellData
        args: 1,"Single value","MI27"
    - step:
        id: '20'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTable("SAPLALDBSINGLE")
        action: SetCellData
        args: 2,"Single value","MI79"
    - step:
        id: '21'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Check
          entries   (Enter)")
        action: Click
    - step:
        id: '23'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Copy   (F8)")
        action: Click
    - step:
        id: '25'
        action: Script
        object_path: '''Enter required Filters and execute'
    - step:
        id: '26'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '27'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("ProcessingStatus_From")
        action: Set
        args: '"1"'
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("ProcessingStatus_To")
        action: Set
        args: '"1"'
    - step:
        id: '29'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '30'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("Maximum
          No. of Hits")
        action: Set
        args: '""'
    - step:
        id: '31'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("Autom.
          Update Up to Max.")
        action: Set
        args: '""'
    - step:
        id: '32'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '33'
        action: Script
        object_path: If Parameter("originalDate") <> "" Then
    - step:
        id: '34'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("Original
          Date/Time")
        action: Set
        args: Replace(Parameter("originalDate"), "/", ".")
    - step:
        id: '35'
        action: Script
        object_path: End If
    - step:
        id: '36'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiButton("Execute")
        action: Click
    - step:
        id: '37'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Clarification Case
          List").SAPGuiStatusBar("No BPEMs Found").Exist(1) Then
    - step:
        id: '38'
        object_path: objSheet.cells(2,2)
        action: value
        args: = "No BPEM's found"
    - step:
        id: '39'
        object_path: objWorkbook
        action: save
    - step:
        id: '40'
        object_path: objWorkbook
        action: close
    - step:
        id: '41'
        object_path: objExcel
        action: Quit
    - step:
        id: '42'
        object_path: Reporter
        action: ReportEvent
        args: micPass, "No BPEM's found", "No BPEM's found"
    - step:
        id: '43'
        action: Script
        object_path: ExitTest
    - step:
        id: '44'
        action: Script
        object_path: End If
    - step:
        id: '45'
        action: Script
        object_path: '''Get total number of rows displayed'
    - step:
        id: '46'
        action: Script
        object_path: bpemRowsCnt = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '47'
        action: Script
        object_path: Parameter("bpemRowsCnt") = bpemRowsCnt
    - step:
        id: '48'
        action: Script
        object_path: completedBpems = 0
    - step:
        id: '49'
        action: Script
        object_path: For bpemRows = 1 to bpemRowsCnt
    - step:
        id: '50'
        action: Script
        object_path: '''Click on each BPEM'
    - step:
        id: '51'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List_2")
        action: Highlight
    - step:
        id: '52'
        action: Script
        object_path: CaseID = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").GetCellData(bpemRows,"Case")
    - step:
        id: '53'
        action: Script
        object_path: NMI = SAPGuiSession("Session").SAPGuiWindow("Clarification Case
          List_2").SAPGuiGrid("GridViewCtrl").GetCellData(bpemRows,"NMI")
    - step:
        id: '54'
        action: Script
        object_path: CaseStatus = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").GetCellData(bpemRows,"Status")
    - step:
        id: '55'
        action: Script
        object_path: ThrdPartyServProv = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").GetCellData(bpemRows,"Thrd Party
          ServProv.")
    - step:
        id: '56'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '57'
        action: Script
        object_path: If CaseStatus = "New" Then
    - step:
        id: '58'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List_2").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: bpemRows,"Case"
    - step:
        id: '59'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '60'
        action: Script
        object_path: OriginalDate = Trim(SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiEdit("Original Date").GetROProperty("value"))
    - step:
        id: '61'
        action: Script
        object_path: OriginalTimeStamp = Trim(SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiEdit("Original Date_2").GetROProperty("value"))
    - step:
        id: '62'
        action: Script
        object_path: '''Sample NMI process'
    - step:
        id: '63'
        action: Script
        object_path: objRowCnt = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '64'
        action: Script
        object_path: For objRows = 1 to objRowCnt
    - step:
        id: '65'
        action: Script
        object_path: shortDesc = trim(SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(objRows, "Short Description"))
    - step:
        id: '66'
        action: Script
        object_path: If lcase(shortDesc) = "utility installation" Then
    - step:
        id: '67'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: objRows,"Key"
    - step:
        id: '68'
        action: Script
        object_path: Exit For
    - step:
        id: '69'
        action: Script
        object_path: End If
    - step:
        id: '70'
        action: Script
        object_path: Next
    - step:
        id: '71'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '72'
        action: Script
        object_path: '''If Inst Type = SMPL, Cancel PDoc'
    - step:
        id: '73'
        action: Script
        object_path: instType = SAPGuiSession("Session").SAPGuiWindow("Display Installation:").SAPGuiEdit("Inst.
          type").GetROProperty("value")
    - step:
        id: '74'
        action: Script
        object_path: If instType = "SMPL" Then
    - step:
        id: '75'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '76'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
    - step:
        id: '77'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '78'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Edit")
        action: Click
    - step:
        id: '79'
        action: Script
        object_path: procsStepRow = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Name","Cancel
          PDoc processing")
    - step:
        id: '80'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '81'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: procsStepRow, "Icon"
    - step:
        id: '82'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '83'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '84'
        action: Script
        object_path: actionUser = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "User Name")
    - step:
        id: '85'
        action: Script
        object_path: actionDate = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Date")
    - step:
        id: '86'
        action: Script
        object_path: actionTime = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Time")
    - step:
        id: '87'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Notes"'
    - step:
        id: '88'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '89'
        action: Script
        object_path: existingText = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '90'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '91'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTextArea("TextAreaControl")
        action: Set
        args: 'actionDate & " " & actionTime & " " & actionUser & ":  " & "CSDN not
          required for Sample NMI, cancelled pdoc processing" + vbCr + existingText'
    - step:
        id: '92'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '93'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("*Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '94'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '95'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '96'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '97'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save")
        action: Click
    - step:
        id: '98'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '99'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '100'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '101'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '102'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '103'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '104'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "CSDN not required for Sample NMI, cancelled pdoc processing"
    - step:
        id: '105'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '106'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '107'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '108'
        object_path: objWorkbook
        action: save
    - step:
        id: '109'
        action: Script
        object_path: Else
    - step:
        id: '110'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '111'
        action: Script
        object_path: '''Click on the Process Doc. Link'
    - step:
        id: '112'
        action: Script
        object_path: objRowCnt = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '113'
        action: Script
        object_path: For objRows = 1 to objRowCnt
    - step:
        id: '114'
        action: Script
        object_path: shortDesc = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(objRows,
          "Short Description")
    - step:
        id: '115'
        action: Script
        object_path: If shortDesc = "Process Doc." Then
    - step:
        id: '116'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: objRows,"Key"
    - step:
        id: '117'
        action: Script
        object_path: Exit For
    - step:
        id: '118'
        action: Script
        object_path: End If
    - step:
        id: '119'
        action: Script
        object_path: Next
    - step:
        id: '120'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '121'
        action: Script
        object_path: businessPartnerText = SAPGuiSession("Session").SAPGuiWindow("Display
          Process Document").SAPGuiEdit("Business Partner").GetROProperty("value")
    - step:
        id: '122'
        action: Script
        object_path: businessPartnerText = LCase(businessPartnerText)
    - step:
        id: '123'
        action: Script
        object_path: PoD = Trim(SAPGuiSession("Session").SAPGuiWindow("Display Process
          Document").SAPGuiEdit("Point of Delivery ID").GetROProperty("value"))
    - step:
        id: '124'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document").SAPGuiTabStrip("TABSTRIP_SWITCH")
        action: Select
        args: '"Add. Header Data"'
    - step:
        id: '125'
        action: Script
        object_path: ThrdPartyServProv = SAPGuiSession("Session").SAPGuiWindow("Display
          Process Document").SAPGuiGrid("GridViewCtrl").GetCellData(1,"Thrd Party
          ServProv.")
    - step:
        id: '126'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document").SAPGuiEdit("Point
          of Delivery ID")
        action: SetFocus
    - step:
        id: '127'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document")
        action: SendKey
        args: F2
    - step:
        id: '128'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiTabStrip("TABSTRIP_UI")
        action: Select
        args: '"Supply Scenario"'
    - step:
        id: '129'
        action: Script
        object_path: Rows = SAPGuiSession("Session").SAPGuiWindow("Display point of
          delivery:").SAPGuiGrid("PoD ID").RowCount
    - step:
        id: '130'
        action: Script
        object_path: For i = 1 To Rows
    - step:
        id: '131'
        action: Script
        object_path: ServiceType = Trim(SAPGuiSession("Session").SAPGuiWindow("Display
          point of delivery:").SAPGuiGrid("PoD ID").GetCellData(i,"Service Type"))
    - step:
        id: '132'
        action: Script
        object_path: If ServiceType = "FRMP" Then
    - step:
        id: '133'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiGrid("PoD
          ID")
        action: SelectCell
        args: i,"Service Provider"
    - step:
        id: '134'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiGrid("PoD
          ID")
        action: ClickCell
        args: i,"Service Provider"
    - step:
        id: '135'
        action: Script
        object_path: ServiceProvider = Trim(SAPGuiSession("Session").SAPGuiWindow("Display
          Service Provider").SAPGuiEdit("External Number").GetROProperty("value"))
    - step:
        id: '136'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Provider").SAPGuiButton("Back")
        action: Click
    - step:
        id: '137'
        action: Script
        object_path: Exit For
    - step:
        id: '138'
        action: Script
        object_path: End If
    - step:
        id: '139'
        action: Script
        object_path: Next
    - step:
        id: '140'
        action: Script
        object_path: If LCase(ServiceProvider) = LCase(ThrdPartyServProv) Then
    - step:
        id: '141'
        action: Script
        object_path: Flag = True
    - step:
        id: '142'
        action: Script
        object_path: Else
    - step:
        id: '143'
        action: Script
        object_path: Flag = False
    - step:
        id: '144'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '145'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document").SAPGuiButton("Back")
        action: Click
    - step:
        id: '146'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
    - step:
        id: '147'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '148'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Edit")
        action: Click
    - step:
        id: '149'
        action: Script
        object_path: procsStepRow = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Name","Cancel
          PDoc processing")
    - step:
        id: '150'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '151'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: procsStepRow, "Icon"
    - step:
        id: '152'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '153'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '154'
        action: Script
        object_path: actionUser = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "User Name")
    - step:
        id: '155'
        action: Script
        object_path: actionDate = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Date")
    - step:
        id: '156'
        action: Script
        object_path: actionTime = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Time")
    - step:
        id: '157'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Notes"'
    - step:
        id: '158'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '159'
        action: Script
        object_path: existingText = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '160'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '161'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTextArea("TextAreaControl")
        action: Set
        args: 'actionDate & " " & actionTime & " " & actionUser & ":  " & "CSDN for
          incorrect FRMP, cancelled pdoc processing" + vbCr + existingText'
    - step:
        id: '162'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '163'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("*Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '164'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '165'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '166'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '167'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save")
        action: Click
    - step:
        id: '168'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '169'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '170'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '171'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '172'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '173'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '174'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "CSDN for incorrect FRMP, cancelled pdoc processing"
    - step:
        id: '175'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '176'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '177'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '178'
        object_path: objWorkbook
        action: save
    - step:
        id: '179'
        action: Script
        object_path: End If
    - step:
        id: '180'
        action: Script
        object_path: If Flag = True Then
    - step:
        id: '181'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display point of delivery:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '182'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '183'
        action: Script
        object_path: business = SAPGuiSession("Session").SAPGuiWindow("Display Process
          Document").SAPGuiEdit("Business Partner_2").GetROProperty("value")
    - step:
        id: '184'
        action: Script
        object_path: If business = "" Then
    - step:
        id: '185'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '186'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '187'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '188'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "Business Partner field is empty. Manual Investigation Required"
    - step:
        id: '189'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '190'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '191'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '192'
        object_path: objWorkbook
        action: save
    - step:
        id: '193'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document").SAPGuiButton("Back")
        action: Click
    - step:
        id: '194'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Back")
        action: Click
    - step:
        id: '195'
        action: Script
        object_path: Else
    - step:
        id: '196'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document").SAPGuiEdit("Business
          Partner_2")
        action: SetFocus
    - step:
        id: '197'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document")
        action: SendKey
        args: F2
    - step:
        id: '198'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '199'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Organization:").SAPGuiTabStrip("GS_SCREEN_1100_TABSTRIP")
        action: Select
        args: '"Identification"'
    - step:
        id: '200'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '201'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Organization:").SAPGuiComboBox("*Display
          in BP role")
        action: Select
        args: '"Contract Partner"'
    - step:
        id: '202'
        args: '"1"'
        object_path: '''Wait 1'
        action: Script
    - step:
        id: '203'
        action: Script
        object_path: '''On Error Resume Next'
    - step:
        id: '204'
        action: Script
        object_path: customerType = SAPGuiSession("Session").SAPGuiWindow("Display
          Organization:").SAPGuiEdit("Account Class").GetROProperty("value")
    - step:
        id: '205'
        action: Script
        object_path: customerType = LCase(Trim(customerType))
    - step:
        id: '206'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Organization:").SAPGuiButton("Back")
        action: Click
    - step:
        id: '207'
        action: Script
        object_path: '''Set regex = New regExp'
    - step:
        id: '208'
        object_path: '''regex'
        action: Pattern
        args: = "^[a-z|A-Z] [a-z|A-Z]$|^[a-z|A-Z] \w+$|^\w+ [a-z|A-Z]$"
    - step:
        id: '209'
        object_path: '''regex'
        action: Global
        args: = True
    - step:
        id: '210'
        action: Script
        object_path: '''nameCheck = regex.Test(businessPartnerText)'
    - step:
        id: '211'
        action: Script
        object_path: '''Set regex = NOTHING'
    - step:
        id: '212'
        action: Script
        object_path: If InStr(businessPartnerText,"occupant") > 0 Then
    - step:
        id: '213'
        action: Script
        object_path: NextFlag = True
    - step:
        id: '214'
        action: Script
        object_path: ElseIf InStr(businessPartnerText,"occupier") > 0 Then
    - step:
        id: '215'
        action: Script
        object_path: NextFlag = True
    - step:
        id: '216'
        action: Script
        object_path: ElseIf InStr(businessPartnerText,"consumer") > 0 Then
    - step:
        id: '217'
        action: Script
        object_path: NextFlag = True
    - step:
        id: '218'
        action: Script
        object_path: ElseIf InStr(businessPartnerText,"site vacant") > 0 Then
    - step:
        id: '219'
        action: Script
        object_path: NextFlag = True
    - step:
        id: '220'
        action: Script
        object_path: ElseIf InStr(businessPartnerText,"energy consumer") > 0 Then
    - step:
        id: '221'
        action: Script
        object_path: NextFlag = True
    - step:
        id: '222'
        action: Script
        object_path: ElseIf InStr(businessPartnerText,"energy consuemr") > 0 Then
    - step:
        id: '223'
        action: Script
        object_path: NextFlag = True
    - step:
        id: '224'
        action: Script
        object_path: ElseIf InStr(businessPartnerText,"energy customer") > 0 Then
    - step:
        id: '225'
        action: Script
        object_path: NextFlag = True
    - step:
        id: '226'
        action: Script
        object_path: ElseIf InStr(businessPartnerText,"energy") > 0 And customerType
          = "residential" Then
    - step:
        id: '227'
        action: Script
        object_path: NextFlag = True
    - step:
        id: '228'
        action: Script
        object_path: '''ElseIf nameCheck Then'
    - step:
        id: '229'
        action: Script
        object_path: '''NextFlag = True'
    - step:
        id: '230'
        action: Script
        object_path: Else
    - step:
        id: '231'
        action: Script
        object_path: NextFlag = False
    - step:
        id: '232'
        action: Script
        object_path: End If
    - step:
        id: '233'
        action: Script
        object_path: If NextFlag = True Then
    - step:
        id: '234'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document").SAPGuiButton("Back")
        action: Click
    - step:
        id: '235'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
    - step:
        id: '236'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '237'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Edit")
        action: Click
    - step:
        id: '238'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '239'
        action: Script
        object_path: procsStepRow = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Name","Repeat
          previous process steps")
    - step:
        id: '240'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '241'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: procsStepRow, "Icon"
    - step:
        id: '242'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '243'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '244'
        action: Script
        object_path: actionUser = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "User Name")
    - step:
        id: '245'
        action: Script
        object_path: actionDate = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Date")
    - step:
        id: '246'
        action: Script
        object_path: actionTime = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Time")
    - step:
        id: '247'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Notes"'
    - step:
        id: '248'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '249'
        action: Script
        object_path: existingText = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '250'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '251'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTextArea("TextAreaControl")
        action: Set
        args: 'actionDate & " " & actionTime & " " & actionUser & ":  " & "Invalid
          customer name, CSDN reissued" + vbCr + existingText'
    - step:
        id: '252'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '253'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("*Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '254'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '255'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '256'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '257'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save")
        action: Click
    - step:
        id: '258'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '259'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '260'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '261'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '262'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '263'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '264'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "Invalid customer name, CSDN reissued"
    - step:
        id: '265'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '266'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '267'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '268'
        object_path: objWorkbook
        action: save
    - step:
        id: '269'
        action: Script
        object_path: ElseIf NextFlag = False Then
    - step:
        id: '270'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Process Document").SAPGuiButton("Back")
        action: Click
    - step:
        id: '271'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process")
        action: Highlight
    - step:
        id: '272'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process").SAPGuiEdit("Maximum
          Number")
        action: Set
        args: '""'
    - step:
        id: '273'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process").SAPGuiEdit("External
          Key for PoD")
        action: Set
        args: PoD
    - step:
        id: '274'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process").SAPGuiEdit("Process
          Group")
        action: Set
        args: '"CSDN"'
    - step:
        id: '275'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process").SAPGuiEdit("Process")
        action: Set
        args: '"CUSTDET"'
    - step:
        id: '276'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process").SAPGuiButton("Execute")
        action: Click
    - step:
        id: '277'
        action: Script
        object_path: If SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process").SAPGuiButton("Execute").Exist(0)
          Then
    - step:
        id: '278'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process").SAPGuiButton("Execute")
        action: Click
    - step:
        id: '279'
        action: Script
        object_path: End If
    - step:
        id: '280'
        action: Script
        object_path: If SAPGuiSession("Session_2").SAPGuiWindow("Number of Hits").SAPGuiGrid("GridViewCtrl").Exist(0)
          Then
    - step:
        id: '281'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Number of Hits").SAPGuiGrid("GridViewCtrl")
        action: SelectColumn
        args: '"Process Time Stamp"'
    - step:
        id: '282'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Number of Hits").SAPGuiButton("Sort
          in Descending Order")
        action: Click
    - step:
        id: '283'
        action: Script
        object_path: Rows = SAPGuiSession("Session_2").SAPGuiWindow("Number of Hits").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '284'
        action: Script
        object_path: For i = 1 To Rows
    - step:
        id: '285'
        action: Script
        object_path: StatusDescription = SAPGuiSession("Session_2").SAPGuiWindow("Number
          of Hits").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Status Description")
    - step:
        id: '286'
        action: Script
        object_path: ProcessTimeStampNTF = Replace(SAPGuiSession("Session_2").SAPGuiWindow("Number
          of Hits").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Process Time Stamp"),".","/")
    - step:
        id: '287'
        action: Script
        object_path: SubProcess = SAPGuiSession("Session_2").SAPGuiWindow("Number
          of Hits").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Sub Process")
    - step:
        id: '288'
        action: Script
        object_path: If LCase(StatusDescription) = "completed" Then
    - step:
        id: '289'
        action: Script
        object_path: If  LCase(SubProcess) = "ntf" Or  LCase(SubProcess) = "req"  Then
    - step:
        id: '290'
        action: Script
        object_path: Exit For
    - step:
        id: '291'
        action: Script
        object_path: Else
    - step:
        id: '292'
        action: Script
        object_path: StatusDescription = EMPTY
    - step:
        id: '293'
        action: Script
        object_path: ProcessTimeStampNTF = EMPTY
    - step:
        id: '294'
        action: Script
        object_path: SubProcess = EMPTY
    - step:
        id: '295'
        action: Script
        object_path: End If
    - step:
        id: '296'
        action: Script
        object_path: Else
    - step:
        id: '297'
        action: Script
        object_path: StatusDescription = EMPTY
    - step:
        id: '298'
        action: Script
        object_path: ProcessTimeStampNTF = EMPTY
    - step:
        id: '299'
        action: Script
        object_path: SubProcess = EMPTY
    - step:
        id: '300'
        action: Script
        object_path: End If
    - step:
        id: '301'
        action: Script
        object_path: Next
    - step:
        id: '302'
        action: Script
        object_path: For i = 1 To Rows
    - step:
        id: '303'
        action: Script
        object_path: StatusDescription = SAPGuiSession("Session_2").SAPGuiWindow("Number
          of Hits").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Status Description")
    - step:
        id: '304'
        action: Script
        object_path: ProcessTimeStampREQ = Replace(SAPGuiSession("Session_2").SAPGuiWindow("Number
          of Hits").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Process Time Stamp"),".","/")
    - step:
        id: '305'
        action: Script
        object_path: SubProcess = SAPGuiSession("Session_2").SAPGuiWindow("Number
          of Hits").SAPGuiGrid("GridViewCtrl").GetCellData(i,"Sub Process")
    - step:
        id: '306'
        action: Script
        object_path: If LCase(SubProcess) = "req" And LCase(StatusDescription) = "active"
          Then
    - step:
        id: '307'
        action: Script
        object_path: Exit For
    - step:
        id: '308'
        action: Script
        object_path: Else
    - step:
        id: '309'
        action: Script
        object_path: StatusDescription = EMPTY
    - step:
        id: '310'
        action: Script
        object_path: ProcessTimeStampREQ = EMPTY
    - step:
        id: '311'
        action: Script
        object_path: SubProcess = EMPTY
    - step:
        id: '312'
        action: Script
        object_path: End If
    - step:
        id: '313'
        action: Script
        object_path: Next
    - step:
        id: '314'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '315'
        action: Script
        object_path: If ProcessTimeStampREQ <> EMPTY And ProcessTimeStampNTF <> EMPTY
          And CDate(ProcessTimeStampNTF) > CDate(ProcessTimeStampREQ)  Then
    - step:
        id: '316'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Number of Hits").SAPGuiButton("Back")
        action: Click
    - step:
        id: '317'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification")
        action: Highlight
    - step:
        id: '318'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
    - step:
        id: '319'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '320'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Edit")
        action: Click
    - step:
        id: '321'
        action: Script
        object_path: procsStepRow = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Name","Cancel
          PDoc processing")
    - step:
        id: '322'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '323'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: procsStepRow, "Icon"
    - step:
        id: '324'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '325'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '326'
        action: Script
        object_path: actionUser = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "User Name")
    - step:
        id: '327'
        action: Script
        object_path: actionDate = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Date")
    - step:
        id: '328'
        action: Script
        object_path: actionTime = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Time")
    - step:
        id: '329'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Notes"'
    - step:
        id: '330'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '331'
        action: Script
        object_path: existingText = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '332'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '333'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTextArea("TextAreaControl")
        action: Set
        args: 'actionDate & " " & actionTime & " " & actionUser & ":  " & "Unsolicited
          CDN received afterward – BPEM closed" + vbCr + existingText'
    - step:
        id: '334'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '335'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("*Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '336'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '337'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '338'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '339'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save")
        action: Click
    - step:
        id: '340'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '341'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '342'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '343'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '344'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '345'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '346'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "Unsolicited CDN received afterward – BPEM closed"
    - step:
        id: '347'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '348'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '349'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '350'
        object_path: objWorkbook
        action: save
    - step:
        id: '351'
        action: Script
        object_path: ElseIf ProcessTimeStampREQ <> EMPTY And ProcessTimeStampNTF <>
          EMPTY And CDate(ProcessTimeStampNTF) < CDate(ProcessTimeStampREQ)  Then
    - step:
        id: '352'
        object_path: 'SAPGuiSession("Session_2").SAPGuiWindow("Number of Hits: 2").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '353'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification")
        action: Highlight
    - step:
        id: '354'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
    - step:
        id: '355'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '356'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Edit")
        action: Click
    - step:
        id: '357'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '358'
        action: Script
        object_path: procsStepRow = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Name","Repeat
          previous process steps")
    - step:
        id: '359'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '360'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: procsStepRow, "Icon"
    - step:
        id: '361'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '362'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '363'
        action: Script
        object_path: actionUser = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "User Name")
    - step:
        id: '364'
        action: Script
        object_path: actionDate = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Date")
    - step:
        id: '365'
        action: Script
        object_path: actionTime = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Time")
    - step:
        id: '366'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Notes"'
    - step:
        id: '367'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '368'
        action: Script
        object_path: existingText = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '369'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '370'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTextArea("TextAreaControl")
        action: Set
        args: 'actionDate & " " & actionTime & " " & actionUser & ":  " & "Valid Customer
          Name. No unsolicited CDN received afterwards. CSDN reissued" + vbCr + existingText'
    - step:
        id: '371'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '372'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("*Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '373'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '374'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '375'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '376'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save")
        action: Click
    - step:
        id: '377'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '378'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '379'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '380'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '381'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '382'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '383'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "Valid Customer Name. No unsolicited CDN received afterwards. CSDN
          reissued"
    - step:
        id: '384'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '385'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '386'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '387'
        object_path: objWorkbook
        action: save
    - step:
        id: '388'
        action: Script
        object_path: ElseIf ProcessTimeStampREQ <> EMPTY And ProcessTimeStampNTF =
          EMPTY Then
    - step:
        id: '389'
        object_path: 'SAPGuiSession("Session_2").SAPGuiWindow("Number of Hits: 2").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '390'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification")
        action: Highlight
    - step:
        id: '391'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
    - step:
        id: '392'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '393'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Edit")
        action: Click
    - step:
        id: '394'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '395'
        action: Script
        object_path: procsStepRow = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Name","Repeat
          previous process steps")
    - step:
        id: '396'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '397'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: procsStepRow, "Icon"
    - step:
        id: '398'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '399'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '400'
        action: Script
        object_path: actionUser = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "User Name")
    - step:
        id: '401'
        action: Script
        object_path: actionDate = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Date")
    - step:
        id: '402'
        action: Script
        object_path: actionTime = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Time")
    - step:
        id: '403'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Notes"'
    - step:
        id: '404'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '405'
        action: Script
        object_path: existingText = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '406'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '407'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTextArea("TextAreaControl")
        action: Set
        args: 'actionDate & " " & actionTime & " " & actionUser & ":  " & "Name is
          valid, but no valid completed CSDN found" + vbCr + existingText'
    - step:
        id: '408'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '409'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("*Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '410'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '411'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '412'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '413'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save")
        action: Click
    - step:
        id: '414'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '415'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '416'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '417'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '418'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '419'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '420'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "Name is valid, but no valid completed CSDN found"
    - step:
        id: '421'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '422'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '423'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '424'
        object_path: objWorkbook
        action: save
    - step:
        id: '425'
        action: Script
        object_path: Else
    - step:
        id: '426'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '427'
        object_path: 'SAPGuiSession("Session_2").SAPGuiWindow("Number of Hits: 2").SAPGuiButton("Back")'
        action: Click
    - step:
        id: '428'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification")
        action: Highlight
    - step:
        id: '429'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Back")
        action: Click
    - step:
        id: '430'
        action: Script
        object_path: '''screenShotFileLocation = "C:\ETSAData\CaseNeedsInvestigation.png"'
    - step:
        id: '431'
        object_path: '''Desktop'
        action: CaptureBitmap
        args: screenShotFileLocation ,true
    - step:
        id: '432'
        action: Script
        object_path: '''fn_SendResultAsEmail Email,"Manual investigations required
          for the Case# " & CaseID, "Manual investigations required for the Case#
          " & CaseID,screenShotFileLocation'
    - step:
        id: '433'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '434'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '435'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '436'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "Manual Investigation Required"
    - step:
        id: '437'
        object_path: objSheet.cells(excelRow,4).Interior
        action: ColorIndex
        args: = 3
    - step:
        id: '438'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '439'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '440'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '441'
        object_path: objWorkbook
        action: save
    - step:
        id: '442'
        action: Script
        object_path: End  If
    - step:
        id: '443'
        action: Script
        object_path: Else
    - step:
        id: '444'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification")
        action: Highlight
    - step:
        id: '445'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
    - step:
        id: '446'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '447'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Edit")
        action: Click
    - step:
        id: '448'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '449'
        action: Script
        object_path: procsStepRow = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Name","Repeat
          previous process steps")
    - step:
        id: '450'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '451'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: procsStepRow, "Icon"
    - step:
        id: '452'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '453'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '454'
        action: Script
        object_path: actionUser = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "User Name")
    - step:
        id: '455'
        action: Script
        object_path: actionDate = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Date")
    - step:
        id: '456'
        action: Script
        object_path: actionTime = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Time")
    - step:
        id: '457'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Notes"'
    - step:
        id: '458'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '459'
        action: Script
        object_path: existingText = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '460'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '461'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTextArea("TextAreaControl")
        action: Set
        args: 'actionDate & " " & actionTime & " " & actionUser & ":  " & "Valid customer
          name but no CSDN found. CSDN reissued." + vbCr + existingText'
    - step:
        id: '462'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '463'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("*Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '464'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '465'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '466'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '467'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save")
        action: Click
    - step:
        id: '468'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '469'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '470'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '471'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '472'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '473'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '474'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "Valid customer name but no CSDN found. CSDN reissued."
    - step:
        id: '475'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '476'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '477'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '478'
        object_path: objWorkbook
        action: save
    - step:
        id: '479'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Process Document").SAPGuiButton("Back")
        action: Click
    - step:
        id: '480'
        action: Script
        object_path: End If
    - step:
        id: '481'
        action: Script
        object_path: End If
    - step:
        id: '482'
        action: Script
        object_path: End If
    - step:
        id: '483'
        action: Script
        object_path: End If
    - step:
        id: '484'
        action: Script
        object_path: End If
    - step:
        id: '485'
        action: Script
        object_path: End If
    - step:
        id: '486'
        action: Script
        object_path: '''export datadate'
    - step:
        id: '487'
        object_path: '''Datatable'
        action: ExportSheet
        args: fname, "Global"
    - step:
        id: '488'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '489'
        action: Script
        object_path: business = ""
    - step:
        id: '490'
        action: Script
        object_path: CaseID = EMPTY
    - step:
        id: '491'
        action: Script
        object_path: NMI = EMPTY
    - step:
        id: '492'
        action: Script
        object_path: CaseStatus = EMPTY
    - step:
        id: '493'
        action: Script
        object_path: ThrdPartyServProv = EMPTY
    - step:
        id: '494'
        action: Script
        object_path: OriginalDate = EMPTY
    - step:
        id: '495'
        action: Script
        object_path: OriginalTimeStamp = EMPTY
    - step:
        id: '496'
        action: Script
        object_path: objRowCnt = EMPTY
    - step:
        id: '497'
        action: Script
        object_path: objRows = EMPTY
    - step:
        id: '498'
        action: Script
        object_path: shortDesc = EMPTY
    - step:
        id: '499'
        action: Script
        object_path: businessPartnerText = EMPTY
    - step:
        id: '500'
        action: Script
        object_path: PoD = EMPTY
    - step:
        id: '501'
        action: Script
        object_path: ThrdPartyServProv = EMPTY
    - step:
        id: '502'
        action: Script
        object_path: Rows = EMPTY
    - step:
        id: '503'
        action: Script
        object_path: i = EMPTY
    - step:
        id: '504'
        action: Script
        object_path: ServiceType = EMPTY
    - step:
        id: '505'
        action: Script
        object_path: ServiceProvider = EMPTY
    - step:
        id: '506'
        action: Script
        object_path: Flag = EMPTY
    - step:
        id: '507'
        action: Script
        object_path: actionUser = EMPTY
    - step:
        id: '508'
        action: Script
        object_path: actionDate = EMPTY
    - step:
        id: '509'
        action: Script
        object_path: actionTime = EMPTY
    - step:
        id: '510'
        action: Script
        object_path: existingText = EMPTY
    - step:
        id: '511'
        action: Script
        object_path: row = EMPTY
    - step:
        id: '512'
        action: Script
        object_path: customerType = EMPTY
    - step:
        id: '513'
        action: Script
        object_path: nameCheck = EMPTY
    - step:
        id: '514'
        action: Script
        object_path: Set regex = NOTHING
    - step:
        id: '515'
        action: Script
        object_path: NextFlag = EMPTY
    - step:
        id: '516'
        action: Script
        object_path: ProcessTimeStamp = EMPTY
    - step:
        id: '517'
        action: Script
        object_path: StatusDescription = EMPTY
    - step:
        id: '518'
        action: Script
        object_path: ProcessTimeStamp = EMPTY
    - step:
        id: '519'
        action: Script
        object_path: procsStepRow = EMPTY
    - step:
        id: '520'
        action: Script
        object_path: If bpemRows = bpemRowsCnt Then
    - step:
        id: '521'
        action: Script
        object_path: Exit For
    - step:
        id: '522'
        action: Script
        object_path: End If
    - step:
        id: '523'
        action: Script
        object_path: Next
    - step:
        id: '524'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '525'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List_2").SAPGuiButton("Exit")
        action: Click
    - step:
        id: '526'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '527'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiButton("Exit")
        action: Click
    - step:
        id: '528'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '529'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Monitoring of Process").SAPGuiButton("Back")
        action: Click
    - step:
        id: '530'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '531'
        object_path: objWorkbook
        action: save
    - step:
        id: '532'
        object_path: objWorkbook
        action: close
    - step:
        id: '533'
        object_path: objExcel
        action: Quit
    - step:
        id: '534'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '535'
        action: Script
        object_path: '''screenshots'
    - step:
        id: '536'
        action: Script
        object_path: Sub sapn_screenShot_done(msg)
    - step:
        id: '537'
        action: Script
        object_path: screenShotFileLocaiton = "C:\ETSAData\CaseNeedsInvestigation.png"
    - step:
        id: '538'
        object_path: Desktop
        action: CaptureBitmap
        args: screenShotFileLocaiton ,true
    - step:
        id: '539'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '540'
        action: Script
        object_path: Set objFSo = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '541'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '542'
        action: Script
        object_path: If objFSo.FileExists(screenShotFileLocaiton) Then
    - step:
        id: '543'
        object_path: Reporter
        action: ReportEvent
        args: micDone, "Step", msg, screenShotFileLocaiton
    - step:
        id: '544'
        action: Script
        object_path: '''sapn_writeLogFile msg'
    - step:
        id: '545'
        object_path: SystemUtil
        action: Run
        args: '"cmd.exe", "/c del " & screenShotFileLocaiton'
    - step:
        id: '546'
        action: Script
        object_path: else
    - step:
        id: '547'
        object_path: Reporter
        action: ReportEvent
        args: micDone, "Step", msg
    - step:
        id: '548'
        action: Script
        object_path: '''sapn_writeLogFile msg'
    - step:
        id: '549'
        action: Script
        object_path: end if
    - step:
        id: '550'
        action: Wait
        args: '"0,50"'
        default_args: '"1"'
    - step:
        id: '551'
        action: Script
        object_path: Set objFSo = Nothing
    - step:
        id: '552'
        action: Script
        object_path: End Sub
    - step:
        id: '553'
        action: Script
        object_path: '''Format report file'
    - step:
        id: '554'
        action: Script
        object_path: Function fn_Editexcel(FileName)
    - step:
        id: '555'
        action: Script
        object_path: '''Creating the Excel Object'
    - step:
        id: '556'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '557'
        object_path: objExcel.Application
        action: Visible
        args: = False
    - step:
        id: '558'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.Open(FileName)
    - step:
        id: '559'
        action: Script
        object_path: '''Creating the Workbooks object'
    - step:
        id: '560'
        object_path: objExcel.Cells(1,1).Font
        action: Bold
        args: = True
    - step:
        id: '561'
        object_path: objExcel.cells(1,1).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '562'
        object_path: objExcel.Cells(1,2).Font
        action: Bold
        args: = True
    - step:
        id: '563'
        object_path: objExcel.cells(1,2).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '564'
        object_path: objExcel.Cells(1,3).Font
        action: Bold
        args: = True
    - step:
        id: '565'
        object_path: objExcel.cells(1,3).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '566'
        object_path: objExcel.Cells(1,4).Font
        action: Bold
        args: = True
    - step:
        id: '567'
        object_path: objExcel.cells(1,4).Interior
        action: ColorIndex
        args: = 33
    - step:
        id: '568'
        object_path: objWorkbook
        action: Save
    - step:
        id: '569'
        object_path: objWorkbook
        action: Close
    - step:
        id: '570'
        object_path: objExcel
        action: quit
    - step:
        id: '571'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '572'
        action: Script
        object_path: End Function
    - step:
        id: '573'
        action: Script
        object_path: '''Send Email'
    - step:
        id: '574'
        action: Script
        object_path: Function fn_SendResultAsEmail(EmailTo,Subject,Body,Attachment)
    - step:
        id: '575'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '576'
        object_path: MyEmail
        action: Subject
        args: = Subject
    - step:
        id: '577'
        object_path: MyEmail
        action: From
        args: = "Process.Automation@sapowernetworks.com.au"
    - step:
        id: '578'
        object_path: MyEmail
        action: To
        args: = EmailTo
    - step:
        id: '579'
        object_path: MyEmail
        action: TextBody
        args: = Body
    - step:
        id: '580'
        object_path: MyEmail
        action: AddAttachment
        args: Attachment
    - step:
        id: '581'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '582'
        action: Script
        object_path: '''SMTP Server'
    - step:
        id: '583'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '584'
        action: Script
        object_path: '''SMTP Port'
    - step:
        id: '585'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '586'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '587'
        object_path: MyEmail
        action: Send
    - step:
        id: '588'
        action: Script
        object_path: Set MyEmail = NOTHING
    - step:
        id: '589'
        action: Script
        object_path: End Function
    - step:
        id: '590'
        action: Script
        object_path: '''Clear variavles'
    - step:
        id: '591'
        action: Script
        object_path: UserName = empty
    - step:
        id: '592'
        action: Script
        object_path: UserPass = empty
    - step:
        id: '593'
        action: Script
        object_path: SystemID = empty
    - step:
        id: '594'
        action: Script
        object_path: ReportLocation = empty
    - step:
        id: '595'
        action: Script
        object_path: rptname = empty
    - step:
        id: '596'
        action: Script
        object_path: fname = empty
    - step:
        id: '597'
        action: Script
        object_path: bpemRowsCnt = empty
    - step:
        id: '598'
        action: Script
        object_path: bpemRows = empty
    - step:
        id: '599'
        action: Script
        object_path: CaseID = empty
    - step:
        id: '600'
        action: Script
        object_path: NMI = empty
    - step:
        id: '601'
        action: Script
        object_path: reasonTxt = empty
    - step:
        id: '602'
        action: Script
        object_path: repeatFlag = empty
    - step:
        id: '603'
        action: Script
        object_path: businessPartnerText = empty
    - step:
        id: '604'
        action: Script
        object_path: procsStepsCnt =empty
    - step:
        id: '605'
        action: Script
        object_path: procsSteps =  empty
    - step:
        id: '606'
        action: Script
        object_path: procsName = empty
    - step:
        id: '607'
        action: Script
        object_path: user = empty
    - step:
        id: '608'
        action: Script
        object_path: actionUser = empty
    - step:
        id: '609'
        action: Script
        object_path: actionStatus = empty
    - step:
        id: '610'
        action: Script
        object_path: row = empty
    - step:
        id: '611'
        action: Script
        object_path: CaseID = EMPTY
    - step:
        id: '612'
        action: Script
        object_path: NMI = EMPTY
    - step:
        id: '613'
        action: Script
        object_path: CaseStatus = EMPTY
    - step:
        id: '614'
        action: Script
        object_path: OriginalDate = EMPTY
    - step:
        id: '615'
        action: Script
        object_path: OriginalTimeStamp = EMPTY
    - step:
        id: '616'
        action: Script
        object_path: objRowCnt = EMPTY
    - step:
        id: '617'
        action: Script
        object_path: objRows = EMPTY
    - step:
        id: '618'
        action: Script
        object_path: shortDesc = EMPTY
    - step:
        id: '619'
        action: Script
        object_path: businessPartnerText = EMPTY
    - step:
        id: '620'
        action: Script
        object_path: PoD = EMPTY
    - step:
        id: '621'
        action: Script
        object_path: ThrdPartyServProv = EMPTY
    - step:
        id: '622'
        action: Script
        object_path: Rows = EMPTY
    - step:
        id: '623'
        action: Script
        object_path: i = EMPTY
    - step:
        id: '624'
        action: Script
        object_path: ServiceType = EMPTY
    - step:
        id: '625'
        action: Script
        object_path: ServiceProvider = EMPTY
    - step:
        id: '626'
        action: Script
        object_path: Flag = EMPTY
    - step:
        id: '627'
        action: Script
        object_path: actionUser = EMPTY
    - step:
        id: '628'
        action: Script
        object_path: actionDate = EMPTY
    - step:
        id: '629'
        action: Script
        object_path: actionTime = EMPTY
    - step:
        id: '630'
        action: Script
        object_path: existingText = EMPTY
    - step:
        id: '631'
        action: Script
        object_path: row = EMPTY
    - step:
        id: '632'
        action: Script
        object_path: customerType = EMPTY
    - step:
        id: '633'
        action: Script
        object_path: nameCheck = EMPTY
    - step:
        id: '634'
        action: Script
        object_path: Set regex = NOTHING
    - step:
        id: '635'
        action: Script
        object_path: NextFlag = EMPTY
    - step:
        id: '636'
        action: Script
        object_path: ProcessTimeStamp = EMPTY
    - step:
        id: '637'
        action: Script
        object_path: StatusDescription = EMPTY
    - step:
        id: '638'
        action: Script
        object_path: ProcessTimeStamp = EMPTY
    - step:
        id: '639'
        action: Script
        object_path: procsStepRow = EMPTY
    - step:
        id: '640'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '641'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '642'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '643'
        action: Script
        object_path: ExitTest
    - step:
        id: '644'
        action: Script
        object_path: '''Sample NMI process'
    - step:
        id: '645'
        action: Script
        object_path: objRowCnt = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '646'
        action: Script
        object_path: For objRows = 1 to objRowCnt
    - step:
        id: '647'
        action: Script
        object_path: shortDesc = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(objRows,
          "Short Description")
    - step:
        id: '648'
        action: Script
        object_path: If shortDesc = "Utility Installation" Then
    - step:
        id: '649'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: objRows,"Key"
    - step:
        id: '650'
        action: Script
        object_path: Exit For
    - step:
        id: '651'
        action: Script
        object_path: End If
    - step:
        id: '652'
        action: Script
        object_path: Next
    - step:
        id: '653'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '654'
        action: Script
        object_path: '''If Inst Type = SMPL, Cancel PDoc'
    - step:
        id: '655'
        action: Script
        object_path: instType = SAPGuiSession("Session").SAPGuiWindow("Display Installation:").SAPGuiEdit("Inst.
          type").GetROProperty("value")
    - step:
        id: '656'
        action: Script
        object_path: If instType = "SMPL" Then
    - step:
        id: '657'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Installation:").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '658'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Procs"'
    - step:
        id: '659'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '660'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Edit")
        action: Click
    - step:
        id: '661'
        action: Script
        object_path: procsStepRow = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").FindRowByCellContent("Name","Cancel
          PDoc processing")
    - step:
        id: '662'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '663'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: procsStepRow, "Icon"
    - step:
        id: '664'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '665'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '666'
        action: Script
        object_path: actionUser = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "User Name")
    - step:
        id: '667'
        action: Script
        object_path: actionDate = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Date")
    - step:
        id: '668'
        action: Script
        object_path: actionTime = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(procsStepRow,
          "Time")
    - step:
        id: '669'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Notes"'
    - step:
        id: '670'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '671'
        action: Script
        object_path: existingText = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiTextArea("TextAreaControl").GetROProperty("value")
    - step:
        id: '672'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '673'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiTextArea("TextAreaControl")
        action: Set
        args: 'actionDate & " " & actionTime & " " & actionUser & ":  " & "CSDN not
          required for Sample NMI, cancelled pdoc processing" + vbCr + existingText'
    - step:
        id: '674'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '675'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("*Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '676'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '677'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '678'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '679'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save")
        action: Click
    - step:
        id: '680'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '681'
        action: Script
        object_path: '''sapn_screenShot_done(msg)'
    - step:
        id: '682'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '683'
        object_path: objSheet.cells(excelRow,1)
        action: value
        args: = CaseID
    - step:
        id: '684'
        object_path: objSheet.cells(excelRow,2)
        action: value
        args: = NMI
    - step:
        id: '685'
        object_path: objSheet.cells(excelRow,3)
        action: value
        args: = businessPartnerText
    - step:
        id: '686'
        object_path: objSheet.cells(excelRow,4)
        action: value
        args: = "CSDN not required for Sample NMI, cancelled pdoc processing"
    - step:
        id: '687'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '688'
        action: Script
        object_path: completedBpems = completedBpems + 1
    - step:
        id: '689'
        action: Script
        object_path: Parameter("completedBpems") = completedBpems
    - step:
        id: '690'
        object_path: objWorkbook
        action: save
    - step:
        id: '691'
        action: Script
        object_path: End If
  outputs:
  - bpemRowsCnt:
      robot: true
      value: ${bpemRowsCnt}
  - completedBpems:
      robot: true
      value: ${completedBpems}
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
      name: Word
      properties:
      - property:
          value:
            value: Word
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: OpusApp
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
          value: OpusApp
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Friday, 6 January 2023 10:53:04 AM
      child_objects:
      - object:
          class: WinObject
          name: Microsoft Word Document
          properties:
          - property:
              value:
                value: _WwG
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
              value: _WwG
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects: []
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
      last_update_time: Friday, 6 January 2023 10:53:04 AM
      child_objects: []
  - object:
      class: SAPGuiSession
      name: Session_2
      properties:
      - property:
          value:
            value: ses[1]
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
      last_update_time: Friday, 6 January 2023 10:53:04 AM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: 'Number of Hits: 2'
          properties:
          - property:
              value:
                value: /IDXGC/PDOCMON02
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
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          basic_identification:
            property_ref:
            - transaction
            - program
            - micclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Number of Hits
          properties:
          - property:
              value:
                value: /IDXGC/PDOCMON02
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
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          basic_identification:
            property_ref:
            - transaction
            - program
            - micclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Sort in Descending Order
              properties:
              - property:
                  value:
                    value: btn[40]
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Monitoring of Process
          properties:
          - property:
              value:
                value: /IDXGC/PDOCMON02
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
                value: SAPLSSEL
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Process Group
              properties:
              - property:
                  value:
                    value: '%%DYN018-LOW'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Process
              properties:
              - property:
                  value:
                    value: '%%DYN019-LOW'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Maximum Number
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
                    value: '31'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: External Key for PoD
              properties:
              - property:
                  value:
                    value: '%%DYN009-LOW'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Process Document
          properties:
          - property:
              value:
                value: /IDXGC/PDOCMON02
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
                value: /IDXGC/SAPLFG_PDOC_DISPLAY
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
            value: '12'
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
      last_update_time: Friday, 6 January 2023 10:53:04 AM
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: SAP
          properties:
          - property:
              value:
                value: S000
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '20'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSYST
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Logon Language
              properties:
              - property:
                  value:
                    value: RSYST-LANGU
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Client
              properties:
              - property:
                  value:
                    value: RSYST-MANDT
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: '*User'
              properties:
              - property:
                  value:
                    value: RSYST-BNAME
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: '*Password'
              properties:
              - property:
                  value:
                    value: RSYST-BCODE
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
                    value: '33'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Number of Hits
          properties:
          - property:
              value:
                value: /IDXGC/PDOCMON02
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
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          basic_identification:
            property_ref:
            - transaction
            - program
            - micclass
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Exit
              properties:
              - property:
                  value:
                    value: btn[15]
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Monitoring of Process
          properties:
          - property:
              value:
                value: /IDXGC/PDOCMON02
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
                value: SAPLSSEL
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Process Group
              properties:
              - property:
                  value:
                    value: '%%DYN018-LOW'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Process
              properties:
              - property:
                  value:
                    value: '%%DYN019-LOW'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Maximum Number
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
                    value: '31'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: External Key for PoD
              properties:
              - property:
                  value:
                    value: '%%DYN009-LOW'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Exit
              properties:
              - property:
                  value:
                    value: btn[15]
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Service Provider
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
                value: '100'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLEEDMIDE_SERVPROV_MAINT
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: External Number
              properties:
              - property:
                  value:
                    value: EEDMIDESERVPROV_DYN_HEADDATA-EXTERNALID
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
                    value: wnd[0]/usr/ssubSERVPROV_SUBSCR:SAPLEEDMIDE_SERVPROV_MAINT:0200/tabsSERVPROV_DATA/tabpSERVPROV_FC1/ssubSERVPROV_SCA:SAPLEEDMIDE_SERVPROV_MAINT:0210/txtEEDMIDESERVPROV_DYN_HEADDATA-EXTERNALID
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Process Document_2
          properties:
          - property:
              value:
                value: /IDXGC/PDOCMON02
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
                value: /IDXGC/SAPLFG_PDOC_DISPLAY
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Process Document
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
                value: '100'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: /IDXGC/SAPLFG_PDOC_DISPLAY
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: TABSTRIP_SWITCH
              properties:
              - property:
                  value:
                    value: TABSTRIP_SWITCH
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TABSTRIP_ADDMSGDATA
              properties:
              - property:
                  value:
                    value: TABSTRIP_ADDMSGDATA
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Point of Delivery ID
              properties:
              - property:
                  value:
                    value: GS_PDOC_DISPLAY-EXT_UI
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Business Partner_2
              properties:
              - property:
                  value:
                    value: GS_PDOC_DISPLAY-BU_PARTNER
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Business Partner
              properties:
              - property:
                  value:
                    value: GS_PDOC_DISPLAY-BU_PARTNER_NAME
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Show process step add.
              properties:
              - property:
                  value:
                    value: UNHIDE_ADDMSGDATA
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display point of delivery:'
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
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: PoD ID
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
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Organization:'
          properties:
          - property:
              value:
                value: BP
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
                value: SAPLBUS_LOCATOR
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiTabStrip
              name: GS_SCREEN_1100_TABSTRIP
              properties:
              - property:
                  value:
                    value: GS_SCREEN_1100_TABSTRIP
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Account Class
              properties:
              - property:
                  value:
                    value: KONTOKLASSET-KTOTX
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
                    value: wnd[0]/usr/subSCREEN_3000_RESIZING_AREA:SAPLBUS_LOCATOR:2000/subSCREEN_1010_RIGHT_AREA:SAPLBUPA_DIALOG_JOEL:1000/ssubSCREEN_1000_WORKAREA_AREA:SAPLBUPA_DIALOG_JOEL:1100/ssubSCREEN_1100_MAIN_AREA:SAPLBUPA_DIALOG_JOEL:1101/tabsGS_SCREEN_1100_TABSTRIP/tabpSCREEN_1100_TAB_03/ssubSCREEN_1100_TABSTRIP_AREA:SAPLBUSS:0028/ssubGENSUB:SAPLBUSS:7012/subA08P02:SAPLES02:0210/txtKONTOKLASSET-KTOTX
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
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiComboBox
              name: '*Display in BP role'
              properties:
              - property:
                  value:
                    value: BUS_JOEL_MAIN-PARTNER_ROLE
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Installation:'
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Inst. type
              properties:
              - property:
                  value:
                    value: EANLD-ANLART
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
                    value: wnd[0]/usr/ctxtEANLD-ANLART
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiTextArea
              name: TextAreaControl
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
                    value: SAPGuiTextArea
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '203'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Original Date_2
              properties:
              - property:
                  value:
                    value: EMMAD_CASEHDR-ORIG_TIME
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Original Date
              properties:
              - property:
                  value:
                    value: EMMAD_CASEHDR-ORIG_DATE
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiComboBox
              name: '*Status'
              properties:
              - property:
                  value:
                    value: Completed
                    regular_expression: false
                  name: selecteditem
                  hidden: false
                  read_only: false
                  type: STRING
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
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Edit
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Exit
              properties:
              - property:
                  value:
                    value: btn[15]
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
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
          last_update_time: Friday, 6 January 2023 10:53:04 AM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: No BPEMs Found
              properties:
              - property:
                  value:
                    value: No entry found
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
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
              basic_identification:
                property_ref:
                - text
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: ProcessingStatus_To
              properties:
              - property:
                  value:
                    value: STATUS-HIGH
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: ProcessingStatus_From
              properties:
              - property:
                  value:
                    value: STATUS-LOW
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Original Date/Time
              properties:
              - property:
                  value:
                    value: PV_ORD_F
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
                    value: wnd[0]/usr/ctxtPV_ORD_F
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Maximum No. of Hits
              properties:
              - property:
                  value:
                    value: MAXHITS
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Clarif. Case Category
              properties:
              - property:
                  value:
                    value: CCAT-LOW
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Case
              properties:
              - property:
                  value:
                    value: CASENO-LOW
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Autom. Update Up to Max.
              properties:
              - property:
                  value:
                    value: LSTRFRSH
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Multiple selection
              properties:
              - property:
                  value:
                    value: '%_CCAT_%_APP_%-VALU_PUSH'
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Exit
              properties:
              - property:
                  value:
                    value: btn[15]
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
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
              last_update_time: Friday, 6 January 2023 10:53:04 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
