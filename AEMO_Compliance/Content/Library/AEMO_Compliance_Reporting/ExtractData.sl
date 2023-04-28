namespace: AEMO_Compliance_Reporting
operation:
  name: ExtractData
  inputs:
  - fileNameString
  - weeknumber
  - rptRole
  - prevWeekrptdate
  - TodaydayofWeek
  - location
  sequential_action:
    gav: com.microfocus.seq:AEMO_Compliance_Reporting.ExtractData:1.0.0
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
        object_path: '''Get folder locations'
    - step:
        id: '2'
        action: Script
        object_path: location = Parameter("location")
    - step:
        id: '3'
        action: Script
        object_path: fileNameString = parameter("fileNameString")
    - step:
        id: '4'
        action: Script
        object_path: xmlFolder = location&"XML Files\"
    - step:
        id: '5'
        action: Script
        object_path: excelFolder = location&"Excel Files\"
    - step:
        id: '6'
        action: Script
        object_path: '''clean up xlsx'
    - step:
        id: '7'
        action: Script
        object_path: Set oFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '8'
        action: Script
        object_path: Set xlsfolder = oFSO.GetFolder(excelFolder)
    - step:
        id: '9'
        action: Script
        object_path: If xlsfolder.Files.Count <> 0 Then
    - step:
        id: '10'
        object_path: oFSO
        action: DeleteFile(excelFolder&"*"),
        args: DeleteReadOnly
    - step:
        id: '11'
        action: Script
        object_path: End If
    - step:
        id: '12'
        action: Script
        object_path: Set xlsfolder = nothing
    - step:
        id: '13'
        action: Script
        object_path: Set oFSO = nothing
    - step:
        id: '14'
        action: Script
        object_path: rptRole = Parameter("rptRole")
    - step:
        id: '15'
        action: Script
        object_path: weekNumber = Parameter("weeknumber")
    - step:
        id: '16'
        action: Script
        object_path: prevWeekrptdate = Parameter("prevWeekrptdate")
    - step:
        id: '17'
        action: Script
        object_path: TodaydayofWeek = Parameter("TodaydayofWeek")
    - step:
        id: '18'
        action: Script
        object_path: prevWeekNum = Cint(weekNumber) - 1
    - step:
        id: '19'
        action: Script
        object_path: If Len(prevWeekNum) = 1 Then
    - step:
        id: '20'
        action: Script
        object_path: prevWeekNum = "0" & prevWeekNum
    - step:
        id: '21'
        action: Script
        object_path: End If
    - step:
        id: '22'
        action: Script
        object_path: fileNameString = rptRole &"-"&Replace(fileNameString, "WIP",
          "")&"-Week "&weekNumber
    - step:
        id: '23'
        action: Script
        object_path: prevWeekRptName = rptRole  & "-" & prevWeekrptdate&"-Week "&
          prevWeekNum & ".xlsx"
    - step:
        id: '24'
        action: Script
        object_path: Parameter("prevWeekRptName") = prevWeekRptName
    - step:
        id: '25'
        action: Script
        object_path: rptData = Empty
    - step:
        id: '26'
        action: Script
        object_path: rptSummary = Empty
    - step:
        id: '27'
        action: Script
        object_path: Set oFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '28'
        action: Script
        object_path: '''Get report names'
    - step:
        id: '29'
        action: Script
        object_path: filecounter = 0
    - step:
        id: '30'
        action: Script
        object_path: rptData = Empty
    - step:
        id: '31'
        action: Script
        object_path: For Each oFile In oFSO.GetFolder(xmlFolder).Files
    - step:
        id: '32'
        action: Script
        object_path: fileName = oFile.Name
    - step:
        id: '33'
        action: Script
        object_path: fileName = Replace(fileName, ".xml", "")
    - step:
        id: '34'
        action: Script
        object_path: '''Open xml and gate data from "CSVdata" node'
    - step:
        id: '35'
        action: Script
        object_path: Set objXMLDoc = CreateObject("Microsoft.XMLDOM")
    - step:
        id: '36'
        object_path: objXMLDoc
        action: async
        args: = False
    - step:
        id: '37'
        object_path: objXMLDoc.load(oFile
        action: Path)
    - step:
        id: '38'
        action: Script
        object_path: Set Root = objXMLDoc.documentElement
    - step:
        id: '39'
        action: Script
        object_path: Set NodeList = objXMLDoc.SelectNodes("/ase:aseXML/Transactions/Transaction/ReportResponse/ReportResults")
    - step:
        id: '40'
        action: Script
        object_path: Set dataExistsNode = objXMLDoc.SelectNodes("/ase:aseXML/Transactions/Transaction/ReportResponse/Event/Explanation")
    - step:
        id: '41'
        action: Script
        object_path: Iterator = 0
    - step:
        id: '42'
        action: Script
        object_path: For Each dExists in dataExistsNode
    - step:
        id: '43'
        action: Script
        object_path: dataExistsCheck = dExists.Text
    - step:
        id: '44'
        action: Script
        object_path: Next
    - step:
        id: '45'
        action: Script
        object_path: For Each objNode In NodeList
    - step:
        id: '46'
        action: Script
        object_path: csvdata =  objNode.Text
    - step:
        id: '47'
        action: Script
        object_path: Iterator = Iterator + 1
    - step:
        id: '48'
        action: Script
        object_path: If Iterator = 1 Then
    - step:
        id: '49'
        action: Script
        object_path: If filecounter > 0 Then
    - step:
        id: '50'
        action: Script
        object_path: csvdata =  Replace(csvdata, "QueryId,Count,QueryCount"&vblf,
          "")
    - step:
        id: '51'
        action: Script
        object_path: rptSummary = rptSummary & vblf & csvdata
    - step:
        id: '52'
        action: Script
        object_path: Else
    - step:
        id: '53'
        action: Script
        object_path: rptSummary = csvdata
    - step:
        id: '54'
        action: Script
        object_path: End If
    - step:
        id: '55'
        action: Script
        object_path: If (dataExistsCheck = "No data found.") and (rptData = Empty)
          Then
    - step:
        id: '56'
        action: Script
        object_path: rptData = Empty
    - step:
        id: '57'
        action: Script
        object_path: End If
    - step:
        id: '58'
        action: Script
        object_path: ElseIf Iterator = 2 Then
    - step:
        id: '59'
        action: Script
        object_path: If dataExistsCheck <> "No data found." Then
    - step:
        id: '60'
        action: Script
        object_path: If filecounter > 0 Then
    - step:
        id: '61'
        action: Script
        object_path: If (rptData <> Empty) or (rptData <> "") Then
    - step:
        id: '62'
        action: Script
        object_path: rptData = rptData &  vblf & csvdata
    - step:
        id: '63'
        action: Script
        object_path: Else
    - step:
        id: '64'
        action: Script
        object_path: rptData = csvdata
    - step:
        id: '65'
        action: Script
        object_path: End If
    - step:
        id: '66'
        action: Script
        object_path: Else
    - step:
        id: '67'
        action: Script
        object_path: rptData = csvdata
    - step:
        id: '68'
        action: Script
        object_path: End If
    - step:
        id: '69'
        action: Script
        object_path: Else
    - step:
        id: '70'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '71'
        action: Script
        object_path: End If
    - step:
        id: '72'
        action: Script
        object_path: End If
    - step:
        id: '73'
        action: Script
        object_path: Next
    - step:
        id: '74'
        action: Script
        object_path: filecounter = filecounter + 1
    - step:
        id: '75'
        action: Script
        object_path: Set Root = Nothing
    - step:
        id: '76'
        action: Script
        object_path: Set NodeList = Nothing
    - step:
        id: '77'
        action: Script
        object_path: Next
    - step:
        id: '78'
        action: Script
        object_path: '''If all of the XML files are emply then making rptData = "No
          data found."'
    - step:
        id: '79'
        action: Script
        object_path: If (rptData = Empty) or (rptData = "") Then
    - step:
        id: '80'
        action: Script
        object_path: rptData = "No data found."
    - step:
        id: '81'
        action: Script
        object_path: End If
    - step:
        id: '82'
        action: Script
        object_path: '''Write the captured summary info to CSV file'
    - step:
        id: '83'
        action: Script
        object_path: csvSummaryFile = excelFolder&fileNameString&"_Summary.csv"
    - step:
        id: '84'
        action: Script
        object_path: csvDataFile = excelFolder&fileNameString&"_Data.csv"
    - step:
        id: '85'
        action: Script
        object_path: Set objFileToWritesmry = oFSO.OpenTextFile(csvSummaryFile,2,true)
    - step:
        id: '86'
        object_path: objFileToWritesmry
        action: WriteLine(rptSummary)
    - step:
        id: '87'
        object_path: objFileToWritesmry
        action: Close
    - step:
        id: '88'
        action: Script
        object_path: '''Write the captured Data info to CSV file'
    - step:
        id: '89'
        action: Script
        object_path: Set objFileToWriteData = oFSO.OpenTextFile(csvDataFile,2,true)
    - step:
        id: '90'
        object_path: objFileToWriteData
        action: WriteLine(rptData)
    - step:
        id: '91'
        object_path: objFileToWriteData
        action: Close
    - step:
        id: '92'
        action: Script
        object_path: '''convert csv to excel'
    - step:
        id: '93'
        action: Script
        object_path: xlsSummaryFile = excelFolder&fileNameString&"_Summary.xls"
    - step:
        id: '94'
        action: Script
        object_path: xlsDataFile = excelFolder&fileNameString&"_Data.xls"
    - step:
        id: '95'
        action: Script
        object_path: xlsDataWIPFile = excelFolder&fileNameString&".xlsx"
    - step:
        id: '96'
        action: Script
        object_path: Set appExcel = CreateObject("Excel.Application")
    - step:
        id: '97'
        action: Script
        object_path: '''Summary info'
    - step:
        id: '98'
        object_path: appExcel.Workbooks
        action: Open(csvSummaryFile)
    - step:
        id: '99'
        object_path: appExcel.ActiveWorkbook
        comment: ' 43 is the code for xls format'
        action: SaveAs
        args: xlsSummaryFile, 56
    - step:
        id: '100'
        object_path: appExcel.Workbooks
        action: Close
    - step:
        id: '101'
        action: Script
        object_path: '''Data info'
    - step:
        id: '102'
        object_path: appExcel.Workbooks
        action: Open(csvDataFile)
    - step:
        id: '103'
        object_path: appExcel.ActiveWorkbook
        comment: ' 43 is the code for xls format'
        action: SaveAs
        args: xlsDataFile, 56
    - step:
        id: '104'
        action: Script
        object_path: Set objWorkbook = appExcel.ActiveWorkbook
    - step:
        id: '105'
        action: Script
        object_path: For Each WS In objWorkbook.Worksheets
    - step:
        id: '106'
        action: Script
        object_path: If "Chart1" = WS.name Then
    - step:
        id: '107'
        action: Script
        object_path: Set objSheet = objWorkbook.worksheets(WS)
    - step:
        id: '108'
        object_path: objSheet
        action: Delete
    - step:
        id: '109'
        action: Script
        object_path: End If
    - step:
        id: '110'
        action: Script
        object_path: Next
    - step:
        id: '111'
        object_path: appExcel.Workbooks
        action: Close
    - step:
        id: '112'
        object_path: appExcel
        action: Quit
    - step:
        id: '113'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '114'
        action: Script
        object_path: '''Open the data file and move data to WIP file multiple worksheets'
    - step:
        id: '115'
        object_path: appExcel
        action: visible
        args: = false
    - step:
        id: '116'
        action: Script
        object_path: set appwkb = appExcel.workbooks.open(xlsDataFile)
    - step:
        id: '117'
        action: Script
        object_path: set appsht = appwkb.sheets(1)
    - step:
        id: '118'
        action: Script
        object_path: Rows = appsht.usedrange.rows.count
    - step:
        id: '119'
        action: Script
        object_path: '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''676767676767676677767767'
    - step:
        id: '120'
        action: Script
        object_path: '''When data is not found in data file the row could is going
          to be 1 then we need to creATE A BLANK FILE AND SAVE IT TO TEAMS FOR NEXT
          WEEK'
    - step:
        id: '121'
        action: Script
        object_path: '''NEW IMPLEMENTATION IS REQQUIRED'
    - step:
        id: '122'
        action: Script
        object_path: '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''676767676767676677767767'
    - step:
        id: '123'
        action: Script
        object_path: Set oDic1 = CreateObject("Scripting.Dictionary")
    - step:
        id: '124'
        action: Script
        object_path: Set oDic2  = CreateObject("Scripting.Dictionary")
    - step:
        id: '125'
        action: Script
        object_path: For i = 1 To Rows
    - step:
        id: '126'
        action: Script
        object_path: QueryId = appsht.Cells(i,2).Value
    - step:
        id: '127'
        action: Script
        object_path: If QueryId <> "QueryId" Then
    - step:
        id: '128'
        action: Script
        object_path: If oDic1.Exists(QueryId) Then
    - step:
        id: '129'
        action: Script
        object_path: Else
    - step:
        id: '130'
        object_path: oDic1
        action: add
        args: QueryId,i
    - step:
        id: '131'
        action: Script
        object_path: End If
    - step:
        id: '132'
        action: Script
        object_path: If oDic2.Exists(QueryId) Then
    - step:
        id: '133'
        object_path: oDic2.Item(QueryId) = oDic2
        action: Item(QueryId)
        args: + 1
    - step:
        id: '134'
        action: Script
        object_path: Else
    - step:
        id: '135'
        object_path: oDic2
        action: Add
        args: QueryId,1
    - step:
        id: '136'
        action: Script
        object_path: End If
    - step:
        id: '137'
        action: Script
        object_path: End If
    - step:
        id: '138'
        action: Script
        object_path: Next
    - step:
        id: '139'
        action: Script
        object_path: Set obj = createobject("Excel.Application")
    - step:
        id: '140'
        action: Script
        object_path: Set ClipBoard = CreateObject("Mercury.Clipboard")
    - step:
        id: '141'
        object_path: obj
        action: Visible
        args: = false
    - step:
        id: '142'
        action: Script
        object_path: Set objWorkbook = obj.Workbooks.Add()
    - step:
        id: '143'
        action: Script
        object_path: Set objWorkSheet = objWorkbook.ActiveSheet
    - step:
        id: '144'
        object_path: objWorkbook
        action: Saveas(xlsDataWIPFile)
    - step:
        id: '145'
        action: Script
        object_path: If rptData <> "No data found." Then
    - step:
        id: '146'
        action: Script
        object_path: queryIDCnt = oDic1.Count
    - step:
        id: '147'
        action: Script
        object_path: querycounter = 0
    - step:
        id: '148'
        action: Script
        object_path: For each val in oDic1
    - step:
        id: '149'
        action: Script
        object_path: querycounter = querycounter + 1
    - step:
        id: '150'
        action: Script
        object_path: QueryIdValue  = val
    - step:
        id: '151'
        action: Script
        object_path: QueryIdFirstRow = oDic1.Item(val)-1
    - step:
        id: '152'
        action: Script
        object_path: QueryIdCount = oDic2.Item(val)
    - step:
        id: '153'
        object_path: objWorkSheet
        action: Name
        args: = QueryIdValue
    - step:
        id: '154'
        object_path: appsht.Rows(QueryIdFirstRow&":"&QueryIdFirstRow + QueryIdCount)
        action: Copy
    - step:
        id: '155'
        object_path: objWorkSheet
        action: Paste
    - step:
        id: '156'
        object_path: objWorkSheet.Range("A:A").EntireColumn
        action: Delete
    - step:
        id: '157'
        action: Script
        object_path: If querycounter = queryIDCnt Then
    - step:
        id: '158'
        action: Script
        object_path: Exit for
    - step:
        id: '159'
        action: Script
        object_path: End If
    - step:
        id: '160'
        action: Script
        object_path: Set objWorkSheet = objWorkbook.Worksheets.Add(objWorkbook.Worksheets(objWorkbook.Worksheets.Count))
    - step:
        id: '161'
        action: Script
        object_path: Next
    - step:
        id: '162'
        action: Script
        object_path: Else
    - step:
        id: '163'
        object_path: objWorkSheet
        action: Cells(1,1)
        args: = "QueryId"
    - step:
        id: '164'
        object_path: objWorkSheet
        action: Cells(1,2)
        args: = "NMI"
    - step:
        id: '165'
        object_path: objWorkSheet
        action: Cells(2,1)
        args: = rptData
    - step:
        id: '166'
        action: Script
        object_path: End If
    - step:
        id: '167'
        object_path: objWorkbook
        action: Save
    - step:
        id: '168'
        object_path: ClipBoard
        action: clear
    - step:
        id: '169'
        action: Script
        object_path: '''Add new worksheets to  merge the adwanan and nmist query IDs'
    - step:
        id: '170'
        action: Script
        object_path: If TodaydayofWeek = "Monday" Then
    - step:
        id: '171'
        action: Script
        object_path: Set mergewkb = obj.workbooks.open(xlsDataWIPFile)
    - step:
        id: '172'
        action: Script
        object_path: For mergewrksht = 0 to 1
    - step:
        id: '173'
        action: Script
        object_path: Set mergeWorkSheet = mergewkb.Worksheets.Add(mergewkb.Worksheets(mergewkb.Worksheets.Count))
    - step:
        id: '174'
        action: Script
        object_path: If mergewrksht = 0 Then
    - step:
        id: '175'
        object_path: mergeWorkSheet
        action: Name
        args: = "ADWNAN"
    - step:
        id: '176'
        action: Script
        object_path: ElseIf mergewrksht = 1 Then
    - step:
        id: '177'
        object_path: mergeWorkSheet
        action: Name
        args: = "NMIST"
    - step:
        id: '178'
        action: Script
        object_path: End If
    - step:
        id: '179'
        action: Script
        object_path: Next
    - step:
        id: '180'
        object_path: mergewkb
        action: Save
    - step:
        id: '181'
        action: Script
        object_path: End If
    - step:
        id: '182'
        action: Script
        object_path: '''If weekday is monday then merge ADWNAN sheets and NMIST sheets'
    - step:
        id: '183'
        action: Script
        object_path: If TodaydayofWeek = "Monday" Then
    - step:
        id: '184'
        action: Script
        object_path: Set objWkb = obj.workbooks.open(xlsDataWIPFile)
    - step:
        id: '185'
        action: Script
        object_path: firstRow = Empty
    - step:
        id: '186'
        action: Script
        object_path: For Each wkshtNameStr in objWkb.Worksheets
    - step:
        id: '187'
        action: Script
        object_path: Rows = Empty
    - step:
        id: '188'
        action: Script
        object_path: wkshtName = wkshtNameStr.Name
    - step:
        id: '189'
        action: Script
        object_path: If wkshtName = "ADWNAN_BASIC" Then
    - step:
        id: '190'
        action: Script
        object_path: Rows = Empty
    - step:
        id: '191'
        action: Script
        object_path: set Sheet = objWkb.worksheets(wkshtName)
    - step:
        id: '192'
        action: Script
        object_path: Rows = Sheet.UsedRange.Rows.Count
    - step:
        id: '193'
        action: Script
        object_path: Set ADWNANSheet = objWkb.worksheets("ADWNAN")
    - step:
        id: '194'
        action: Script
        object_path: ADWANANRows = ADWNANSheet.UsedRange.Rows.Count
    - step:
        id: '195'
        action: Script
        object_path: If ADWANANRows > 1 Then
    - step:
        id: '196'
        object_path: Sheet.Rows("2:"&Rows)
        action: Copy
    - step:
        id: '197'
        action: Script
        object_path: ADWANANRows = ADWANANRows+1
    - step:
        id: '198'
        action: Script
        object_path: Else
    - step:
        id: '199'
        object_path: Sheet.Rows("1:"&Rows)
        action: Copy
    - step:
        id: '200'
        action: Script
        object_path: End If
    - step:
        id: '201'
        object_path: ADWNANSheet
        action: Activate
    - step:
        id: '202'
        object_path: ADWNANSheet.Range("A"&ADWANANRows)
        action: PasteSpecial
        args: '-4104'
    - step:
        id: '203'
        object_path: ClipBoard
        action: clear
    - step:
        id: '204'
        object_path: obj
        action: DisplayAlerts
        args: = False
    - step:
        id: '205'
        object_path: objWkb.worksheets("ADWNAN_BASIC")
        action: Delete
    - step:
        id: '206'
        object_path: obj
        action: DisplayAlerts
        args: = True
    - step:
        id: '207'
        action: Script
        object_path: ElseIf wkshtName = "ADWNAN_INTERVAL" Then
    - step:
        id: '208'
        action: Script
        object_path: Rows = Empty
    - step:
        id: '209'
        action: Script
        object_path: set Sheet = objWkb.worksheets(wkshtName)
    - step:
        id: '210'
        action: Script
        object_path: Rows = Sheet.UsedRange.Rows.Count
    - step:
        id: '211'
        action: Script
        object_path: Set ADWNANSheet = objWkb.worksheets("ADWNAN")
    - step:
        id: '212'
        action: Script
        object_path: ADWANANRows = ADWNANSheet.UsedRange.Rows.Count
    - step:
        id: '213'
        action: Script
        object_path: If ADWANANRows > 1 Then
    - step:
        id: '214'
        object_path: Sheet.Rows("2:"&Rows)
        action: Copy
    - step:
        id: '215'
        action: Script
        object_path: ADWANANRows = ADWANANRows+1
    - step:
        id: '216'
        action: Script
        object_path: Else
    - step:
        id: '217'
        object_path: Sheet.Rows("1:"&Rows)
        action: Copy
    - step:
        id: '218'
        action: Script
        object_path: End If
    - step:
        id: '219'
        object_path: ADWNANSheet
        action: Activate
    - step:
        id: '220'
        object_path: ADWNANSheet.Range("A"&ADWANANRows)
        action: PasteSpecial
        args: '-4104'
    - step:
        id: '221'
        object_path: ClipBoard
        action: clear
    - step:
        id: '222'
        object_path: obj
        action: DisplayAlerts
        args: = False
    - step:
        id: '223'
        object_path: objWkb.worksheets("ADWNAN_INTERVAL")
        action: Delete
    - step:
        id: '224'
        object_path: obj
        action: DisplayAlerts
        args: = True
    - step:
        id: '225'
        action: Script
        object_path: ElseIf wkshtName = "NMIST1" Then
    - step:
        id: '226'
        action: Script
        object_path: Rows = Empty
    - step:
        id: '227'
        action: Script
        object_path: set Sheet = objWkb.worksheets(wkshtName)
    - step:
        id: '228'
        action: Script
        object_path: Rows = Sheet.UsedRange.Rows.Count
    - step:
        id: '229'
        action: Script
        object_path: Set NMISTSheet = objWkb.worksheets("NMIST")
    - step:
        id: '230'
        action: Script
        object_path: NMISTRows = NMISTSheet.UsedRange.Rows.Count
    - step:
        id: '231'
        action: Script
        object_path: If NMISTRows > 1 Then
    - step:
        id: '232'
        object_path: Sheet.Rows("2:"&Rows)
        action: Copy
    - step:
        id: '233'
        action: Script
        object_path: NMISTRows= NMISTRows+1
    - step:
        id: '234'
        action: Script
        object_path: Else
    - step:
        id: '235'
        object_path: Sheet.Rows("1:"&Rows)
        action: Copy
    - step:
        id: '236'
        action: Script
        object_path: End If
    - step:
        id: '237'
        object_path: NMISTSheet
        action: Activate
    - step:
        id: '238'
        object_path: NMISTSheet.Range("A"&NMISTRows)
        action: PasteSpecial
        args: '-4104'
    - step:
        id: '239'
        object_path: ClipBoard
        action: clear
    - step:
        id: '240'
        object_path: obj
        action: DisplayAlerts
        args: = False
    - step:
        id: '241'
        object_path: objWkb.worksheets("NMIST1")
        action: Delete
    - step:
        id: '242'
        object_path: obj
        action: DisplayAlerts
        args: = True
    - step:
        id: '243'
        action: Script
        object_path: ElseIf wkshtName = "NMIST2" Then
    - step:
        id: '244'
        action: Script
        object_path: Rows = Empty
    - step:
        id: '245'
        action: Script
        object_path: set Sheet = objWkb.worksheets(wkshtName)
    - step:
        id: '246'
        action: Script
        object_path: Rows = Sheet.UsedRange.Rows.Count
    - step:
        id: '247'
        action: Script
        object_path: Set NMISTSheet = objWkb.worksheets("NMIST")
    - step:
        id: '248'
        action: Script
        object_path: NMISTRows = NMISTSheet.UsedRange.Rows.Count
    - step:
        id: '249'
        action: Script
        object_path: If NMISTRows > 1 Then
    - step:
        id: '250'
        object_path: Sheet.Rows("2:"&Rows)
        action: Copy
    - step:
        id: '251'
        action: Script
        object_path: NMISTRows= NMISTRows+1
    - step:
        id: '252'
        action: Script
        object_path: Else
    - step:
        id: '253'
        object_path: Sheet.Rows("1:"&Rows)
        action: Copy
    - step:
        id: '254'
        action: Script
        object_path: End If
    - step:
        id: '255'
        object_path: NMISTSheet
        action: Activate
    - step:
        id: '256'
        object_path: NMISTSheet.Range("A"&NMISTRows)
        action: PasteSpecial
        args: '-4104'
    - step:
        id: '257'
        object_path: ClipBoard
        action: clear
    - step:
        id: '258'
        object_path: obj
        action: DisplayAlerts
        args: = False
    - step:
        id: '259'
        object_path: objWkb.worksheets("NMIST2")
        action: Delete
    - step:
        id: '260'
        object_path: obj
        action: DisplayAlerts
        args: = True
    - step:
        id: '261'
        action: Script
        object_path: ElseIf wkshtName = "NMIST3" Then
    - step:
        id: '262'
        action: Script
        object_path: Rows = Empty
    - step:
        id: '263'
        action: Script
        object_path: set Sheet = objWkb.worksheets(wkshtName)
    - step:
        id: '264'
        action: Script
        object_path: Rows = Sheet.UsedRange.Rows.Count
    - step:
        id: '265'
        action: Script
        object_path: Set NMISTSheet = objWkb.worksheets("NMIST")
    - step:
        id: '266'
        action: Script
        object_path: NMISTRows = NMISTSheet.UsedRange.Rows.Count
    - step:
        id: '267'
        action: Script
        object_path: If NMISTRows > 1 Then
    - step:
        id: '268'
        object_path: Sheet.Rows("2:"&Rows)
        action: Copy
    - step:
        id: '269'
        action: Script
        object_path: NMISTRows= NMISTRows+1
    - step:
        id: '270'
        action: Script
        object_path: Else
    - step:
        id: '271'
        object_path: Sheet.Rows("1:"&Rows)
        action: Copy
    - step:
        id: '272'
        action: Script
        object_path: End If
    - step:
        id: '273'
        object_path: NMISTSheet
        action: Activate
    - step:
        id: '274'
        object_path: NMISTSheet.Range("A"&NMISTRows)
        action: PasteSpecial
        args: '-4104'
    - step:
        id: '275'
        object_path: ClipBoard
        action: clear
    - step:
        id: '276'
        object_path: obj
        action: DisplayAlerts
        args: = False
    - step:
        id: '277'
        object_path: objWkb.worksheets("NMIST3")
        action: Delete
    - step:
        id: '278'
        object_path: obj
        action: DisplayAlerts
        args: = True
    - step:
        id: '279'
        action: Script
        object_path: ElseIf wkshtName = "NMIST4" Then
    - step:
        id: '280'
        action: Script
        object_path: Rows = Empty
    - step:
        id: '281'
        action: Script
        object_path: set Sheet = objWkb.worksheets(wkshtName)
    - step:
        id: '282'
        action: Script
        object_path: Rows = Sheet.UsedRange.Rows.Count
    - step:
        id: '283'
        action: Script
        object_path: Set NMISTSheet = objWkb.worksheets("NMIST")
    - step:
        id: '284'
        action: Script
        object_path: NMISTRows = NMISTSheet.UsedRange.Rows.Count
    - step:
        id: '285'
        action: Script
        object_path: If NMISTRows > 1 Then
    - step:
        id: '286'
        object_path: Sheet.Rows("2:"&Rows)
        action: Copy
    - step:
        id: '287'
        action: Script
        object_path: NMISTRows= NMISTRows+1
    - step:
        id: '288'
        action: Script
        object_path: Else
    - step:
        id: '289'
        object_path: Sheet.Rows("1:"&Rows)
        action: Copy
    - step:
        id: '290'
        action: Script
        object_path: End If
    - step:
        id: '291'
        object_path: NMISTSheet
        action: Activate
    - step:
        id: '292'
        object_path: NMISTSheet.Range("A"&NMISTRows)
        action: PasteSpecial
        args: '-4104'
    - step:
        id: '293'
        object_path: ClipBoard
        action: clear
    - step:
        id: '294'
        object_path: obj
        action: DisplayAlerts
        args: = False
    - step:
        id: '295'
        object_path: objWkb.worksheets("NMIST4")
        action: Delete
    - step:
        id: '296'
        object_path: obj
        action: DisplayAlerts
        args: = True
    - step:
        id: '297'
        action: Script
        object_path: End If
    - step:
        id: '298'
        action: Script
        object_path: Next
    - step:
        id: '299'
        object_path: objWkb
        action: Save
    - step:
        id: '300'
        action: Script
        object_path: End If
    - step:
        id: '301'
        object_path: ClipBoard
        action: clear
    - step:
        id: '302'
        object_path: objWorkbook
        action: Save
    - step:
        id: '303'
        object_path: objWorkbook
        action: Close
    - step:
        id: '304'
        object_path: obj
        action: Quit
    - step:
        id: '305'
        object_path: appExcel
        action: Quit
    - step:
        id: '306'
        action: Script
        object_path: Set ClipBoard = nothing
    - step:
        id: '307'
        action: Script
        object_path: Set obj = nothing
    - step:
        id: '308'
        action: Script
        object_path: Set objWorkbook = nothing
    - step:
        id: '309'
        action: Script
        object_path: Set objWorkSheet = nothing
    - step:
        id: '310'
        action: Script
        object_path: Set appExcel = Nothing
    - step:
        id: '311'
        action: Script
        object_path: Set objFileToWritesmry = Nothing
    - step:
        id: '312'
        action: Script
        object_path: Set objFileToWriteData = Nothing
    - step:
        id: '313'
        action: Script
        object_path: parameter("wipDataFileName") = fileNameString&".xlsx"
    - step:
        id: '314'
        action: Script
        object_path: parameter("summaryFileName") = fileNameString&"_Summary.xls"
    - step:
        id: '315'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '316'
        action: Script
        object_path: xmlFolder = Empty
    - step:
        id: '317'
        action: Script
        object_path: weekNumber = empty
    - step:
        id: '318'
        action: Script
        object_path: Iterator = Empty
    - step:
        id: '319'
        action: Script
        object_path: excelFolder = Empty
    - step:
        id: '320'
        action: Script
        object_path: rptData = Empty
    - step:
        id: '321'
        action: Script
        object_path: rptSummary = Empty
    - step:
        id: '322'
        action: Script
        object_path: fileName = Empty
    - step:
        id: '323'
        action: Script
        object_path: Iterator = Empty
    - step:
        id: '324'
        action: Script
        object_path: csvdata =  Empty
    - step:
        id: '325'
        action: Script
        object_path: rptSummary = Empty
    - step:
        id: '326'
        action: Script
        object_path: rptData = Empty
    - step:
        id: '327'
        action: Script
        object_path: csvSummaryFile =Empty
    - step:
        id: '328'
        action: Script
        object_path: csvDataFile = Empty
    - step:
        id: '329'
        action: Script
        object_path: xlsSummaryFile = Empty
    - step:
        id: '330'
        action: Script
        object_path: xlsDataFile = Empty
    - step:
        id: '331'
        action: Script
        object_path: QueryId = Empty
    - step:
        id: '332'
        action: Script
        object_path: querycounter = Empty
    - step:
        id: '333'
        action: Script
        object_path: QueryIdValue  = Empty
    - step:
        id: '334'
        action: Script
        object_path: QueryIdFirstRow = Empty
    - step:
        id: '335'
        action: Script
        object_path: QueryIdCount = Empty
    - step:
        id: '336'
        action: Script
        object_path: filecounter = Empty
    - step:
        id: '337'
        action: Script
        object_path: firstRow = Empty
    - step:
        id: '338'
        action: Script
        object_path: wkshtName = Empty
    - step:
        id: '339'
        action: Script
        object_path: NMISTRows = Empty
    - step:
        id: '340'
        action: Script
        object_path: ADWANANRows = Empty
    - step:
        id: '341'
        action: Script
        object_path: Rows = Empty
    - step:
        id: '342'
        action: Script
        object_path: mergewrksht = Empty
    - step:
        id: '343'
        action: Script
        object_path: Set oFSO = Nothing
    - step:
        id: '344'
        action: Script
        object_path: Set objXMLDoc = Nothing
    - step:
        id: '345'
        action: Script
        object_path: Set oDic1 = Nothing
    - step:
        id: '346'
        action: Script
        object_path: Set oDic2 = Nothing
    - step:
        id: '347'
        action: Script
        object_path: Set objWkb = Nothing
    - step:
        id: '348'
        action: Script
        object_path: set Sheet = Nothing
    - step:
        id: '349'
        action: Script
        object_path: Set ADWNANSheet = Nothing
    - step:
        id: '350'
        action: Script
        object_path: Set NMISTSheet = Nothing
    - step:
        id: '351'
        action: Script
        object_path: Set mergewkb = Nothing
    - step:
        id: '352'
        action: Script
        object_path: Set mergeWorkSheet = Nothing
    - step:
        id: '353'
        action: Script
        object_path: Set dataExistsNode = Nothing
    - step:
        id: '354'
        action: Script
        object_path: ExitTest
  outputs:
  - wipDataFileName:
      robot: true
      value: ${wipDataFileName}
  - summaryFileName:
      robot: true
      value: ${summaryFileName}
  - prevWeekRptName:
      robot: true
      value: ${prevWeekRptName}
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
