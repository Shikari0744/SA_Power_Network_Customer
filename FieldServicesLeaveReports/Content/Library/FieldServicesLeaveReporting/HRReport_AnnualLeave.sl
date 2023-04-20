namespace: FieldServicesLeaveReporting
operation:
  name: HRReport_AnnualLeave
  inputs:
  - orgStructure: Organizational structure;SA POWER NETWORKS;SA Power Networks;Field
      Services;Operations Delivery Metropolitan;Metropolitan Operations South;St Marys
  - filepath: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Field
      Services Leave Balance Reports\04-04-2022\Automation - Leave Balances as at
      4-04-2022.xlsx
  - orgStructureSelection: St Marys
  sequential_action:
    gav: com.microfocus.seq:FieldServicesLeaveReporting.HRReport_AnnualLeave:1.0.1
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
        object_path: '''ANNUAL LEAVE EXTRACTION'
    - step:
        id: '2'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '3'
        action: Script
        object_path: '''CREATE EXCEL DOCUMENT'
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
        object_path: '''OPEN WORKBOOK'
    - step:
        id: '7'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.Open(Parameter("filepath"))
    - step:
        id: '8'
        action: Script
        object_path: '''OPEN SHEET'
    - step:
        id: '9'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("Annual Leave")
    - step:
        id: '10'
        action: Script
        object_path: '''GET ROW COUNT'
    - step:
        id: '11'
        action: Script
        object_path: excelRow = 2
        comment: objWorksheet.usedrange.Rows.Count + 1
    - step:
        id: '12'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '13'
        action: Script
        object_path: orgStructure = Parameter("orgStructure")
    - step:
        id: '14'
        action: Script
        object_path: orgStruct = Split(orgStructure,"|")
    - step:
        id: '15'
        action: Script
        object_path: orgStructureSelection = Parameter("orgStructureSelection")
    - step:
        id: '16'
        action: Script
        object_path: orgStructSelect = Split(orgStructureSelection,"|")
    - step:
        id: '17'
        action: Script
        object_path: '''EXTRACT ANNUAL LEAVE BALANCES AND ADD TO EXCEL'
    - step:
        id: '18'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nZLVE"'
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '21'
    - step:
        id: '19'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access")
        action: SendKey
        args: ENTER
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '0'
    - step:
        id: '20'
        action: Script
        object_path: currentYear = Year(date)
    - step:
        id: '21'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Leave Information Report").SAPGuiEdit("Annual
          Leave Quota Balances")
        action: Set
        args: currentYear
    - step:
        id: '22'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Leave Information Report").SAPGuiButton("Org.
          structure")
        action: Click
    - step:
        id: '23'
        action: Script
        object_path: For x = 0 To Ubound(orgStruct)
    - step:
        id: '24'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose Organizational").SAPGuiTree("TableTreeControl")
        action: Set
        args: orgStruct(x),orgStructSelect(x),"ON"
    - step:
        id: '25'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose Organizational").SAPGuiButton("Select
          subtree   (Shift+F1)")
        action: Click
    - step:
        id: '26'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '27'
        action: Script
        object_path: Next
        snapshot: .\Snapshots\ssf4.png
        highlight_id: '4'
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Choose Organizational").SAPGuiButton("Continue   (Enter)")
        action: Click
        snapshot: .\Snapshots\ssf6.png
        highlight_id: '2'
    - step:
        id: '29'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Leave Information Report").SAPGuiButton("Execute   (F8)")
        action: Click
        snapshot: .\Snapshots\ssf11.png
        highlight_id: '2'
    - step:
        id: '30'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '31'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Leave Information Report_2").SAPGuiGrid("Annual
          Leave Information").Exist(3) Then
    - step:
        id: '32'
        action: Script
        object_path: sapRow = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").RowCount
    - step:
        id: '33'
        action: Script
        object_path: For i = 1 To sapRow
    - step:
        id: '34'
        action: Script
        object_path: employeeNo = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Employee
          No")
    - step:
        id: '35'
        action: Script
        object_path: employeeNo = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Employee
          No")
    - step:
        id: '36'
        action: Script
        object_path: employeeName = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Employee
          Name")
    - step:
        id: '37'
        action: Script
        object_path: tda = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "TDA")
    - step:
        id: '38'
        action: Script
        object_path: tdaName = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "TDA Name")
    - step:
        id: '39'
        action: Script
        object_path: entitlement = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Entitlement")
    - step:
        id: '40'
        action: Script
        object_path: If Instr(entitlement,"-") Then
    - step:
        id: '41'
        action: Script
        object_path: entitlement = Replace(entitlement,"-","")
    - step:
        id: '42'
        action: Script
        object_path: entitlement = "-"&entitlement
    - step:
        id: '43'
        action: Script
        object_path: entitlement = CDbl(entitlement)
    - step:
        id: '44'
        action: Script
        object_path: End If
    - step:
        id: '45'
        action: Script
        object_path: currentAccrual = SAPGuiSession("Session").SAPGuiWindow("Leave
          Information Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i,
          "Current Accrual")
    - step:
        id: '46'
        action: Script
        object_path: If Instr(currentAccrual,"-") Then
    - step:
        id: '47'
        action: Script
        object_path: currentAccrual = Replace(currentAccrual,"-","")
    - step:
        id: '48'
        action: Script
        object_path: currentAccrual = "-"&currentAccrual
    - step:
        id: '49'
        action: Script
        object_path: currentAccrual = CDbl(currentAccrual)
    - step:
        id: '50'
        action: Script
        object_path: End If
    - step:
        id: '51'
        action: Script
        object_path: balance = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Balance")
    - step:
        id: '52'
        action: Script
        object_path: If Instr(balance,"-") Then
    - step:
        id: '53'
        action: Script
        object_path: balance = Replace(balance,"-","")
    - step:
        id: '54'
        action: Script
        object_path: balance = "-"&balance
    - step:
        id: '55'
        action: Script
        object_path: balance = CDbl(balance)
    - step:
        id: '56'
        action: Script
        object_path: End If
    - step:
        id: '57'
        action: Script
        object_path: anniversary = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Anniversary")
    - step:
        id: '58'
        action: Script
        object_path: january = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Jan")
    - step:
        id: '59'
        action: Script
        object_path: If Instr(january,"-") Then
    - step:
        id: '60'
        action: Script
        object_path: january = Replace(january,"-","")
    - step:
        id: '61'
        action: Script
        object_path: january = "-"&january
    - step:
        id: '62'
        action: Script
        object_path: january = CDbl(january)
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        action: Script
        object_path: february = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Feb")
    - step:
        id: '65'
        action: Script
        object_path: If Instr(february,"-") Then
    - step:
        id: '66'
        action: Script
        object_path: february = Replace(february,"-","")
    - step:
        id: '67'
        action: Script
        object_path: february = "-"&february
    - step:
        id: '68'
        action: Script
        object_path: february = CDbl(february)
    - step:
        id: '69'
        action: Script
        object_path: End If
    - step:
        id: '70'
        action: Script
        object_path: march = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Mar")
    - step:
        id: '71'
        action: Script
        object_path: If Instr(march,"-") Then
    - step:
        id: '72'
        action: Script
        object_path: march = Replace(march,"-","")
    - step:
        id: '73'
        action: Script
        object_path: march = "-"&march
    - step:
        id: '74'
        action: Script
        object_path: march = CDbl(march)
    - step:
        id: '75'
        action: Script
        object_path: End If
    - step:
        id: '76'
        action: Script
        object_path: april = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Apr")
    - step:
        id: '77'
        action: Script
        object_path: If Instr(april,"-") Then
    - step:
        id: '78'
        action: Script
        object_path: april = Replace(april,"-","")
    - step:
        id: '79'
        action: Script
        object_path: april = "-"&april
    - step:
        id: '80'
        action: Script
        object_path: april = CDbl(april)
    - step:
        id: '81'
        action: Script
        object_path: End If
    - step:
        id: '82'
        action: Script
        object_path: may = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "May")
    - step:
        id: '83'
        action: Script
        object_path: If Instr(may,"-") Then
    - step:
        id: '84'
        action: Script
        object_path: may = Replace(may,"-","")
    - step:
        id: '85'
        action: Script
        object_path: may = "-"&may
    - step:
        id: '86'
        action: Script
        object_path: may = CDbl(may)
    - step:
        id: '87'
        action: Script
        object_path: End If
    - step:
        id: '88'
        action: Script
        object_path: june = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Jun")
    - step:
        id: '89'
        action: Script
        object_path: If Instr(june,"-") Then
    - step:
        id: '90'
        action: Script
        object_path: june = Replace(june,"-","")
    - step:
        id: '91'
        action: Script
        object_path: june = "-"&june
    - step:
        id: '92'
        action: Script
        object_path: june = CDbl(june)
    - step:
        id: '93'
        action: Script
        object_path: End If
    - step:
        id: '94'
        action: Script
        object_path: july = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Jul")
    - step:
        id: '95'
        action: Script
        object_path: If Instr(july,"-") Then
    - step:
        id: '96'
        action: Script
        object_path: july = Replace(july,"-","")
    - step:
        id: '97'
        action: Script
        object_path: july = "-"&july
    - step:
        id: '98'
        action: Script
        object_path: july = CDbl(july)
    - step:
        id: '99'
        action: Script
        object_path: End If
    - step:
        id: '100'
        action: Script
        object_path: august= SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Aug")
    - step:
        id: '101'
        action: Script
        object_path: If Instr(august,"-") Then
    - step:
        id: '102'
        action: Script
        object_path: august = Replace(august,"-","")
    - step:
        id: '103'
        action: Script
        object_path: august = "-"&august
    - step:
        id: '104'
        action: Script
        object_path: august = CDbl(august)
    - step:
        id: '105'
        action: Script
        object_path: End If
    - step:
        id: '106'
        action: Script
        object_path: september = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Sep")
    - step:
        id: '107'
        action: Script
        object_path: If Instr(september,"-") Then
    - step:
        id: '108'
        action: Script
        object_path: september = Replace(september,"-","")
    - step:
        id: '109'
        action: Script
        object_path: september = "-"&september
    - step:
        id: '110'
        action: Script
        object_path: september = CDbl(september)
    - step:
        id: '111'
        action: Script
        object_path: End If
    - step:
        id: '112'
        action: Script
        object_path: october = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Oct")
    - step:
        id: '113'
        action: Script
        object_path: If Instr(october,"-") Then
    - step:
        id: '114'
        action: Script
        object_path: october = Replace(october,"-","")
    - step:
        id: '115'
        action: Script
        object_path: october = "-"&october
    - step:
        id: '116'
        action: Script
        object_path: october = CDbl(october)
    - step:
        id: '117'
        action: Script
        object_path: End If
    - step:
        id: '118'
        action: Script
        object_path: november = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Nov")
    - step:
        id: '119'
        action: Script
        object_path: If Instr(november,"-") Then
    - step:
        id: '120'
        action: Script
        object_path: november = Replace(november,"-","")
    - step:
        id: '121'
        action: Script
        object_path: november = "-"&november
    - step:
        id: '122'
        action: Script
        object_path: november = CDbl(november)
    - step:
        id: '123'
        action: Script
        object_path: End If
    - step:
        id: '124'
        action: Script
        object_path: december = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Dec")
    - step:
        id: '125'
        action: Script
        object_path: If Instr(december,"-") Then
    - step:
        id: '126'
        action: Script
        object_path: december = Replace(december,"-","")
    - step:
        id: '127'
        action: Script
        object_path: december = "-"&december
    - step:
        id: '128'
        action: Script
        object_path: december = CDbl(december)
    - step:
        id: '129'
        action: Script
        object_path: End If
    - step:
        id: '130'
        action: Script
        object_path: levelTotal = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "Lve Total")
    - step:
        id: '131'
        action: Script
        object_path: If Instr(levelTotal,"-") Then
    - step:
        id: '132'
        action: Script
        object_path: levelTotal = Replace(levelTotal,"-","")
    - step:
        id: '133'
        action: Script
        object_path: levelTotal = "-"&levelTotal
    - step:
        id: '134'
        action: Script
        object_path: levelTotal = CDbl(levelTotal)
    - step:
        id: '135'
        action: Script
        object_path: End If
    - step:
        id: '136'
        action: Script
        object_path: eoyTotal = SAPGuiSession("Session").SAPGuiWindow("Leave Information
          Report_2").SAPGuiGrid("Annual Leave Information").GetCellData(i, "EOY_total")
    - step:
        id: '137'
        action: Script
        object_path: If Instr(eoyTotal,"-") Then
    - step:
        id: '138'
        action: Script
        object_path: eoyTotal = Replace(eoyTotal,"-","")
    - step:
        id: '139'
        action: Script
        object_path: eoyTotal = "-"&eoyTotal
    - step:
        id: '140'
        action: Script
        object_path: eoyTotal = CDbl(eoyTotal)
    - step:
        id: '141'
        action: Script
        object_path: End If
    - step:
        id: '142'
        action: Script
        object_path: '''If Logistics file, only include specific leaders'
    - step:
        id: '143'
        action: Script
        object_path: If Instr(Parameter("filepath"),"Logistics") > 0 Then
    - step:
        id: '144'
        action: Script
        object_path: If tdaName = "Dilena A" or tdaName = "Docking B" or tdaName =
          "Caldicott P" or tdaName = "Turner P" or tdaName = "Souter G" or tdaName
          = "Lindner T" or tdaName = "Perrone A" or tdaName = "Durdin C" Then
    - step:
        id: '145'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = employeeNo
    - step:
        id: '146'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeName
    - step:
        id: '147'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = tda
    - step:
        id: '148'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = tdaName
    - step:
        id: '149'
        object_path: objWorksheet.Cells(excelRow,5)
        action: Value
        args: = entitlement
    - step:
        id: '150'
        object_path: objWorksheet.Cells(excelRow,6)
        action: Value
        args: = currentAccrual
    - step:
        id: '151'
        object_path: objWorksheet.Cells(excelRow,7)
        action: Value
        args: = balance
    - step:
        id: '152'
        object_path: objWorksheet.Cells(excelRow,8)
        action: Value
        args: = anniversary
    - step:
        id: '153'
        object_path: objWorksheet.Cells(excelRow,9)
        action: Value
        args: = january
    - step:
        id: '154'
        object_path: objWorksheet.Cells(excelRow,10)
        action: Value
        args: = february
    - step:
        id: '155'
        object_path: objWorksheet.Cells(excelRow,11)
        action: Value
        args: = march
    - step:
        id: '156'
        object_path: objWorksheet.Cells(excelRow,12)
        action: Value
        args: = april
    - step:
        id: '157'
        object_path: objWorksheet.Cells(excelRow,13)
        action: Value
        args: = may
    - step:
        id: '158'
        object_path: objWorksheet.Cells(excelRow,14)
        action: Value
        args: = june
    - step:
        id: '159'
        object_path: objWorksheet.Cells(excelRow,15)
        action: Value
        args: = july
    - step:
        id: '160'
        object_path: objWorksheet.Cells(excelRow,16)
        action: Value
        args: = august
    - step:
        id: '161'
        object_path: objWorksheet.Cells(excelRow,17)
        action: Value
        args: = september
    - step:
        id: '162'
        object_path: objWorksheet.Cells(excelRow,18)
        action: Value
        args: = october
    - step:
        id: '163'
        object_path: objWorksheet.Cells(excelRow,19)
        action: Value
        args: = november
    - step:
        id: '164'
        object_path: objWorksheet.Cells(excelRow,20)
        action: Value
        args: = december
    - step:
        id: '165'
        action: Script
        object_path: alTaken = findALTaken
    - step:
        id: '166'
        object_path: objWorksheet.Cells(excelRow,21)
        action: Value
        args: = alTaken
    - step:
        id: '167'
        action: Script
        object_path: alPlanned = findALPlanned
    - step:
        id: '168'
        object_path: objWorksheet.Cells(excelRow,22)
        action: Value
        args: = alPlanned
    - step:
        id: '169'
        object_path: objWorksheet.Cells(excelRow,23)
        action: Value
        args: = balance
    - step:
        id: '170'
        object_path: objWorksheet.Cells(excelRow,24)
        action: Value
        args: = eoyTotal
    - step:
        id: '171'
        action: Script
        object_path: If eoyTotal > 287 Then
    - step:
        id: '172'
        object_path: objWorksheet.cells(excelRow,24).interior
        action: ColorIndex
        args: = 3
    - step:
        id: '173'
        action: Script
        object_path: End If
    - step:
        id: '174'
        action: Script
        object_path: hoursToBe = eoyTotal - 287
    - step:
        id: '175'
        action: Script
        object_path: If hoursToBe > 0 Then
    - step:
        id: '176'
        object_path: objWorksheet.Cells(excelRow,25)
        action: Value
        args: = hoursToBe
    - step:
        id: '177'
        action: Script
        object_path: daysToBe = hoursToBe / 8
    - step:
        id: '178'
        object_path: objWorksheet.Cells(excelRow,26)
        action: Value
        args: = daysToBe
    - step:
        id: '179'
        action: Script
        object_path: Else
    - step:
        id: '180'
        object_path: objWorksheet.Cells(excelRow,25)
        action: Value
        args: = 0
    - step:
        id: '181'
        object_path: objWorksheet.Cells(excelRow,26)
        action: Value
        args: = 0
    - step:
        id: '182'
        action: Script
        object_path: End If
    - step:
        id: '183'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '184'
        action: Script
        object_path: End If
    - step:
        id: '185'
        action: Script
        object_path: '''If Ops Planning file, don''t include Logistics leaders'
    - step:
        id: '186'
        action: Script
        object_path: ElseIf Instr(Parameter("filepath"),"Operations Planning") > 0
          Then
    - step:
        id: '187'
        action: Script
        object_path: If tdaName = "Dilena A" or tdaName = "Docking B" or tdaName =
          "Caldicott P" or tdaName = "Turner P" or tdaName = "Souter G" or tdaName
          = "Lindner T" or tdaName = "Perrone A" or tdaName = "Durdin C" Then
    - step:
        id: '188'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '189'
        action: Script
        object_path: Else
    - step:
        id: '190'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = employeeNo
    - step:
        id: '191'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeName
    - step:
        id: '192'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = tda
    - step:
        id: '193'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = tdaName
    - step:
        id: '194'
        object_path: objWorksheet.Cells(excelRow,5)
        action: Value
        args: = entitlement
    - step:
        id: '195'
        object_path: objWorksheet.Cells(excelRow,6)
        action: Value
        args: = currentAccrual
    - step:
        id: '196'
        object_path: objWorksheet.Cells(excelRow,7)
        action: Value
        args: = balance
    - step:
        id: '197'
        object_path: objWorksheet.Cells(excelRow,8)
        action: Value
        args: = anniversary
    - step:
        id: '198'
        object_path: objWorksheet.Cells(excelRow,9)
        action: Value
        args: = january
    - step:
        id: '199'
        object_path: objWorksheet.Cells(excelRow,10)
        action: Value
        args: = february
    - step:
        id: '200'
        object_path: objWorksheet.Cells(excelRow,11)
        action: Value
        args: = march
    - step:
        id: '201'
        object_path: objWorksheet.Cells(excelRow,12)
        action: Value
        args: = april
    - step:
        id: '202'
        object_path: objWorksheet.Cells(excelRow,13)
        action: Value
        args: = may
    - step:
        id: '203'
        object_path: objWorksheet.Cells(excelRow,14)
        action: Value
        args: = june
    - step:
        id: '204'
        object_path: objWorksheet.Cells(excelRow,15)
        action: Value
        args: = july
    - step:
        id: '205'
        object_path: objWorksheet.Cells(excelRow,16)
        action: Value
        args: = august
    - step:
        id: '206'
        object_path: objWorksheet.Cells(excelRow,17)
        action: Value
        args: = september
    - step:
        id: '207'
        object_path: objWorksheet.Cells(excelRow,18)
        action: Value
        args: = october
    - step:
        id: '208'
        object_path: objWorksheet.Cells(excelRow,19)
        action: Value
        args: = november
    - step:
        id: '209'
        object_path: objWorksheet.Cells(excelRow,20)
        action: Value
        args: = december
    - step:
        id: '210'
        action: Script
        object_path: alTaken = findALTaken
    - step:
        id: '211'
        object_path: objWorksheet.Cells(excelRow,21)
        action: Value
        args: = alTaken
    - step:
        id: '212'
        action: Script
        object_path: alPlanned = findALPlanned
    - step:
        id: '213'
        object_path: objWorksheet.Cells(excelRow,22)
        action: Value
        args: = alPlanned
    - step:
        id: '214'
        object_path: objWorksheet.Cells(excelRow,23)
        action: Value
        args: = balance
    - step:
        id: '215'
        object_path: objWorksheet.Cells(excelRow,24)
        action: Value
        args: = eoyTotal
    - step:
        id: '216'
        action: Script
        object_path: If eoyTotal > 287 Then
    - step:
        id: '217'
        object_path: objWorksheet.cells(excelRow,24).interior
        action: ColorIndex
        args: = 3
    - step:
        id: '218'
        action: Script
        object_path: End If
    - step:
        id: '219'
        action: Script
        object_path: hoursToBe = eoyTotal - 287
    - step:
        id: '220'
        action: Script
        object_path: If hoursToBe > 0 Then
    - step:
        id: '221'
        object_path: objWorksheet.Cells(excelRow,25)
        action: Value
        args: = hoursToBe
    - step:
        id: '222'
        action: Script
        object_path: daysToBe = hoursToBe / 8
    - step:
        id: '223'
        object_path: objWorksheet.Cells(excelRow,26)
        action: Value
        args: = daysToBe
    - step:
        id: '224'
        action: Script
        object_path: Else
    - step:
        id: '225'
        object_path: objWorksheet.Cells(excelRow,25)
        action: Value
        args: = 0
    - step:
        id: '226'
        object_path: objWorksheet.Cells(excelRow,26)
        action: Value
        args: = 0
    - step:
        id: '227'
        action: Script
        object_path: End If
    - step:
        id: '228'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '229'
        action: Script
        object_path: End If
    - step:
        id: '230'
        action: Script
        object_path: Else
    - step:
        id: '231'
        object_path: objWorksheet.Cells(excelRow,1)
        action: Value
        args: = employeeNo
    - step:
        id: '232'
        object_path: objWorksheet.Cells(excelRow,2)
        action: Value
        args: = employeeName
    - step:
        id: '233'
        object_path: objWorksheet.Cells(excelRow,3)
        action: Value
        args: = tda
    - step:
        id: '234'
        object_path: objWorksheet.Cells(excelRow,4)
        action: Value
        args: = tdaName
    - step:
        id: '235'
        object_path: objWorksheet.Cells(excelRow,5)
        action: Value
        args: = entitlement
    - step:
        id: '236'
        object_path: objWorksheet.Cells(excelRow,6)
        action: Value
        args: = currentAccrual
    - step:
        id: '237'
        object_path: objWorksheet.Cells(excelRow,7)
        action: Value
        args: = balance
    - step:
        id: '238'
        object_path: objWorksheet.Cells(excelRow,8)
        action: Value
        args: = anniversary
    - step:
        id: '239'
        object_path: objWorksheet.Cells(excelRow,9)
        action: Value
        args: = january
    - step:
        id: '240'
        object_path: objWorksheet.Cells(excelRow,10)
        action: Value
        args: = february
    - step:
        id: '241'
        object_path: objWorksheet.Cells(excelRow,11)
        action: Value
        args: = march
    - step:
        id: '242'
        object_path: objWorksheet.Cells(excelRow,12)
        action: Value
        args: = april
    - step:
        id: '243'
        object_path: objWorksheet.Cells(excelRow,13)
        action: Value
        args: = may
    - step:
        id: '244'
        object_path: objWorksheet.Cells(excelRow,14)
        action: Value
        args: = june
    - step:
        id: '245'
        object_path: objWorksheet.Cells(excelRow,15)
        action: Value
        args: = july
    - step:
        id: '246'
        object_path: objWorksheet.Cells(excelRow,16)
        action: Value
        args: = august
    - step:
        id: '247'
        object_path: objWorksheet.Cells(excelRow,17)
        action: Value
        args: = september
    - step:
        id: '248'
        object_path: objWorksheet.Cells(excelRow,18)
        action: Value
        args: = october
    - step:
        id: '249'
        object_path: objWorksheet.Cells(excelRow,19)
        action: Value
        args: = november
    - step:
        id: '250'
        object_path: objWorksheet.Cells(excelRow,20)
        action: Value
        args: = december
    - step:
        id: '251'
        action: Script
        object_path: alTaken = findALTaken
    - step:
        id: '252'
        object_path: objWorksheet.Cells(excelRow,21)
        action: Value
        args: = alTaken
    - step:
        id: '253'
        action: Script
        object_path: alPlanned = findALPlanned
    - step:
        id: '254'
        object_path: objWorksheet.Cells(excelRow,22)
        action: Value
        args: = alPlanned
    - step:
        id: '255'
        object_path: objWorksheet.Cells(excelRow,23)
        action: Value
        args: = balance
    - step:
        id: '256'
        object_path: objWorksheet.Cells(excelRow,24)
        action: Value
        args: = eoyTotal
    - step:
        id: '257'
        action: Script
        object_path: If eoyTotal > 287 Then
    - step:
        id: '258'
        object_path: objWorksheet.cells(excelRow,24).interior
        action: ColorIndex
        args: = 3
    - step:
        id: '259'
        action: Script
        object_path: End If
    - step:
        id: '260'
        action: Script
        object_path: hoursToBe = eoyTotal - 287
    - step:
        id: '261'
        action: Script
        object_path: If hoursToBe > 0 Then
    - step:
        id: '262'
        object_path: objWorksheet.Cells(excelRow,25)
        action: Value
        args: = hoursToBe
    - step:
        id: '263'
        action: Script
        object_path: daysToBe = hoursToBe / 8
    - step:
        id: '264'
        object_path: objWorksheet.Cells(excelRow,26)
        action: Value
        args: = daysToBe
    - step:
        id: '265'
        action: Script
        object_path: Else
    - step:
        id: '266'
        object_path: objWorksheet.Cells(excelRow,25)
        action: Value
        args: = 0
    - step:
        id: '267'
        object_path: objWorksheet.Cells(excelRow,26)
        action: Value
        args: = 0
    - step:
        id: '268'
        action: Script
        object_path: End If
    - step:
        id: '269'
        action: Script
        object_path: excelRow = excelRow + 1
    - step:
        id: '270'
        action: Script
        object_path: End If
    - step:
        id: '271'
        action: Script
        object_path: Next
    - step:
        id: '272'
        action: Script
        object_path: End If
    - step:
        id: '273'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Leave Information Report_2").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '274'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Leave Information Report_2").SAPGuiButton("Enter")
        action: Click
    - step:
        id: '275'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '276'
        action: Script
        object_path: '''SAVE AND CLOSE WORKBOOK'
    - step:
        id: '277'
        object_path: objWorkbook
        action: Save
    - step:
        id: '278'
        object_path: objWorkbook
        action: Close
    - step:
        id: '279'
        object_path: objExcel
        action: Quit
    - step:
        id: '280'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '281'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '282'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '283'
        action: Script
        object_path: Function findALTaken
    - step:
        id: '284'
        action: Script
        object_path: currentMonth = month(date)
    - step:
        id: '285'
        action: Script
        object_path: current = currentMonth + 8
    - step:
        id: '286'
        action: Script
        object_path: alTaken = 0
    - step:
        id: '287'
        action: Script
        object_path: For e = 9 To current
    - step:
        id: '288'
        action: Script
        object_path: monthN = objWorksheet.Cells(1,e).Value
    - step:
        id: '289'
        action: Script
        object_path: alT = objWorksheet.Cells(excelRow,e).Value
    - step:
        id: '290'
        action: Script
        object_path: alTaken = alTaken + CDbl(alT)
    - step:
        id: '291'
        action: Script
        object_path: Next
    - step:
        id: '292'
        action: Script
        object_path: findALTaken = alTaken
    - step:
        id: '293'
        action: Script
        object_path: End Function
    - step:
        id: '294'
        action: Script
        object_path: Function findALPlanned
    - step:
        id: '295'
        action: Script
        object_path: currentMonth = month(date)
    - step:
        id: '296'
        action: Script
        object_path: current = currentMonth + 9
    - step:
        id: '297'
        action: Script
        object_path: alPlanned = 0
    - step:
        id: '298'
        action: Script
        object_path: For e = current To 20
    - step:
        id: '299'
        action: Script
        object_path: monthN = objWorksheet.Cells(1,e).Value
    - step:
        id: '300'
        action: Script
        object_path: alP = objWorksheet.Cells(excelRow,e).Value
    - step:
        id: '301'
        action: Script
        object_path: alPlanned = alPlanned + CDbl(alP)
    - step:
        id: '302'
        action: Script
        object_path: Next
    - step:
        id: '303'
        action: Script
        object_path: findALPlanned = alPlanned
    - step:
        id: '304'
        action: Script
        object_path: End Function
        snapshot: .\Snapshots\ssf95.png
        highlight_id: '4'
    - step:
        id: '305'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
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
      last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
      last_update_time: Thursday, 8 September 2022 10:53:56 AM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: This layout already exists.
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
                    value: wnd[3]/usr/btnSPOP-OPTION1
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Save Layout
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
                value: '505'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSLVC_DIALOG
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
                    value: wnd[2]/tbar[0]/btn[12]
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Leave Information Report_4
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
                value: '2510'
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Change layout...   (Ctrl+F8)
              properties:
              - property:
                  value:
                    value: btn[32]
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
                    value: wnd[0]/tbar[1]/btn[32]
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Annual Leave Quota Balances
              properties:
              - property:
                  value:
                    value: P_YEAR
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
                    value: wnd[0]/usr/txtP_YEAR
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
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
              - property:
                  value:
                    value: wnd[0]/usr/btnPNPS$ORG
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Find
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
                value: '841'
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: 'Search Term:'
              properties:
              - property:
                  value:
                    value: GS_SEARCH-VALUE
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
                    value: wnd[2]/usr/txtGS_SEARCH-VALUE
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: OK   (Enter)
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
                    value: wnd[2]/tbar[0]/btn[12]
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
                    value: wnd[1]/usr/subSUB_SEARCH:SAPLRHWH:0300/cntlSEARCH_TREE/shellcont/shell
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[13]
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Layout
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
                value: '2510'
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
          last_update_time: Thursday, 8 September 2022 10:53:56 AM
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
                    value: usr/tabsG_TS_ALV/tabpALV_M_R1/ssubSUB_DYN0510:SAPLSKBH:0620/cntlCONTAINER1_LAYO/shellcont/shell
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - guicomponenttype
                ordinal_identifier:
                  value: 0
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
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
                    value: wnd[1]/usr/tabsG_TS_ALV/tabpALV_M_R1/ssubSUB_DYN0510:SAPLSKBH:0620/cntlCONTAINER1_LAYO/shellcont/shell
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Transfer   (Enter)
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Show Selected Fields (F7)
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
                    value: wnd[1]/usr/tabsG_TS_ALV/tabpALV_M_R1/ssubSUB_DYN0510:SAPLSKBH:0620/btnAPP_WL_SING
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save layout   (F5)
              properties:
              - property:
                  value:
                    value: btn[5]
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
                    value: wnd[1]/tbar[0]/btn[5]
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
              last_update_time: Thursday, 8 September 2022 10:53:56 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
