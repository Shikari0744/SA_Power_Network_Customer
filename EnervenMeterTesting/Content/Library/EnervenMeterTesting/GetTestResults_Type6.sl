namespace: EnervenMeterTesting
operation:
  name: GetTestResults_Type6
  inputs:
  - filelocation: C:\Users\svcrpabot\OneDrive - SA Power Networks\Enerven Meter Testing\Type
      6\
  sequential_action:
    gav: com.microfocus.seq:EnervenMeterTesting.GetTestResults_Type6:1.0.0
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
        object_path: URL = "https://sapowernetworks.sharepoint.com/sites/EnervenMeterTestingSite/Lists/Enerven%20Meter%20Testing%20Type%206/AllItems.aspx"
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
        object_path: meterTestingResultsFile = "Type 6 Meter Testing Results "&CStr(todayDay)&"-"&CStr(todayMonth)
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
        object_path: sampleLot = objSheet.cells(x,13).value
    - step:
        id: '45'
        action: Script
        object_path: If len(sampleLot) < 5 or len(sampleLot) > 7 Then
    - step:
        id: '46'
        action: Script
        object_path: sampleLot = "Lot NA"
    - step:
        id: '47'
        action: Script
        object_path: End If
    - step:
        id: '48'
        action: Script
        object_path: If fso.FileExists(filelocation&"Sample "&sampleLot&" Results.xlsx")Then
    - step:
        id: '49'
        action: Script
        object_path: Set objWorkbookNew = objExcel.Workbooks.open(filelocation&"Sample
          "&sampleLot&" Results.xlsx")
    - step:
        id: '50'
        action: Script
        object_path: Set objSheetNew = objWorkbookNew.Worksheets(1)
    - step:
        id: '51'
        action: Script
        object_path: y = objSheetNew.usedrange.Rows.Count + 1
    - step:
        id: '52'
        action: Script
        object_path: Call updateResults(x,y)
    - step:
        id: '53'
        object_path: objWorkbookNew
        action: Save
    - step:
        id: '54'
        object_path: objWorkbookNew
        action: close
    - step:
        id: '55'
        action: Script
        object_path: Else
    - step:
        id: '56'
        action: Script
        object_path: Set objWorkbookNew = objExcel.Workbooks.Add()
    - step:
        id: '57'
        action: Script
        object_path: Set objSheetNew = objWorkbookNew.Worksheets(1)
    - step:
        id: '58'
        action: Script
        object_path: Call addColumnHeadings
    - step:
        id: '59'
        action: Script
        object_path: y = objSheetNew.usedrange.Rows.Count + 1
    - step:
        id: '60'
        action: Script
        object_path: Call updateResults(x,y)
    - step:
        id: '61'
        object_path: objWorkbookNew
        action: SaveAs(filelocation&"Sample
        args: '"&sampleLot&" Results.xlsx")'
    - step:
        id: '62'
        object_path: objWorkbookNew
        action: close
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        action: Script
        object_path: If Not fso.FolderExists(filelocation&"Sample "&sampleLot&" Summary
          Sheets") Then
    - step:
        id: '65'
        action: Script
        object_path: Set newfolder = fso.CreateFolder(filelocation&"Sample "&sampleLot&"
          Summary Sheets")
    - step:
        id: '66'
        action: Script
        object_path: End If
    - step:
        id: '67'
        action: Script
        object_path: Set newfolder = Nothing
    - step:
        id: '68'
        action: Script
        object_path: Next
    - step:
        id: '69'
        object_path: objWorkbook
        action: save
    - step:
        id: '70'
        object_path: objWorkbook
        action: close
    - step:
        id: '71'
        object_path: objExcel
        action: Quit
    - step:
        id: '72'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '73'
        action: Script
        object_path: Set objSheetNew = Nothing
    - step:
        id: '74'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '75'
        action: Script
        object_path: Set objWorkbookNew = Nothing
    - step:
        id: '76'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '77'
        action: Script
        object_path: '''DELETE FROM SHAREPOINT LIST'
    - step:
        id: '78'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&URL'
    - step:
        id: '79'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '80'
        object_path: Browser("RPA - Enerven Meter Testing_2").Page("RPA - Enerven
          Meter Testing").WebCheckBox("Toggle selection for all")
        action: Set
        args: '"ON"'
    - step:
        id: '81'
        object_path: Browser("RPA - Enerven Meter Testing_2").Page("RPA - Enerven
          Meter Testing").WebMenu("Command bar")
        action: Select
        args: '"Delete"'
        snapshot: .\Snapshots\ssf2.html
        highlight_id: '10000000'
    - step:
        id: '82'
        object_path: Browser("RPA - Enerven Meter Testing_2").Page("RPA - Enerven
          Meter Testing").WebButton("Delete")
        action: Click
    - step:
        id: '83'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '84'
        action: Script
        object_path: Else
    - step:
        id: '85'
        object_path: Reporter
        action: ReportEvent
        args: micFail, "Download failed", "Download failed"
    - step:
        id: '86'
        action: Script
        object_path: ExitTest
    - step:
        id: '87'
        action: Script
        object_path: End If
        snapshot: .\Snapshots\ssf3.html
        highlight_id: '10000000'
    - step:
        id: '88'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '89'
        action: Script
        object_path: Else
    - step:
        id: '90'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "No entries", "No entries"
    - step:
        id: '91'
        action: Script
        object_path: ExitTest
    - step:
        id: '92'
        action: Script
        object_path: End If
    - step:
        id: '93'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '94'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '95'
        object_path: SystemUtil
        action: CloseProcessByName("msedge.exe")
    - step:
        id: '96'
        action: Script
        object_path: '''*************************************************************************************************************************************************'
    - step:
        id: '97'
        action: Script
        object_path: Function addColumnHeadings
    - step:
        id: '98'
        object_path: objSheetNew.cells(1,1)
        action: value
        args: = "Type of Test"
    - step:
        id: '99'
        object_path: objSheetNew.cells(1,1).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '100'
        object_path: objSheetNew.cells(1,2)
        action: value
        args: = "Test Set Type"
    - step:
        id: '101'
        object_path: objSheetNew.cells(1,2).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '102'
        object_path: objSheetNew.cells(1,3)
        action: value
        args: '= "Test Set #"'
    - step:
        id: '103'
        object_path: objSheetNew.cells(1,3).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '104'
        object_path: objSheetNew.cells(1,4)
        action: value
        args: = "Stock Item"
    - step:
        id: '105'
        object_path: objSheetNew.cells(1,4).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '106'
        object_path: objSheetNew.cells(1,5)
        action: value
        args: = "Meter Serial Number"
    - step:
        id: '107'
        object_path: objSheetNew.cells(1,5).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '108'
        object_path: objSheetNew.cells(1,6)
        action: value
        args: = "Program"
    - step:
        id: '109'
        object_path: objSheetNew.cells(1,6).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '110'
        object_path: objSheetNew.cells(1,7)
        action: value
        args: = "Operators Name"
    - step:
        id: '111'
        object_path: objSheetNew.cells(1,7).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '112'
        object_path: objSheetNew.cells(1,8)
        action: value
        args: = "Suburb"
    - step:
        id: '113'
        object_path: objSheetNew.cells(1,8).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '114'
        object_path: objSheetNew.cells(1,9)
        action: value
        args: = "Street Name"
    - step:
        id: '115'
        object_path: objSheetNew.cells(1,9).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '116'
        object_path: objSheetNew.cells(1,10)
        action: value
        args: = "Street Number"
    - step:
        id: '117'
        object_path: objSheetNew.cells(1,10).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '118'
        object_path: objSheetNew.cells(1,11)
        action: value
        args: = "Unit Number"
    - step:
        id: '119'
        object_path: objSheetNew.cells(1,11).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '120'
        object_path: objSheetNew.cells(1,12)
        action: value
        args: = "Sample Lot Number"
    - step:
        id: '121'
        object_path: objSheetNew.cells(1,12).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '122'
        object_path: objSheetNew.cells(1,13)
        action: value
        args: = "NMI"
    - step:
        id: '123'
        object_path: objSheetNew.cells(1,13).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '124'
        object_path: objSheetNew.cells(1,14)
        action: value
        args: = "Noti Details"
    - step:
        id: '125'
        object_path: objSheetNew.cells(1,14).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '126'
        object_path: objSheetNew.cells(1,15)
        action: value
        args: = "RPK"
    - step:
        id: '127'
        object_path: objSheetNew.cells(1,15).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '128'
        object_path: objSheetNew.cells(1,16)
        action: value
        args: = "Current Rating"
    - step:
        id: '129'
        object_path: objSheetNew.cells(1,16).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '130'
        object_path: objSheetNew.cells(1,17)
        action: value
        args: = "Date of Test"
    - step:
        id: '131'
        object_path: objSheetNew.cells(1,17).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '132'
        object_path: objSheetNew.cells(1,18)
        action: value
        args: = "Ambient Temp"
    - step:
        id: '133'
        object_path: objSheetNew.cells(1,18).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '134'
        object_path: objSheetNew.cells(1,19)
        action: value
        args: = "Calibration Date"
    - step:
        id: '135'
        object_path: objSheetNew.cells(1,19).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '136'
        object_path: objSheetNew.cells(1,20)
        action: value
        args: = "High Reading"
    - step:
        id: '137'
        object_path: objSheetNew.cells(1,20).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '138'
        object_path: objSheetNew.cells(1,21)
        action: value
        args: = "Low Reading"
    - step:
        id: '139'
        object_path: objSheetNew.cells(1,21).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '140'
        object_path: objSheetNew.cells(1,22)
        action: value
        args: = "Export"
    - step:
        id: '141'
        object_path: objSheetNew.cells(1,22).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '142'
        object_path: objSheetNew.cells(1,23)
        action: value
        args: = "OPCL"
    - step:
        id: '143'
        object_path: objSheetNew.cells(1,23).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '144'
        object_path: objSheetNew.cells(1,24)
        action: value
        args: = "Phase to Neutral"
    - step:
        id: '145'
        object_path: objSheetNew.cells(1,24).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '146'
        object_path: objSheetNew.cells(1,25)
        action: value
        args: = "Phase to Red"
    - step:
        id: '147'
        object_path: objSheetNew.cells(1,25).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '148'
        object_path: objSheetNew.cells(1,26)
        action: value
        args: = "Phase to White"
    - step:
        id: '149'
        object_path: objSheetNew.cells(1,26).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '150'
        object_path: objSheetNew.cells(1,27)
        action: value
        args: = "Phase to Blue"
    - step:
        id: '151'
        object_path: objSheetNew.cells(1,27).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '152'
        object_path: objSheetNew.cells(1,28)
        action: value
        args: = "Low Load Unity Red Test 1"
    - step:
        id: '153'
        object_path: objSheetNew.cells(1,28).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '154'
        object_path: objSheetNew.cells(1,29)
        action: value
        args: = "Low Load Unity Red Test 2"
    - step:
        id: '155'
        object_path: objSheetNew.cells(1,29).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '156'
        object_path: objSheetNew.cells(1,30)
        action: value
        args: = "Low Load Unity Red Test 3"
    - step:
        id: '157'
        object_path: objSheetNew.cells(1,30).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '158'
        object_path: objSheetNew.cells(1,31)
        action: value
        args: = "Low Load Unity Red Test Total"
    - step:
        id: '159'
        object_path: objSheetNew.cells(1,31).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '160'
        object_path: objSheetNew.cells(1,32)
        action: value
        args: = "Low Load Unity Red Test Average"
    - step:
        id: '161'
        object_path: objSheetNew.cells(1,32).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '162'
        object_path: objSheetNew.cells(1,33)
        action: value
        args: = "Low Load Unity White Test 1"
    - step:
        id: '163'
        object_path: objSheetNew.cells(1,33).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '164'
        object_path: objSheetNew.cells(1,34)
        action: value
        args: = "Low Load Unity White Test 2"
    - step:
        id: '165'
        object_path: objSheetNew.cells(1,34).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '166'
        object_path: objSheetNew.cells(1,35)
        action: value
        args: = "Low Load Unity White Test 3"
    - step:
        id: '167'
        object_path: objSheetNew.cells(1,35).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '168'
        object_path: objSheetNew.cells(1,36)
        action: value
        args: = "Low Load Unity White Test Total"
    - step:
        id: '169'
        object_path: objSheetNew.cells(1,36).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '170'
        object_path: objSheetNew.cells(1,37)
        action: value
        args: = "Low Load Unity White Test Average"
    - step:
        id: '171'
        object_path: objSheetNew.cells(1,37).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '172'
        object_path: objSheetNew.cells(1,38)
        action: value
        args: = "Low Load Unity Blue Test 1"
    - step:
        id: '173'
        object_path: objSheetNew.cells(1,38).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '174'
        object_path: objSheetNew.cells(1,39)
        action: value
        args: = "Low Load Unity Blue Test 2"
    - step:
        id: '175'
        object_path: objSheetNew.cells(1,39).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '176'
        object_path: objSheetNew.cells(1,40)
        action: value
        args: = "Low Load Unity Blue Test 3"
    - step:
        id: '177'
        object_path: objSheetNew.cells(1,40).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '178'
        object_path: objSheetNew.cells(1,41)
        action: value
        args: = "Low Load Unity Blue Test Total"
    - step:
        id: '179'
        object_path: objSheetNew.cells(1,41).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '180'
        object_path: objSheetNew.cells(1,42)
        action: value
        args: = "Low Load Unity Blue Test Average"
    - step:
        id: '181'
        object_path: objSheetNew.cells(1,42).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '182'
        object_path: objSheetNew.cells(1,43)
        action: value
        args: = "Low Load Unity Total"
    - step:
        id: '183'
        object_path: objSheetNew.cells(1,43).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '184'
        object_path: objSheetNew.cells(1,44)
        action: value
        args: = "Low Load Unity Average"
    - step:
        id: '185'
        object_path: objSheetNew.cells(1,44).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '186'
        object_path: objSheetNew.cells(1,45)
        action: value
        args: = "Full Load Unity Red Test 1"
    - step:
        id: '187'
        object_path: objSheetNew.cells(1,45).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '188'
        object_path: objSheetNew.cells(1,46)
        action: value
        args: = "Full Load Unity Red Test 2"
    - step:
        id: '189'
        object_path: objSheetNew.cells(1,46).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '190'
        object_path: objSheetNew.cells(1,47)
        action: value
        args: = "Full Load Unity Red Test 3"
    - step:
        id: '191'
        object_path: objSheetNew.cells(1,47).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '192'
        object_path: objSheetNew.cells(1,48)
        action: value
        args: = "Full Load Unity Red Test Total"
    - step:
        id: '193'
        object_path: objSheetNew.cells(1,48).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '194'
        object_path: objSheetNew.cells(1,49)
        action: value
        args: = "Full Load Unity Red Test Average"
    - step:
        id: '195'
        object_path: objSheetNew.cells(1,49).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '196'
        object_path: objSheetNew.cells(1,50)
        action: value
        args: = "Full Load Unity White Test 1"
    - step:
        id: '197'
        object_path: objSheetNew.cells(1,50).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '198'
        object_path: objSheetNew.cells(1,51)
        action: value
        args: = "Full Load Unity White Test 2"
    - step:
        id: '199'
        object_path: objSheetNew.cells(1,51).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '200'
        object_path: objSheetNew.cells(1,52)
        action: value
        args: = "Full Load Unity White Test 3"
    - step:
        id: '201'
        object_path: objSheetNew.cells(1,52).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '202'
        object_path: objSheetNew.cells(1,53)
        action: value
        args: = "Full Load Unity White Test Total"
    - step:
        id: '203'
        object_path: objSheetNew.cells(1,53).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '204'
        object_path: objSheetNew.cells(1,54)
        action: value
        args: = "Full Load Unity White Test Average"
    - step:
        id: '205'
        object_path: objSheetNew.cells(1,54).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '206'
        object_path: objSheetNew.cells(1,55)
        action: value
        args: = "Full Load Unity Blue Test 1"
    - step:
        id: '207'
        object_path: objSheetNew.cells(1,55).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '208'
        object_path: objSheetNew.cells(1,56)
        action: value
        args: = "Full Load Unity Blue Test 2"
    - step:
        id: '209'
        object_path: objSheetNew.cells(1,56).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '210'
        object_path: objSheetNew.cells(1,57)
        action: value
        args: = "Full Load Unity Blue Test 3"
    - step:
        id: '211'
        object_path: objSheetNew.cells(1,57).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '212'
        object_path: objSheetNew.cells(1,58)
        action: value
        args: = "Full Load Unity Blue Test Total"
    - step:
        id: '213'
        object_path: objSheetNew.cells(1,58).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '214'
        object_path: objSheetNew.cells(1,59)
        action: value
        args: = "Full Load Unity Blue Test Average"
    - step:
        id: '215'
        object_path: objSheetNew.cells(1,59).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '216'
        object_path: objSheetNew.cells(1,60)
        action: value
        args: = "Full Load Unity Total"
    - step:
        id: '217'
        object_path: objSheetNew.cells(1,60).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '218'
        object_path: objSheetNew.cells(1,61)
        action: value
        args: = "Full Load Unity Average"
    - step:
        id: '219'
        object_path: objSheetNew.cells(1,61).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '220'
        object_path: objSheetNew.cells(1,62)
        action: value
        args: = "Full Load 0.5 Red Test 1"
    - step:
        id: '221'
        object_path: objSheetNew.cells(1,62).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '222'
        object_path: objSheetNew.cells(1,63)
        action: value
        args: = "Full Load 0.5 Red Test 2"
    - step:
        id: '223'
        object_path: objSheetNew.cells(1,63).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '224'
        object_path: objSheetNew.cells(1,64)
        action: value
        args: = "Full Load 0.5 Red Test 3"
    - step:
        id: '225'
        object_path: objSheetNew.cells(1,64).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '226'
        object_path: objSheetNew.cells(1,65)
        action: value
        args: = "Full Load 0.5 Red Test Total"
    - step:
        id: '227'
        object_path: objSheetNew.cells(1,65).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '228'
        object_path: objSheetNew.cells(1,66)
        action: value
        args: = "Full Load 0.5 Red Test Average"
    - step:
        id: '229'
        object_path: objSheetNew.cells(1,66).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '230'
        object_path: objSheetNew.cells(1,67)
        action: value
        args: = "Full Load 0.5 White Test 1"
    - step:
        id: '231'
        object_path: objSheetNew.cells(1,67).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '232'
        object_path: objSheetNew.cells(1,68)
        action: value
        args: = "Full Load 0.5 White Test 2"
    - step:
        id: '233'
        object_path: objSheetNew.cells(1,68).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '234'
        object_path: objSheetNew.cells(1,69)
        action: value
        args: = "Full Load 0.5 White Test 3"
    - step:
        id: '235'
        object_path: objSheetNew.cells(1,69).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '236'
        object_path: objSheetNew.cells(1,70)
        action: value
        args: = "Full Load 0.5 White Test Total"
    - step:
        id: '237'
        object_path: objSheetNew.cells(1,70).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '238'
        object_path: objSheetNew.cells(1,71)
        action: value
        args: = "Full Load 0.5 White Test Average"
    - step:
        id: '239'
        object_path: objSheetNew.cells(1,71).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '240'
        object_path: objSheetNew.cells(1,72)
        action: value
        args: = "Full Load 0.5 Blue Test 1"
    - step:
        id: '241'
        object_path: objSheetNew.cells(1,72).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '242'
        object_path: objSheetNew.cells(1,73)
        action: value
        args: = "Full Load 0.5 Blue Test 2"
    - step:
        id: '243'
        object_path: objSheetNew.cells(1,73).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '244'
        object_path: objSheetNew.cells(1,74)
        action: value
        args: = "Full Load 0.5 Blue Test 3"
    - step:
        id: '245'
        object_path: objSheetNew.cells(1,74).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '246'
        object_path: objSheetNew.cells(1,75)
        action: value
        args: = "Full Load 0.5 Blue Test Total"
    - step:
        id: '247'
        object_path: objSheetNew.cells(1,75).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '248'
        object_path: objSheetNew.cells(1,76)
        action: value
        args: = "Full Load 0.5 Blue Test Average"
    - step:
        id: '249'
        object_path: objSheetNew.cells(1,76).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '250'
        object_path: objSheetNew.cells(1,77)
        action: value
        args: = "Full Load 0.5 Total"
    - step:
        id: '251'
        object_path: objSheetNew.cells(1,77).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '252'
        object_path: objSheetNew.cells(1,78)
        action: value
        args: = "Full Load 0.5 Average"
    - step:
        id: '253'
        object_path: objSheetNew.cells(1,78).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '254'
        object_path: objSheetNew.cells(1,79)
        action: value
        args: = "Low Load Overall Error"
    - step:
        id: '255'
        object_path: objSheetNew.cells(1,79).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '256'
        object_path: objSheetNew.cells(1,80)
        action: value
        args: = "Full Load Overall Error"
    - step:
        id: '257'
        object_path: objSheetNew.cells(1,80).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '258'
        object_path: objSheetNew.cells(1,81)
        action: value
        args: = "Meter Tampering"
    - step:
        id: '259'
        object_path: objSheetNew.cells(1,81).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '260'
        object_path: objSheetNew.cells(1,82)
        action: value
        args: = "Creep Forward/Reverse"
    - step:
        id: '261'
        object_path: objSheetNew.cells(1,82).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '262'
        object_path: objSheetNew.cells(1,83)
        action: value
        args: = "Registration Check"
    - step:
        id: '263'
        object_path: objSheetNew.cells(1,83).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '264'
        object_path: objSheetNew.cells(1,84)
        action: value
        args: = "Asbestos Panel"
    - step:
        id: '265'
        object_path: objSheetNew.cells(1,84).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '266'
        object_path: objSheetNew.cells(1,85)
        action: value
        args: = "Sticker Attached to Fast Reader"
    - step:
        id: '267'
        object_path: objSheetNew.cells(1,85).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '268'
        object_path: objSheetNew.cells(1,86)
        action: value
        args: = "Pass or Fail"
    - step:
        id: '269'
        object_path: objSheetNew.cells(1,86).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '270'
        object_path: objSheetNew.cells(1,87)
        action: value
        args: = "Tested By"
    - step:
        id: '271'
        object_path: objSheetNew.cells(1,87).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '272'
        object_path: objSheetNew.cells(1,88)
        action: value
        args: = "Comments"
    - step:
        id: '273'
        object_path: objSheetNew.cells(1,88).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '274'
        object_path: objSheetNew.cells(1,89)
        action: value
        args: = "ID"
    - step:
        id: '275'
        object_path: objSheetNew.cells(1,89).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '276'
        object_path: objSheetNew.cells(1,90)
        action: value
        args: = "Attachments"
    - step:
        id: '277'
        object_path: objSheetNew.cells(1,90).interior
        action: ColorIndex
        args: = 15
    - step:
        id: '278'
        action: Script
        object_path: End Function
    - step:
        id: '279'
        action: Script
        object_path: Function updateResults(x,y)
    - step:
        id: '280'
        action: Script
        object_path: '''EXTRACT FROM EXCEL'
    - step:
        id: '281'
        action: Script
        object_path: typeOfTest = objSheet.cells(x,1).value
    - step:
        id: '282'
        action: Script
        object_path: testSetType = objSheet.cells(x,2).value
    - step:
        id: '283'
        action: Script
        object_path: mteTestSet = objSheet.cells(x,3).value
    - step:
        id: '284'
        action: Script
        object_path: redTestSet = objSheet.cells(x,4).value
    - step:
        id: '285'
        action: Script
        object_path: stockItem = objSheet.cells(x,5).value
    - step:
        id: '286'
        action: Script
        object_path: meterNum = objSheet.cells(x,6).value
    - step:
        id: '287'
        action: Script
        object_path: program = objSheet.cells(x,7).value
    - step:
        id: '288'
        action: Script
        object_path: operatorsName = objSheet.cells(x,8).value
    - step:
        id: '289'
        action: Script
        object_path: suburb = objSheet.cells(x,9).value
    - step:
        id: '290'
        action: Script
        object_path: streetName = objSheet.cells(x,10).value
    - step:
        id: '291'
        action: Script
        object_path: streetNumber = objSheet.cells(x,11).value
    - step:
        id: '292'
        action: Script
        object_path: unitNumber = objSheet.cells(x,12).value
    - step:
        id: '293'
        action: Script
        object_path: sampleLotNumber = objSheet.cells(x,13).value
    - step:
        id: '294'
        action: Script
        object_path: nmiNo = objSheet.cells(x,14).value
    - step:
        id: '295'
        action: Script
        object_path: noti = objSheet.cells(x,15).value
    - step:
        id: '296'
        action: Script
        object_path: rpk = objSheet.cells(x,16).value
    - step:
        id: '297'
        action: Script
        object_path: currentRating = objSheet.cells(x,17).value
    - step:
        id: '298'
        action: Script
        object_path: dateofTest = objSheet.cells(x,18).value
    - step:
        id: '299'
        action: Script
        object_path: ambientTemp = objSheet.cells(x,19).value
    - step:
        id: '300'
        action: Script
        object_path: calibrationDate = objSheet.cells(x,20).value
    - step:
        id: '301'
        action: Script
        object_path: highReading = objSheet.cells(x,21).value
    - step:
        id: '302'
        action: Script
        object_path: lowReading = objSheet.cells(x,22).value
    - step:
        id: '303'
        action: Script
        object_path: export = objSheet.cells(x,23).value
    - step:
        id: '304'
        action: Script
        object_path: opcl = objSheet.cells(x,24).value
    - step:
        id: '305'
        action: Script
        object_path: neutralPhase = objSheet.cells(x,25).value
    - step:
        id: '306'
        action: Script
        object_path: redPhase = objSheet.cells(x,26).value
    - step:
        id: '307'
        action: Script
        object_path: whitePhase = objSheet.cells(x,27).value
    - step:
        id: '308'
        action: Script
        object_path: bluePhase = objSheet.cells(x,28).value
    - step:
        id: '309'
        action: Script
        object_path: lowLoadPFred1 = objSheet.cells(x,29).value
    - step:
        id: '310'
        action: Script
        object_path: lowLoadPFred2 = objSheet.cells(x,30).value
    - step:
        id: '311'
        action: Script
        object_path: lowLoadPFred3 = objSheet.cells(x,31).value
    - step:
        id: '312'
        action: Script
        object_path: lowLoadPFredSum = objSheet.cells(x,32).value
    - step:
        id: '313'
        action: Script
        object_path: lowLoadPFredAverage = objSheet.cells(x,33).value
    - step:
        id: '314'
        action: Script
        object_path: lowLoadPFwhite1 = objSheet.cells(x,34).value
    - step:
        id: '315'
        action: Script
        object_path: lowLoadPFwhite2 = objSheet.cells(x,35).value
    - step:
        id: '316'
        action: Script
        object_path: lowLoadPFwhite3 = objSheet.cells(x,36).value
    - step:
        id: '317'
        action: Script
        object_path: lowLoadPFwhiteSum = objSheet.cells(x,37).value
    - step:
        id: '318'
        action: Script
        object_path: lowLoadPFwhiteAverage = objSheet.cells(x,38).value
    - step:
        id: '319'
        action: Script
        object_path: lowLoadPFblue1 = objSheet.cells(x,39).value
    - step:
        id: '320'
        action: Script
        object_path: lowLoadPFblue2 = objSheet.cells(x,40).value
    - step:
        id: '321'
        action: Script
        object_path: lowLoadPFblue3 = objSheet.cells(x,41).value
    - step:
        id: '322'
        action: Script
        object_path: lowLoadPFblueSum = objSheet.cells(x,42).value
    - step:
        id: '323'
        action: Script
        object_path: lowLoadPFblueAverage = objSheet.cells(x,43).value
    - step:
        id: '324'
        action: Script
        object_path: lowLoadPFSum = objSheet.cells(x,44).value
    - step:
        id: '325'
        action: Script
        object_path: lowLoadPFAverage = objSheet.cells(x,45).value
    - step:
        id: '326'
        action: Script
        object_path: fullLoadPFred1 = objSheet.cells(x,46).value
    - step:
        id: '327'
        action: Script
        object_path: fullLoadPFred2 = objSheet.cells(x,47).value
    - step:
        id: '328'
        action: Script
        object_path: fullLoadPFred3 = objSheet.cells(x,48).value
    - step:
        id: '329'
        action: Script
        object_path: fullLoadPFredSum = objSheet.cells(x,49).value
    - step:
        id: '330'
        action: Script
        object_path: fullLoadPFredAverage = objSheet.cells(x,50).value
    - step:
        id: '331'
        action: Script
        object_path: fullLoadPFwhite1 = objSheet.cells(x,51).value
    - step:
        id: '332'
        action: Script
        object_path: fullLoadPFwhite2 = objSheet.cells(x,52).value
    - step:
        id: '333'
        action: Script
        object_path: fullLoadPFwhite3 = objSheet.cells(x,53).value
    - step:
        id: '334'
        action: Script
        object_path: fullLoadPFwhiteSum = objSheet.cells(x,54).value
    - step:
        id: '335'
        action: Script
        object_path: fullLoadPFwhiteAverage = objSheet.cells(x,55).value
    - step:
        id: '336'
        action: Script
        object_path: fullLoadPFblue1 = objSheet.cells(x,56).value
    - step:
        id: '337'
        action: Script
        object_path: fullLoadPFblue2 = objSheet.cells(x,57).value
    - step:
        id: '338'
        action: Script
        object_path: fullLoadPFblue3 = objSheet.cells(x,58).value
    - step:
        id: '339'
        action: Script
        object_path: fullLoadPFblueSum = objSheet.cells(x,59).value
    - step:
        id: '340'
        action: Script
        object_path: fullLoadPFblueAverage = objSheet.cells(x,60).value
    - step:
        id: '341'
        action: Script
        object_path: fullLoadPFSum = objSheet.cells(x,61).value
    - step:
        id: '342'
        action: Script
        object_path: fullLoadPFAverage = objSheet.cells(x,62).value
    - step:
        id: '343'
        action: Script
        object_path: fullLoad05red1 = objSheet.cells(x,63).value
    - step:
        id: '344'
        action: Script
        object_path: fullLoad05red2 = objSheet.cells(x,64).value
    - step:
        id: '345'
        action: Script
        object_path: fullLoad05red3 = objSheet.cells(x,65).value
    - step:
        id: '346'
        action: Script
        object_path: fullLoad05redSum = objSheet.cells(x,66).value
    - step:
        id: '347'
        action: Script
        object_path: fullLoad05redAverage = objSheet.cells(x,67).value
    - step:
        id: '348'
        action: Script
        object_path: fullLoad05white1 = objSheet.cells(x,68).value
    - step:
        id: '349'
        action: Script
        object_path: fullLoad05white2 = objSheet.cells(x,69).value
    - step:
        id: '350'
        action: Script
        object_path: fullLoad05white3 = objSheet.cells(x,70).value
    - step:
        id: '351'
        action: Script
        object_path: fullLoad05whiteSum = objSheet.cells(x,71).value
    - step:
        id: '352'
        action: Script
        object_path: fullLoad05whiteAverage = objSheet.cells(x,72).value
    - step:
        id: '353'
        action: Script
        object_path: fullLoad05blue1 = objSheet.cells(x,73).value
    - step:
        id: '354'
        action: Script
        object_path: fullLoad05blue2 = objSheet.cells(x,74).value
    - step:
        id: '355'
        action: Script
        object_path: fullLoad05blue3 = objSheet.cells(x,75).value
    - step:
        id: '356'
        action: Script
        object_path: fullLoad05blueSum = objSheet.cells(x,76).value
    - step:
        id: '357'
        action: Script
        object_path: fullLoad05blueAverage = objSheet.cells(x,77).value
    - step:
        id: '358'
        action: Script
        object_path: fullLoad05Sum = objSheet.cells(x,78).value
    - step:
        id: '359'
        action: Script
        object_path: fullLoad05Average = objSheet.cells(x,79).value
    - step:
        id: '360'
        action: Script
        object_path: overallFullLoad = objSheet.cells(x,80).value
    - step:
        id: '361'
        action: Script
        object_path: overallLowLoad = objSheet.cells(x,81).value
    - step:
        id: '362'
        action: Script
        object_path: meterTamp = objSheet.cells(x,82).value
    - step:
        id: '363'
        action: Script
        object_path: creep = objSheet.cells(x,83).value
    - step:
        id: '364'
        action: Script
        object_path: registration = objSheet.cells(x,84).value
    - step:
        id: '365'
        action: Script
        object_path: asbestos = objSheet.cells(x,85).value
    - step:
        id: '366'
        action: Script
        object_path: sticker = objSheet.cells(x,86).value
    - step:
        id: '367'
        action: Script
        object_path: passFail = objSheet.cells(x,87).value
    - step:
        id: '368'
        action: Script
        object_path: testedBy = objSheet.cells(x,88).value
    - step:
        id: '369'
        action: Script
        object_path: comments = objSheet.cells(x,89).value
    - step:
        id: '370'
        action: Script
        object_path: attachmentsUploaded =  objSheet.cells(x,90).value
    - step:
        id: '371'
        action: Script
        object_path: id = objSheet.cells(x,91).value
    - step:
        id: '372'
        action: Script
        object_path: '''EXTRACT ATTACHMENTS'
    - step:
        id: '373'
        action: Script
        object_path: If attachmentsUploaded <> "" Then
    - step:
        id: '374'
        action: Script
        object_path: attachments = getAttachments(id)
    - step:
        id: '375'
        action: Script
        object_path: If attachments <> "" Then
    - step:
        id: '376'
        action: Script
        object_path: attachments = "ID "&id&" "&attachments
    - step:
        id: '377'
        action: Script
        object_path: attachments = Replace(attachments, ", ", ", ID "&id&" ")
    - step:
        id: '378'
        object_path: objSheet.cells(1,94)
        action: value
        args: = "Attachments"
    - step:
        id: '379'
        object_path: objSheet.cells(x,94)
        action: value
        args: = attachments
    - step:
        id: '380'
        action: Script
        object_path: Else
    - step:
        id: '381'
        object_path: objSheet.cells(x,94)
        action: value
        args: = ""
    - step:
        id: '382'
        action: Script
        object_path: End If
    - step:
        id: '383'
        action: Script
        object_path: Else
    - step:
        id: '384'
        object_path: objSheet.cells(x,94)
        action: value
        args: = ""
    - step:
        id: '385'
        action: Script
        object_path: End If
    - step:
        id: '386'
        action: Script
        object_path: '''ADD TO SAMPLE LOT'
    - step:
        id: '387'
        object_path: objSheetNew.cells(y,1)
        action: value
        args: = typeOfTest
    - step:
        id: '388'
        object_path: objSheetNew.cells(y,2)
        action: value
        args: = testSetType
    - step:
        id: '389'
        action: Script
        object_path: If mteTestSet <> "" Then
    - step:
        id: '390'
        object_path: objSheetNew.cells(y,3)
        action: value
        args: = mteTestSet
    - step:
        id: '391'
        action: Script
        object_path: ElseIf redTestSet <> "" Then
    - step:
        id: '392'
        object_path: objSheetNew.cells(y,3)
        action: value
        args: = redTestSet
    - step:
        id: '393'
        action: Script
        object_path: End If
    - step:
        id: '394'
        object_path: objSheetNew.cells(y,4)
        action: value
        args: = stockItem
    - step:
        id: '395'
        object_path: objSheetNew.cells(y,5)
        action: value
        args: = meterNum
    - step:
        id: '396'
        object_path: objSheetNew.cells(y,6)
        action: value
        args: = program
    - step:
        id: '397'
        object_path: objSheetNew.cells(y,7)
        action: value
        args: = operatorsName
    - step:
        id: '398'
        object_path: objSheetNew.cells(y,8)
        action: value
        args: = suburb
    - step:
        id: '399'
        object_path: objSheetNew.cells(y,9)
        action: value
        args: = streetName
    - step:
        id: '400'
        object_path: objSheetNew.cells(y,10)
        action: value
        args: = streetNumber
    - step:
        id: '401'
        object_path: objSheetNew.cells(y,11)
        action: value
        args: = unitNumber
    - step:
        id: '402'
        object_path: objSheetNew.cells(y,12)
        action: value
        args: = sampleLotNumber
    - step:
        id: '403'
        object_path: objSheetNew.cells(y,13)
        action: value
        args: = nmiNo
    - step:
        id: '404'
        object_path: objSheetNew.cells(y,14)
        action: value
        args: = noti
    - step:
        id: '405'
        object_path: objSheetNew.cells(y,15)
        action: value
        args: = rpk
    - step:
        id: '406'
        object_path: objSheetNew.cells(y,16)
        action: Numberformat
        args: = "@"
    - step:
        id: '407'
        object_path: objSheetNew.cells(y,16)
        action: value
        args: = currentRating
    - step:
        id: '408'
        object_path: objSheetNew.cells(y,17)
        action: value
        args: = dateofTest
    - step:
        id: '409'
        object_path: objSheetNew.cells(y,18)
        action: value
        args: = ambientTemp
    - step:
        id: '410'
        object_path: objSheetNew.cells(y,19)
        action: value
        args: = calibrationDate
    - step:
        id: '411'
        object_path: objSheetNew.cells(y,20)
        action: value
        args: = highReading
    - step:
        id: '412'
        object_path: objSheetNew.cells(y,21)
        action: value
        args: = lowReading
    - step:
        id: '413'
        object_path: objSheetNew.cells(y,22)
        action: value
        args: = export
    - step:
        id: '414'
        object_path: objSheetNew.cells(y,23)
        action: value
        args: = opcl
    - step:
        id: '415'
        object_path: objSheetNew.cells(y,24)
        action: value
        args: = neutralPhase
    - step:
        id: '416'
        object_path: objSheetNew.cells(y,25)
        action: value
        args: = redPhase
    - step:
        id: '417'
        object_path: objSheetNew.cells(y,26)
        action: value
        args: = whitePhase
    - step:
        id: '418'
        object_path: objSheetNew.cells(y,27)
        action: value
        args: = bluePhase
    - step:
        id: '419'
        object_path: objSheetNew.cells(y,28)
        action: value
        args: = lowLoadPFred1
    - step:
        id: '420'
        object_path: objSheetNew.cells(y,29)
        action: value
        args: = lowLoadPFred2
    - step:
        id: '421'
        object_path: objSheetNew.cells(y,30)
        action: value
        args: = lowLoadPFred3
    - step:
        id: '422'
        object_path: objSheetNew.cells(y,31)
        action: value
        args: = lowLoadPFredSum
    - step:
        id: '423'
        object_path: objSheetNew.cells(y,32)
        action: value
        args: = lowLoadPFredAverage
    - step:
        id: '424'
        object_path: objSheetNew.cells(y,33)
        action: value
        args: = lowLoadPFwhite1
    - step:
        id: '425'
        object_path: objSheetNew.cells(y,34)
        action: value
        args: = lowLoadPFwhite2
    - step:
        id: '426'
        object_path: objSheetNew.cells(y,35)
        action: value
        args: = lowLoadPFwhite3
    - step:
        id: '427'
        object_path: objSheetNew.cells(y,36)
        action: value
        args: = lowLoadPFwhiteSum
    - step:
        id: '428'
        object_path: objSheetNew.cells(y,37)
        action: value
        args: = lowLoadPFwhiteAverage
    - step:
        id: '429'
        object_path: objSheetNew.cells(y,38)
        action: value
        args: = lowLoadPFblue1
    - step:
        id: '430'
        object_path: objSheetNew.cells(y,39)
        action: value
        args: = lowLoadPFblue2
    - step:
        id: '431'
        object_path: objSheetNew.cells(y,40)
        action: value
        args: = lowLoadPFblue3
    - step:
        id: '432'
        object_path: objSheetNew.cells(y,41)
        action: value
        args: = lowLoadPFblueSum
    - step:
        id: '433'
        object_path: objSheetNew.cells(y,42)
        action: value
        args: = lowLoadPFblueAverage
    - step:
        id: '434'
        object_path: objSheetNew.cells(y,43)
        action: value
        args: = lowLoadPFSum
    - step:
        id: '435'
        object_path: objSheetNew.cells(y,44)
        action: value
        args: = lowLoadPFAverage
    - step:
        id: '436'
        object_path: objSheetNew.cells(y,45)
        action: value
        args: = fullLoadPFred1
    - step:
        id: '437'
        object_path: objSheetNew.cells(y,46)
        action: value
        args: = fullLoadPFred2
    - step:
        id: '438'
        object_path: objSheetNew.cells(y,47)
        action: value
        args: = fullLoadPFred3
    - step:
        id: '439'
        object_path: objSheetNew.cells(y,48)
        action: value
        args: = fullLoadPFredSum
    - step:
        id: '440'
        object_path: objSheetNew.cells(y,49)
        action: value
        args: = fullLoadPFredAverage
    - step:
        id: '441'
        object_path: objSheetNew.cells(y,50)
        action: value
        args: = fullLoadPFwhite1
    - step:
        id: '442'
        object_path: objSheetNew.cells(y,51)
        action: value
        args: = fullLoadPFwhite2
    - step:
        id: '443'
        object_path: objSheetNew.cells(y,52)
        action: value
        args: = fullLoadPFwhite3
    - step:
        id: '444'
        object_path: objSheetNew.cells(y,53)
        action: value
        args: = fullLoadPFwhiteSum
    - step:
        id: '445'
        object_path: objSheetNew.cells(y,54)
        action: value
        args: = fullLoadPFwhiteAverage
    - step:
        id: '446'
        object_path: objSheetNew.cells(y,55)
        action: value
        args: = fullLoadPFblue1
    - step:
        id: '447'
        object_path: objSheetNew.cells(y,56)
        action: value
        args: = fullLoadPFblue2
    - step:
        id: '448'
        object_path: objSheetNew.cells(y,57)
        action: value
        args: = fullLoadPFblue3
    - step:
        id: '449'
        object_path: objSheetNew.cells(y,58)
        action: value
        args: = fullLoadPFblueSum
    - step:
        id: '450'
        object_path: objSheetNew.cells(y,59)
        action: value
        args: = fullLoadPFblueAverage
    - step:
        id: '451'
        object_path: objSheetNew.cells(y,60)
        action: value
        args: = fullLoadPFSum
    - step:
        id: '452'
        object_path: objSheetNew.cells(y,61)
        action: value
        args: = fullLoadPFAverage
    - step:
        id: '453'
        object_path: objSheetNew.cells(y,62)
        action: value
        args: = fullLoad05red1
    - step:
        id: '454'
        object_path: objSheetNew.cells(y,63)
        action: value
        args: = fullLoad05red2
    - step:
        id: '455'
        object_path: objSheetNew.cells(y,64)
        action: value
        args: = fullLoad05red3
    - step:
        id: '456'
        object_path: objSheetNew.cells(y,65)
        action: value
        args: = fullLoad05redSum
    - step:
        id: '457'
        object_path: objSheetNew.cells(y,66)
        action: value
        args: = fullLoad05redAverage
    - step:
        id: '458'
        object_path: objSheetNew.cells(y,67)
        action: value
        args: = fullLoad05white1
    - step:
        id: '459'
        object_path: objSheetNew.cells(y,68)
        action: value
        args: = fullLoad05white2
    - step:
        id: '460'
        object_path: objSheetNew.cells(y,69)
        action: value
        args: = fullLoad05white3
    - step:
        id: '461'
        object_path: objSheetNew.cells(y,70)
        action: value
        args: = fullLoad05whiteSum
    - step:
        id: '462'
        object_path: objSheetNew.cells(y,71)
        action: value
        args: = fullLoad05whiteAverage
    - step:
        id: '463'
        object_path: objSheetNew.cells(y,72)
        action: value
        args: = fullLoad05blue1
    - step:
        id: '464'
        object_path: objSheetNew.cells(y,73)
        action: value
        args: = fullLoad05blue2
    - step:
        id: '465'
        object_path: objSheetNew.cells(y,74)
        action: value
        args: = fullLoad05blue3
    - step:
        id: '466'
        object_path: objSheetNew.cells(y,75)
        action: value
        args: = fullLoad05blueSum
    - step:
        id: '467'
        object_path: objSheetNew.cells(y,76)
        action: value
        args: = fullLoad05blueAverage
    - step:
        id: '468'
        object_path: objSheetNew.cells(y,77)
        action: value
        args: = fullLoad05Sum
    - step:
        id: '469'
        object_path: objSheetNew.cells(y,78)
        action: value
        args: = fullLoad05Average
    - step:
        id: '470'
        action: Script
        object_path: overallLowLoad = overallLowLoad * 100
    - step:
        id: '471'
        object_path: objSheetNew.cells(y,79)
        action: value
        args: = overallLowLoad
    - step:
        id: '472'
        action: Script
        object_path: overallFullLoad = overallFullLoad * 100
    - step:
        id: '473'
        object_path: objSheetNew.cells(y,80)
        action: value
        args: = overallFullLoad
    - step:
        id: '474'
        object_path: objSheetNew.cells(y,81)
        action: value
        args: = meterTamp
    - step:
        id: '475'
        object_path: objSheetNew.cells(y,82)
        action: value
        args: = creep
    - step:
        id: '476'
        object_path: objSheetNew.cells(y,83)
        action: value
        args: = registration
    - step:
        id: '477'
        object_path: objSheetNew.cells(y,84)
        action: value
        args: = asbestos
    - step:
        id: '478'
        object_path: objSheetNew.cells(y,85)
        action: value
        args: = sticker
    - step:
        id: '479'
        object_path: objSheetNew.cells(y,86)
        action: value
        args: = passFail
    - step:
        id: '480'
        object_path: objSheetNew.cells(y,87)
        action: value
        args: = testedBy
    - step:
        id: '481'
        object_path: objSheetNew.cells(y,88)
        action: value
        args: = comments
    - step:
        id: '482'
        object_path: objSheetNew.cells(y,89)
        action: value
        args: = id
    - step:
        id: '483'
        action: Script
        object_path: If attachments <> "" Then
    - step:
        id: '484'
        object_path: objSheetNew.cells(y,90)
        action: value
        args: = attachments
    - step:
        id: '485'
        action: Script
        object_path: Else
    - step:
        id: '486'
        object_path: objSheetNew.cells(y,90)
        action: value
        args: = ""
    - step:
        id: '487'
        action: Script
        object_path: End If
    - step:
        id: '488'
        action: Script
        object_path: End Function
    - step:
        id: '489'
        action: Script
        object_path: Function getAttachments(id)
    - step:
        id: '490'
        action: Script
        object_path: attachmentURL = "https://sapowernetworks.sharepoint.com/sites/EnervenMeterTestingSite/Lists/Enerven%20Meter%20Testing%20Type%206/DispForm.aspx?ID="&id
    - step:
        id: '491'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&attachmentURL'
    - step:
        id: '492'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '493'
        action: Script
        object_path: attachments = Browser("Enerven Meter Testing").Page("Enerven
          Meter Testing").WebButton("Attachments").GetROProperty("acc_name")
    - step:
        id: '494'
        action: Script
        object_path: attachments = Replace(attachments,"Attachments, ","")
    - step:
        id: '495'
        action: Script
        object_path: attachments = Replace(attachments,", press enter to edit.","")
    - step:
        id: '496'
        action: Script
        object_path: att = Split(attachments,",")
    - step:
        id: '497'
        action: Script
        object_path: For each attachment1 in att
    - step:
        id: '498'
        action: Script
        object_path: attachment = Replace(attachment1,".","\.")
    - step:
        id: '499'
        action: Script
        object_path: attachment = Trim(attachment)
    - step:
        id: '500'
        action: Script
        object_path: attachment = Replace(attachment,"(","\(")
    - step:
        id: '501'
        action: Script
        object_path: attachment = Replace(attachment,")","\)")
    - step:
        id: '502'
        action: Script
        object_path: attachURL = Browser("Enerven Meter Testing").Page("Enerven Meter
          Testing").Link("innertext:="&attachment).GetROProperty("href")
    - step:
        id: '503'
        action: Script
        object_path: attachURL = Replace(attachURL," ","%20")
    - step:
        id: '504'
        action: Script
        object_path: attachURL = Replace(attachURL,"?web=1","")
    - step:
        id: '505'
        action: Script
        object_path: downloadURL = "https://sapowernetworks.sharepoint.com/sites/EnervenMeterTestingSite/_layouts/download.aspx?SourceURL="&attachURL
    - step:
        id: '506'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&downloadURL'
    - step:
        id: '507'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '508'
        action: Script
        object_path: attachment1 = trim(attachment1)
    - step:
        id: '509'
        object_path: SystemUtil
        action: CloseProcessByName("i_view64.exe")
    - step:
        id: '510'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '511'
        action: Script
        object_path: newFolderPath = filelocation&"Sample "&sampleLot&" Attachments"
    - step:
        id: '512'
        action: Script
        object_path: If Not fso.FolderExists(newFolderPath) Then
    - step:
        id: '513'
        action: Script
        object_path: Set newfolder = fso.CreateFolder(newFolderPath)
    - step:
        id: '514'
        action: Script
        object_path: End If
    - step:
        id: '515'
        action: Script
        object_path: If fso.FileExists(newFolderPath&"\ID "&id&" "&attachment1)Then
    - step:
        id: '516'
        object_path: fso
        action: DeleteFile(newFolderPath&"\ID
        args: '"&id&" "&attachment1)'
    - step:
        id: '517'
        action: Script
        object_path: End If
    - step:
        id: '518'
        object_path: fso
        action: MoveFile
        args: '"C:\Automation Downloads\"&attachment1, newFolderPath&"\ID "&id&" "&attachment1'
    - step:
        id: '519'
        action: Script
        object_path: Set newfolder = Nothing
    - step:
        id: '520'
        action: Script
        object_path: Next
    - step:
        id: '521'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '522'
        object_path: SystemUtil
        action: CloseProcessByName
        args: '"msedge.exe"'
    - step:
        id: '523'
        action: Script
        object_path: getAttachments = attachments
    - step:
        id: '524'
        action: Script
        object_path: End Function
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
      last_update_time: Friday, 26 August 2022 10:06:09 AM
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
          last_update_time: Friday, 26 August 2022 10:06:09 AM
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
              last_update_time: Friday, 26 August 2022 10:06:09 AM
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
              last_update_time: Friday, 26 August 2022 10:06:09 AM
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
              last_update_time: Friday, 26 August 2022 10:06:09 AM
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
      last_update_time: Friday, 26 August 2022 10:06:09 AM
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
          last_update_time: Friday, 26 August 2022 10:06:09 AM
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
              last_update_time: Friday, 26 August 2022 10:06:09 AM
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
              last_update_time: Friday, 26 August 2022 10:06:09 AM
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
              last_update_time: Friday, 26 August 2022 10:06:09 AM
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
      last_update_time: Friday, 26 August 2022 10:06:09 AM
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
          last_update_time: Friday, 26 August 2022 10:06:09 AM
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
              last_update_time: Friday, 26 August 2022 10:06:09 AM
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
              last_update_time: Friday, 26 August 2022 10:06:09 AM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
