namespace: FieldServicesConsolidatedLeaveReporting
operation:
  name: CreateExcelFiles
  inputs:
  - orgStructureSelection
  - reportName:
      required: false
  - currentDate
  - folderLocation
  - structureFile
  - iteration
  sequential_action:
    gav: com.microfocus.seq:FieldServicesConsolidatedLeaveReporting.CreateExcelFiles:1.0.1
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
        object_path: '''CREATE EXCEL DOCUMENT AND SET UP COLUMN NAMES'
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
        object_path: Set objWorkbook = objExcel.Workbooks.Add()
    - step:
        id: '5'
        action: Script
        object_path: '''EQUALISATION REPORT'
    - step:
        id: '6'
        action: Script
        object_path: Set objWorksheet = objWorkbook.sheets.Add
    - step:
        id: '7'
        object_path: objWorksheet
        action: name
        args: = "Equalisation"
    - step:
        id: '8'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("Equalisation")
    - step:
        id: '9'
        object_path: objWorksheet.Cells(1,1)
        action: Value
        args: = "Employee Number"
    - step:
        id: '10'
        object_path: objWorksheet.Cells(1,1).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '11'
        object_path: objWorksheet.Cells(1,1)
        action: ColumnWidth
        args: = 20
    - step:
        id: '12'
        object_path: objWorksheet.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '13'
        object_path: objWorksheet.Cells(1,2)
        action: Value
        args: = "Employee Name"
    - step:
        id: '14'
        object_path: objWorksheet.Cells(1,2).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '15'
        object_path: objWorksheet.Cells(1,2)
        action: ColumnWidth
        args: = 20
    - step:
        id: '16'
        object_path: objWorksheet.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '17'
        object_path: objWorksheet.Cells(1,3)
        action: Value
        args: = "Balance"
    - step:
        id: '18'
        object_path: objWorksheet.Cells(1,3).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '19'
        object_path: objWorksheet.Cells(1,3)
        action: ColumnWidth
        args: = 20
    - step:
        id: '20'
        object_path: objWorksheet.Cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '21'
        object_path: objWorksheet.Cells(1,4)
        action: Value
        args: = "Time Admin"
    - step:
        id: '22'
        object_path: objWorksheet.Cells(1,4).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '23'
        object_path: objWorksheet.Cells(1,4)
        action: ColumnWidth
        args: = 20
    - step:
        id: '24'
        object_path: objWorksheet.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '25'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '26'
        action: Script
        object_path: '''FLEXI AND LSL REPORT'
    - step:
        id: '27'
        action: Script
        object_path: Set objWorksheet = objWorkbook.sheets.Add
    - step:
        id: '28'
        object_path: objWorksheet
        action: name
        args: = "Flexi and LSL"
    - step:
        id: '29'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("Flexi and LSL")
    - step:
        id: '30'
        object_path: objWorksheet.Cells(1,1)
        action: Value
        args: = "Employee Number"
    - step:
        id: '31'
        object_path: objWorksheet.Cells(1,1).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '32'
        object_path: objWorksheet.Cells(1,1)
        action: ColumnWidth
        args: = 20
    - step:
        id: '33'
        object_path: objWorksheet.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '34'
        object_path: objWorksheet.Cells(1,2)
        action: Value
        args: = "Employee Name"
    - step:
        id: '35'
        object_path: objWorksheet.Cells(1,2).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '36'
        object_path: objWorksheet.Cells(1,2)
        action: ColumnWidth
        args: = 20
    - step:
        id: '37'
        object_path: objWorksheet.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '38'
        object_path: objWorksheet.Cells(1,3)
        action: Value
        args: = "Quota Text"
    - step:
        id: '39'
        object_path: objWorksheet.Cells(1,3).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '40'
        object_path: objWorksheet.Cells(1,3)
        action: ColumnWidth
        args: = 20
    - step:
        id: '41'
        object_path: objWorksheet.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '42'
        object_path: objWorksheet.Cells(1,4)
        action: Value
        args: = "TDA"
    - step:
        id: '43'
        object_path: objWorksheet.Cells(1,4).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '44'
        object_path: objWorksheet.Cells(1,4)
        action: ColumnWidth
        args: = 20
    - step:
        id: '45'
        object_path: objWorksheet.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '46'
        object_path: objWorksheet.Cells(1,5)
        action: Value
        args: = "TDA Name"
    - step:
        id: '47'
        object_path: objWorksheet.Cells(1,5).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '48'
        object_path: objWorksheet.Cells(1,5)
        action: ColumnWidth
        args: = 20
    - step:
        id: '49'
        object_path: objWorksheet.Cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '50'
        object_path: objWorksheet.Cells(1,6)
        action: Value
        args: = "Balance"
    - step:
        id: '51'
        object_path: objWorksheet.Cells(1,6).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '52'
        object_path: objWorksheet.Cells(1,6)
        action: ColumnWidth
        args: = 20
    - step:
        id: '53'
        object_path: objWorksheet.Cells(1,6)
        action: WrapText
        args: = true
    - step:
        id: '54'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '55'
        action: Script
        object_path: '''TOIL REPORT'
    - step:
        id: '56'
        action: Script
        object_path: Set objWorksheet = objWorkbook.sheets.Add
    - step:
        id: '57'
        object_path: objWorksheet
        action: name
        args: = "TOIL"
    - step:
        id: '58'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("TOIL")
    - step:
        id: '59'
        object_path: objWorksheet.Cells(1,1)
        action: Value
        args: = "Employee Number"
    - step:
        id: '60'
        object_path: objWorksheet.Cells(1,1).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '61'
        object_path: objWorksheet.Cells(1,1)
        action: ColumnWidth
        args: = 20
    - step:
        id: '62'
        object_path: objWorksheet.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '63'
        object_path: objWorksheet.Cells(1,2)
        action: Value
        args: = "Employee Name"
    - step:
        id: '64'
        object_path: objWorksheet.Cells(1,2).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '65'
        object_path: objWorksheet.Cells(1,2)
        action: ColumnWidth
        args: = 20
    - step:
        id: '66'
        object_path: objWorksheet.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '67'
        object_path: objWorksheet.Cells(1,3)
        action: Value
        args: = "TDA"
    - step:
        id: '68'
        object_path: objWorksheet.Cells(1,3).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '69'
        object_path: objWorksheet.Cells(1,3)
        action: ColumnWidth
        args: = 20
    - step:
        id: '70'
        object_path: objWorksheet.Cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '71'
        object_path: objWorksheet.Cells(1,4)
        action: Value
        args: = "TDA Name"
    - step:
        id: '72'
        object_path: objWorksheet.Cells(1,4).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '73'
        object_path: objWorksheet.Cells(1,4)
        action: ColumnWidth
        args: = 20
    - step:
        id: '74'
        object_path: objWorksheet.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '75'
        object_path: objWorksheet.Cells(1,5)
        action: Value
        args: = "Balance"
    - step:
        id: '76'
        object_path: objWorksheet.Cells(1,5).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '77'
        object_path: objWorksheet.Cells(1,5)
        action: ColumnWidth
        args: = 20
    - step:
        id: '78'
        object_path: objWorksheet.Cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '79'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '80'
        action: Script
        object_path: '''PERSONAL LEAVE REPORT'
    - step:
        id: '81'
        action: Script
        object_path: Set objWorksheet = objWorkbook.sheets.Add
    - step:
        id: '82'
        object_path: objWorksheet
        action: name
        args: = "Personal Leave"
    - step:
        id: '83'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("Personal Leave")
    - step:
        id: '84'
        object_path: objWorksheet.Cells(1,1)
        action: Value
        args: = "Cost Centre"
    - step:
        id: '85'
        object_path: objWorksheet.Cells(1,1).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '86'
        object_path: objWorksheet.Cells(1,1)
        action: ColumnWidth
        args: = 15
    - step:
        id: '87'
        object_path: objWorksheet.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '88'
        object_path: objWorksheet.Cells(1,2)
        action: Value
        args: = "Employee Number"
    - step:
        id: '89'
        object_path: objWorksheet.Cells(1,2).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '90'
        object_path: objWorksheet.Cells(1,2)
        action: ColumnWidth
        args: = 15
    - step:
        id: '91'
        object_path: objWorksheet.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '92'
        object_path: objWorksheet.Cells(1,3)
        action: Value
        args: = "Last Name"
    - step:
        id: '93'
        object_path: objWorksheet.Cells(1,3).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '94'
        object_path: objWorksheet.Cells(1,3)
        action: ColumnWidth
        args: = 15
    - step:
        id: '95'
        object_path: objWorksheet.Cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '96'
        object_path: objWorksheet.Cells(1,4)
        action: Value
        args: = "First Name"
    - step:
        id: '97'
        object_path: objWorksheet.Cells(1,4).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '98'
        object_path: objWorksheet.Cells(1,4)
        action: ColumnWidth
        args: = 15
    - step:
        id: '99'
        object_path: objWorksheet.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '100'
        object_path: objWorksheet.Cells(1,5)
        action: Value
        args: = "Administrator for Time"
    - step:
        id: '101'
        object_path: objWorksheet.Cells(1,5).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '102'
        object_path: objWorksheet.Cells(1,5)
        action: ColumnWidth
        args: = 15
    - step:
        id: '103'
        object_path: objWorksheet.Cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '104'
        object_path: objWorksheet.Cells(1,6)
        action: Value
        args: = "Contract Description"
    - step:
        id: '105'
        object_path: objWorksheet.Cells(1,6).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '106'
        object_path: objWorksheet.Cells(1,6)
        action: ColumnWidth
        args: = 15
    - step:
        id: '107'
        object_path: objWorksheet.Cells(1,6)
        action: WrapText
        args: = true
    - step:
        id: '108'
        object_path: objWorksheet.Cells(1,7)
        action: Value
        args: = "Position Description"
    - step:
        id: '109'
        object_path: objWorksheet.Cells(1,7).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '110'
        object_path: objWorksheet.Cells(1,7)
        action: ColumnWidth
        args: = 15
    - step:
        id: '111'
        object_path: objWorksheet.Cells(1,7)
        action: WrapText
        args: = true
    - step:
        id: '112'
        object_path: objWorksheet.Cells(1,8)
        action: Value
        args: = "Personal Leave Paid"
    - step:
        id: '113'
        object_path: objWorksheet.Cells(1,8).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '114'
        object_path: objWorksheet.Cells(1,8)
        action: ColumnWidth
        args: = 15
    - step:
        id: '115'
        object_path: objWorksheet.Cells(1,8)
        action: WrapText
        args: = true
    - step:
        id: '116'
        object_path: objWorksheet.Cells(1,9)
        action: Value
        args: = "Personal Leave Unpaid"
    - step:
        id: '117'
        object_path: objWorksheet.Cells(1,9).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '118'
        object_path: objWorksheet.Cells(1,9)
        action: ColumnWidth
        args: = 15
    - step:
        id: '119'
        object_path: objWorksheet.Cells(1,9)
        action: WrapText
        args: = true
    - step:
        id: '120'
        object_path: objWorksheet.Cells(1,10)
        action: Value
        args: = "Carers Leave Paid"
    - step:
        id: '121'
        object_path: objWorksheet.Cells(1,10).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '122'
        object_path: objWorksheet.Cells(1,10)
        action: ColumnWidth
        args: = 15
    - step:
        id: '123'
        object_path: objWorksheet.Cells(1,10)
        action: WrapText
        args: = true
    - step:
        id: '124'
        object_path: objWorksheet.Cells(1,11)
        action: Value
        args: = "Carers Leave Unpaid"
    - step:
        id: '125'
        object_path: objWorksheet.Cells(1,11).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '126'
        object_path: objWorksheet.Cells(1,11)
        action: ColumnWidth
        args: = 15
    - step:
        id: '127'
        object_path: objWorksheet.Cells(1,11)
        action: WrapText
        args: = true
    - step:
        id: '128'
        object_path: objWorksheet.Cells(1,12)
        action: Value
        args: = "Total Personal and Carers Leave Taken"
    - step:
        id: '129'
        object_path: objWorksheet.Cells(1,12).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '130'
        object_path: objWorksheet.Cells(1,12)
        action: ColumnWidth
        args: = 15
    - step:
        id: '131'
        object_path: objWorksheet.Cells(1,12)
        action: WrapText
        args: = true
    - step:
        id: '132'
        object_path: objWorksheet.Cells(1,13)
        action: Value
        args: = "Personal Leave Entitlement"
    - step:
        id: '133'
        object_path: objWorksheet.Cells(1,13).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '134'
        object_path: objWorksheet.Cells(1,13)
        action: ColumnWidth
        args: = 15
    - step:
        id: '135'
        object_path: objWorksheet.Cells(1,13)
        action: WrapText
        args: = true
    - step:
        id: '136'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '137'
        action: Script
        object_path: '''ANNUAL LEAVE REPORT'
    - step:
        id: '138'
        action: Script
        object_path: Set objWorksheet = objWorkbook.sheets.Add
    - step:
        id: '139'
        object_path: objWorksheet
        action: name
        args: = "Annual Leave"
    - step:
        id: '140'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("Annual Leave")
    - step:
        id: '141'
        object_path: objWorksheet.Cells(1,1)
        action: Value
        args: = "Employee Number"
    - step:
        id: '142'
        object_path: objWorksheet.Cells(1,1).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '143'
        object_path: objWorksheet.Cells(1,1)
        action: ColumnWidth
        args: = 15
    - step:
        id: '144'
        object_path: objWorksheet.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '145'
        object_path: objWorksheet.Cells(1,2)
        action: Value
        args: = "Employee Name"
    - step:
        id: '146'
        object_path: objWorksheet.Cells(1,2).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '147'
        object_path: objWorksheet.Cells(1,2)
        action: ColumnWidth
        args: = 15
    - step:
        id: '148'
        object_path: objWorksheet.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '149'
        object_path: objWorksheet.Cells(1,3)
        action: Value
        args: = "TDA"
    - step:
        id: '150'
        object_path: objWorksheet.Cells(1,3).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '151'
        object_path: objWorksheet.Cells(1,3)
        action: ColumnWidth
        args: = 15
    - step:
        id: '152'
        object_path: objWorksheet.Cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '153'
        object_path: objWorksheet.Cells(1,4)
        action: Value
        args: = "TDA Name"
    - step:
        id: '154'
        object_path: objWorksheet.Cells(1,4).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '155'
        object_path: objWorksheet.Cells(1,4)
        action: ColumnWidth
        args: = 15
    - step:
        id: '156'
        object_path: objWorksheet.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '157'
        object_path: objWorksheet.Cells(1,5)
        action: Value
        args: = "Entitlement"
    - step:
        id: '158'
        object_path: objWorksheet.Cells(1,5).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '159'
        object_path: objWorksheet.Cells(1,5)
        action: ColumnWidth
        args: = 15
    - step:
        id: '160'
        object_path: objWorksheet.Cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '161'
        object_path: objWorksheet.Cells(1,6)
        action: Value
        args: = "Current Accrual"
    - step:
        id: '162'
        object_path: objWorksheet.Cells(1,6).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '163'
        object_path: objWorksheet.Cells(1,6)
        action: ColumnWidth
        args: = 15
    - step:
        id: '164'
        object_path: objWorksheet.Cells(1,6)
        action: WrapText
        args: = true
    - step:
        id: '165'
        object_path: objWorksheet.Cells(1,7)
        action: Value
        args: = "Balance"
    - step:
        id: '166'
        object_path: objWorksheet.Cells(1,7).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '167'
        object_path: objWorksheet.Cells(1,7)
        action: ColumnWidth
        args: = 15
    - step:
        id: '168'
        object_path: objWorksheet.Cells(1,7)
        action: WrapText
        args: = true
    - step:
        id: '169'
        object_path: objWorksheet.Cells(1,8)
        action: Value
        args: = "Anniversary"
    - step:
        id: '170'
        object_path: objWorksheet.Cells(1,8).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '171'
        object_path: objWorksheet.Cells(1,8)
        action: ColumnWidth
        args: = 15
    - step:
        id: '172'
        object_path: objWorksheet.Cells(1,8)
        action: WrapText
        args: = true
    - step:
        id: '173'
        object_path: objWorksheet.Cells(1,9)
        action: Value
        args: = "Jan"
    - step:
        id: '174'
        object_path: objWorksheet.Cells(1,9).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '175'
        object_path: objWorksheet.Cells(1,9)
        action: ColumnWidth
        args: = 7
    - step:
        id: '176'
        object_path: objWorksheet.Cells(1,9)
        action: WrapText
        args: = true
    - step:
        id: '177'
        object_path: objWorksheet.Cells(1,10)
        action: Value
        args: = "Feb"
    - step:
        id: '178'
        object_path: objWorksheet.Cells(1,10).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '179'
        object_path: objWorksheet.Cells(1,10)
        action: ColumnWidth
        args: = 7
    - step:
        id: '180'
        object_path: objWorksheet.Cells(1,10)
        action: WrapText
        args: = true
    - step:
        id: '181'
        object_path: objWorksheet.Cells(1,11)
        action: Value
        args: = "Mar"
    - step:
        id: '182'
        object_path: objWorksheet.Cells(1,11).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '183'
        object_path: objWorksheet.Cells(1,11)
        action: ColumnWidth
        args: = 7
    - step:
        id: '184'
        object_path: objWorksheet.Cells(1,11)
        action: WrapText
        args: = true
    - step:
        id: '185'
        object_path: objWorksheet.Cells(1,12)
        action: Value
        args: = "Apr"
    - step:
        id: '186'
        object_path: objWorksheet.Cells(1,12).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '187'
        object_path: objWorksheet.Cells(1,12)
        action: ColumnWidth
        args: = 7
    - step:
        id: '188'
        object_path: objWorksheet.Cells(1,12)
        action: WrapText
        args: = true
    - step:
        id: '189'
        object_path: objWorksheet.Cells(1,13)
        action: Value
        args: = "May"
    - step:
        id: '190'
        object_path: objWorksheet.Cells(1,13).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '191'
        object_path: objWorksheet.Cells(1,12)
        action: ColumnWidth
        args: = 7
    - step:
        id: '192'
        object_path: objWorksheet.Cells(1,13)
        action: WrapText
        args: = true
    - step:
        id: '193'
        object_path: objWorksheet.Cells(1,14)
        action: Value
        args: = "Jun"
    - step:
        id: '194'
        object_path: objWorksheet.Cells(1,14).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '195'
        object_path: objWorksheet.Cells(1,15)
        action: ColumnWidth
        args: = 7
    - step:
        id: '196'
        object_path: objWorksheet.Cells(1,14)
        action: WrapText
        args: = true
    - step:
        id: '197'
        object_path: objWorksheet.Cells(1,15)
        action: Value
        args: = "Jul"
    - step:
        id: '198'
        object_path: objWorksheet.Cells(1,15).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '199'
        object_path: objWorksheet.Cells(1,15)
        action: ColumnWidth
        args: = 7
    - step:
        id: '200'
        object_path: objWorksheet.Cells(1,15)
        action: WrapText
        args: = true
    - step:
        id: '201'
        object_path: objWorksheet.Cells(1,16)
        action: Value
        args: = "Aug"
    - step:
        id: '202'
        object_path: objWorksheet.Cells(1,16).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '203'
        object_path: objWorksheet.Cells(1,16)
        action: ColumnWidth
        args: = 7
    - step:
        id: '204'
        object_path: objWorksheet.Cells(1,16)
        action: WrapText
        args: = true
    - step:
        id: '205'
        object_path: objWorksheet.Cells(1,17)
        action: Value
        args: = "Sep"
    - step:
        id: '206'
        object_path: objWorksheet.Cells(1,17).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '207'
        object_path: objWorksheet.Cells(1,17)
        action: ColumnWidth
        args: = 7
    - step:
        id: '208'
        object_path: objWorksheet.Cells(1,17)
        action: WrapText
        args: = true
    - step:
        id: '209'
        object_path: objWorksheet.Cells(1,18)
        action: Value
        args: = "Oct"
    - step:
        id: '210'
        object_path: objWorksheet.Cells(1,18).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '211'
        object_path: objWorksheet.Cells(1,18)
        action: ColumnWidth
        args: = 7
    - step:
        id: '212'
        object_path: objWorksheet.Cells(1,18)
        action: WrapText
        args: = true
    - step:
        id: '213'
        object_path: objWorksheet.Cells(1,19)
        action: Value
        args: = "Nov"
    - step:
        id: '214'
        object_path: objWorksheet.Cells(1,19).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '215'
        object_path: objWorksheet.Cells(1,19)
        action: ColumnWidth
        args: = 7
    - step:
        id: '216'
        object_path: objWorksheet.Cells(1,19)
        action: WrapText
        args: = true
    - step:
        id: '217'
        object_path: objWorksheet.Cells(1,20)
        action: Value
        args: = "Dec"
    - step:
        id: '218'
        object_path: objWorksheet.Cells(1,20).Interior
        action: ColorIndex
        args: = 15
    - step:
        id: '219'
        object_path: objWorksheet.Cells(1,20)
        action: ColumnWidth
        args: = 7
    - step:
        id: '220'
        object_path: objWorksheet.Cells(1,20)
        action: WrapText
        args: = true
    - step:
        id: '221'
        object_path: objWorksheet.Cells(1,21)
        action: Value
        args: = "Annual Leave Taken to "&date
    - step:
        id: '222'
        object_path: objWorksheet.Cells(1,21).Interior
        action: ColorIndex
        args: = 16
    - step:
        id: '223'
        object_path: objWorksheet.Cells(1,21)
        action: ColumnWidth
        args: = 15
    - step:
        id: '224'
        object_path: objWorksheet.Cells(1,21).Font
        action: Bold
        args: = true
    - step:
        id: '225'
        object_path: objWorksheet.Cells(1,21)
        action: WrapText
        args: = true
    - step:
        id: '226'
        object_path: objWorksheet.Cells(1,22)
        action: Value
        args: = "Annual Leave Planned to EOY"
    - step:
        id: '227'
        object_path: objWorksheet.Cells(1,22).Interior
        action: ColorIndex
        args: = 16
    - step:
        id: '228'
        object_path: objWorksheet.Cells(1,22)
        action: ColumnWidth
        args: = 15
    - step:
        id: '229'
        object_path: objWorksheet.Cells(1,22).Font
        action: Bold
        args: = true
    - step:
        id: '230'
        object_path: objWorksheet.Cells(1,22)
        action: WrapText
        args: = true
    - step:
        id: '231'
        object_path: objWorksheet.Cells(1,23)
        action: Value
        args: = "Annual Leave Balance to "&date
    - step:
        id: '232'
        object_path: objWorksheet.Cells(1,23).Interior
        action: ColorIndex
        args: = 16
    - step:
        id: '233'
        object_path: objWorksheet.Cells(1,23)
        action: ColumnWidth
        args: = 15
    - step:
        id: '234'
        object_path: objWorksheet.Cells(1,23).Font
        action: Bold
        args: = true
    - step:
        id: '235'
        object_path: objWorksheet.Cells(1,23)
        action: WrapText
        args: = true
    - step:
        id: '236'
        object_path: objWorksheet.Cells(1,24)
        action: Value
        args: = "Projected Balance to EOY"
    - step:
        id: '237'
        object_path: objWorksheet.Cells(1,24).Interior
        action: ColorIndex
        args: = 16
    - step:
        id: '238'
        object_path: objWorksheet.Cells(1,24)
        action: ColumnWidth
        args: = 15
    - step:
        id: '239'
        object_path: objWorksheet.Cells(1,24).Font
        action: Bold
        args: = true
    - step:
        id: '240'
        object_path: objWorksheet.Cells(1,24)
        action: WrapText
        args: = true
    - step:
        id: '241'
        object_path: objWorksheet.Cells(1,25)
        action: Value
        args: = "Hours to be under 288"
    - step:
        id: '242'
        object_path: objWorksheet.Cells(1,25).Interior
        action: ColorIndex
        args: = 16
    - step:
        id: '243'
        object_path: objWorksheet.Cells(1,25)
        action: ColumnWidth
        args: = 15
    - step:
        id: '244'
        object_path: objWorksheet.Cells(1,25).Font
        action: Bold
        args: = true
    - step:
        id: '245'
        object_path: objWorksheet.Cells(1,25)
        action: WrapText
        args: = true
    - step:
        id: '246'
        object_path: objWorksheet.Cells(1,26)
        action: Value
        args: = "Days to be under 288"
    - step:
        id: '247'
        object_path: objWorksheet.Cells(1,26).Interior
        action: ColorIndex
        args: = 16
    - step:
        id: '248'
        object_path: objWorksheet.Cells(1,26)
        action: ColumnWidth
        args: = 15
    - step:
        id: '249'
        object_path: objWorksheet.Cells(1,26).Font
        action: Bold
        args: = true
    - step:
        id: '250'
        object_path: objWorksheet.Cells(1,26)
        action: WrapText
        args: = true
    - step:
        id: '251'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '252'
        action: Script
        object_path: '''DELETE SHEET1'
    - step:
        id: '253'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("Sheet1")
    - step:
        id: '254'
        object_path: objWorksheet
        action: Delete
    - step:
        id: '255'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '256'
        action: Script
        object_path: '''SAVE WORKBOOK'
    - step:
        id: '257'
        action: Script
        object_path: currentDate = Parameter("currentDate")
    - step:
        id: '258'
        action: Script
        object_path: If Parameter("reportName") = "None" Then
    - step:
        id: '259'
        action: Script
        object_path: orgStruct = Parameter("orgStructureSelection")
    - step:
        id: '260'
        action: Script
        object_path: If InStr(orgStruct,"/") > 0 Then
    - step:
        id: '261'
        action: Script
        object_path: orgStruct = Replace(orgStruct,"/"," - ")
    - step:
        id: '262'
        action: Script
        object_path: End If
    - step:
        id: '263'
        action: Script
        object_path: If InStr(orgStruct,"|") > 0 Then
    - step:
        id: '264'
        action: Script
        object_path: orgStruct = Replace(orgStruct,"|"," & ")
    - step:
        id: '265'
        action: Script
        object_path: End If
    - step:
        id: '266'
        action: Script
        object_path: fileName = orgStruct & " Leave Balances as at " & currentDate
          & ".xlsx"
    - step:
        id: '267'
        action: Script
        object_path: Else
    - step:
        id: '268'
        action: Script
        object_path: fileName = Parameter("reportName") & " Leave Balances as at "
          & currentDate & ".xlsx"
    - step:
        id: '269'
        action: Script
        object_path: End If
    - step:
        id: '270'
        action: Script
        object_path: Parameter("fileName") = fileName
    - step:
        id: '271'
        action: Script
        object_path: folderLocation = Parameter("folderLocation")
    - step:
        id: '272'
        action: Script
        object_path: filePath = folderLocation & fileName
    - step:
        id: '273'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '274'
        action: Script
        object_path: If fso.FileExists(filePath) Then
    - step:
        id: '275'
        object_path: fso
        action: DeleteFile(filePath)
    - step:
        id: '276'
        action: Script
        object_path: End If
    - step:
        id: '277'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '278'
        action: Script
        object_path: Parameter("filePath") = filePath
    - step:
        id: '279'
        action: Script
        object_path: filePath = Replace(filePath,"/","\")
    - step:
        id: '280'
        object_path: objWorkbook
        action: SaveAs
        args: filePath
    - step:
        id: '281'
        object_path: objWorkbook
        action: Close
    - step:
        id: '282'
        object_path: objExcel
        action: Quit
    - step:
        id: '283'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '284'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '285'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '286'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '287'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("structureFile"))
    - step:
        id: '288'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("Email OrgStruct")
    - step:
        id: '289'
        action: Script
        object_path: i = Parameter("iteration")
    - step:
        id: '290'
        object_path: objSheet.cells(i,9)
        action: value
        args: = reportName
    - step:
        id: '291'
        object_path: objSheet.cells(i,10)
        action: value
        args: = filePath
    - step:
        id: '292'
        object_path: objWorkbook
        action: save
    - step:
        id: '293'
        object_path: objWorkbook
        action: close
    - step:
        id: '294'
        object_path: objExcel
        action: Quit
    - step:
        id: '295'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '296'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '297'
        action: Script
        object_path: Set objSheet = Nothing
  outputs:
  - fileName:
      robot: true
      value: ${fileName}
  - filePath:
      robot: true
      value: ${filePath}
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
