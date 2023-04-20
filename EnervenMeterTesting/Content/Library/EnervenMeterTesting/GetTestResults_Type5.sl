namespace: EnervenMeterTesting
operation:
  name: GetTestResults_Type5
  inputs:
  - filelocation: C:\Users\svcrpabot\OneDrive - SA Power Networks\Enerven Meter Testing\Type
      5\
  sequential_action:
    gav: com.microfocus.seq:EnervenMeterTesting.GetTestResults_Type5:1.0.0
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
        object_path: '''Export SharePoint list, convert .iqy to .xlsx, update column
          headings, extract results into separate sample lot documents'
    - step:
        id: '2'
        action: Script
        object_path: '''*************************************************************************************************************************************************'
    - step:
        id: '3'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '4'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '5'
        action: Script
        object_path: If fso.FileExists("C:\Automation Downloads\query.iqy")Then
    - step:
        id: '6'
        object_path: fso
        action: DeleteFile("C:\Automation
        args: Downloads\query.iqy")
    - step:
        id: '7'
        action: Script
        object_path: End If
    - step:
        id: '8'
        action: Script
        object_path: '''EXPORT EXCEL'
    - step:
        id: '9'
        action: Script
        object_path: filelocation = Parameter("filelocation")
    - step:
        id: '10'
        action: Script
        object_path: filelocation = Replace(filelocation, "/", "\")
    - step:
        id: '11'
        action: Script
        object_path: URL = "https://sapowernetworks.sharepoint.com/sites/EnervenMeterTestingSite/Lists/Enerven%20Meter%20Testing%20Type%205/AllItems.aspx"
    - step:
        id: '12'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&URL'
    - step:
        id: '13'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '14'
        object_path: Browser("RPA - Enerven Meter Testing")
        action: Highlight
    - step:
        id: '15'
        action: Script
        object_path: loadCheck = ""
    - step:
        id: '16'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '17'
        action: Script
        object_path: rowCount = Browser("RPA - Enerven Meter Testing").Page("RPA -
          Enerven Meter Testing").WebTable("List of folders, files").RowCount
    - step:
        id: '18'
        action: Script
        object_path: Parameter("rowCount") = rowCount
    - step:
        id: '19'
        action: Script
        object_path: If rowCount > 1 Then
    - step:
        id: '20'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '21'
        object_path: Browser("RPA - Enerven Meter Testing").Page("RPA - Enerven Meter
          Testing").WebMenu("Command bar")
        action: Highlight
    - step:
        id: '22'
        object_path: Browser("RPA - Enerven Meter Testing").Page("RPA - Enerven Meter
          Testing").WebMenu("Command bar")
        action: Select
        args: '"Export;Export to Excel"'
    - step:
        id: '23'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '24'
        action: Script
        object_path: If fso.FileExists("C:\Automation Downloads\query.iqy")Then
    - step:
        id: '25'
        object_path: SystemUtil
        action: CloseProcessByName("msedge.exe")
    - step:
        id: '26'
        action: Script
        object_path: '''SAVE FILE AS EXCEL'
    - step:
        id: '27'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '28'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '29'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open("C:\Automation Downloads\query.iqy")
    - step:
        id: '30'
        action: Script
        object_path: '''SAVE FILE ON SVCRPABOT CLOUD'
    - step:
        id: '31'
        action: Script
        object_path: todayDate = Date()
    - step:
        id: '32'
        action: Script
        object_path: todayDay = Day(todayDate)
    - step:
        id: '33'
        action: Script
        object_path: todayMonth = Month(todayDate)
    - step:
        id: '34'
        action: Script
        object_path: meterTestingResultsFile = "Type 5 Meter Testing Results "&CStr(todayDay)&"-"&CStr(todayMonth)
          &".xlsx"
    - step:
        id: '35'
        action: Script
        object_path: If fso.FileExists(filelocation&meterTestingResultsFile)Then
    - step:
        id: '36'
        object_path: fso
        action: DeleteFile(filelocation&meterTestingResultsFile)
    - step:
        id: '37'
        action: Script
        object_path: End If
    - step:
        id: '38'
        action: Script
        object_path: Parameter("meterTestingResultsFile") = meterTestingResultsFile
    - step:
        id: '39'
        object_path: objWorkbook
        action: SaveAs(filelocation&meterTestingResultsFile)
    - step:
        id: '40'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets(1)
    - step:
        id: '41'
        action: Script
        object_path: '''EXTRACT RESULTS INTO SEPARATE SAMPLE LOT DOCUMENTS'
    - step:
        id: '42'
        action: Script
        object_path: rowCount = objSheet.usedrange.Rows.Count
    - step:
        id: '43'
        action: Script
        object_path: For x = 2 To rowCount
    - step:
        id: '44'
        action: Script
        object_path: resultType = objSheet.cells(x,1).value
    - step:
        id: '45'
        action: Script
        object_path: If resultType = "Sample Meter Test" Then
    - step:
        id: '46'
        action: Script
        object_path: sampleLot = objSheet.cells(x,9).value
    - step:
        id: '47'
        action: Script
        object_path: If len(sampleLot) < 5 or len(sampleLot) > 7 Then
    - step:
        id: '48'
        action: Script
        object_path: sampleLot = "Lot NA"
    - step:
        id: '49'
        action: Script
        object_path: End If
    - step:
        id: '50'
        action: Script
        object_path: If fso.FileExists(filelocation&"Meter Test Sample "&sampleLot&"
          Results.xlsx")Then
    - step:
        id: '51'
        action: Script
        object_path: Set objWorkbookNew = objExcel.Workbooks.open(filelocation&"Meter
          Test Sample "&sampleLot&" Results.xlsx")
    - step:
        id: '52'
        action: Script
        object_path: Set objSheetNew = objWorkbookNew.Worksheets(1)
    - step:
        id: '53'
        action: Script
        object_path: y = objSheetNew.usedrange.Rows.Count + 1
    - step:
        id: '54'
        action: Script
        object_path: Call updateResultsTest(x,y)
    - step:
        id: '55'
        object_path: objWorkbookNew
        action: Save
    - step:
        id: '56'
        object_path: objWorkbookNew
        action: close
    - step:
        id: '57'
        action: Script
        object_path: Else
    - step:
        id: '58'
        action: Script
        object_path: Set objWorkbookNew = objExcel.Workbooks.Add()
    - step:
        id: '59'
        action: Script
        object_path: Set objSheetNew = objWorkbookNew.Worksheets(1)
    - step:
        id: '60'
        action: Script
        object_path: Call addColumnHeadingsTest
    - step:
        id: '61'
        action: Script
        object_path: y = objSheetNew.usedrange.Rows.Count + 1
    - step:
        id: '62'
        action: Script
        object_path: Call updateResultsTest(x,y)
    - step:
        id: '63'
        object_path: objWorkbookNew
        action: SaveAs(filelocation&"Meter
        args: Test Sample "&sampleLot&" Results.xlsx")
    - step:
        id: '64'
        object_path: objWorkbookNew
        action: close
    - step:
        id: '65'
        action: Script
        object_path: End If
    - step:
        id: '66'
        action: Script
        object_path: If Not fso.FolderExists(filelocation&"Meter Test Sample "&sampleLot&"
          Summary Sheets") Then
    - step:
        id: '67'
        action: Script
        object_path: Set newfolder = fso.CreateFolder(filelocation&"Meter Test Sample
          "&sampleLot&" Summary Sheets")
    - step:
        id: '68'
        action: Script
        object_path: End If
    - step:
        id: '69'
        action: Script
        object_path: Set newfolder = Nothing
    - step:
        id: '70'
        action: Script
        object_path: ElseIf resultType = "Site Inspection" Then
    - step:
        id: '71'
        action: Script
        object_path: If fso.FileExists(filelocation&"Meter Inspection Results.xlsx")Then
    - step:
        id: '72'
        action: Script
        object_path: Set objWorkbookNew = objExcel.Workbooks.open(filelocation&"Meter
          Inspection Results.xlsx")
    - step:
        id: '73'
        action: Script
        object_path: Set objSheetNew = objWorkbookNew.Worksheets(1)
    - step:
        id: '74'
        action: Script
        object_path: y = objSheetNew.usedrange.Rows.Count + 1
    - step:
        id: '75'
        action: Script
        object_path: Call updateResultsInspect(x,y)
    - step:
        id: '76'
        object_path: objWorkbookNew
        action: Save
    - step:
        id: '77'
        object_path: objWorkbookNew
        action: close
    - step:
        id: '78'
        action: Script
        object_path: Else
    - step:
        id: '79'
        action: Script
        object_path: Set objWorkbookNew = objExcel.Workbooks.Add()
    - step:
        id: '80'
        action: Script
        object_path: Set objSheetNew = objWorkbookNew.Worksheets(1)
    - step:
        id: '81'
        action: Script
        object_path: Call addColumnHeadingsInspect
    - step:
        id: '82'
        action: Script
        object_path: y = objSheetNew.usedrange.Rows.Count + 1
    - step:
        id: '83'
        action: Script
        object_path: Call updateResultsInspect(x,y)
    - step:
        id: '84'
        object_path: objWorkbookNew
        action: SaveAs(filelocation&"Meter
        args: Inspection Results.xlsx")
    - step:
        id: '85'
        object_path: objWorkbookNew
        action: close
    - step:
        id: '86'
        action: Script
        object_path: End If
    - step:
        id: '87'
        action: Script
        object_path: If Not fso.FolderExists(filelocation&"Meter Inspection Summary
          Sheets") Then
    - step:
        id: '88'
        action: Script
        object_path: Set newfolder = fso.CreateFolder(filelocation&"Meter Inspection
          Summary Sheets")
    - step:
        id: '89'
        action: Script
        object_path: End If
    - step:
        id: '90'
        action: Script
        object_path: End If
    - step:
        id: '91'
        action: Script
        object_path: Next
    - step:
        id: '92'
        object_path: objWorkbook
        action: save
    - step:
        id: '93'
        object_path: objWorkbook
        action: close
    - step:
        id: '94'
        object_path: objExcel
        action: Quit
    - step:
        id: '95'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '96'
        action: Script
        object_path: Set objSheetNew = Nothing
    - step:
        id: '97'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '98'
        action: Script
        object_path: Set objWorkbookNew = Nothing
    - step:
        id: '99'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '100'
        action: Script
        object_path: '''DELETE FROM SHAREPOINT LIST'
    - step:
        id: '101'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&URL'
    - step:
        id: '102'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '103'
        object_path: Browser("RPA - Enerven Meter Testing_2").Page("RPA - Enerven
          Meter Testing").WebCheckBox("Toggle selection for all")
        action: Set
        args: '"ON"'
    - step:
        id: '104'
        object_path: Browser("RPA - Enerven Meter Testing_2").Page("RPA - Enerven
          Meter Testing").WebMenu("Command bar")
        action: Select
        args: '"Delete"'
    - step:
        id: '105'
        object_path: Browser("RPA - Enerven Meter Testing_2").Page("RPA - Enerven
          Meter Testing").WebButton("Delete")
        action: Click
    - step:
        id: '106'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '107'
        action: Script
        object_path: Else
    - step:
        id: '108'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Download failed", "Download failed"
    - step:
        id: '109'
        action: Script
        object_path: ExitTest
    - step:
        id: '110'
        action: Script
        object_path: End If
    - step:
        id: '111'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '112'
        action: Script
        object_path: Else
    - step:
        id: '113'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "No entries", "No entries"
    - step:
        id: '114'
        action: Script
        object_path: ExitTest
    - step:
        id: '115'
        action: Script
        object_path: End If
    - step:
        id: '116'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '117'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '118'
        object_path: SystemUtil
        action: CloseProcessByName("msedge.exe")
    - step:
        id: '119'
        action: Script
        object_path: '''*************************************************************************************************************************************************'
    - step:
        id: '120'
        action: Script
        object_path: '''Sample Meter Test Functions'
    - step:
        id: '121'
        action: Script
        object_path: Function addColumnHeadingsTest
    - step:
        id: '122'
        object_path: objSheetNew.cells(1,1)
        action: value
        args: = "Test Type"
    - step:
        id: '123'
        object_path: objSheetNew.cells(1,1).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '124'
        object_path: objSheetNew.cells(1,2)
        action: value
        args: = "Test Set Number"
    - step:
        id: '125'
        object_path: objSheetNew.cells(1,2).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '126'
        object_path: objSheetNew.cells(1,3)
        action: value
        args: = "Meter Class"
    - step:
        id: '127'
        object_path: objSheetNew.cells(1,3).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '128'
        object_path: objSheetNew.cells(1,4)
        action: value
        args: = "Meter Number"
    - step:
        id: '129'
        object_path: objSheetNew.cells(1,4).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '130'
        object_path: objSheetNew.cells(1,5)
        action: value
        args: = "Meter Type"
    - step:
        id: '131'
        object_path: objSheetNew.cells(1,5).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '132'
        object_path: objSheetNew.cells(1,6)
        action: value
        args: = "Stock Item"
    - step:
        id: '133'
        object_path: objSheetNew.cells(1,6).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '134'
        object_path: objSheetNew.cells(1,7)
        action: value
        args: = "K Factor"
    - step:
        id: '135'
        object_path: objSheetNew.cells(1,7).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '136'
        object_path: objSheetNew.cells(1,8)
        action: value
        args: = "NMI"
    - step:
        id: '137'
        object_path: objSheetNew.cells(1,8).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '138'
        object_path: objSheetNew.cells(1,9)
        action: value
        args: = "Sample Lot"
    - step:
        id: '139'
        object_path: objSheetNew.cells(1,9).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '140'
        object_path: objSheetNew.cells(1,10)
        action: value
        args: = "Suburb"
    - step:
        id: '141'
        object_path: objSheetNew.cells(1,10).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '142'
        object_path: objSheetNew.cells(1,11)
        action: value
        args: = "Street Name"
    - step:
        id: '143'
        object_path: objSheetNew.cells(1,11).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '144'
        object_path: objSheetNew.cells(1,12)
        action: value
        args: = "Street Number"
    - step:
        id: '145'
        object_path: objSheetNew.cells(1,12).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '146'
        object_path: objSheetNew.cells(1,13)
        action: value
        args: = "Unit Number"
    - step:
        id: '147'
        object_path: objSheetNew.cells(1,13).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '148'
        object_path: objSheetNew.cells(1,14)
        action: value
        args: = "Date of Test"
    - step:
        id: '149'
        object_path: objSheetNew.cells(1,14).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '150'
        object_path: objSheetNew.cells(1,15)
        action: value
        args: = "Test Start Time"
    - step:
        id: '151'
        object_path: objSheetNew.cells(1,15).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '152'
        object_path: objSheetNew.cells(1,16)
        action: value
        args: = "Test End Time"
    - step:
        id: '153'
        object_path: objSheetNew.cells(1,16).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '154'
        object_path: objSheetNew.cells(1,17)
        action: value
        args: = "Calibration Date"
    - step:
        id: '155'
        object_path: objSheetNew.cells(1,17).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '156'
        object_path: objSheetNew.cells(1,18)
        action: value
        args: = "CT Available Ratio"
    - step:
        id: '157'
        object_path: objSheetNew.cells(1,18).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '158'
        object_path: objSheetNew.cells(1,19)
        action: value
        args: = "CT Actual Ratio"
    - step:
        id: '159'
        object_path: objSheetNew.cells(1,19).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '160'
        object_path: objSheetNew.cells(1,20)
        action: value
        args: = "CT Make"
    - step:
        id: '161'
        object_path: objSheetNew.cells(1,20).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '162'
        object_path: objSheetNew.cells(1,21)
        action: value
        args: = "CT Standard"
    - step:
        id: '163'
        object_path: objSheetNew.cells(1,21).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '164'
        object_path: objSheetNew.cells(1,22)
        action: value
        args: = "CT Burden"
    - step:
        id: '165'
        object_path: objSheetNew.cells(1,22).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '166'
        object_path: objSheetNew.cells(1,23)
        action: value
        args: = "CT Class"
    - step:
        id: '167'
        object_path: objSheetNew.cells(1,23).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '168'
        object_path: objSheetNew.cells(1,24)
        action: value
        args: = "CT Type"
    - step:
        id: '169'
        object_path: objSheetNew.cells(1,24).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '170'
        object_path: objSheetNew.cells(1,25)
        action: value
        args: = "CT Housing Type"
    - step:
        id: '171'
        object_path: objSheetNew.cells(1,25).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '172'
        object_path: objSheetNew.cells(1,26)
        action: value
        args: = "CT Red Serial Number"
    - step:
        id: '173'
        object_path: objSheetNew.cells(1,26).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '174'
        object_path: objSheetNew.cells(1,27)
        action: value
        args: = "CT Red Primary Current"
    - step:
        id: '175'
        object_path: objSheetNew.cells(1,27).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '176'
        object_path: objSheetNew.cells(1,28)
        action: value
        args: = "CT Red Secondary Current"
    - step:
        id: '177'
        object_path: objSheetNew.cells(1,28).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '178'
        object_path: objSheetNew.cells(1,29)
        action: value
        args: = "CT Red Calculated Constant"
    - step:
        id: '179'
        object_path: objSheetNew.cells(1,29).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '180'
        object_path: objSheetNew.cells(1,30)
        action: value
        args: = "CT Red Terminal Sec Voltage"
    - step:
        id: '181'
        object_path: objSheetNew.cells(1,30).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '182'
        object_path: objSheetNew.cells(1,31)
        action: value
        args: = "CT Red Burden V/I"
    - step:
        id: '183'
        object_path: objSheetNew.cells(1,31).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '184'
        object_path: objSheetNew.cells(1,32)
        action: value
        args: = "CT White Serial Number"
    - step:
        id: '185'
        object_path: objSheetNew.cells(1,32).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '186'
        object_path: objSheetNew.cells(1,33)
        action: value
        args: = "CT White Primary Current"
    - step:
        id: '187'
        object_path: objSheetNew.cells(1,33).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '188'
        object_path: objSheetNew.cells(1,34)
        action: value
        args: = "CT White Secondary Current"
    - step:
        id: '189'
        object_path: objSheetNew.cells(1,34).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '190'
        object_path: objSheetNew.cells(1,35)
        action: value
        args: = "CT White Calculated Constant"
    - step:
        id: '191'
        object_path: objSheetNew.cells(1,35).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '192'
        object_path: objSheetNew.cells(1,36)
        action: value
        args: = "CT White Terminal Sec Voltage"
    - step:
        id: '193'
        object_path: objSheetNew.cells(1,36).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '194'
        object_path: objSheetNew.cells(1,37)
        action: value
        args: = "CT White Burden V/I"
    - step:
        id: '195'
        object_path: objSheetNew.cells(1,37).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '196'
        object_path: objSheetNew.cells(1,38)
        action: value
        args: = "CT Blue Serial Number"
    - step:
        id: '197'
        object_path: objSheetNew.cells(1,38).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '198'
        object_path: objSheetNew.cells(1,39)
        action: value
        args: = "CT Blue Primary Current"
    - step:
        id: '199'
        object_path: objSheetNew.cells(1,39).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '200'
        object_path: objSheetNew.cells(1,40)
        action: value
        args: = "CT Blue Secondary Current"
    - step:
        id: '201'
        object_path: objSheetNew.cells(1,40).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '202'
        object_path: objSheetNew.cells(1,41)
        action: value
        args: = "CT Blue Calculated Constant"
    - step:
        id: '203'
        object_path: objSheetNew.cells(1,41).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '204'
        object_path: objSheetNew.cells(1,42)
        action: value
        args: = "CT Blue Terminal Sec Voltage"
    - step:
        id: '205'
        object_path: objSheetNew.cells(1,42).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '206'
        object_path: objSheetNew.cells(1,43)
        action: value
        args: = "CT Blue Burden V/I"
    - step:
        id: '207'
        object_path: objSheetNew.cells(1,43).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '208'
        object_path: objSheetNew.cells(1,44)
        action: value
        args: = "Secondary Demands RN Secondary Current"
    - step:
        id: '209'
        object_path: objSheetNew.cells(1,44).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '210'
        object_path: objSheetNew.cells(1,45)
        action: value
        args: = "Secondary Demands RN Volts"
    - step:
        id: '211'
        object_path: objSheetNew.cells(1,45).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '212'
        object_path: objSheetNew.cells(1,46)
        action: value
        args: = "Secondary Demands RN Volts/Amps"
    - step:
        id: '213'
        object_path: objSheetNew.cells(1,46).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '214'
        object_path: objSheetNew.cells(1,47)
        action: value
        args: = "Secondary Demands RN Power Factor"
    - step:
        id: '215'
        object_path: objSheetNew.cells(1,47).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '216'
        object_path: objSheetNew.cells(1,48)
        action: value
        args: = "Secondary Demands RN Watts"
    - step:
        id: '217'
        object_path: objSheetNew.cells(1,48).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '218'
        object_path: objSheetNew.cells(1,49)
        action: value
        args: = "Secondary Demands WN Secondary Current"
    - step:
        id: '219'
        object_path: objSheetNew.cells(1,49).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '220'
        object_path: objSheetNew.cells(1,50)
        action: value
        args: = "Secondary Demands WN Volts"
    - step:
        id: '221'
        object_path: objSheetNew.cells(1,50).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '222'
        object_path: objSheetNew.cells(1,51)
        action: value
        args: = "Secondary Demands WN Volts/Amps"
    - step:
        id: '223'
        object_path: objSheetNew.cells(1,51).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '224'
        object_path: objSheetNew.cells(1,52)
        action: value
        args: = "Secondary Demands WN Power Factor"
    - step:
        id: '225'
        object_path: objSheetNew.cells(1,52).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '226'
        object_path: objSheetNew.cells(1,53)
        action: value
        args: = "Secondary Demands WN Watts"
    - step:
        id: '227'
        object_path: objSheetNew.cells(1,53).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '228'
        object_path: objSheetNew.cells(1,54)
        action: value
        args: = "Secondary Demands BN Secondary Current"
    - step:
        id: '229'
        object_path: objSheetNew.cells(1,54).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '230'
        object_path: objSheetNew.cells(1,55)
        action: value
        args: = "Secondary Demands BN Volts"
    - step:
        id: '231'
        object_path: objSheetNew.cells(1,55).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '232'
        object_path: objSheetNew.cells(1,56)
        action: value
        args: = "Secondary Demands BN Volts/Amps"
    - step:
        id: '233'
        object_path: objSheetNew.cells(1,56).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '234'
        object_path: objSheetNew.cells(1,57)
        action: value
        args: = "Secondary Demands BN Power Factor"
    - step:
        id: '235'
        object_path: objSheetNew.cells(1,57).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '236'
        object_path: objSheetNew.cells(1,58)
        action: value
        args: = "Secondary Demands BN Watts"
    - step:
        id: '237'
        object_path: objSheetNew.cells(1,58).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '238'
        object_path: objSheetNew.cells(1,59)
        action: value
        args: = "Secondary Demands Volt/Amps Total"
    - step:
        id: '239'
        object_path: objSheetNew.cells(1,59).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '240'
        object_path: objSheetNew.cells(1,60)
        action: value
        args: = "Secondary Demands Watts Total"
    - step:
        id: '241'
        object_path: objSheetNew.cells(1,60).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '242'
        object_path: objSheetNew.cells(1,61)
        action: value
        args: = "Primary Demands Calc from Sec kW"
    - step:
        id: '243'
        object_path: objSheetNew.cells(1,61).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '244'
        object_path: objSheetNew.cells(1,62)
        action: value
        args: = "Primary Demands Calc from Sec kVA"
    - step:
        id: '245'
        object_path: objSheetNew.cells(1,62).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '246'
        object_path: objSheetNew.cells(1,63)
        action: value
        args: = "KW ID 10 Reading"
    - step:
        id: '247'
        object_path: objSheetNew.cells(1,63).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '248'
        object_path: objSheetNew.cells(1,64)
        action: value
        args: = "KVA ID 11 Reading"
    - step:
        id: '249'
        object_path: objSheetNew.cells(1,64).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '250'
        object_path: objSheetNew.cells(1,65)
        action: value
        args: = "Primary Demands Register Read kW"
    - step:
        id: '251'
        object_path: objSheetNew.cells(1,65).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '252'
        object_path: objSheetNew.cells(1,66)
        action: value
        args: = "Primary Demands Register Read kVA"
    - step:
        id: '253'
        object_path: objSheetNew.cells(1,66).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '254'
        object_path: objSheetNew.cells(1,67)
        action: value
        args: = "Test Point = 0.1 In @ Unity (1) Active"
    - step:
        id: '255'
        object_path: objSheetNew.cells(1,67).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '256'
        object_path: objSheetNew.cells(1,68)
        action: value
        args: = "Test Point = 0.5 In @ Unity (1) Active"
    - step:
        id: '257'
        object_path: objSheetNew.cells(1,68).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '258'
        object_path: objSheetNew.cells(1,69)
        action: value
        args: = "Test Point = 1.0 In @ Unity (1) Active"
    - step:
        id: '259'
        object_path: objSheetNew.cells(1,69).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '260'
        object_path: objSheetNew.cells(1,70)
        action: value
        args: = "Test Point = 1.0 In @ 0.5 LAGGING"
    - step:
        id: '261'
        object_path: objSheetNew.cells(1,70).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '262'
        object_path: objSheetNew.cells(1,71)
        action: value
        args: = "Test Point = 2 x In or Imax (Whichever is lesser)"
    - step:
        id: '263'
        object_path: objSheetNew.cells(1,71).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '264'
        object_path: objSheetNew.cells(1,72)
        action: value
        args: = "Loading Device Used"
    - step:
        id: '265'
        object_path: objSheetNew.cells(1,72).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '266'
        object_path: objSheetNew.cells(1,73)
        action: value
        args: = "Comms Confirmed"
    - step:
        id: '267'
        object_path: objSheetNew.cells(1,73).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '268'
        object_path: objSheetNew.cells(1,74)
        action: value
        args: = "Equipment Sealed"
    - step:
        id: '269'
        object_path: objSheetNew.cells(1,74).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '270'
        object_path: objSheetNew.cells(1,75)
        action: value
        args: = "Meter Time & Date"
    - step:
        id: '271'
        object_path: objSheetNew.cells(1,75).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '272'
        object_path: objSheetNew.cells(1,76)
        action: value
        args: = "Sequence OK"
    - step:
        id: '273'
        object_path: objSheetNew.cells(1,76).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '274'
        object_path: objSheetNew.cells(1,77)
        action: value
        args: = "Meter Read Screen Amps Validated"
    - step:
        id: '275'
        object_path: objSheetNew.cells(1,77).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '276'
        object_path: objSheetNew.cells(1,78)
        action: value
        args: = "Secondary Cable Tonged"
    - step:
        id: '277'
        object_path: objSheetNew.cells(1,78).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '278'
        object_path: objSheetNew.cells(1,79)
        action: value
        args: = "Pass/Fail"
    - step:
        id: '279'
        object_path: objSheetNew.cells(1,79).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '280'
        object_path: objSheetNew.cells(1,80)
        action: value
        args: = "Attachments Name"
    - step:
        id: '281'
        object_path: objSheetNew.cells(1,80).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '282'
        object_path: objSheetNew.cells(1,81)
        action: value
        args: = "Comments"
    - step:
        id: '283'
        object_path: objSheetNew.cells(1,81).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '284'
        object_path: objSheetNew.cells(1,82)
        action: value
        args: = "ID"
    - step:
        id: '285'
        object_path: objSheetNew.cells(1,82).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '286'
        object_path: objSheetNew.cells(1,83)
        action: value
        args: = "Technician Name"
    - step:
        id: '287'
        object_path: objSheetNew.cells(1,83).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '288'
        action: Script
        object_path: End Function
    - step:
        id: '289'
        action: Script
        object_path: Function updateResultsTest(x,y)
    - step:
        id: '290'
        action: Script
        object_path: '''EXTRACT FROM EXCEL'
    - step:
        id: '291'
        action: Script
        object_path: typeOfTest = objSheet.cells(x,1).value
    - step:
        id: '292'
        action: Script
        object_path: testSet = objSheet.cells(x,2).value
    - step:
        id: '293'
        action: Script
        object_path: meterClass = objSheet.cells(x,3).value
    - step:
        id: '294'
        action: Script
        object_path: meterNum = objSheet.cells(x,4).value
    - step:
        id: '295'
        action: Script
        object_path: meterType = objSheet.cells(x,5).value
    - step:
        id: '296'
        action: Script
        object_path: stockItem = objSheet.cells(x,6).value
    - step:
        id: '297'
        action: Script
        object_path: kFactor = objSheet.cells(x,7).value
    - step:
        id: '298'
        action: Script
        object_path: nmi = objSheet.cells(x,8).value
    - step:
        id: '299'
        action: Script
        object_path: sampleLot = objSheet.cells(x,9).value
    - step:
        id: '300'
        action: Script
        object_path: suburb = objSheet.cells(x,10).value
    - step:
        id: '301'
        action: Script
        object_path: streetName = objSheet.cells(x,11).value
    - step:
        id: '302'
        action: Script
        object_path: streetNumber = objSheet.cells(x,12).value
    - step:
        id: '303'
        action: Script
        object_path: streetNumber = Replace(streetNumber,"-","--")
    - step:
        id: '304'
        action: Script
        object_path: unitNumber = objSheet.cells(x,13).value
    - step:
        id: '305'
        action: Script
        object_path: unitNumber = Replace(unitNumber,"-","--")
    - step:
        id: '306'
        action: Script
        object_path: dateOfTest = objSheet.cells(x,14).value
    - step:
        id: '307'
        action: Script
        object_path: testStartTime = objSheet.cells(x,15).value
    - step:
        id: '308'
        action: Script
        object_path: testEndTime = objSheet.cells(x,16).value
    - step:
        id: '309'
        action: Script
        object_path: testEndTime = objSheet.cells(x,16).value
    - step:
        id: '310'
        action: Script
        object_path: calibrationDate = objSheet.cells(x,17).value
    - step:
        id: '311'
        action: Script
        object_path: ctAvailableRatio = objSheet.cells(x,18).value
    - step:
        id: '312'
        action: Script
        object_path: ctActualRatio = objSheet.cells(x,19).value
    - step:
        id: '313'
        action: Script
        object_path: ctMake = objSheet.cells(x,20).value
    - step:
        id: '314'
        action: Script
        object_path: ctStandard = objSheet.cells(x,21).value
    - step:
        id: '315'
        action: Script
        object_path: ctBurden = objSheet.cells(x,22).value
    - step:
        id: '316'
        action: Script
        object_path: ctClass = objSheet.cells(x,23).value
    - step:
        id: '317'
        action: Script
        object_path: ctType = objSheet.cells(x,24).value
    - step:
        id: '318'
        action: Script
        object_path: ctHousingType = objSheet.cells(x,25).value
    - step:
        id: '319'
        action: Script
        object_path: ctRedSerialNum = objSheet.cells(x,26).value
    - step:
        id: '320'
        action: Script
        object_path: ctRedPrimCurr = objSheet.cells(x,27).value
    - step:
        id: '321'
        action: Script
        object_path: ctRedSecCurr = objSheet.cells(x,28).value
    - step:
        id: '322'
        action: Script
        object_path: ctRedCalcConstant = objSheet.cells(x,29).value
    - step:
        id: '323'
        action: Script
        object_path: ctRedVoltage = objSheet.cells(x,30).value
    - step:
        id: '324'
        action: Script
        object_path: ctRedBurdenVI = objSheet.cells(x,31).value
    - step:
        id: '325'
        action: Script
        object_path: ctWhiteSerialNum = objSheet.cells(x,32).value
    - step:
        id: '326'
        action: Script
        object_path: ctWhitePrimCurr = objSheet.cells(x,33).value
    - step:
        id: '327'
        action: Script
        object_path: ctWhiteSecCurr = objSheet.cells(x,34).value
    - step:
        id: '328'
        action: Script
        object_path: ctWhiteCalcConstant = objSheet.cells(x,35).value
    - step:
        id: '329'
        action: Script
        object_path: ctWhiteVoltage = objSheet.cells(x,36).value
    - step:
        id: '330'
        action: Script
        object_path: ctWhiteBurdenVI = objSheet.cells(x,37).value
    - step:
        id: '331'
        action: Script
        object_path: ctBlueSerialNum = objSheet.cells(x,38).value
    - step:
        id: '332'
        action: Script
        object_path: ctBluePrimCurr = objSheet.cells(x,39).value
    - step:
        id: '333'
        action: Script
        object_path: ctBlueSecCurr = objSheet.cells(x,40).value
    - step:
        id: '334'
        action: Script
        object_path: ctBlueCalcConstant = objSheet.cells(x,41).value
    - step:
        id: '335'
        action: Script
        object_path: ctBlueVoltage = objSheet.cells(x,42).value
    - step:
        id: '336'
        action: Script
        object_path: ctBlueBurdenVI = objSheet.cells(x,43).value
    - step:
        id: '337'
        action: Script
        object_path: secDemandsRNSecCurrent = objSheet.cells(x,44).value
    - step:
        id: '338'
        action: Script
        object_path: secDemandsRNVolts = objSheet.cells(x,45).value
    - step:
        id: '339'
        action: Script
        object_path: secDemandsRNVoltsAmps = objSheet.cells(x,46).value
    - step:
        id: '340'
        action: Script
        object_path: secDemandsRNPowerFactor = objSheet.cells(x,47).value
    - step:
        id: '341'
        action: Script
        object_path: secDemandsRNWatts = objSheet.cells(x,48).value
    - step:
        id: '342'
        action: Script
        object_path: secDemandsWNSecCurrent = objSheet.cells(x,49).value
    - step:
        id: '343'
        action: Script
        object_path: secDemandsWNVolts = objSheet.cells(x,50).value
    - step:
        id: '344'
        action: Script
        object_path: secDemandsWNVoltsAmps = objSheet.cells(x,51).value
    - step:
        id: '345'
        action: Script
        object_path: secDemandsWNPowerFactor = objSheet.cells(x,52).value
    - step:
        id: '346'
        action: Script
        object_path: secDemandsWNWatts = objSheet.cells(x,53).value
    - step:
        id: '347'
        action: Script
        object_path: secDemandsBNSecCurrent = objSheet.cells(x,54).value
    - step:
        id: '348'
        action: Script
        object_path: secDemandsBNVolts = objSheet.cells(x,55).value
    - step:
        id: '349'
        action: Script
        object_path: secDemandsBNVoltsAmps = objSheet.cells(x,56).value
    - step:
        id: '350'
        action: Script
        object_path: secDemandsBNPowerFactor = objSheet.cells(x,57).value
    - step:
        id: '351'
        action: Script
        object_path: secDemandsBNWatts = objSheet.cells(x,58).value
    - step:
        id: '352'
        action: Script
        object_path: secDemandsVoltsAmpsTotal = objSheet.cells(x,59).value
    - step:
        id: '353'
        action: Script
        object_path: secDemandsWattsTotal = objSheet.cells(x,60).value
    - step:
        id: '354'
        action: Script
        object_path: primDemandsFromSeckW = objSheet.cells(x,61).value
    - step:
        id: '355'
        action: Script
        object_path: primDemandsFromSeckVA = objSheet.cells(x,62).value
    - step:
        id: '356'
        action: Script
        object_path: kwid10Reading = objSheet.cells(x,63).value
    - step:
        id: '357'
        action: Script
        object_path: kwid11Reading = objSheet.cells(x,64).value
    - step:
        id: '358'
        action: Script
        object_path: primDemandsRegisterReadkW = objSheet.cells(x,65).value
    - step:
        id: '359'
        action: Script
        object_path: primDemandsRegisterReadkVa = objSheet.cells(x,66).value
    - step:
        id: '360'
        action: Script
        object_path: tp01unityactive = objSheet.cells(x,67).value
    - step:
        id: '361'
        action: Script
        object_path: tp05unityactive = objSheet.cells(x,68).value
    - step:
        id: '362'
        action: Script
        object_path: tp10unityactive = objSheet.cells(x,69).value
    - step:
        id: '363'
        action: Script
        object_path: tp10in05lagging = objSheet.cells(x,70).value
    - step:
        id: '364'
        action: Script
        object_path: tp2inorImax = objSheet.cells(x,71).value
    - step:
        id: '365'
        action: Script
        object_path: loadingDeviceUsed = objSheet.cells(x,72).value
    - step:
        id: '366'
        action: Script
        object_path: commsConfirmed = objSheet.cells(x,73).value
    - step:
        id: '367'
        action: Script
        object_path: equipmentSealed = objSheet.cells(x,74).value
    - step:
        id: '368'
        action: Script
        object_path: meterTimeDate = objSheet.cells(x,75).value
    - step:
        id: '369'
        action: Script
        object_path: sequenceOK = objSheet.cells(x,76).value
    - step:
        id: '370'
        action: Script
        object_path: meterReadScreenAmpsValidated = objSheet.cells(x,77).value
    - step:
        id: '371'
        action: Script
        object_path: secondaryCableTonged= objSheet.cells(x,78).value
    - step:
        id: '372'
        action: Script
        object_path: passFail = objSheet.cells(x,79).value
    - step:
        id: '373'
        action: Script
        object_path: attachmentNames = objSheet.cells(x,80).value
    - step:
        id: '374'
        action: Script
        object_path: comments = objSheet.cells(x,81).value
    - step:
        id: '375'
        action: Script
        object_path: id = objSheet.cells(x,82).value
    - step:
        id: '376'
        action: Script
        object_path: technicianName = objSheet.cells(x,83).value
    - step:
        id: '377'
        action: Script
        object_path: '''ADD TO SAMPLE LOT'
    - step:
        id: '378'
        object_path: objSheetNew.cells(y,1)
        action: value
        args: = typeOfTest
    - step:
        id: '379'
        object_path: objSheetNew.cells(y,2)
        action: value
        args: = testSet
    - step:
        id: '380'
        object_path: objSheetNew.cells(y,3)
        action: value
        args: = meterClass
    - step:
        id: '381'
        object_path: objSheetNew.cells(y,4)
        action: value
        args: = meterNum
    - step:
        id: '382'
        object_path: objSheetNew.cells(y,5)
        action: value
        args: = meterType
    - step:
        id: '383'
        object_path: objSheetNew.cells(y,6)
        action: value
        args: = stockItem
    - step:
        id: '384'
        object_path: objSheetNew.cells(y,7)
        action: value
        args: = kFactor
    - step:
        id: '385'
        object_path: objSheetNew.cells(y,8)
        action: value
        args: = nmi
    - step:
        id: '386'
        object_path: objSheetNew.cells(y,9)
        action: value
        args: = sampleLot
    - step:
        id: '387'
        object_path: objSheetNew.cells(y,10)
        action: value
        args: = suburb
    - step:
        id: '388'
        object_path: objSheetNew.cells(y,11)
        action: value
        args: = streetName
    - step:
        id: '389'
        object_path: objSheetNew.cells(y,12)
        action: value
        args: = streetNumber
    - step:
        id: '390'
        object_path: objSheetNew.cells(y,13)
        action: value
        args: = unitNumber
    - step:
        id: '391'
        object_path: objSheetNew.cells(y,14)
        action: value
        args: = dateofTest
    - step:
        id: '392'
        object_path: objSheetNew.cells(y,15)
        action: value
        args: = testStartTime
    - step:
        id: '393'
        object_path: objSheetNew.cells(y,16)
        action: value
        args: = testEndTime
    - step:
        id: '394'
        object_path: objSheetNew.cells(y,17)
        action: value
        args: = calibrationDate
    - step:
        id: '395'
        object_path: objSheetNew.cells(y,18)
        action: value
        args: = ctAvailableRatio
    - step:
        id: '396'
        object_path: objSheetNew.cells(y,19)
        action: value
        args: = ctActualRatio
    - step:
        id: '397'
        object_path: objSheetNew.cells(y,20)
        action: value
        args: = ctMake
    - step:
        id: '398'
        object_path: objSheetNew.cells(y,21)
        action: value
        args: = ctStandard
    - step:
        id: '399'
        object_path: objSheetNew.cells(y,22)
        action: value
        args: = ctBurden
    - step:
        id: '400'
        object_path: objSheetNew.cells(y,23)
        action: value
        args: = ctClass
    - step:
        id: '401'
        object_path: objSheetNew.cells(y,24)
        action: value
        args: = ctType
    - step:
        id: '402'
        object_path: objSheetNew.cells(y,25)
        action: value
        args: = ctHousingType
    - step:
        id: '403'
        object_path: objSheetNew.cells(y,26)
        action: value
        args: = ctRedSerialNum
    - step:
        id: '404'
        object_path: objSheetNew.cells(y,27)
        action: value
        args: = ctRedPrimCurr
    - step:
        id: '405'
        object_path: objSheetNew.cells(y,28)
        action: value
        args: = ctRedSecCurr
    - step:
        id: '406'
        object_path: objSheetNew.cells(y,29)
        action: value
        args: = ctRedCalcConstant
    - step:
        id: '407'
        object_path: objSheetNew.cells(y,30)
        action: value
        args: = ctRedVoltage
    - step:
        id: '408'
        object_path: objSheetNew.cells(y,31)
        action: value
        args: = ctRedBurdenVI
    - step:
        id: '409'
        object_path: objSheetNew.cells(y,32)
        action: value
        args: = ctWhiteSerialNum
    - step:
        id: '410'
        object_path: objSheetNew.cells(y,33)
        action: value
        args: = ctWhitePrimCurr
    - step:
        id: '411'
        object_path: objSheetNew.cells(y,34)
        action: value
        args: = ctWhiteSecCurr
    - step:
        id: '412'
        object_path: objSheetNew.cells(y,35)
        action: value
        args: = ctWhiteCalcConstant
    - step:
        id: '413'
        object_path: objSheetNew.cells(y,36)
        action: value
        args: = ctWhiteVoltage
    - step:
        id: '414'
        object_path: objSheetNew.cells(y,37)
        action: value
        args: = ctWhiteBurdenVI
    - step:
        id: '415'
        object_path: objSheetNew.cells(y,38)
        action: value
        args: = ctBlueSerialNum
    - step:
        id: '416'
        object_path: objSheetNew.cells(y,39)
        action: value
        args: = ctBluePrimCurr
    - step:
        id: '417'
        object_path: objSheetNew.cells(y,40)
        action: value
        args: = ctBlueSecCurr
    - step:
        id: '418'
        object_path: objSheetNew.cells(y,41)
        action: value
        args: = ctBlueCalcConstant
    - step:
        id: '419'
        object_path: objSheetNew.cells(y,42)
        action: value
        args: = ctBlueVoltage
    - step:
        id: '420'
        object_path: objSheetNew.cells(y,43)
        action: value
        args: = ctBlueBurdenVI
    - step:
        id: '421'
        object_path: objSheetNew.cells(y,44)
        action: value
        args: = secDemandsRNSecCurr
    - step:
        id: '422'
        object_path: objSheetNew.cells(y,45)
        action: value
        args: = secDemandsRNVolts
    - step:
        id: '423'
        object_path: objSheetNew.cells(y,46)
        action: value
        args: = secDemandsRNVoltsAmps
    - step:
        id: '424'
        object_path: objSheetNew.cells(y,47)
        action: value
        args: = secDemandsRNPowerFactor
    - step:
        id: '425'
        object_path: objSheetNew.cells(y,48)
        action: value
        args: = secDemandsRNWatts
    - step:
        id: '426'
        object_path: objSheetNew.cells(y,49)
        action: value
        args: = secDemandsWNSecCurr
    - step:
        id: '427'
        object_path: objSheetNew.cells(y,50)
        action: value
        args: = secDemandsWNVolts
    - step:
        id: '428'
        object_path: objSheetNew.cells(y,51)
        action: value
        args: = secDemandsWNVoltsAmps
    - step:
        id: '429'
        object_path: objSheetNew.cells(y,52)
        action: value
        args: = secDemandsWNPowerFactor
    - step:
        id: '430'
        object_path: objSheetNew.cells(y,53)
        action: value
        args: = secDemandsWNWatts
    - step:
        id: '431'
        object_path: objSheetNew.cells(y,54)
        action: value
        args: = secDemandsBNSecCurr
    - step:
        id: '432'
        object_path: objSheetNew.cells(y,55)
        action: value
        args: = secDemandsBNVolts
    - step:
        id: '433'
        object_path: objSheetNew.cells(y,56)
        action: value
        args: = secDemandsBNVoltsAmps
    - step:
        id: '434'
        object_path: objSheetNew.cells(y,57)
        action: value
        args: = secDemandsBNPowerFactor
    - step:
        id: '435'
        object_path: objSheetNew.cells(y,58)
        action: value
        args: = secDemandsBNWatts
    - step:
        id: '436'
        object_path: objSheetNew.cells(y,59)
        action: value
        args: = secDemandsVoltsAmpsTotal
    - step:
        id: '437'
        object_path: objSheetNew.cells(y,60)
        action: value
        args: = secDemandsWattsTotal
    - step:
        id: '438'
        object_path: objSheetNew.cells(y,61)
        action: value
        args: = primDemandsFromSeckW
    - step:
        id: '439'
        object_path: objSheetNew.cells(y,62)
        action: value
        args: = primDemandsFromSeckVA
    - step:
        id: '440'
        object_path: objSheetNew.cells(y,63)
        action: value
        args: = kwid10Reading
    - step:
        id: '441'
        object_path: objSheetNew.cells(y,64)
        action: value
        args: = kwid11Reading
    - step:
        id: '442'
        object_path: objSheetNew.cells(y,65)
        action: value
        args: = primDemandsRegisterReadkW
    - step:
        id: '443'
        object_path: objSheetNew.cells(y,66)
        action: value
        args: = primDemandsRegisterReadkVa
    - step:
        id: '444'
        object_path: objSheetNew.cells(y,67)
        action: value
        args: = tp01unityactive
    - step:
        id: '445'
        object_path: objSheetNew.cells(y,68)
        action: value
        args: = tp05unityactive
    - step:
        id: '446'
        object_path: objSheetNew.cells(y,69)
        action: value
        args: = tp10unityactive
    - step:
        id: '447'
        object_path: objSheetNew.cells(y,70)
        action: value
        args: = tp10in05lagging
    - step:
        id: '448'
        object_path: objSheetNew.cells(y,71)
        action: value
        args: = tp2inorImax
    - step:
        id: '449'
        object_path: objSheetNew.cells(y,72)
        action: value
        args: = loadingDeviceUsed
    - step:
        id: '450'
        object_path: objSheetNew.cells(y,73)
        action: value
        args: = commsConfirmed
    - step:
        id: '451'
        object_path: objSheetNew.cells(y,74)
        action: value
        args: = equipmentSealed
    - step:
        id: '452'
        object_path: objSheetNew.cells(y,75)
        action: value
        args: = meterTimeDate
    - step:
        id: '453'
        object_path: objSheetNew.cells(y,76)
        action: value
        args: = sequenceOK
    - step:
        id: '454'
        object_path: objSheetNew.cells(y,77)
        action: value
        args: = meterReadScreenAmpsValidated
    - step:
        id: '455'
        object_path: objSheetNew.cells(y,78)
        action: value
        args: = secondaryCableTonged
    - step:
        id: '456'
        object_path: objSheetNew.cells(y,79)
        action: value
        args: = passFail
    - step:
        id: '457'
        object_path: objSheetNew.cells(y,80)
        action: value
        args: = attachmentNames
    - step:
        id: '458'
        object_path: objSheetNew.cells(y,81)
        action: value
        args: = comments
    - step:
        id: '459'
        object_path: objSheetNew.cells(y,82)
        action: value
        args: = id
    - step:
        id: '460'
        object_path: objSheetNew.cells(y,83)
        action: value
        args: = technicianName
    - step:
        id: '461'
        action: Script
        object_path: End Function
    - step:
        id: '462'
        action: Script
        object_path: '''Meter Inspection Functions'
    - step:
        id: '463'
        action: Script
        object_path: Function addColumnHeadingsInspect
    - step:
        id: '464'
        object_path: objSheetNew.cells(1,1)
        action: value
        args: = "Test Type"
    - step:
        id: '465'
        object_path: objSheetNew.cells(1,1).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '466'
        object_path: objSheetNew.cells(1,2)
        action: value
        args: = "Meter Class"
    - step:
        id: '467'
        object_path: objSheetNew.cells(1,2).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '468'
        object_path: objSheetNew.cells(1,3)
        action: value
        args: = "Meter Number"
    - step:
        id: '469'
        object_path: objSheetNew.cells(1,3).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '470'
        object_path: objSheetNew.cells(1,4)
        action: value
        args: = "Meter Type"
    - step:
        id: '471'
        object_path: objSheetNew.cells(1,4).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '472'
        object_path: objSheetNew.cells(1,5)
        action: value
        args: = "K Factor"
    - step:
        id: '473'
        object_path: objSheetNew.cells(1,5).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '474'
        object_path: objSheetNew.cells(1,6)
        action: value
        args: = "NMI"
    - step:
        id: '475'
        object_path: objSheetNew.cells(1,6).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '476'
        object_path: objSheetNew.cells(1,7)
        action: value
        args: = "Suburb"
    - step:
        id: '477'
        object_path: objSheetNew.cells(1,7).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '478'
        object_path: objSheetNew.cells(1,8)
        action: value
        args: = "Street Name"
    - step:
        id: '479'
        object_path: objSheetNew.cells(1,8).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '480'
        object_path: objSheetNew.cells(1,9)
        action: value
        args: = "Street Number"
    - step:
        id: '481'
        object_path: objSheetNew.cells(1,9).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '482'
        object_path: objSheetNew.cells(1,10)
        action: value
        args: = "Unit Number"
    - step:
        id: '483'
        object_path: objSheetNew.cells(1,10).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '484'
        object_path: objSheetNew.cells(1,11)
        action: value
        args: = "Date of Test"
    - step:
        id: '485'
        object_path: objSheetNew.cells(1,11).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '486'
        object_path: objSheetNew.cells(1,12)
        action: value
        args: = "CT Available Ratio"
    - step:
        id: '487'
        object_path: objSheetNew.cells(1,12).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '488'
        object_path: objSheetNew.cells(1,13)
        action: value
        args: = "CT Actual Ratio"
    - step:
        id: '489'
        object_path: objSheetNew.cells(1,13).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '490'
        object_path: objSheetNew.cells(1,14)
        action: value
        args: = "CT Make"
    - step:
        id: '491'
        object_path: objSheetNew.cells(1,14).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '492'
        object_path: objSheetNew.cells(1,15)
        action: value
        args: = "CT Standard"
    - step:
        id: '493'
        object_path: objSheetNew.cells(1,15).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '494'
        object_path: objSheetNew.cells(1,16)
        action: value
        args: = "CT Burden"
    - step:
        id: '495'
        object_path: objSheetNew.cells(1,16).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '496'
        object_path: objSheetNew.cells(1,17)
        action: value
        args: = "CT Class"
    - step:
        id: '497'
        object_path: objSheetNew.cells(1,17).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '498'
        object_path: objSheetNew.cells(1,18)
        action: value
        args: = "CT Type"
    - step:
        id: '499'
        object_path: objSheetNew.cells(1,18).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '500'
        object_path: objSheetNew.cells(1,19)
        action: value
        args: = "CT Housing Type"
    - step:
        id: '501'
        object_path: objSheetNew.cells(1,19).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '502'
        object_path: objSheetNew.cells(1,20)
        action: value
        args: = "CT Red Serial Number"
    - step:
        id: '503'
        object_path: objSheetNew.cells(1,20).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '504'
        object_path: objSheetNew.cells(1,21)
        action: value
        args: = "CT Red Primary Current"
    - step:
        id: '505'
        object_path: objSheetNew.cells(1,21).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '506'
        object_path: objSheetNew.cells(1,22)
        action: value
        args: = "CT Red Secondary Current"
    - step:
        id: '507'
        object_path: objSheetNew.cells(1,22).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '508'
        object_path: objSheetNew.cells(1,23)
        action: value
        args: = "CT Red Calculated Constant"
    - step:
        id: '509'
        object_path: objSheetNew.cells(1,23).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '510'
        object_path: objSheetNew.cells(1,24)
        action: value
        args: = "CT Red Terminal Sec Voltage"
    - step:
        id: '511'
        object_path: objSheetNew.cells(1,24).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '512'
        object_path: objSheetNew.cells(1,25)
        action: value
        args: = "CT Red Burden V/I"
    - step:
        id: '513'
        object_path: objSheetNew.cells(1,25).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '514'
        object_path: objSheetNew.cells(1,26)
        action: value
        args: = "CT White Serial Number"
    - step:
        id: '515'
        object_path: objSheetNew.cells(1,26).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '516'
        object_path: objSheetNew.cells(1,27)
        action: value
        args: = "CT White Primary Current"
    - step:
        id: '517'
        object_path: objSheetNew.cells(1,27).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '518'
        object_path: objSheetNew.cells(1,28)
        action: value
        args: = "CT White Secondary Current"
    - step:
        id: '519'
        object_path: objSheetNew.cells(1,28).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '520'
        object_path: objSheetNew.cells(1,29)
        action: value
        args: = "CT White Calculated Constant"
    - step:
        id: '521'
        object_path: objSheetNew.cells(1,29).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '522'
        object_path: objSheetNew.cells(1,30)
        action: value
        args: = "CT White Terminal Sec Voltage"
    - step:
        id: '523'
        object_path: objSheetNew.cells(1,30).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '524'
        object_path: objSheetNew.cells(1,31)
        action: value
        args: = "CT White Burden V/I"
    - step:
        id: '525'
        object_path: objSheetNew.cells(1,31).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '526'
        object_path: objSheetNew.cells(1,32)
        action: value
        args: = "CT Blue Serial Number"
    - step:
        id: '527'
        object_path: objSheetNew.cells(1,32).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '528'
        object_path: objSheetNew.cells(1,33)
        action: value
        args: = "CT Blue Primary Current"
    - step:
        id: '529'
        object_path: objSheetNew.cells(1,33).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '530'
        object_path: objSheetNew.cells(1,34)
        action: value
        args: = "CT Blue Secondary Current"
    - step:
        id: '531'
        object_path: objSheetNew.cells(1,34).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '532'
        object_path: objSheetNew.cells(1,35)
        action: value
        args: = "CT Blue Calculated Constant"
    - step:
        id: '533'
        object_path: objSheetNew.cells(1,35).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '534'
        object_path: objSheetNew.cells(1,36)
        action: value
        args: = "CT Blue Terminal Sec Voltage"
    - step:
        id: '535'
        object_path: objSheetNew.cells(1,36).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '536'
        object_path: objSheetNew.cells(1,37)
        action: value
        args: = "CT Blue Burden V/I"
    - step:
        id: '537'
        object_path: objSheetNew.cells(1,37).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '538'
        object_path: objSheetNew.cells(1,38)
        action: value
        args: = "Loading Device Used"
    - step:
        id: '539'
        object_path: objSheetNew.cells(1,38).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '540'
        object_path: objSheetNew.cells(1,39)
        action: value
        args: = "Comms Confirmed"
    - step:
        id: '541'
        object_path: objSheetNew.cells(1,39).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '542'
        object_path: objSheetNew.cells(1,40)
        action: value
        args: = "Equipment Sealed"
    - step:
        id: '543'
        object_path: objSheetNew.cells(1,40).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '544'
        object_path: objSheetNew.cells(1,41)
        action: value
        args: = "Meter Time & Date"
    - step:
        id: '545'
        object_path: objSheetNew.cells(1,41).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '546'
        object_path: objSheetNew.cells(1,42)
        action: value
        args: = "Sequence OK"
    - step:
        id: '547'
        object_path: objSheetNew.cells(1,42).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '548'
        object_path: objSheetNew.cells(1,43)
        action: value
        args: = "Meter Read Screen Amps Validated"
    - step:
        id: '549'
        object_path: objSheetNew.cells(1,43).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '550'
        object_path: objSheetNew.cells(1,44)
        action: value
        args: = "Secondary Cable Tonged"
    - step:
        id: '551'
        object_path: objSheetNew.cells(1,44).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '552'
        object_path: objSheetNew.cells(1,45)
        action: value
        args: = "Pass/Fail"
    - step:
        id: '553'
        object_path: objSheetNew.cells(1,45).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '554'
        object_path: objSheetNew.cells(1,46)
        action: value
        args: = "Attachemnt Name"
    - step:
        id: '555'
        object_path: objSheetNew.cells(1,46).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '556'
        object_path: objSheetNew.cells(1,47)
        action: value
        args: = "Comments"
    - step:
        id: '557'
        object_path: objSheetNew.cells(1,47).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '558'
        object_path: objSheetNew.cells(1,48)
        action: value
        args: = "ID"
    - step:
        id: '559'
        object_path: objSheetNew.cells(1,48).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '560'
        object_path: objSheetNew.cells(1,49)
        action: value
        args: = "Technician Name"
    - step:
        id: '561'
        object_path: objSheetNew.cells(1,49).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '562'
        action: Script
        object_path: End Function
    - step:
        id: '563'
        action: Script
        object_path: Function updateResultsInspect(x,y)
    - step:
        id: '564'
        action: Script
        object_path: '''EXTRACT FROM EXCEL'
    - step:
        id: '565'
        action: Script
        object_path: typeOfTest = objSheet.cells(x,1).value
    - step:
        id: '566'
        action: Script
        object_path: testSet = objSheet.cells(x,2).value
    - step:
        id: '567'
        action: Script
        object_path: meterClass = objSheet.cells(x,3).value
    - step:
        id: '568'
        action: Script
        object_path: meterNum = objSheet.cells(x,4).value
    - step:
        id: '569'
        action: Script
        object_path: meterType = objSheet.cells(x,5).value
    - step:
        id: '570'
        action: Script
        object_path: stockItem = objSheet.cells(x,6).value
    - step:
        id: '571'
        action: Script
        object_path: kFactor = objSheet.cells(x,7).value
    - step:
        id: '572'
        action: Script
        object_path: nmi = objSheet.cells(x,8).value
    - step:
        id: '573'
        action: Script
        object_path: sampleLot = objSheet.cells(x,9).value
    - step:
        id: '574'
        action: Script
        object_path: suburb = objSheet.cells(x,10).value
    - step:
        id: '575'
        action: Script
        object_path: streetName = objSheet.cells(x,11).value
    - step:
        id: '576'
        action: Script
        object_path: streetNumber = objSheet.cells(x,12).value
    - step:
        id: '577'
        action: Script
        object_path: streetNumber = Replace(streetNumber,"-","--")
    - step:
        id: '578'
        action: Script
        object_path: unitNumber = objSheet.cells(x,13).value
    - step:
        id: '579'
        action: Script
        object_path: unitNumber = Replace(unitNumber,"-","--")
    - step:
        id: '580'
        action: Script
        object_path: dateofTest = objSheet.cells(x,14).value
    - step:
        id: '581'
        action: Script
        object_path: testStartTime = objSheet.cells(x,15).value
    - step:
        id: '582'
        action: Script
        object_path: testEndTime = objSheet.cells(x,16).value
    - step:
        id: '583'
        action: Script
        object_path: calibrationDate = objSheet.cells(x,17).value
    - step:
        id: '584'
        action: Script
        object_path: ctAvailableRatio = objSheet.cells(x,18).value
    - step:
        id: '585'
        action: Script
        object_path: ctActualRatio = objSheet.cells(x,19).value
    - step:
        id: '586'
        action: Script
        object_path: ctMake = objSheet.cells(x,20).value
    - step:
        id: '587'
        action: Script
        object_path: ctStandard = objSheet.cells(x,21).value
    - step:
        id: '588'
        action: Script
        object_path: ctBurden = objSheet.cells(x,22).value
    - step:
        id: '589'
        action: Script
        object_path: ctClass = objSheet.cells(x,23).value
    - step:
        id: '590'
        action: Script
        object_path: ctType = objSheet.cells(x,24).value
    - step:
        id: '591'
        action: Script
        object_path: ctHousingType = objSheet.cells(x,25).value
    - step:
        id: '592'
        action: Script
        object_path: ctRedSerialNum = objSheet.cells(x,26).value
    - step:
        id: '593'
        action: Script
        object_path: ctRedPrimCurr = objSheet.cells(x,27).value
    - step:
        id: '594'
        action: Script
        object_path: ctRedSecCurr = objSheet.cells(x,28).value
    - step:
        id: '595'
        action: Script
        object_path: ctRedCalcConstant = objSheet.cells(x,29).value
    - step:
        id: '596'
        action: Script
        object_path: ctRedVoltage = objSheet.cells(x,30).value
    - step:
        id: '597'
        action: Script
        object_path: ctRedBurdenVI = objSheet.cells(x,31).value
    - step:
        id: '598'
        action: Script
        object_path: ctWhiteSerialNum = objSheet.cells(x,32).value
    - step:
        id: '599'
        action: Script
        object_path: ctWhitePrimCurr = objSheet.cells(x,33).value
    - step:
        id: '600'
        action: Script
        object_path: ctWhiteSecCurr = objSheet.cells(x,34).value
    - step:
        id: '601'
        action: Script
        object_path: ctWhiteCalcConstant = objSheet.cells(x,35).value
    - step:
        id: '602'
        action: Script
        object_path: ctWhiteVoltage = objSheet.cells(x,36).value
    - step:
        id: '603'
        action: Script
        object_path: ctWhiteBurdenVI = objSheet.cells(x,37).value
    - step:
        id: '604'
        action: Script
        object_path: ctBlueSerialNum = objSheet.cells(x,38).value
    - step:
        id: '605'
        action: Script
        object_path: ctBluePrimCurr = objSheet.cells(x,39).value
    - step:
        id: '606'
        action: Script
        object_path: ctBlueSecCurr = objSheet.cells(x,40).value
    - step:
        id: '607'
        action: Script
        object_path: ctBlueCalcConstant = objSheet.cells(x,41).value
    - step:
        id: '608'
        action: Script
        object_path: ctBlueVoltage = objSheet.cells(x,42).value
    - step:
        id: '609'
        action: Script
        object_path: ctBlueBurdenVI = objSheet.cells(x,43).value
    - step:
        id: '610'
        action: Script
        object_path: secDemandsRNSecCurrent = objSheet.cells(x,44).value
    - step:
        id: '611'
        action: Script
        object_path: secDemandsRNVolts = objSheet.cells(x,45).value
    - step:
        id: '612'
        action: Script
        object_path: secDemandsRNVoltsAmps = objSheet.cells(x,46).value
    - step:
        id: '613'
        action: Script
        object_path: secDemandsRNPowerFactor = objSheet.cells(x,47).value
    - step:
        id: '614'
        action: Script
        object_path: secDemandsRNWatts = objSheet.cells(x,48).value
    - step:
        id: '615'
        action: Script
        object_path: secDemandsWNSecCurrent = objSheet.cells(x,49).value
    - step:
        id: '616'
        action: Script
        object_path: secDemandsWNVolts = objSheet.cells(x,50).value
    - step:
        id: '617'
        action: Script
        object_path: secDemandsWNVoltsAmps = objSheet.cells(x,51).value
    - step:
        id: '618'
        action: Script
        object_path: secDemandsWNPowerFactor = objSheet.cells(x,52).value
    - step:
        id: '619'
        action: Script
        object_path: secDemandsWNWatts = objSheet.cells(x,53).value
    - step:
        id: '620'
        action: Script
        object_path: secDemandsBNSecCurrent = objSheet.cells(x,54).value
    - step:
        id: '621'
        action: Script
        object_path: secDemandsBNVolts = objSheet.cells(x,55).value
    - step:
        id: '622'
        action: Script
        object_path: secDemandsBNVoltsAmps = objSheet.cells(x,56).value
    - step:
        id: '623'
        action: Script
        object_path: secDemandsBNPowerFactor = objSheet.cells(x,57).value
    - step:
        id: '624'
        action: Script
        object_path: secDemandsBNWatts = objSheet.cells(x,58).value
    - step:
        id: '625'
        action: Script
        object_path: secDemandsVoltsAmpsTotal = objSheet.cells(x,59).value
    - step:
        id: '626'
        action: Script
        object_path: secDemandsWattsTotal = objSheet.cells(x,60).value
    - step:
        id: '627'
        action: Script
        object_path: primDemandsFromSeckW = objSheet.cells(x,61).value
    - step:
        id: '628'
        action: Script
        object_path: primDemandsFromSeckVA = objSheet.cells(x,62).value
    - step:
        id: '629'
        action: Script
        object_path: kwid10Reading = objSheet.cells(x,63).value
    - step:
        id: '630'
        action: Script
        object_path: kwid11Reading = objSheet.cells(x,64).value
    - step:
        id: '631'
        action: Script
        object_path: primDemandsRegisterReadkW = objSheet.cells(x,65).value
    - step:
        id: '632'
        action: Script
        object_path: primDemandsRegisterReadkVa = objSheet.cells(x,66).value
    - step:
        id: '633'
        action: Script
        object_path: tp01unityactive = objSheet.cells(x,67).value
    - step:
        id: '634'
        action: Script
        object_path: tp05unityactive = objSheet.cells(x,68).value
    - step:
        id: '635'
        action: Script
        object_path: tp10unityactive = objSheet.cells(x,69).value
    - step:
        id: '636'
        action: Script
        object_path: tp10in05lagging = objSheet.cells(x,70).value
    - step:
        id: '637'
        action: Script
        object_path: tp2inorImax = objSheet.cells(x,71).value
    - step:
        id: '638'
        action: Script
        object_path: loadingDeviceUsed = objSheet.cells(x,72).value
    - step:
        id: '639'
        action: Script
        object_path: commsConfirmed = objSheet.cells(x,73).value
    - step:
        id: '640'
        action: Script
        object_path: equipmentSealed = objSheet.cells(x,74).value
    - step:
        id: '641'
        action: Script
        object_path: meterTimeDate = objSheet.cells(x,75).value
    - step:
        id: '642'
        action: Script
        object_path: sequenceOK = objSheet.cells(x,76).value
    - step:
        id: '643'
        action: Script
        object_path: meterReadScreenAmpsValidated = objSheet.cells(x,77).value
    - step:
        id: '644'
        action: Script
        object_path: secondaryCableTonged= objSheet.cells(x,78).value
    - step:
        id: '645'
        action: Script
        object_path: passFail = objSheet.cells(x,79).value
    - step:
        id: '646'
        action: Script
        object_path: attachmentNames = objSheet.cells(x,80).value
    - step:
        id: '647'
        action: Script
        object_path: comments = objSheet.cells(x,81).value
    - step:
        id: '648'
        action: Script
        object_path: id = objSheet.cells(x,82).value
    - step:
        id: '649'
        action: Script
        object_path: technicianName = objSheet.cells(x,83).value
    - step:
        id: '650'
        action: Script
        object_path: '''ADD TO SAMPLE LOT'
    - step:
        id: '651'
        object_path: objSheetNew.cells(y,1)
        action: value
        args: = typeOfTest
    - step:
        id: '652'
        object_path: objSheetNew.cells(y,2)
        action: value
        args: = meterClass
    - step:
        id: '653'
        object_path: objSheetNew.cells(y,3)
        action: value
        args: = meterNum
    - step:
        id: '654'
        object_path: objSheetNew.cells(y,4)
        action: value
        args: = meterType
    - step:
        id: '655'
        object_path: objSheetNew.cells(y,5)
        action: value
        args: = kFactor
    - step:
        id: '656'
        object_path: objSheetNew.cells(y,6)
        action: value
        args: = nmi
    - step:
        id: '657'
        object_path: objSheetNew.cells(y,7)
        action: value
        args: = suburb
    - step:
        id: '658'
        object_path: objSheetNew.cells(y,8)
        action: value
        args: = streetName
    - step:
        id: '659'
        object_path: objSheetNew.cells(y,9)
        action: value
        args: = streetNumber
    - step:
        id: '660'
        object_path: objSheetNew.cells(y,10)
        action: value
        args: = unitNumber
    - step:
        id: '661'
        object_path: objSheetNew.cells(y,11)
        action: value
        args: = dateofTest
    - step:
        id: '662'
        object_path: objSheetNew.cells(y,12)
        action: value
        args: = ctAvailableRatio
    - step:
        id: '663'
        object_path: objSheetNew.cells(y,13)
        action: value
        args: = ctActualRatio
    - step:
        id: '664'
        object_path: objSheetNew.cells(y,14)
        action: value
        args: = ctMake
    - step:
        id: '665'
        object_path: objSheetNew.cells(y,15)
        action: value
        args: = ctStandard
    - step:
        id: '666'
        object_path: objSheetNew.cells(y,16)
        action: value
        args: = ctBurden
    - step:
        id: '667'
        object_path: objSheetNew.cells(y,17)
        action: value
        args: = ctClass
    - step:
        id: '668'
        object_path: objSheetNew.cells(y,18)
        action: value
        args: = ctType
    - step:
        id: '669'
        object_path: objSheetNew.cells(y,19)
        action: value
        args: = ctHousingType
    - step:
        id: '670'
        object_path: objSheetNew.cells(y,20)
        action: value
        args: = ctRedSerialNum
    - step:
        id: '671'
        object_path: objSheetNew.cells(y,21)
        action: value
        args: = ctRedPrimCurr
    - step:
        id: '672'
        object_path: objSheetNew.cells(y,22)
        action: value
        args: = ctRedSecCurr
    - step:
        id: '673'
        object_path: objSheetNew.cells(y,23)
        action: value
        args: = ctRedCalcConstant
    - step:
        id: '674'
        object_path: objSheetNew.cells(y,24)
        action: value
        args: = ctRedVoltage
    - step:
        id: '675'
        object_path: objSheetNew.cells(y,25)
        action: value
        args: = ctRedBurdenVI
    - step:
        id: '676'
        object_path: objSheetNew.cells(y,26)
        action: value
        args: = ctWhiteSerialNum
    - step:
        id: '677'
        object_path: objSheetNew.cells(y,27)
        action: value
        args: = ctWhitePrimCurr
    - step:
        id: '678'
        object_path: objSheetNew.cells(y,28)
        action: value
        args: = ctWhiteSecCurr
    - step:
        id: '679'
        object_path: objSheetNew.cells(y,29)
        action: value
        args: = ctWhiteCalcConstant
    - step:
        id: '680'
        object_path: objSheetNew.cells(y,30)
        action: value
        args: = ctWhiteVoltage
    - step:
        id: '681'
        object_path: objSheetNew.cells(y,31)
        action: value
        args: = ctWhiteBurdenVI
    - step:
        id: '682'
        object_path: objSheetNew.cells(y,32)
        action: value
        args: = ctBlueSerialNum
    - step:
        id: '683'
        object_path: objSheetNew.cells(y,33)
        action: value
        args: = ctBluePrimCurr
    - step:
        id: '684'
        object_path: objSheetNew.cells(y,34)
        action: value
        args: = ctBlueSecCurr
    - step:
        id: '685'
        object_path: objSheetNew.cells(y,35)
        action: value
        args: = ctBlueCalcConstant
    - step:
        id: '686'
        object_path: objSheetNew.cells(y,36)
        action: value
        args: = ctBlueVoltage
    - step:
        id: '687'
        object_path: objSheetNew.cells(y,37)
        action: value
        args: = ctBlueBurdenVI
    - step:
        id: '688'
        object_path: objSheetNew.cells(y,38)
        action: value
        args: = loadingDeviceUsed
    - step:
        id: '689'
        object_path: objSheetNew.cells(y,39)
        action: value
        args: = commsConfirmed
    - step:
        id: '690'
        object_path: objSheetNew.cells(y,40)
        action: value
        args: = equipmentSealed
    - step:
        id: '691'
        object_path: objSheetNew.cells(y,41)
        action: value
        args: = meterTimeDate
    - step:
        id: '692'
        object_path: objSheetNew.cells(y,42)
        action: value
        args: = sequenceOK
    - step:
        id: '693'
        object_path: objSheetNew.cells(y,43)
        action: value
        args: = meterReadScreenAmpsValidated
    - step:
        id: '694'
        object_path: objSheetNew.cells(y,44)
        action: value
        args: = secondaryCableTonged
    - step:
        id: '695'
        object_path: objSheetNew.cells(y,45)
        action: value
        args: = passFail
    - step:
        id: '696'
        object_path: objSheetNew.cells(y,46)
        action: value
        args: = attachmentNames
    - step:
        id: '697'
        object_path: objSheetNew.cells(y,47)
        action: value
        args: = comments
    - step:
        id: '698'
        object_path: objSheetNew.cells(y,48)
        action: value
        args: = id
    - step:
        id: '699'
        object_path: objSheetNew.cells(y,49)
        action: value
        args: = technicianName
    - step:
        id: '700'
        action: Script
        object_path: End Function
    - step:
        id: '701'
        action: Script
        object_path: '''Function getAttachmentsTest(id,sampleLot)'
    - step:
        id: '702'
        action: Script
        object_path: '''    attachmentURL = "https://sapowernetworks.sharepoint.com/sites/EnervenMeterTestingSite/Lists/Enerven%20Meter%20Testing%20Type%205/DispForm.aspx?ID="&id'
    - step:
        id: '703'
        action: Script
        object_path: '''    mySendKeys.Run "msedge -url "&attachmentURL'
    - step:
        id: '704'
        action: Script
        object_path: '''    Wait 5'
    - step:
        id: '705'
        action: Script
        object_path: '''    attachments = Browser("Enerven Meter Testing").Page("Enerven
          Meter Testing").WebButton("Attachments").GetROProperty("acc_name")'
    - step:
        id: '706'
        action: Script
        object_path: '''    attachments = Replace(attachments,"Attachments, ","")'
    - step:
        id: '707'
        action: Script
        object_path: '''    attachments = Replace(attachments,", press enter to edit.","")'
    - step:
        id: '708'
        action: Script
        object_path: '''    att = Split(attachments,",")'
    - step:
        id: '709'
        action: Script
        object_path: '''    For each attachment1 in att'
    - step:
        id: '710'
        action: Script
        object_path: '''        attachment = Replace(attachment1,".","\.")'
    - step:
        id: '711'
        action: Script
        object_path: '''        attachment = Trim(attachment)'
    - step:
        id: '712'
        action: Script
        object_path: '''        attachment = Replace(attachment,"(","\(")'
    - step:
        id: '713'
        action: Script
        object_path: '''        attachment = Replace(attachment,")","\)")'
    - step:
        id: '714'
        action: Script
        object_path: '''        attachURL = Browser("Enerven Meter Testing").Page("Enerven
          Meter Testing").Link("innertext:="&attachment).GetROProperty("href")'
    - step:
        id: '715'
        action: Script
        object_path: '''        attachURL = Replace(attachURL," ","%20")'
    - step:
        id: '716'
        action: Script
        object_path: '''        attachURL = Replace(attachURL,"?web=1","")'
    - step:
        id: '717'
        action: Script
        object_path: '''        downloadURL = "https://sapowernetworks.sharepoint.com/sites/EnervenMeterTestingSite/_layouts/download.aspx?SourceURL="&attachURL'
    - step:
        id: '718'
        action: Script
        object_path: '''        mySendKeys.Run "msedge -url "&downloadURL'
    - step:
        id: '719'
        action: Script
        object_path: '''        Wait 5'
    - step:
        id: '720'
        action: Script
        object_path: '''        attachment1 = trim(attachment1)'
    - step:
        id: '721'
        action: Script
        object_path: '''        SystemUtil.CloseProcessByName("i_view64.exe")'
    - step:
        id: '722'
        action: Script
        object_path: '''        Wait 3'
    - step:
        id: '723'
        action: Script
        object_path: '''        newFolderPath = filelocation&"Meter Test Sample "&sampleLot&"
          Attachments"'
    - step:
        id: '724'
        action: Script
        object_path: '''        If Not fso.FolderExists(newFolderPath) Then'
    - step:
        id: '725'
        action: Script
        object_path: '''            Set newfolder = fso.CreateFolder(newFolderPath)'
    - step:
        id: '726'
        action: Script
        object_path: '''        End If'
    - step:
        id: '727'
        action: Script
        object_path: '''        If fso.FileExists(newFolderPath&"\ID "&id&" "&attachment1)Then'
    - step:
        id: '728'
        action: Script
        object_path: '''            fso.DeleteFile(newFolderPath&"\ID "&id&" "&attachment1)'
    - step:
        id: '729'
        action: Script
        object_path: '''        End If'
    - step:
        id: '730'
        action: Script
        object_path: '''        fso.MoveFile "C:\Automation Downloads\"&attachment1,
          newFolderPath&"\ID "&id&" "&attachment1'
    - step:
        id: '731'
        action: Script
        object_path: '''        Set newfolder = Nothing'
    - step:
        id: '732'
        action: Script
        object_path: '''    Next'
    - step:
        id: '733'
        action: Script
        object_path: '''    Wait 1'
    - step:
        id: '734'
        action: Script
        object_path: '''    SystemUtil.CloseProcessByName "msedge.exe"'
    - step:
        id: '735'
        action: Script
        object_path: '''    getAttachmentsTest = attachments'
    - step:
        id: '736'
        action: Script
        object_path: '''End Function'
    - step:
        id: '737'
        action: Script
        object_path: '''Function getAttachmentsInspect(id)'
    - step:
        id: '738'
        action: Script
        object_path: '''    attachmentURL = "https://sapowernetworks.sharepoint.com/sites/EnervenMeterTestingSite/Lists/Enerven%20Meter%20Testing%20Type%205/DispForm.aspx?ID="&id'
    - step:
        id: '739'
        action: Script
        object_path: '''    mySendKeys.Run "msedge -url "&attachmentURL'
    - step:
        id: '740'
        action: Script
        object_path: '''    Wait 5'
    - step:
        id: '741'
        action: Script
        object_path: '''    attachments = Browser("Enerven Meter Testing").Page("Enerven
          Meter Testing").WebButton("Attachments").GetROProperty("acc_name")'
    - step:
        id: '742'
        action: Script
        object_path: '''    attachments = Replace(attachments,"Attachments, ","")'
    - step:
        id: '743'
        action: Script
        object_path: '''    attachments = Replace(attachments,", press enter to edit.","")'
    - step:
        id: '744'
        action: Script
        object_path: '''    att = Split(attachments,",")'
    - step:
        id: '745'
        action: Script
        object_path: '''    For each attachment1 in att'
    - step:
        id: '746'
        action: Script
        object_path: '''        attachment = Replace(attachment1,".","\.")'
    - step:
        id: '747'
        action: Script
        object_path: '''        attachment = Trim(attachment)'
    - step:
        id: '748'
        action: Script
        object_path: '''        attachment = Replace(attachment,"(","\(")'
    - step:
        id: '749'
        action: Script
        object_path: '''        attachment = Replace(attachment,")","\)")'
    - step:
        id: '750'
        action: Script
        object_path: '''        attachURL = Browser("Enerven Meter Testing").Page("Enerven
          Meter Testing").Link("innertext:="&attachment).GetROProperty("href")'
    - step:
        id: '751'
        action: Script
        object_path: '''        attachURL = Replace(attachURL," ","%20")'
    - step:
        id: '752'
        action: Script
        object_path: '''        attachURL = Replace(attachURL,"?web=1","")'
    - step:
        id: '753'
        action: Script
        object_path: '''        downloadURL = "https://sapowernetworks.sharepoint.com/sites/EnervenMeterTestingSite/_layouts/download.aspx?SourceURL="&attachURL'
    - step:
        id: '754'
        action: Script
        object_path: '''        mySendKeys.Run "msedge -url "&downloadURL'
    - step:
        id: '755'
        action: Script
        object_path: '''        Wait 2'
    - step:
        id: '756'
        action: Script
        object_path: '''        attachment1 = trim(attachment1)'
    - step:
        id: '757'
        action: Script
        object_path: '''        SystemUtil.CloseProcessByName("i_view64.exe")'
    - step:
        id: '758'
        action: Script
        object_path: '''        newFolderPath = filelocation&"Meter Inspection Attachments"'
    - step:
        id: '759'
        action: Script
        object_path: '''        If Not fso.FolderExists(newFolderPath) Then'
    - step:
        id: '760'
        action: Script
        object_path: '''            Set newfolder = fso.CreateFolder(newFolderPath)'
    - step:
        id: '761'
        action: Script
        object_path: '''        End If'
    - step:
        id: '762'
        action: Script
        object_path: '''        If fso.FileExists(newFolderPath&"\ID "&id&" "&attachment1)Then'
    - step:
        id: '763'
        action: Script
        object_path: '''            fso.DeleteFile(newFolderPath&"\ID "&id&" "&attachment1)'
    - step:
        id: '764'
        action: Script
        object_path: '''        End If'
    - step:
        id: '765'
        action: Script
        object_path: '''        Wait 3'
    - step:
        id: '766'
        action: Script
        object_path: '''        fso.MoveFile "C:\Automation Downloads\"&attachment1,
          newFolderPath&"\ID "&id&" "&attachment1'
    - step:
        id: '767'
        action: Script
        object_path: '''        Set newfolder = Nothing'
    - step:
        id: '768'
        action: Script
        object_path: '''    Next'
    - step:
        id: '769'
        action: Script
        object_path: '''    Wait 1'
    - step:
        id: '770'
        action: Script
        object_path: '''    SystemUtil.CloseProcessByName "msedge.exe"'
    - step:
        id: '771'
        action: Script
        object_path: '''    getAttachmentsInspect = attachments'
    - step:
        id: '772'
        action: Script
        object_path: '''End Function'
    - step:
        id: '773'
        action: Script
        object_path: ''''
  outputs:
  - meterTestingResultsFile:
      robot: true
      value: ${meterTestingResultsFile}
  - rowCount:
      robot: true
      value: ${rowCount}
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Browser
      name: RPA - Enerven Meter Testing_2
      properties:
      - property:
          value:
            value: RPA - Enerven Meter Testing Type 6 - All Items
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/AllItems.aspx?viewid=78153375%2D0346%2D45ba%2D90f1%2Da6e29bd74f61
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: ''
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '1'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: RPA - Enerven Meter Testing Type 6 - All Items
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '1'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 2
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Wednesday, 31 August 2022 7:13:52 PM
      child_objects:
      - object:
          class: Page
          name: RPA - Enerven Meter Testing
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/AllItems.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/AllItems.aspx?viewid=78153375%2D0346%2D45ba%2D90f1%2Da6e29bd74f61
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: RPA - Enerven Meter Testing Type 6 - All Items
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10051'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Wednesday, 31 August 2022 7:13:52 PM
          child_objects:
          - object:
              class: WebMenu
              name: Command bar
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[2]/DIV[@role="region"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="menubar"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '1644'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '157'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '276'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '44'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: New
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-FocusZone css-83 ms-CommandBar root-84
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Command bar
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '260'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '276'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 31 August 2022 7:13:52 PM
              child_objects: []
          - object:
              class: WebCheckBox
              name: Toggle selection for all
              properties:
              - property:
                  value:
                    value: WebCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="main"]/DIV/DIV/DIV/DIV/DIV/DIV/DIV/DIV/DIV[@role="grid"]/DIV[@role="presentation"]/DIV[@role="row"]/DIV[@role="columnheader"
                      and normalize-space()=""]/DIV[1]/DIV[@role="checkbox"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '48'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: '286'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '308'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: checkbox
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: header6-check
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '42'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ms-DetailsRow-check ms-DetailsHeader-check check-98 ms-DetailsRow-check--isHeader
                      ms-Check-checkHost check-114
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Toggle selection for all items
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '389'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '308'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - role
                - html tag
                - acc_name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 31 August 2022 7:13:52 PM
              child_objects: []
          - object:
              class: WebButton
              name: Delete
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //SPAN/BUTTON[normalize-space()="Delete"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '83'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: '531'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '981'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Delete
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Delete
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '32'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ms-Button ms-Button--primary root-242
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '634'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '981'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 31 August 2022 7:13:52 PM
              child_objects: []
  - object:
      class: Browser
      name: RPA - Enerven Meter Testing
      properties:
      - property:
          value:
            value: RPA - Enerven Meter Testing Type 6 - All Items
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://login.microsoftonline.com/8c9b06d0-cb4a-4a03-b449-1f5a2548a910/oauth2/authorize?client_id=00000003-0000-0ff1-ce00-000000000000&response_mode=form_post&protectedtoken=true&response_type=code+id_token&resource=00000003-0000-0ff1-ce00-000000000000&scope=openid&nonce=781C29F14B65921D88C0960874589C2EC234A93768D96074-7988D59E95E8866F3C75E867C3DD1B9688F14338CD4E245926CD23C90AEA2C3B&redirect_uri=https%3a%2f%2fsapowernetworks.sharepoint.com%2f_forms%2fdefault.aspx&state=OD0w&claims=%7b%22id_token%22%3a%7b%22xms_cc%22%3a%7b%22values%22%3a%5b%22CP1%22%5d%7d%7d%7d&wsucxt=1&cobrandid=11bd8083-87e0-41b5-bb78-0bc43c8a8e8a&client-request-id=29740ea0-a0e6-0000-c9ca-45228d16bd23&sso_nonce=AwABAAAAAAACAOz_BAD0_15YG2jClFdYXlgG1NNbVvUmhEYxy3hljGK_E8stPgAH6Nn6LActdDSyERGzz8AKwXIzT9fvMaGQOGPhcGrMz3UgAA&mscrid=29740ea0-a0e6-0000-c9ca-45228d16bd23
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Working...
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '1'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: RPA - Enerven Meter Testing Type 6 - All Items
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '1'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 0
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Wednesday, 31 August 2022 7:13:52 PM
      child_objects:
      - object:
          class: Page
          name: RPA - Enerven Meter Testing
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/AllItems.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/AllItems.aspx?viewid=78153375%2D0346%2D45ba%2D90f1%2Da6e29bd74f61
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: RPA - Enerven Meter Testing Type 6 - All Items
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10046'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Wednesday, 31 August 2022 7:13:52 PM
          child_objects:
          - object:
              class: WebTable
              name: List of folders, files
              properties:
              - property:
                  value:
                    value: WebTable
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="grid"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 31 August 2022 7:13:52 PM
              child_objects: []
          - object:
              class: WebMenu
              name: Command bar
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: New
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-FocusZone css-83 ms-CommandBar root-84
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Command bar
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 31 August 2022 7:13:52 PM
              child_objects: []
          - object:
              class: SAPEdit
              name: SAPEdit
              properties:
              - property:
                  value:
                    value: SAPEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //BODY
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '1920'
                    regular_expression: false
                  name: width
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: view_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: view_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: readonly
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '937'
                    regular_expression: false
                  name: height
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '103'
                    regular_expression: false
                  name: abs_y
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: abs_x
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - sap attached text
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - readonly
                  - name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Wednesday, 31 August 2022 7:13:52 PM
              child_objects: []
  - object:
      class: Browser
      name: Enerven Meter Testing
      properties:
      - property:
          value:
            value: Enerven Meter Testing Type 6 - Item properties
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/DispForm.aspx?ID=25
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: ''
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '2'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Enerven Meter Testing Type 6 - Item properties
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '3'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 1
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Wednesday, 31 August 2022 7:13:52 PM
      child_objects:
      - object:
          class: Page
          name: Enerven Meter Testing
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/DispForm.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/DispForm.aspx?ID=26
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Enerven Meter Testing Type 6 - Item properties
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '30051'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Wednesday, 31 August 2022 7:13:52 PM
          child_objects:
          - object:
              class: WebButton
              name: Attachments
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Add or remove attachments
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Add or remove attachments
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ReactFieldEditor-core--display
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Attachments,.*
                    regular_expression: true
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - type
                - html tag
                - acc_name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 31 August 2022 7:13:52 PM
              child_objects: []
          - object:
              class: Link
              name: Attachment URL
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Activities.xlsx
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Activities.xlsx
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: A
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://sapowernetworks.sharepoint.com/sites/RPA/Lists/Type6MeterTesting/Attachments/25/Activities.xlsx?web=1
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-Link urlField_56c88ace root-81
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Wednesday, 31 August 2022 7:13:52 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
