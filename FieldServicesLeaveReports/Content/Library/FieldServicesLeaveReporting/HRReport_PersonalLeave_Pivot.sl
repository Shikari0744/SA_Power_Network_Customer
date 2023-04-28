namespace: FieldServicesLeaveReporting
operation:
  name: HRReport_PersonalLeave_Pivot
  inputs:
  - orgStructureValue
  - filepath: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Field
      Services Leave Balance Reports\Copy of Copy of EXPORT OPS PLANNING PERSONAL
      LEAVE.xlsx
  - orgStructureSelection
  sequential_action:
    gav: com.microfocus.seq:FieldServicesLeaveReporting.HRReport_PersonalLeave_Pivot:1.0.0
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
        object_path: '''PERSONAL LEAVE EXTRACTION'
    - step:
        id: '2'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '3'
        action: Script
        object_path: '''''CREATE EXCEL DOCUMENT'
    - step:
        id: '4'
        action: Script
        object_path: '''Set objExcel = CreateObject("Excel.Application")'
    - step:
        id: '5'
        object_path: '''objExcel'
        action: visible
        args: = true
    - step:
        id: '6'
        action: Script
        object_path: '''''OPEN WORKBOOK'
    - step:
        id: '7'
        action: Script
        object_path: '''Set objWorkbook = objExcel.Workbooks.Open(Parameter("filepath"))'
    - step:
        id: '8'
        action: Script
        object_path: '''''OPEN SHEET'
    - step:
        id: '9'
        action: Script
        object_path: '''Set objWorksheet = objWorkbook.Worksheets("MASTER DATA")'
    - step:
        id: '10'
        action: Script
        object_path: '''GET ROW COUNT'
    - step:
        id: '11'
        action: Script
        object_path: '''excelRow = 2''objWorksheet.usedrange.Rows.Count + 1'
    - step:
        id: '12'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '13'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '14'
        object_path: objExcel
        action: Visible
        args: = True
    - step:
        id: '15'
        action: Script
        object_path: '''Add the path of the excel file'
    - step:
        id: '16'
        action: Script
        object_path: Set xlBook1 = objExcel.WorkBooks.Open(Parameter("filepath"))
    - step:
        id: '17'
        action: Script
        object_path: '''Add the Sheet name'
    - step:
        id: '18'
        action: Script
        object_path: Set objData = xlBook1.Sheets("MASTER DATA")
    - step:
        id: '19'
        action: Script
        object_path: Set objSheet = xlBook1.Sheets.Add(,objData)
    - step:
        id: '20'
        action: Script
        object_path: '''Edit the Name of the sheet (Do not use spaces)'
    - step:
        id: '21'
        object_path: objSheet
        action: Name="PL_By_Month"
    - step:
        id: '22'
        action: Script
        object_path: '''Add the Source data reference'
    - step:
        id: '23'
        action: Script
        object_path: Const SrcData = "PL_By_Month!R1C1:R2-1C2-1"
    - step:
        id: '24'
        action: Script
        object_path: Const xlDatabase = 1
    - step:
        id: '25'
        action: Script
        object_path: Const Version = 5
    - step:
        id: '26'
        action: Script
        object_path: '''Add the Destination'
    - step:
        id: '27'
        action: Script
        object_path: Const Destination = "PL_By_Month!R3C1"
    - step:
        id: '28'
        action: Script
        object_path: '''Add the Pivot table name'
    - step:
        id: '29'
        action: Script
        object_path: Const TableName = "PivotTable1"
    - step:
        id: '30'
        action: Script
        object_path: Set pvtcache = xlBook1.PivotCaches.Create(xlDatabase,SrcData,Version)
    - step:
        id: '31'
        action: Script
        object_path: Set pvtTable = pvtcache.CreatePivotTable(Destination,TableName)
    - step:
        id: '32'
        action: Script
        object_path: Const xlRowField = 1
    - step:
        id: '33'
        action: Script
        object_path: '''Add the field''s name for Row Field'
    - step:
        id: '34'
        object_path: pvtTable.pivotFields("Employee Name")
        action: orientation
        args: = xlRowField
    - step:
        id: '35'
        action: Script
        object_path: Const xlColumnField = 2
    - step:
        id: '36'
        action: Script
        object_path: '''Add the field''s name for Column Field'
    - step:
        id: '37'
        object_path: pvtTable.pivotFields("Months")
        action: orientation
        args: = xlColumnField
    - step:
        id: '38'
        action: Script
        object_path: Const xlFilterField = 3
    - step:
        id: '39'
        action: Script
        object_path: '''Add the field''s name for Filter'
    - step:
        id: '40'
        object_path: pvtTable.pivotFields("TDA")
        action: orientation
        args: = xlFilterField
    - step:
        id: '41'
        action: Script
        object_path: '''Add the field''s name and Alias for Sum Field'
    - step:
        id: '42'
        action: Script
        object_path: Const xlSum = -4157
    - step:
        id: '43'
        object_path: pvtTable.AddDataField pvtTable
        action: PivotFields("Hours"),
        args: '"Sum of Hours", xlSum'
    - step:
        id: '44'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '45'
        action: Script
        object_path: '''orgStructureValue = Parameter("orgStructureValue")'
    - step:
        id: '46'
        action: Script
        object_path: '''orgStructValue = Split(orgStructureValue,"/")'
    - step:
        id: '47'
        action: Script
        object_path: '''''EXTRACT PERSONAL LEAVE BALANCES AND ADD TO EXCEL'
    - step:
        id: '48'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n/SPIN/ER"'
    - step:
        id: '49'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")'
        action: SendKey
        args: ENTER
    - step:
        id: '50'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiTree("TableTreeControl")'
        action: SelectNode
        args: '"Draft Reports;End Of Month Reporting;Field Serv PL All Types Report
          inc hours"'
    - step:
        id: '51'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiTabStrip("TAB_RUN_RPT")'
        action: Select
        args: '"Report Data Period"'
    - step:
        id: '52'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiButton("Period")'
        action: Click
    - step:
        id: '53'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiRadioButton("Current
          year")'
        action: Set
    - step:
        id: '54'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiTabStrip("TAB_RUN_RPT")'
        action: Select
        args: '"Select Employees"'
    - step:
        id: '55'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl")'
        action: SetCellData
        args: 2,"Value","0004"
    - step:
        id: '56'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl")'
        action: ClickCell
        args: 5,"#4"
    - step:
        id: '57'
        action: Script
        object_path: '''For x = 1 To Ubound(orgStructValue) + 1'
    - step:
        id: '58'
        action: Script
        object_path: "'\tSAPGuiSession(\"Session\").SAPGuiWindow(\"Additional Selection\"\
          ).SAPGuiTable(\"SAPLALDBSINGLE\").SetCellData x,\"Single value\",orgStructValue(x-1)"
    - step:
        id: '59'
        action: Script
        object_path: '''Next'
    - step:
        id: '60'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Additional Selection").SAPGuiButton("Copy   (F8)")'
        action: Click
    - step:
        id: '61'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiTabStrip("TAB_RUN_RPT")'
        action: Select
        args: '"Run the Report"'
    - step:
        id: '62'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiButton("Execute
          Report in Foreground")'
        action: Click
    - step:
        id: '63'
        action: Script
        object_path: '''If SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiGrid("GridViewCtrl").Exist(3)
          Then'
    - step:
        id: '64'
        action: Script
        object_path: "'\tsapRow =  SAPGuiSession(\"Session\").SAPGuiWindow(\"Easy\
          \ Reporter\").SAPGuiGrid(\"GridViewCtrl\").RowCount"
    - step:
        id: '65'
        action: Script
        object_path: "'\tFor i = 1 To sapRow"
    - step:
        id: '66'
        action: Script
        object_path: "'\t\tcostCentre = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Cost Center\"\
          )"
    - step:
        id: '67'
        action: Script
        object_path: "'\t\tempSubgroup = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Employee subgroup\
          \ Desc\")"
    - step:
        id: '68'
        action: Script
        object_path: "'\t\tIf empSubgroup = \"Terminated/Separated\" Then"
    - step:
        id: '69'
        action: Script
        object_path: "'\t\t\tseparated = 1"
    - step:
        id: '70'
        action: Script
        object_path: "'\t\tElseIf costCentre <> \"\" and empSubgroup <> \"Terminated/Separated\"\
          \ Then"
    - step:
        id: '71'
        action: Script
        object_path: "'\t\t\temployeeNo = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Employee No.\"\
          )"
    - step:
        id: '72'
        action: Script
        object_path: "'\t\t\tlastName = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Last Name\"\
          )"
    - step:
        id: '73'
        action: Script
        object_path: "'\t\t\tfirstName = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"First Name\"\
          )"
    - step:
        id: '74'
        action: Script
        object_path: "'\t\t\tadminForTime = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Administrator\
          \ for Time (Text)\")"
    - step:
        id: '75'
        action: Script
        object_path: "'\t\t\tcontractDescription = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Contract Description\"\
          )"
    - step:
        id: '76'
        action: Script
        object_path: "'\t\t\tpositionDescription = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Position -\
          \ Description\")"
    - step:
        id: '77'
        action: Script
        object_path: "'\t\t\tpersonalLeavePaid = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"PL Paid Hours\"\
          )"
    - step:
        id: '78'
        action: Script
        object_path: "'\t\t\tIf Instr(personalLeavePaid,\"-\") Then"
    - step:
        id: '79'
        action: Script
        object_path: "'\t\t\t\tpersonalLeavePaid = Replace(personalLeavePaid,\"-\"\
          ,\"\")"
    - step:
        id: '80'
        action: Script
        object_path: "'\t\t\t\tpersonalLeavePaid = \"-\"&personalLeavePaid"
    - step:
        id: '81'
        action: Script
        object_path: "'\t\t\t\tpersonalLeavePaid = CDbl(personalLeavePaid)"
    - step:
        id: '82'
        action: Script
        object_path: "'\t\t\tElse"
    - step:
        id: '83'
        action: Script
        object_path: "'\t\t\t\tpersonalLeavePaid = CDbl(personalLeavePaid)"
    - step:
        id: '84'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '85'
        action: Script
        object_path: "'\t\t\tpersonalLeaveUnpaid = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"PL Unpaid\"\
          )"
    - step:
        id: '86'
        action: Script
        object_path: "'\t\t\tIf Instr(personalLeaveUnpaid,\"-\") Then"
    - step:
        id: '87'
        action: Script
        object_path: "'\t\t\t\tpersonalLeaveUnpaid = Replace(personalLeaveUnpaid,\"\
          -\",\"\")"
    - step:
        id: '88'
        action: Script
        object_path: "'\t\t\t\tpersonalLeaveUnpaid = \"-\"&personalLeaveUnpaid"
    - step:
        id: '89'
        action: Script
        object_path: "'\t\t\t\tpersonalLeaveUnpaid = CDbl(personalLeaveUnpaid)"
    - step:
        id: '90'
        action: Script
        object_path: "'\t\t\tElse"
    - step:
        id: '91'
        action: Script
        object_path: "'\t\t\t\tpersonalLeaveUnpaid = CDbl(personalLeaveUnpaid)"
    - step:
        id: '92'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '93'
        action: Script
        object_path: "'\t\t\tcarersLeavePaid = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Carers Leave\
          \ Paid\")"
    - step:
        id: '94'
        action: Script
        object_path: "'\t\t\tIf Instr(carersLeavePaid,\"-\") Then"
    - step:
        id: '95'
        action: Script
        object_path: "'\t\t\t\tcarersLeavePaid = Replace(carersLeavePaid,\"-\",\"\"\
          )"
    - step:
        id: '96'
        action: Script
        object_path: "'\t\t\t\tcarersLeavePaid = \"-\"&carersLeavePaid"
    - step:
        id: '97'
        action: Script
        object_path: "'\t\t\t\tcarersLeavePaid = CDbl(carersLeavePaid)"
    - step:
        id: '98'
        action: Script
        object_path: "'\t\t\tElse"
    - step:
        id: '99'
        action: Script
        object_path: "'\t\t\t\tcarersLeavePaid = CDbl(carersLeavePaid)"
    - step:
        id: '100'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '101'
        action: Script
        object_path: "'\t\t\tcarersLeaveUnpaid = SAPGuiSession(\"Session\").SAPGuiWindow(\"\
          Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"Carers Leave\
          \ unpaid\")"
    - step:
        id: '102'
        action: Script
        object_path: "'\t\t\tIf Instr(carersLeaveUnpaid,\"-\") Then"
    - step:
        id: '103'
        action: Script
        object_path: "'\t\t\t\tcarersLeaveUnpaid = Replace(carersLeaveUnpaid,\"-\"\
          ,\"\")"
    - step:
        id: '104'
        action: Script
        object_path: "'\t\t\t\tcarersLeaveUnpaid = \"-\"&carersLeaveUnpaid"
    - step:
        id: '105'
        action: Script
        object_path: "'\t\t\t\tcarersLeaveUnpaid = CDbl(carersLeaveUnpaid)"
    - step:
        id: '106'
        action: Script
        object_path: "'\t\t\tElse"
    - step:
        id: '107'
        action: Script
        object_path: "'\t\t\t\tcarersLeaveUnpaid = CDbl(carersLeaveUnpaid)"
    - step:
        id: '108'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '109'
        action: Script
        object_path: "'\t\t\tpersonalLeaveEntitlement = SAPGuiSession(\"Session\"\
          ).SAPGuiWindow(\"Easy Reporter\").SAPGuiGrid(\"GridViewCtrl\").GetCellData(i,\"\
          Personal Leave Entitlement\")"
    - step:
        id: '110'
        action: Script
        object_path: "'\t\t\tIf Instr(personalLeaveEntitlement,\"-\") Then"
    - step:
        id: '111'
        action: Script
        object_path: "'\t\t\t\tpersonalLeaveEntitlement = Replace(personalLeaveEntitlement,\"\
          -\",\"\")"
    - step:
        id: '112'
        action: Script
        object_path: "'\t\t\t\tpersonalLeaveEntitlement = \"-\"&personalLeaveEntitlement"
    - step:
        id: '113'
        action: Script
        object_path: "'\t\t\t\tpersonalLeaveEntitlement = CDbl(personalLeaveEntitlement)"
    - step:
        id: '114'
        action: Script
        object_path: "'\t\t\tElse"
    - step:
        id: '115'
        action: Script
        object_path: "'\t\t\t\tpersonalLeaveEntitlement = CDbl(personalLeaveEntitlement)"
    - step:
        id: '116'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '117'
        action: Script
        object_path: "'\t\t\t'If Logistics file, only include specific leaders"
    - step:
        id: '118'
        action: Script
        object_path: "'\t\t\tIf Instr(Parameter(\"filepath\"),\"Logistics\") > 0 Then"
    - step:
        id: '119'
        action: Script
        object_path: "'\t\t\t\tIf adminForTime = \"Dilena A\" or adminForTime = \"\
          Docking B\" or adminForTime = \"Caldicott P\" or adminForTime = \"Turner\
          \ P\" or adminForTime = \"Souter G\" or adminForTime = \"Lindner T\" or\
          \ adminForTime = \"Perrone A\" or adminForTime = \"Durdin C\" Then"
    - step:
        id: '120'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,1).Value = costCentre"
    - step:
        id: '121'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,2).Value = employeeNo"
    - step:
        id: '122'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,3).Value = lastName"
    - step:
        id: '123'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,4).Value = firstName"
    - step:
        id: '124'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,5).Value = adminForTime"
    - step:
        id: '125'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,6).Value = contractDescription"
    - step:
        id: '126'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,7).Value = positionDescription"
    - step:
        id: '127'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,8).Value = personalLeavePaid"
    - step:
        id: '128'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,9).Value = personalLeaveUnpaid"
    - step:
        id: '129'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,10).Value = carersLeavePaid"
    - step:
        id: '130'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,11).Value = carersLeaveUnpaid"
    - step:
        id: '131'
        action: Script
        object_path: "'\t\t\t\t\ttotalPersonalAndCarers = personalLeavePaid + personalLeaveUnpaid\
          \ + carersLeavePaid + carersLeaveUnpaid"
    - step:
        id: '132'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,12).Value = totalPersonalAndCarers"
    - step:
        id: '133'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,13).Value = personalLeaveEntitlement"
    - step:
        id: '134'
        action: Script
        object_path: "'\t\t\t\t\texcelRow = excelRow + 1"
    - step:
        id: '135'
        action: Script
        object_path: "'\t\t\t\tEnd If"
    - step:
        id: '136'
        action: Script
        object_path: "'\t\t\t\t'If Ops Planning file, don't include Logistics leaders"
    - step:
        id: '137'
        action: Script
        object_path: "'\t\t\tElseIf Instr(Parameter(\"filepath\"),\"Operations Planning\"\
          ) > 0 Then"
    - step:
        id: '138'
        action: Script
        object_path: "'\t\t\t\tIf adminForTime = \"Dilena A\" or adminForTime = \"\
          Docking B\" or adminForTime = \"Caldicott P\" or adminForTime = \"Turner\
          \ P\" or adminForTime = \"Souter G\" or adminForTime = \"Lindner T\" or\
          \ adminForTime = \"Perrone A\" or adminForTime = \"Durdin C\" Then"
    - step:
        id: '139'
        action: Script
        object_path: "'\t\t\t\t\tWait 1"
    - step:
        id: '140'
        action: Script
        object_path: "'\t\t\t\tElse"
    - step:
        id: '141'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,1).Value = costCentre"
    - step:
        id: '142'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,2).Value = employeeNo"
    - step:
        id: '143'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,3).Value = lastName"
    - step:
        id: '144'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,4).Value = firstName"
    - step:
        id: '145'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,5).Value = adminForTime"
    - step:
        id: '146'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,6).Value = contractDescription"
    - step:
        id: '147'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,7).Value = positionDescription"
    - step:
        id: '148'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,8).Value = personalLeavePaid"
    - step:
        id: '149'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,9).Value = personalLeaveUnpaid"
    - step:
        id: '150'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,10).Value = carersLeavePaid"
    - step:
        id: '151'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,11).Value = carersLeaveUnpaid"
    - step:
        id: '152'
        action: Script
        object_path: "'\t\t\t\t\ttotalPersonalAndCarers = personalLeavePaid + personalLeaveUnpaid\
          \ + carersLeavePaid + carersLeaveUnpaid"
    - step:
        id: '153'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,12).Value = totalPersonalAndCarers"
    - step:
        id: '154'
        action: Script
        object_path: "'\t\t\t\t\tobjWorksheet.Cells(excelRow,13).Value = personalLeaveEntitlement"
    - step:
        id: '155'
        action: Script
        object_path: "'\t\t\t\t\texcelRow = excelRow + 1"
    - step:
        id: '156'
        action: Script
        object_path: "'\t\t\t\tEnd If"
    - step:
        id: '157'
        action: Script
        object_path: "'\t\t\tElse"
    - step:
        id: '158'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,1).Value = costCentre"
    - step:
        id: '159'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,2).Value = employeeNo"
    - step:
        id: '160'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,3).Value = lastName"
    - step:
        id: '161'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,4).Value = firstName"
    - step:
        id: '162'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,5).Value = adminForTime"
    - step:
        id: '163'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,6).Value = contractDescription"
    - step:
        id: '164'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,7).Value = positionDescription"
    - step:
        id: '165'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,8).Value = personalLeavePaid"
    - step:
        id: '166'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,9).Value = personalLeaveUnpaid"
    - step:
        id: '167'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,10).Value = carersLeavePaid"
    - step:
        id: '168'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,11).Value = carersLeaveUnpaid"
    - step:
        id: '169'
        action: Script
        object_path: "'\t\t\t\ttotalPersonalAndCarers = personalLeavePaid + personalLeaveUnpaid\
          \ + carersLeavePaid + carersLeaveUnpaid"
    - step:
        id: '170'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,12).Value = totalPersonalAndCarers"
    - step:
        id: '171'
        action: Script
        object_path: "'\t\t\t\tobjWorksheet.Cells(excelRow,13).Value = personalLeaveEntitlement"
    - step:
        id: '172'
        action: Script
        object_path: "'\t\t\t\texcelRow = excelRow + 1"
    - step:
        id: '173'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '174'
        action: Script
        object_path: "'\t\tElse"
    - step:
        id: '175'
        action: Script
        object_path: "'\t\t\tExit For"
    - step:
        id: '176'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '177'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '178'
        action: Script
        object_path: '''End If'
    - step:
        id: '179'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/n"'
    - step:
        id: '180'
        object_path: '''SAPGuiSession("Session").SAPGuiWindow("Easy Reporter").SAPGuiButton("Enter   (Enter)")'
        action: Click
    - step:
        id: '181'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '182'
        action: Script
        object_path: '''''SAVE AND CLOSE WORKBOOK'
    - step:
        id: '183'
        object_path: '''objWorkbook'
        action: Save
    - step:
        id: '184'
        object_path: '''objWorkbook'
        action: Close
    - step:
        id: '185'
        object_path: '''objExcel'
        action: Quit
    - step:
        id: '186'
        action: Script
        object_path: '''Set objWorkbook = Nothing'
    - step:
        id: '187'
        action: Script
        object_path: '''Set objExcel = Nothing'
    - step:
        id: '188'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
      last_update_time: Tuesday, 23 August 2022 9:21:53 AM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: SAP Easy Access
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
          last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Leave Information Report_3
          properties:
          - property:
              value:
                value: ZLVE
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '400'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLRHWH
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
          last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Leave Information Report_2
          properties:
          - property:
              value:
                value: ZLVE
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
          last_update_time: Tuesday, 23 August 2022 9:21:53 AM
          child_objects:
          - object:
              class: SAPGuiGrid
              name: Annual Leave Information
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Leave Information Report
          properties:
          - property:
              value:
                value: ZLVE
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
                value: ZEH25P01
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
          last_update_time: Tuesday, 23 August 2022 9:21:53 AM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Org. structure
              properties:
              - property:
                  value:
                    value: PNPS$ORG
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Easy Reporter
          properties:
          - property:
              value:
                value: /SPIN/ER
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
                value: /ALG/MNU_MAINMENU
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
          last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TAB_RUN_RPT
              properties:
              - property:
                  value:
                    value: TAB_RUN_RPT
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
          - object:
              class: SAPGuiRadioButton
              name: Current year
              properties:
              - property:
                  value:
                    value: Current year
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: RUN_CURR_YR
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Period
              properties:
              - property:
                  value:
                    value: BUT_DATES_PERIOD
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute Report in Foreground
              properties:
              - property:
                  value:
                    value: BUT_RUN_RPT
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter   (Enter)
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Choose Organizational_2
          properties:
          - property:
              value:
                value: /SPIN/ER
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '400'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLRHWH
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
          last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Choose Organizational
          properties:
          - property:
              value:
                value: ZLVE
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '400'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLRHWH
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
          last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Select subtree   (Shift+F1)
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Additional Selection
          properties:
          - property:
              value:
                value: /SPIN/ER
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
          last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
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
              last_update_time: Tuesday, 23 August 2022 9:21:53 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
