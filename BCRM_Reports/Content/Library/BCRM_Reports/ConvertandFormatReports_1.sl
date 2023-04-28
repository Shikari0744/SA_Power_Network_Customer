namespace: BCRM_Reports
operation:
  name: ConvertandFormatReports_1
  inputs:
  - EstimatesWeekA_StartDate:
      required: false
  - EstimatesWeekA_EndDate:
      required: false
  - EstimatesWeekB_StartDate:
      required: false
  - EstimatesWeekB_EndDate:
      required: false
  - NullsPrelimA_StartDate:
      required: false
  - NullsPrelimA_EndDate:
      required: false
  - NullsPrelimB_StartDate:
      required: false
  - NullsPrelimB_EndDate:
      required: false
  - NullsR1A_StartDate:
      required: false
  - NullsR1A_EndDate:
      required: false
  - NullsR1B_StartDate:
      required: false
  - NullsR1B_EndDate:
      required: false
  - NullsR2A_StartDate:
      required: false
  - NullsR2A_EndDate:
      required: false
  - NullsR2B_StartDate:
      required: false
  - NullsR2B_EndDate:
      required: false
  - NullsFinalA_StartDate:
      required: false
  - NullsFinalA_EndDate:
      required: false
  - NullsFinalB_StartDate:
      required: false
  - NullsFinalB_EndDate:
      required: false
  - EstimatesWeekA_Number:
      required: false
  - EstimatesWeekB_Number:
      required: false
  - NullsPrelimA_Number:
      required: false
  - NullsPrelimB_Number:
      required: false
  - NullsR1A_Number:
      required: false
  - NullsR1B_Number:
      required: false
  - NullsR2A_Number:
      required: false
  - NullsR2B_Number:
      required: false
  - NullsFinalA_Number:
      required: false
  - NullsFinalB_Number:
      required: false
  - runDate:
      required: false
  - location
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.ConvertandFormatReports_1:1.0.0
    skills:
    - Web
    settings:
      windows:
        active: true
      web:
        active: false
        address: http://advantageonlineshopping.com
        browser: IE
        close_on_exit: true
    steps:
    - step:
        id: '1'
        action: Script
        object_path: xmlFolder = Parameter("location")&"XML Files\"
    - step:
        id: '2'
        action: Script
        object_path: excelFolder = Parameter("location")&"Excel Files\"
    - step:
        id: '3'
        action: Script
        object_path: todaysFormattedfolder = Parameter("location")&"Formatted Files\"
    - step:
        id: '4'
        action: Script
        object_path: EstimatesWeekA_Start = Parameter("EstimatesWeekA_StartDate")
    - step:
        id: '5'
        action: Script
        object_path: EstimatesWeekA_End = Parameter("EstimatesWeekA_EndDate")
    - step:
        id: '6'
        action: Script
        object_path: EstimatesWeekB_Start = Parameter("EstimatesWeekB_StartDate")
    - step:
        id: '7'
        action: Script
        object_path: EstimatesWeekB_End = Parameter("EstimatesWeekB_EndDate")
    - step:
        id: '8'
        action: Script
        object_path: NullsPrelimA_Start = Parameter("NullsPrelimA_StartDate")
    - step:
        id: '9'
        action: Script
        object_path: NullsPrelimA_End = Parameter("NullsPrelimA_EndDate")
    - step:
        id: '10'
        action: Script
        object_path: NullsPrelimB_Start = Parameter("NullsPrelimB_StartDate")
    - step:
        id: '11'
        action: Script
        object_path: NullsPrelimB_End = Parameter("NullsPrelimB_EndDate")
    - step:
        id: '12'
        action: Script
        object_path: NullsR1A_Start = Parameter("NullsR1A_StartDate")
    - step:
        id: '13'
        action: Script
        object_path: NullsR1A_End = Parameter("NullsR1A_EndDate")
    - step:
        id: '14'
        action: Script
        object_path: NullsR1B_Start = Parameter("NullsR1B_StartDate")
    - step:
        id: '15'
        action: Script
        object_path: NullsR1B_End = Parameter("NullsR1B_EndDate")
    - step:
        id: '16'
        action: Script
        object_path: NullsR2A_Start = Parameter("NullsR2A_StartDate")
    - step:
        id: '17'
        action: Script
        object_path: NullsR2A_End = Parameter("NullsR2A_EndDate")
    - step:
        id: '18'
        action: Script
        object_path: NullsR2B_Start = Parameter("NullsR2B_StartDate")
    - step:
        id: '19'
        action: Script
        object_path: NullsR2B_End = Parameter("NullsR2B_EndDate")
    - step:
        id: '20'
        action: Script
        object_path: NullsFinalA_Start = Parameter("NullsFinalA_StartDate")
    - step:
        id: '21'
        action: Script
        object_path: NullsFinalA_End = Parameter("NullsFinalA_EndDate")
    - step:
        id: '22'
        action: Script
        object_path: NullsFinalB_Start = Parameter("NullsFinalB_StartDate")
    - step:
        id: '23'
        action: Script
        object_path: NullsFinalB_End = Parameter("NullsFinalB_EndDate")
    - step:
        id: '24'
        action: Script
        object_path: EstimatesWeekA_Number = Parameter("EstimatesWeekA_Number")
    - step:
        id: '25'
        action: Script
        object_path: EstimatesWeekB_Number = Parameter("EstimatesWeekB_Number")
    - step:
        id: '26'
        action: Script
        object_path: NullsPrelimA_Number = Parameter("NullsPrelimA_Number")
    - step:
        id: '27'
        action: Script
        object_path: NullsPrelimB_Number = Parameter("NullsPrelimB_Number")
    - step:
        id: '28'
        action: Script
        object_path: NullsR1A_Number = Parameter("NullsR1A_Number")
    - step:
        id: '29'
        action: Script
        object_path: NullsR1B_Number = Parameter("NullsR1B_Number")
    - step:
        id: '30'
        action: Script
        object_path: NullsR2A_Number = Parameter("NullsR2A_Number")
    - step:
        id: '31'
        action: Script
        object_path: NullsR2B_Number = Parameter("NullsR2B_Number")
    - step:
        id: '32'
        action: Script
        object_path: NullsFinalA_Number = Parameter("NullsFinalA_Number")
    - step:
        id: '33'
        action: Script
        object_path: NullsFinalB_Number = Parameter("NullsFinalB_Number")
    - step:
        id: '34'
        action: Script
        object_path: runDate = Parameter("runDate")
    - step:
        id: '35'
        action: Script
        object_path: '''Start'
    - step:
        id: '36'
        action: Script
        object_path: If runDate = "" Then
    - step:
        id: '37'
        action: Script
        object_path: today = Replace(Date, "/", ".")
    - step:
        id: '38'
        action: Script
        object_path: Else
    - step:
        id: '39'
        action: Script
        object_path: today = Replace(runDate, "/", ".")
    - step:
        id: '40'
        action: Script
        object_path: End If
    - step:
        id: '41'
        action: Script
        object_path: '''todaysFormattedfolder = formattedFolder&today'
    - step:
        id: '42'
        action: Script
        object_path: strSafeDate = DatePart("yyyy",Date) & Right("0" & DatePart("m",Date),
          2) & Right("0" & DatePart("d",Date), 2)
    - step:
        id: '43'
        action: Script
        object_path: strSafeTime = Right("0" & Hour(Now), 2) & Right("0" & Minute(Now),
          2)
    - step:
        id: '44'
        action: Script
        object_path: strDateTime = strSafeDate & strSafeTime
    - step:
        id: '45'
        action: Script
        object_path: '''todaysFormattedfolder = formattedFolder&strSafeDate'
    - step:
        id: '46'
        action: Script
        object_path: '''Create Dictionary for all ween number, start date and end
          date'
    - step:
        id: '47'
        action: Script
        object_path: Function reportDic(weeknum, startDate, endDate)
    - step:
        id: '48'
        action: Script
        object_path: Set reportDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '49'
        object_path: reportDic
        action: Add
        args: '"Week_Number", weeknum'
    - step:
        id: '50'
        object_path: reportDic
        action: Add
        args: '"Start_Date", startDate'
    - step:
        id: '51'
        object_path: reportDic
        action: Add
        args: '"End_Date", endDate'
    - step:
        id: '52'
        action: Script
        object_path: End Function
    - step:
        id: '53'
        action: Script
        object_path: '''Create a dictionary to map the details to the report name'
    - step:
        id: '54'
        action: Script
        object_path: Set reportDetails = CreateObject("Scripting.Dictionary")
    - step:
        id: '55'
        object_path: reportDetails
        action: Add
        args: '"ESTIMATES WEEK A", reportDic(EstimatesWeekA_Number, EstimatesWeekA_Start,
          EstimatesWeekA_End)'
    - step:
        id: '56'
        object_path: reportDetails
        action: Add
        args: '"ESTIMATES WEEK B", reportDic(EstimatesWeekB_Number, EstimatesWeekB_Start,
          EstimatesWeekB_End)'
    - step:
        id: '57'
        object_path: reportDetails
        action: Add
        args: '"NULLS PRELIM A", reportDic(NullsPrelimA_Number, NullsPrelimA_Start,
          NullsPrelimA_End)'
    - step:
        id: '58'
        object_path: reportDetails
        action: Add
        args: '"NULLS PRELIM B", reportDic(NullsPrelimB_Number, NullsPrelimB_Start,
          NullsPrelimB_End)'
    - step:
        id: '59'
        object_path: reportDetails
        action: Add
        args: '"NULLS R1 A", reportDic(NullsR1A_Number, NullsR1A_Start, NullsR1A_End)'
    - step:
        id: '60'
        object_path: reportDetails
        action: Add
        args: '"NULLS R1 B", reportDic(NullsR1B_Number, NullsR1B_Start, NullsR1B_End)'
    - step:
        id: '61'
        object_path: reportDetails
        action: Add
        args: '"NULLS R2 A", reportDic(NullsR2A_Number, NullsR2A_Start, NullsR2A_End)'
    - step:
        id: '62'
        object_path: reportDetails
        action: Add
        args: '"NULLS R2 B", reportDic(NullsR2B_Number, NullsR2B_Start, NullsR2B_End)'
    - step:
        id: '63'
        object_path: reportDetails
        action: Add
        args: '"NULLS FINAL A", reportDic(NullsFinalA_Number, NullsFinalA_Start, NullsFinalA_End)'
    - step:
        id: '64'
        object_path: reportDetails
        action: Add
        args: '"NULLS FINAL B", reportDic(NullsFinalB_Number, NullsFinalB_Start, NullsFinalB_End)'
    - step:
        id: '65'
        action: Script
        object_path: '''''Create Folder with todays date'
    - step:
        id: '66'
        action: Script
        object_path: Set oFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '67'
        action: Script
        object_path: '''If Not oFSO.FolderExists(todaysFormattedfolder) Then'
    - step:
        id: '68'
        action: Script
        object_path: "'\toFSO.CreateFolder todaysFormattedfolder"
    - step:
        id: '69'
        action: Script
        object_path: '''End If'
    - step:
        id: '70'
        action: Script
        object_path: '''todaysFormattedfolder = todaysFormattedfolder&"\"'
    - step:
        id: '71'
        action: Script
        object_path: Parameter("currentFormatFolder") = todaysFormattedfolder
    - step:
        id: '72'
        action: Script
        object_path: '''Create excel files for todays reports'
    - step:
        id: '73'
        action: Script
        object_path: Set objexcel = createobject("Excel.Application")
    - step:
        id: '74'
        object_path: objexcel
        action: visible=FALSE
    - step:
        id: '75'
        action: Script
        object_path: Set obj1 = objexcel.Workbooks.Add()
    - step:
        id: '76'
        action: Script
        object_path: For each obj in reportDetails.Keys
    - step:
        id: '77'
        action: Script
        object_path: weekbnumber = reportDetails.Item(obj).Item("Week_Number")
    - step:
        id: '78'
        action: Script
        object_path: If (InStr(1, obj, "NULLS") > 0) and (reportDetails.Item(obj).Item("Week_Number")
          <> "" ) Then
    - step:
        id: '79'
        action: Script
        object_path: sheet = obj & " - WEEK " & reportDetails.Item(obj).Item("Week_Number")
    - step:
        id: '80'
        action: Script
        object_path: Set oSheet = obj1.Worksheets.Add(obj1.Sheets(obj1.Sheets.Count))
    - step:
        id: '81'
        object_path: oSheet
        action: Name
        args: = sheet
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
        action: Script
        object_path: nullsBasicFileName = todaysFormattedfolder&today&" ETSAMDP-BASIC-NULLS-"&strDateTime&".xlsx"
    - step:
        id: '85'
        action: Script
        object_path: nullsIntervalFileName = todaysFormattedfolder&today&" ETSAMDP-INTERVAL-NULLS-"&strDateTime&".xlsx"
    - step:
        id: '86'
        object_path: obj1
        action: SaveAs
        args: nullsBasicFileName
    - step:
        id: '87'
        object_path: obj1
        action: SaveAs
        args: nullsIntervalFileName
    - step:
        id: '88'
        object_path: obj1
        action: Close
    - step:
        id: '89'
        action: Script
        object_path: Set obj2 = objexcel.Workbooks.Add()
    - step:
        id: '90'
        action: Script
        object_path: For each obj in reportDetails.Keys
    - step:
        id: '91'
        action: Script
        object_path: If (InStr(1, obj, "ESTIMATES") > 0) and (reportDetails.Item(obj).Item("Week_Number")
          <> "" ) Then
    - step:
        id: '92'
        action: Script
        object_path: sheet = obj & " - WEEK " & reportDetails.Item(obj).Item("Week_Number")
    - step:
        id: '93'
        action: Script
        object_path: Set oSheet = obj2.Worksheets.Add(obj2.Sheets(obj2.Sheets.Count))
    - step:
        id: '94'
        object_path: oSheet
        action: Name
        args: = sheet
    - step:
        id: '95'
        action: Script
        object_path: End If
    - step:
        id: '96'
        action: Script
        object_path: Next
    - step:
        id: '97'
        action: Script
        object_path: estimatesBasicFileName = todaysFormattedfolder&today&" ETSAMDP-BASIC-ESTIMATES-"&strDateTime&".xlsx"
    - step:
        id: '98'
        action: Script
        object_path: estimatesIntervalFileName = todaysFormattedfolder&today&" ETSAMDP-INTERVAL-ESTIMATES-"&strDateTime&".xlsx"
    - step:
        id: '99'
        object_path: obj2
        action: SaveAs
        args: estimatesBasicFileName
    - step:
        id: '100'
        object_path: obj2
        action: SaveAs
        args: estimatesIntervalFileName
    - step:
        id: '101'
        object_path: obj2
        action: Close
    - step:
        id: '102'
        object_path: objexcel
        action: Quit
    - step:
        id: '103'
        action: Script
        object_path: Set oSheet = Nothing
    - step:
        id: '104'
        action: Script
        object_path: Set obj1 = Nothing
    - step:
        id: '105'
        action: Script
        object_path: Set obj2 = Nothing
    - step:
        id: '106'
        action: Script
        object_path: Set objexcel = Nothing
    - step:
        id: '107'
        action: Script
        object_path: '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''Get
          report names based on information in xmls files'
    - step:
        id: '108'
        action: Script
        object_path: '''Set report flags to empty'
    - step:
        id: '109'
        action: Script
        object_path: rptNullsPrelimABasic = ""
    - step:
        id: '110'
        action: Script
        object_path: rptNullsPrelimBBasic = ""
    - step:
        id: '111'
        action: Script
        object_path: rptNullsR1ABasic = ""
    - step:
        id: '112'
        action: Script
        object_path: rptNullsR1BBasic = ""
    - step:
        id: '113'
        action: Script
        object_path: rptNullsR2ABasic = ""
    - step:
        id: '114'
        action: Script
        object_path: rptNullsR2BBasic = ""
    - step:
        id: '115'
        action: Script
        object_path: rptNullsFinalABasic = ""
    - step:
        id: '116'
        action: Script
        object_path: rptNullsFinalBBasic = ""
    - step:
        id: '117'
        action: Script
        object_path: rptEstimateWeekABasic = ""
    - step:
        id: '118'
        action: Script
        object_path: rptEstimateWeekBBasic = ""
    - step:
        id: '119'
        action: Script
        object_path: rptNullsPrelimAInterval = ""
    - step:
        id: '120'
        action: Script
        object_path: rptNullsPrelimBInterval = ""
    - step:
        id: '121'
        action: Script
        object_path: rptNullsR1AInterval = ""
    - step:
        id: '122'
        action: Script
        object_path: rptNullsR1BInterval = ""
    - step:
        id: '123'
        action: Script
        object_path: rptNullsR2AInterval = ""
    - step:
        id: '124'
        action: Script
        object_path: rptNullsR2BInterval = ""
    - step:
        id: '125'
        action: Script
        object_path: rptNullsFinalAInterval = ""
    - step:
        id: '126'
        action: Script
        object_path: rptNullsFinalBInterval = ""
    - step:
        id: '127'
        action: Script
        object_path: rptEstimateWeekAInterval = ""
    - step:
        id: '128'
        action: Script
        object_path: rptEstimateWeekBInterval = ""
    - step:
        id: '129'
        action: Script
        object_path: '''Get report names'
    - step:
        id: '130'
        action: Script
        object_path: For Each oFile In oFSO.GetFolder(xmlFolder).Files
    - step:
        id: '131'
        action: Script
        object_path: rptParamName = empty
    - step:
        id: '132'
        action: Script
        object_path: ReportType = empty
    - step:
        id: '133'
        action: Script
        object_path: ReportName = empty
    - step:
        id: '134'
        action: Script
        object_path: fileName = oFile.Name
    - step:
        id: '135'
        action: Script
        object_path: fileName = Replace(fileName, ".xml", "")
    - step:
        id: '136'
        action: Script
        object_path: '''Open xml and gate data from "CSVdata" node'
    - step:
        id: '137'
        action: Script
        object_path: Set objXMLDoc = CreateObject("Microsoft.XMLDOM")
    - step:
        id: '138'
        object_path: objXMLDoc
        action: async
        args: = False
    - step:
        id: '139'
        object_path: objXMLDoc.load(oFile
        action: Path)
    - step:
        id: '140'
        action: Script
        object_path: Set Root = objXMLDoc.documentElement
    - step:
        id: '141'
        action: Script
        object_path: Set rptCat = Root.getElementsByTagName("ReportName")
    - step:
        id: '142'
        action: Script
        object_path: For Each Elem In rptCat
    - step:
        id: '143'
        action: Script
        object_path: rpt = Elem.firstChild.nodeValue
    - step:
        id: '144'
        action: Script
        object_path: Next
    - step:
        id: '145'
        action: Script
        object_path: If rpt = "SubstitutionEstimation" Then
    - step:
        id: '146'
        action: Script
        object_path: rptPrefix = "R26"
    - step:
        id: '147'
        action: Script
        object_path: ElseIf rpt = "MissingData"  Then
    - step:
        id: '148'
        action: Script
        object_path: rptPrefix = "R11"
    - step:
        id: '149'
        action: Script
        object_path: End If
    - step:
        id: '150'
        action: Script
        object_path: If rptPrefix = "R26" Then
    - step:
        id: '151'
        action: Script
        object_path: Set parameterList = objXMLDoc.SelectNodes("/ase:aseXML/Transactions/Transaction/ReportResponse/ReportParameters/Parameters/Parameter")
    - step:
        id: '152'
        action: Script
        object_path: 'For Each Node In parameterList   '
        comment: '''''''''get Datatype vale to determine the report type'
    - step:
        id: '153'
        action: Script
        object_path: 'rptParamName =  Node.SelectSingleNode("Name").Text '
        comment: the text content in this element and its child elements
    - step:
        id: '154'
        action: Script
        object_path: If rptParamName = "DataType" Then
    - step:
        id: '155'
        action: Script
        object_path: rptParamVal =  Node.SelectSingleNode("Value").Text
    - step:
        id: '156'
        action: Script
        object_path: Exit For
    - step:
        id: '157'
        action: Script
        object_path: End If
    - step:
        id: '158'
        action: Script
        object_path: Next
    - step:
        id: '159'
        action: Script
        object_path: '''decide on report type'
    - step:
        id: '160'
        action: Script
        object_path: If (rptParamName = "DataType") and (rptParamVal = "Consumption")
          Then
    - step:
        id: '161'
        action: Script
        object_path: ReportType = "Basic"
    - step:
        id: '162'
        action: Script
        object_path: ElseIf (rptParamName = "DataType") and (rptParamVal = "Interval")
          Then
    - step:
        id: '163'
        action: Script
        object_path: ReportType = "Interval"
    - step:
        id: '164'
        action: Script
        object_path: End If
    - step:
        id: '165'
        action: Script
        object_path: For Each parameterNode In parameterList
    - step:
        id: '166'
        action: Script
        object_path: 'rptParameterName =  parameterNode.SelectSingleNode("Name").Text '
        comment: the text content in this element and its child elements
    - step:
        id: '167'
        action: Script
        object_path: If rptParameterName = "FromDate" Then
    - step:
        id: '168'
        action: Script
        object_path: FromDate =  parameterNode.SelectSingleNode("Value").Text
    - step:
        id: '169'
        action: Script
        object_path: Exit For
    - step:
        id: '170'
        action: Script
        object_path: End If
    - step:
        id: '171'
        action: Script
        object_path: Next
    - step:
        id: '172'
        action: Script
        object_path: For Each parameterNode In parameterList
    - step:
        id: '173'
        action: Script
        object_path: 'rptParameterName =  parameterNode.SelectSingleNode("Name").Text '
        comment: the text content in this element and its child elements
    - step:
        id: '174'
        action: Script
        object_path: If rptParameterName = "ToDate" Then
    - step:
        id: '175'
        action: Script
        object_path: ToDate =  parameterNode.SelectSingleNode("Value").Text
    - step:
        id: '176'
        action: Script
        object_path: Exit For
    - step:
        id: '177'
        action: Script
        object_path: End If
    - step:
        id: '178'
        action: Script
        object_path: Next
    - step:
        id: '179'
        action: Script
        object_path: '''construct report name based on start and end dates match between
          calender and xml from/to dates'
    - step:
        id: '180'
        action: Script
        object_path: For each obj in reportDetails.Keys
    - step:
        id: '181'
        action: Script
        object_path: startDate = reportDetails.Item(obj).Item("Start_Date")
    - step:
        id: '182'
        action: Script
        object_path: endDate = reportDetails.Item(obj).Item("End_Date")
    - step:
        id: '183'
        action: Script
        object_path: If (startDate <> "") and (endDate <> "") Then
    - step:
        id: '184'
        action: Script
        object_path: startDate = DatePart("yyyy",startDate) &"-"& Right("0" & DatePart("m",startDate),
          2) &"-"& Right("0" & DatePart("d",startDate), 2)
    - step:
        id: '185'
        action: Script
        object_path: endDate = DatePart("yyyy",endDate) &"-"& Right("0" & DatePart("m",endDate),
          2) &"-"& Right("0" & DatePart("d",endDate), 2)
    - step:
        id: '186'
        action: Script
        object_path: If (startDate = FromDate) and (endDate = ToDate) Then
    - step:
        id: '187'
        action: Script
        object_path: ReportName = obj & " - WEEK " & reportDetails.Item(obj).Item("Week_Number")
    - step:
        id: '188'
        action: Script
        object_path: Exit for
    - step:
        id: '189'
        action: Script
        object_path: End If
    - step:
        id: '190'
        action: Script
        object_path: End If
    - step:
        id: '191'
        action: Script
        object_path: Next
    - step:
        id: '192'
        action: Script
        object_path: ElseIf rptPrefix = "R11" Then
    - step:
        id: '193'
        action: Script
        object_path: Set parameterList = objXMLDoc.SelectNodes("/ase:aseXML/Transactions/Transaction/ReportResponse/ReportParameters")
    - step:
        id: '194'
        action: Script
        object_path: For Each Node In parameterList
    - step:
        id: '195'
        action: Script
        object_path: 'rptParamName =  Node.SelectSingleNode("DataType").Text '
        comment: the text content in this element and its child elements
    - step:
        id: '196'
        action: Script
        object_path: Next
    - step:
        id: '197'
        action: Script
        object_path: '''decide on report type'
    - step:
        id: '198'
        action: Script
        object_path: If rptParamName = "Consumption" Then
    - step:
        id: '199'
        action: Script
        object_path: ReportType = "Basic"
    - step:
        id: '200'
        action: Script
        object_path: ElseIf rptParamName = "Interval" Then
    - step:
        id: '201'
        action: Script
        object_path: ReportType = "Interval"
    - step:
        id: '202'
        action: Script
        object_path: End If
    - step:
        id: '203'
        action: Script
        object_path: For Each parameterNode In parameterList
    - step:
        id: '204'
        action: Script
        object_path: 'FromDate =  parameterNode.SelectSingleNode("FromDate").Text '
        comment: the text content in this element and its child elements
    - step:
        id: '205'
        action: Script
        object_path: Next
    - step:
        id: '206'
        action: Script
        object_path: For Each parameterNode In parameterList
    - step:
        id: '207'
        action: Script
        object_path: 'ToDate =  parameterNode.SelectSingleNode("ToDate").Text '
        comment: the text content in this element and its child elements
    - step:
        id: '208'
        action: Script
        object_path: Next
    - step:
        id: '209'
        action: Script
        object_path: '''construct report name based on start and end dates match between
          calender and xml from/to dates'
    - step:
        id: '210'
        action: Script
        object_path: For each obj in reportDetails.Keys
    - step:
        id: '211'
        action: Script
        object_path: startDate = reportDetails.Item(obj).Item("Start_Date")
    - step:
        id: '212'
        action: Script
        object_path: endDate = reportDetails.Item(obj).Item("End_Date")
    - step:
        id: '213'
        action: Script
        object_path: If (startDate <> "") and (endDate <> "") Then
    - step:
        id: '214'
        action: Script
        object_path: startDate = DatePart("yyyy",startDate) &"-"& Right("0" & DatePart("m",startDate),
          2) &"-"& Right("0" & DatePart("d",startDate), 2)
    - step:
        id: '215'
        action: Script
        object_path: endDate = DatePart("yyyy",endDate) &"-"& Right("0" & DatePart("m",endDate),
          2) &"-"& Right("0" & DatePart("d",endDate), 2)
    - step:
        id: '216'
        action: Script
        object_path: If (startDate = FromDate) and (endDate = ToDate) Then
    - step:
        id: '217'
        action: Script
        object_path: ReportName = obj & " - WEEK " & reportDetails.Item(obj).Item("Week_Number")
    - step:
        id: '218'
        action: Script
        object_path: Exit for
    - step:
        id: '219'
        action: Script
        object_path: End If
    - step:
        id: '220'
        action: Script
        object_path: End If
    - step:
        id: '221'
        action: Script
        object_path: Next
    - step:
        id: '222'
        action: Script
        object_path: End If
    - step:
        id: '223'
        action: Script
        object_path: If ReportName <> "" Then
    - step:
        id: '224'
        action: Script
        object_path: '''''''''''$%$%$%$%%$%$%$%$%$%%$%$%$%$%$%$%'
    - step:
        id: '225'
        action: Script
        object_path: '''''''''$%$%$%$%%$%$%$%$%$%%$%$%$%$%$%$%'
    - step:
        id: '226'
        action: Script
        object_path: '''''''''$%$%$%$%%$%$%$%$%$%%$%$%$%$%$%$%'
    - step:
        id: '227'
        action: Script
        object_path: '''''''''$%$%$%$%%$%$%$%$%$%%$%$%$%$%$%$%'
    - step:
        id: '228'
        action: Script
        object_path: "'\tIf (InStr(1, ReportName, \"NULLS PRELIM A\") > 0) and (ReportType\
          \ = \"Basic\") Then"
    - step:
        id: '229'
        action: Script
        object_path: "'\t\trptNullsPrelimABasic = \"True\""
    - step:
        id: '230'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS PRELIM B\") > 0) and\
          \ (ReportType = \"Basic\") Then"
    - step:
        id: '231'
        action: Script
        object_path: "'\t\trptNullsPrelimBBasic = \"True\""
    - step:
        id: '232'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS R1 A\") > 0) and (ReportType\
          \ = \"Basic\") Then"
    - step:
        id: '233'
        action: Script
        object_path: "'\t\trptNullsR1ABasic = \"True\""
    - step:
        id: '234'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS R1 B\") > 0) and (ReportType\
          \ = \"Basic\") Then"
    - step:
        id: '235'
        action: Script
        object_path: "'\t\trptNullsR1BBasic = \"True\""
    - step:
        id: '236'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS R2 A\") > 0) and (ReportType\
          \ = \"Basic\") Then"
    - step:
        id: '237'
        action: Script
        object_path: "'\t\trptNullsR2ABasic = \"True\""
    - step:
        id: '238'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS R2 B\") > 0) and (ReportType\
          \ = \"Basic\") Then"
    - step:
        id: '239'
        action: Script
        object_path: "'\t\trptNullsR2BBasic = \"True\""
    - step:
        id: '240'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS FINAL A\") > 0) and\
          \ (ReportType = \"Basic\") Then"
    - step:
        id: '241'
        action: Script
        object_path: "'\t\trptNullsFinalABasic = \"True\""
    - step:
        id: '242'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS FINAL B\") > 0) and\
          \ (ReportType = \"Basic\") Then"
    - step:
        id: '243'
        action: Script
        object_path: "'\t\trptNullsFinalBBasic = \"True\""
    - step:
        id: '244'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"ESTIMATES WEEK A\") > 0) and\
          \ (ReportType = \"Basic\") Then"
    - step:
        id: '245'
        action: Script
        object_path: "'\t\trptEstimateWeekABasic = \"True\""
    - step:
        id: '246'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"ESTIMATES WEEK B\") > 0) and\
          \ (ReportType = \"Basic\") Then"
    - step:
        id: '247'
        action: Script
        object_path: "'\t\trptEstimateWeekBBasic = \"True\""
    - step:
        id: '248'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS PRELIM A\") > 0)  and\
          \ (ReportType = \"Interval\") Then"
    - step:
        id: '249'
        action: Script
        object_path: "'\t\trptNullsPrelimAInterval = \"True\""
    - step:
        id: '250'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS PRELIM B\") > 0) and\
          \ (ReportType = \"Interval\") Then"
    - step:
        id: '251'
        action: Script
        object_path: "'\t\trptNullsPrelimBInterval = \"True\""
    - step:
        id: '252'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS R1 A\") > 0) and (ReportType\
          \ = \"Interval\") Then"
    - step:
        id: '253'
        action: Script
        object_path: "'\t\trptNullsR1AInterval = \"True\""
    - step:
        id: '254'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS R1 B\") > 0) and (ReportType\
          \ = \"Interval\") Then"
    - step:
        id: '255'
        action: Script
        object_path: "'\t\trptNullsR1BInterval = \"True\""
    - step:
        id: '256'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS R2 A\") > 0) and (ReportType\
          \ = \"Interval\") Then"
    - step:
        id: '257'
        action: Script
        object_path: "'\t\trptNullsR2AInterval = \"True\""
    - step:
        id: '258'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS R2 B\") > 0) and (ReportType\
          \ = \"Interval\") Then"
    - step:
        id: '259'
        action: Script
        object_path: "'\t\trptNullsR2BInterval = \"True\""
    - step:
        id: '260'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS FINAL A\") > 0) and\
          \ (ReportType = \"Interval\") Then"
    - step:
        id: '261'
        action: Script
        object_path: "'\t\trptNullsFinalAInterval = \"True\""
    - step:
        id: '262'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"NULLS FINAL B\") > 0) and\
          \ (ReportType = \"Interval\") Then"
    - step:
        id: '263'
        action: Script
        object_path: "'\t\trptNullsFinalBInterval = \"True\""
    - step:
        id: '264'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"ESTIMATES WEEK A\") > 0) and\
          \ (ReportType = \"Interval\") Then"
    - step:
        id: '265'
        action: Script
        object_path: "'\t\trptEstimateWeekAInterval = \"True\""
    - step:
        id: '266'
        action: Script
        object_path: "'\tElseIf (InStr(1, ReportName, \"ESTIMATES WEEK B\") > 0) and\
          \ (ReportType = \"Interval\") Then"
    - step:
        id: '267'
        action: Script
        object_path: "'\t\trptEstimateWeekBInterval = \"True\""
    - step:
        id: '268'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '269'
        action: Script
        object_path: '''''''''$%$%$%$%%$%$%$%$%$%%$%$%$%$%$%$%'
    - step:
        id: '270'
        action: Script
        object_path: '''''''''$%$%$%$%%$%$%$%$%$%%$%$%$%$%$%$%'
    - step:
        id: '271'
        action: Script
        object_path: '''''''''$%$%$%$%%$%$%$%$%$%%$%$%$%$%$%$%'
    - step:
        id: '272'
        action: Script
        object_path: '''''''''$%$%$%$%%$%$%$%$%$%%$%$%$%$%$%$%'
    - step:
        id: '273'
        action: Script
        object_path: Set NodeList = objXMLDoc.SelectNodes("/ase:aseXML/Transactions/Transaction/ReportResponse/ReportResults")
    - step:
        id: '274'
        action: Script
        object_path: For Each objNode In NodeList
    - step:
        id: '275'
        action: Script
        object_path: 'csvdata =  objNode.Text '
        comment: the text content in this element and its child elements
    - step:
        id: '276'
        action: Script
        object_path: Next
    - step:
        id: '277'
        action: Script
        object_path: Set parameterList = nothing
    - step:
        id: '278'
        action: Script
        object_path: Set rptCat = nothing
    - step:
        id: '279'
        action: Script
        object_path: Set Root = nothing
    - step:
        id: '280'
        action: Script
        object_path: Set objXMLDoc = nothing
    - step:
        id: '281'
        action: Script
        object_path: Set NodeList = nothing
    - step:
        id: '282'
        action: Script
        object_path: Set re = New RegExp
    - step:
        id: '283'
        object_path: re
        action: Pattern
        args: = "[^0-9\.,]"
    - step:
        id: '284'
        object_path: re
        action: Global
        args: = True
    - step:
        id: '285'
        object_path: re
        action: IgnoreCase
        args: = True
    - step:
        id: '286'
        action: Script
        object_path: fileName = re.Replace(fileName, "")
    - step:
        id: '287'
        action: Script
        object_path: fileName = fileName&"_"&ReportName&Left(ReportType,1)
    - step:
        id: '288'
        action: Script
        object_path: csvFile = excelFolder&fileName&".csv"
    - step:
        id: '289'
        action: Script
        object_path: '''Write the captured data to CSV file'
    - step:
        id: '290'
        action: Script
        object_path: Set objFileToWrite = CreateObject("Scripting.FileSystemObject").OpenTextFile(csvFile,2,true)
    - step:
        id: '291'
        object_path: objFileToWrite
        action: WriteLine(csvdata)
    - step:
        id: '292'
        object_path: objFileToWrite
        action: Close
    - step:
        id: '293'
        action: Script
        object_path: Set objFileToWrite = Nothing
    - step:
        id: '294'
        action: Script
        object_path: xlsFile = excelFolder&fileName&".xls"
    - step:
        id: '295'
        action: Script
        object_path: '''convert csv to excel'
    - step:
        id: '296'
        action: Script
        object_path: Set appExcel = CreateObject("Excel.Application")
    - step:
        id: '297'
        object_path: appExcel.Workbooks
        action: Open(csvFile)
    - step:
        id: '298'
        object_path: appExcel.ActiveWorkbook
        comment: ' 43 is the code for xls format'
        action: SaveAs
        args: xlsFile, 56
    - step:
        id: '299'
        object_path: appExcel.Workbooks
        action: Close
    - step:
        id: '300'
        object_path: appExcel
        action: Quit
    - step:
        id: '301'
        action: Script
        object_path: Set appExcel = Nothing
    - step:
        id: '302'
        action: Script
        object_path: Set objFileToWrite = Nothing
    - step:
        id: '303'
        action: Script
        object_path: If (InStr(1, ReportName, "NULLS") > 0) and (ReportName <> "")
          Then
    - step:
        id: '304'
        action: Script
        object_path: '''Import the newly created excel file as datatable'
    - step:
        id: '305'
        object_path: Datatable
        action: Import
        args: xlsFile
    - step:
        id: '306'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '307'
        action: Script
        object_path: '''get Number of rows from DT'
    - step:
        id: '308'
        action: Script
        object_path: nSheetRows = DataTable.GetSheet("Global").GetRowCount
    - step:
        id: '309'
        action: Script
        object_path: If nSheetRows > 0 Then
    - step:
        id: '310'
        action: Script
        object_path: '''Create Dictionary Items with Super Description'
    - step:
        id: '311'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '312'
        action: Script
        object_path: Set oDicStartDate = CreateObject("Scripting.Dictionary")
    - step:
        id: '313'
        action: Script
        object_path: Set oDicEndDate = CreateObject("Scripting.Dictionary")
    - step:
        id: '314'
        action: Script
        object_path: Set oDicSuffix = CreateObject("Scripting.Dictionary")
    - step:
        id: '315'
        action: Script
        object_path: For i = 0 To nSheetRows - 1
    - step:
        id: '316'
        object_path: DataTable.GetSheet("Global")
        action: SetCurrentRow(i+1)
    - step:
        id: '317'
        action: Script
        object_path: If oDic.Exists(Datatable.Value("NMI","Global")) Then
    - step:
        id: '318'
        object_path: oDic.Item(Datatable.Value("NMI","Global")) = oDic.Item(Datatable
        action: Value("NMI","Global"))
        args: + 1
    - step:
        id: '319'
        action: Script
        object_path: Else
    - step:
        id: '320'
        object_path: oDic.Add Datatable
        action: Value("NMI","Global"),1
    - step:
        id: '321'
        action: Script
        object_path: End If
    - step:
        id: '322'
        action: Script
        object_path: '''get start date'
    - step:
        id: '323'
        action: Script
        object_path: If oDicStartDate.Exists(Datatable.Value("NMI","Global")) Then
    - step:
        id: '324'
        action: Script
        object_path: If DateValue(oDicStartDate.Item(Datatable.Value("NMI","Global")))
          > DateValue(Datatable.Value("SettlementDate","Global")) Then
    - step:
        id: '325'
        object_path: oDicStartDate.Item(Datatable.Value("NMI","Global")) = Datatable
        action: Value("SettlementDate","Global")
    - step:
        id: '326'
        action: Script
        object_path: End If
    - step:
        id: '327'
        action: Script
        object_path: Else
    - step:
        id: '328'
        object_path: oDicStartDate.Add Datatable.Value("NMI","Global"),(Datatable
        action: Value("SettlementDate","Global"))
    - step:
        id: '329'
        action: Script
        object_path: End If
    - step:
        id: '330'
        action: Script
        object_path: '''Get end date'
    - step:
        id: '331'
        action: Script
        object_path: If oDicEndDate.Exists(Datatable.Value("NMI","Global")) Then
    - step:
        id: '332'
        action: Script
        object_path: If DateValue(oDicEndDate.Item(Datatable.Value("NMI","Global")))
          < DateValue(Datatable.Value("SettlementDate","Global")) Then
    - step:
        id: '333'
        object_path: oDicEndDate.Item(Datatable.Value("NMI","Global")) = Datatable
        action: Value("SettlementDate","Global")
    - step:
        id: '334'
        action: Script
        object_path: End If
    - step:
        id: '335'
        action: Script
        object_path: Else
    - step:
        id: '336'
        object_path: oDicEndDate.Add Datatable.Value("NMI","Global"),(Datatable
        action: Value("SettlementDate","Global"))
    - step:
        id: '337'
        action: Script
        object_path: End If
    - step:
        id: '338'
        action: Script
        object_path: ''' merge Suffix'
    - step:
        id: '339'
        action: Script
        object_path: If oDicSuffix.Exists(Datatable.Value("NMI","Global")) Then
    - step:
        id: '340'
        action: Script
        object_path: If instr(1, oDicSuffix.Item(Datatable.Value("NMI","Global")),
          Datatable.Value("Suffix","Global")) = 0 Then
    - step:
        id: '341'
        object_path: oDicSuffix.Item(Datatable.Value("NMI","Global")) = oDicSuffix.Item(Datatable.Value("NMI","Global"))
          & "," & Datatable
        action: Value("Suffix","Global")
    - step:
        id: '342'
        action: Script
        object_path: End If
    - step:
        id: '343'
        action: Script
        object_path: Else
    - step:
        id: '344'
        object_path: oDicSuffix.Add Datatable.Value("NMI","Global"),(Datatable
        action: Value("Suffix","Global"))
    - step:
        id: '345'
        action: Script
        object_path: End If
    - step:
        id: '346'
        action: Script
        object_path: Next
    - step:
        id: '347'
        action: Script
        object_path: End If
    - step:
        id: '348'
        action: Script
        object_path: ElseIf (InStr(1, ReportName, "ESTIMATES") > 0) and (ReportName
          <> "") Then
    - step:
        id: '349'
        object_path: Datatable
        action: Import
        args: xlsFile
    - step:
        id: '350'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '351'
        action: Script
        object_path: nSheetRows = DataTable.GetSheet("Global").GetRowCount
    - step:
        id: '352'
        action: Script
        object_path: If  (ColNums = 0) Then
    - step:
        id: '353'
        action: Script
        object_path: If ReportType = "Basic" Then
    - step:
        id: '354'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"NMI", ""'
    - step:
        id: '355'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"SFX", ""'
    - step:
        id: '356'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"START_DATE", ""'
    - step:
        id: '357'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"END_DATE", ""'
    - step:
        id: '358'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"FRMP", ""'
    - step:
        id: '359'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"LR", ""'
    - step:
        id: '360'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"MDP", ""'
    - step:
        id: '361'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"FLAG", ""'
    - step:
        id: '362'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"KWH", ""'
    - step:
        id: '363'
        action: Script
        object_path: ElseIf ReportType = "Interval" Then
    - step:
        id: '364'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"NMI", ""'
    - step:
        id: '365'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"Checksum", ""'
    - step:
        id: '366'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"SFX", ""'
    - step:
        id: '367'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"SettDate", ""'
    - step:
        id: '368'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"FRMP", ""'
    - step:
        id: '369'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"LR", ""'
    - step:
        id: '370'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"MDP", ""'
    - step:
        id: '371'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"FLAG", ""'
    - step:
        id: '372'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"METER_TYPE", ""'
    - step:
        id: '373'
        action: Script
        object_path: End If
    - step:
        id: '374'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"COMMENTS", ""'
    - step:
        id: '375'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"ACTIONED_BY", ""'
    - step:
        id: '376'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"DATE_ACTIONED", ""'
    - step:
        id: '377'
        action: Script
        object_path: End If
    - step:
        id: '378'
        action: Script
        object_path: End If
    - step:
        id: '379'
        action: Script
        object_path: '''Transfer data to formatted report'
    - step:
        id: '380'
        action: Script
        object_path: If (InStr(1, ReportName, "NULLS") > 0) and (ReportName <> "")  Then
    - step:
        id: '381'
        action: Script
        object_path: '''Create headers for formatted report'
    - step:
        id: '382'
        action: Script
        object_path: If ReportType = "Basic" Then
    - step:
        id: '383'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"NMI", ""'
    - step:
        id: '384'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"START_DATE", ""'
    - step:
        id: '385'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"END_DATE", ""'
    - step:
        id: '386'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"ABCON", ""'
    - step:
        id: '387'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"INTERVAL", ""'
    - step:
        id: '388'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"EARLIEST_REVISION", ""'
    - step:
        id: '389'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"LATEST_REVISION", ""'
    - step:
        id: '390'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"COMMENTS", ""'
    - step:
        id: '391'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"ACTIONED_BY", ""'
    - step:
        id: '392'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"DATE_ACTIONED", ""'
    - step:
        id: '393'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"R_DATE", ""'
    - step:
        id: '394'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"SUFFIX", ""'
    - step:
        id: '395'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"TXTNUMDAYS", ""'
    - step:
        id: '396'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"TXT_CSUM", ""'
    - step:
        id: '397'
        action: Script
        object_path: ElseIf ReportType = "Interval" Then
    - step:
        id: '398'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"NMI", ""'
    - step:
        id: '399'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"START_DATE", ""'
    - step:
        id: '400'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"END_DATE", ""'
    - step:
        id: '401'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"SUFFIX", ""'
    - step:
        id: '402'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"COMMENTS", ""'
    - step:
        id: '403'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"ACTIONED_BY", ""'
    - step:
        id: '404'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: AddParameter
        args: '"DATE_ACTIONED", ""'
    - step:
        id: '405'
        action: Script
        object_path: End If
    - step:
        id: '406'
        action: Script
        object_path: intRunLoop = 1
    - step:
        id: '407'
        action: Script
        object_path: '''Add values to the Datatable'
    - step:
        id: '408'
        action: Script
        object_path: If nSheetRows > 0 Then
    - step:
        id: '409'
        action: Script
        object_path: For each key in oDic.Keys
    - step:
        id: '410'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: SetCurrentRow
        args: intRunLoop
    - step:
        id: '411'
        action: Script
        object_path: DataTable("NMI", dtLocalsheet) = key
    - step:
        id: '412'
        action: Script
        object_path: DataTable("START_DATE", dtLocalsheet) = oDicStartDate.Item(key)
    - step:
        id: '413'
        action: Script
        object_path: DataTable("END_DATE", dtLocalsheet) = oDicEndDate.Item(key)
    - step:
        id: '414'
        action: Script
        object_path: DataTable("SUFFIX", dtLocalsheet) = oDicSuffix.Item(key)
    - step:
        id: '415'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: SetCurrentRow
        args: intRunLoop
    - step:
        id: '416'
        action: Script
        object_path: intRunLoop = intRunLoop+1
    - step:
        id: '417'
        action: Script
        object_path: Next
    - step:
        id: '418'
        action: Script
        object_path: End If
    - step:
        id: '419'
        action: Script
        object_path: If ReportType = "Basic" Then
    - step:
        id: '420'
        object_path: '''Datatable'
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '421'
        action: Script
        object_path: If InStr(1, ReportName, "NULLS PRELIM A") > 0 Then
    - step:
        id: '422'
        action: Script
        object_path: If rptNullsPrelimABasic = "" Then
    - step:
        id: '423'
        object_path: Datatable
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '424'
        action: Script
        object_path: rptNullsPrelimABasic = "Done"
    - step:
        id: '425'
        action: Script
        object_path: "ElseIf rptNullsPrelimABasic = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '426'
        action: Script
        object_path: Call AppendRptIfExists(nullsBasicFileName, ReportName, "Action1")
    - step:
        id: '427'
        action: Script
        object_path: End If
    - step:
        id: '428'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS PRELIM B") > 0  Then
    - step:
        id: '429'
        action: Script
        object_path: If rptNullsPrelimBBasic = "" Then
    - step:
        id: '430'
        object_path: Datatable
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '431'
        action: Script
        object_path: rptNullsPrelimBBasic = "Done"
    - step:
        id: '432'
        action: Script
        object_path: "ElseIf rptNullsPrelimBBasic = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '433'
        action: Script
        object_path: Call AppendRptIfExists(nullsBasicFileName, ReportName, "Action1")
    - step:
        id: '434'
        action: Script
        object_path: End If
    - step:
        id: '435'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS R1 A") > 0  Then
    - step:
        id: '436'
        action: Script
        object_path: If rptNullsR1ABasic = "" Then
    - step:
        id: '437'
        object_path: Datatable
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '438'
        action: Script
        object_path: rptNullsR1ABasic = "Done"
    - step:
        id: '439'
        action: Script
        object_path: "ElseIf rptNullsR1ABasic = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '440'
        action: Script
        object_path: Call AppendRptIfExists(nullsBasicFileName, ReportName, "Action1")
    - step:
        id: '441'
        action: Script
        object_path: End If
    - step:
        id: '442'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS R1 B") > 0  Then
    - step:
        id: '443'
        action: Script
        object_path: If rptNullsR1BBasic = "" Then
    - step:
        id: '444'
        object_path: Datatable
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '445'
        action: Script
        object_path: rptNullsR1BBasic = "Done"
    - step:
        id: '446'
        action: Script
        object_path: ElseIf rptNullsR1BBasic = "Done" Then
    - step:
        id: '447'
        action: Script
        object_path: Call AppendRptIfExists(nullsBasicFileName, ReportName, "Action1")
    - step:
        id: '448'
        action: Script
        object_path: End If
    - step:
        id: '449'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS R2 A") > 0  Then
    - step:
        id: '450'
        action: Script
        object_path: If rptNullsR2ABasic = "" Then
    - step:
        id: '451'
        object_path: Datatable
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '452'
        action: Script
        object_path: rptNullsR2ABasic = "Done"
    - step:
        id: '453'
        action: Script
        object_path: "ElseIf rptNullsR2ABasic = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '454'
        action: Script
        object_path: Call AppendRptIfExists(nullsBasicFileName, ReportName, "Action1")
    - step:
        id: '455'
        action: Script
        object_path: End If
    - step:
        id: '456'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS R2 B") > 0  Then
    - step:
        id: '457'
        action: Script
        object_path: If rptNullsR2BBasic = "" Then
    - step:
        id: '458'
        object_path: Datatable
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '459'
        action: Script
        object_path: rptNullsR2BBasic = "Done"
    - step:
        id: '460'
        action: Script
        object_path: "ElseIf rptNullsR2BBasic = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '461'
        action: Script
        object_path: Call AppendRptIfExists(nullsBasicFileName, ReportName, "Action1")
    - step:
        id: '462'
        action: Script
        object_path: End If
    - step:
        id: '463'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS FINAL A") > 0  Then
    - step:
        id: '464'
        action: Script
        object_path: If rptNullsFinalABasic = "" Then
    - step:
        id: '465'
        object_path: Datatable
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '466'
        action: Script
        object_path: rptNullsFinalABasic = "Done"
    - step:
        id: '467'
        action: Script
        object_path: "ElseIf rptNullsFinalABasic = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '468'
        action: Script
        object_path: Call AppendRptIfExists(nullsBasicFileName, ReportName, "Action1")
    - step:
        id: '469'
        action: Script
        object_path: End If
    - step:
        id: '470'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS FINAL B") > 0  Then
    - step:
        id: '471'
        action: Script
        object_path: If rptNullsFinalBBasic = "" Then
    - step:
        id: '472'
        object_path: Datatable
        action: ExportSheet
        args: nullsBasicFileName, dtLocalSheet, ReportName
    - step:
        id: '473'
        action: Script
        object_path: rptNullsFinalBBasic = "Done"
    - step:
        id: '474'
        action: Script
        object_path: "ElseIf rptNullsFinalBBasic = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '475'
        action: Script
        object_path: Call AppendRptIfExists(nullsBasicFileName, ReportName, "Action1")
    - step:
        id: '476'
        action: Script
        object_path: End If
    - step:
        id: '477'
        action: Script
        object_path: End If
    - step:
        id: '478'
        action: Script
        object_path: ElseIf ReportType = "Interval" Then
    - step:
        id: '479'
        object_path: '''Datatable'
        action: ExportSheet
        args: nullsIntervalFileName, dtLocalSheet, ReportName
    - step:
        id: '480'
        action: Script
        object_path: If InStr(1, ReportName, "NULLS PRELIM A") > 0 Then
    - step:
        id: '481'
        action: Script
        object_path: If rptNullsPrelimAInterval = "" Then
    - step:
        id: '482'
        object_path: Datatable
        action: ExportSheet
        args: nullsIntervalFileName, dtLocalSheet, ReportName
    - step:
        id: '483'
        action: Script
        object_path: rptNullsPrelimAInterval = "Done"
    - step:
        id: '484'
        action: Script
        object_path: "ElseIf rptNullsPrelimAInterval = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '485'
        action: Script
        object_path: Call AppendRptIfExists(nullsIntervalFileName, ReportName, "Action1")
    - step:
        id: '486'
        action: Script
        object_path: End If
    - step:
        id: '487'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS PRELIM B") > 0  Then
    - step:
        id: '488'
        action: Script
        object_path: If rptNullsPrelimBInterval = "" Then
    - step:
        id: '489'
        object_path: Datatable
        action: ExportSheet
        args: rptNullsPrelimBInterval, dtLocalSheet, ReportName
    - step:
        id: '490'
        action: Script
        object_path: rptNullsPrelimBBasic = "Done"
    - step:
        id: '491'
        action: Script
        object_path: "ElseIf rptNullsPrelimBBasic = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '492'
        action: Script
        object_path: Call AppendRptIfExists(nullsIntervalFileName, ReportName, "Action1")
    - step:
        id: '493'
        action: Script
        object_path: End If
    - step:
        id: '494'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS R1 A") > 0  Then
    - step:
        id: '495'
        action: Script
        object_path: If rptNullsR1AInterval = "" Then
    - step:
        id: '496'
        object_path: Datatable
        action: ExportSheet
        args: nullsIntervalFileName, dtLocalSheet, ReportName
    - step:
        id: '497'
        action: Script
        object_path: rptNullsR1AInterval = "Done"
    - step:
        id: '498'
        action: Script
        object_path: "ElseIf rptNullsR1AInterval = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '499'
        action: Script
        object_path: Call AppendRptIfExists(nullsIntervalFileName, ReportName, "Action1")
    - step:
        id: '500'
        action: Script
        object_path: End If
    - step:
        id: '501'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS R1 B") > 0  Then
    - step:
        id: '502'
        action: Script
        object_path: If rptNullsR1BInterval = "" Then
    - step:
        id: '503'
        object_path: Datatable
        action: ExportSheet
        args: nullsIntervalFileName, dtLocalSheet, ReportName
    - step:
        id: '504'
        action: Script
        object_path: rptNullsR1BInterval = "Done"
    - step:
        id: '505'
        action: Script
        object_path: "ElseIf rptNullsR1BInterval = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '506'
        action: Script
        object_path: Call AppendRptIfExists(nullsIntervalFileName, ReportName, "Action1")
    - step:
        id: '507'
        action: Script
        object_path: End If
    - step:
        id: '508'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS R2 A") > 0  Then
    - step:
        id: '509'
        action: Script
        object_path: If rptNullsR2AInterval = "" Then
    - step:
        id: '510'
        object_path: Datatable
        action: ExportSheet
        args: nullsIntervalFileName, dtLocalSheet, ReportName
    - step:
        id: '511'
        action: Script
        object_path: rptNullsR2AInterval = "Done"
    - step:
        id: '512'
        action: Script
        object_path: "ElseIf rptNullsR2AInterval = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '513'
        action: Script
        object_path: Call AppendRptIfExists(nullsIntervalFileName, ReportName, "Action1")
    - step:
        id: '514'
        action: Script
        object_path: End If
    - step:
        id: '515'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS R2 B") > 0  Then
    - step:
        id: '516'
        action: Script
        object_path: If rptNullsR2BInterval = "" Then
    - step:
        id: '517'
        object_path: Datatable
        action: ExportSheet
        args: nullsIntervalFileName, dtLocalSheet, ReportName
    - step:
        id: '518'
        action: Script
        object_path: rptNullsR2BInterval = "Done"
    - step:
        id: '519'
        action: Script
        object_path: "ElseIf rptNullsR2BInterval = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '520'
        action: Script
        object_path: Call AppendRptIfExists(nullsIntervalFileName, ReportName, "Action1")
    - step:
        id: '521'
        action: Script
        object_path: End If
    - step:
        id: '522'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS FINAL A") > 0  Then
    - step:
        id: '523'
        action: Script
        object_path: If rptNullsFinalAInterval = "" Then
    - step:
        id: '524'
        object_path: Datatable
        action: ExportSheet
        args: nullsIntervalFileName, dtLocalSheet, ReportName
    - step:
        id: '525'
        action: Script
        object_path: rptNullsFinalAInterval = "Done"
    - step:
        id: '526'
        action: Script
        object_path: "ElseIf rptNullsFinalAInterval = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '527'
        action: Script
        object_path: Call AppendRptIfExists(nullsIntervalFileName, ReportName, "Action1")
    - step:
        id: '528'
        action: Script
        object_path: End If
    - step:
        id: '529'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "NULLS FINAL B") > 0  Then
    - step:
        id: '530'
        action: Script
        object_path: If rptNullsFinalBInterval = "" Then
    - step:
        id: '531'
        object_path: Datatable
        action: ExportSheet
        args: nullsIntervalFileName, dtLocalSheet, ReportName
    - step:
        id: '532'
        action: Script
        object_path: rptNullsFinalBInterval = "Done"
    - step:
        id: '533'
        action: Script
        object_path: "ElseIf rptNullsFinalBInterval = \"Done\" Then\t"
        comment: Append file if report already exists
    - step:
        id: '534'
        action: Script
        object_path: Call AppendRptIfExists(nullsIntervalFileName, ReportName, "Action1")
    - step:
        id: '535'
        action: Script
        object_path: End If
    - step:
        id: '536'
        action: Script
        object_path: End If
    - step:
        id: '537'
        action: Script
        object_path: End If
    - step:
        id: '538'
        action: Script
        object_path: '''Delete columns b ased on the reort type'
    - step:
        id: '539'
        action: Script
        object_path: If ReportType = "Basic" Then
    - step:
        id: '540'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"NMI"'
    - step:
        id: '541'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"START_DATE"'
    - step:
        id: '542'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"END_DATE"'
    - step:
        id: '543'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"ABCON"'
    - step:
        id: '544'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"INTERVAL"'
    - step:
        id: '545'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"EARLIEST_REVISION"'
    - step:
        id: '546'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"LATEST_REVISION"'
    - step:
        id: '547'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"COMMENTS"'
    - step:
        id: '548'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"ACTIONED_BY"'
    - step:
        id: '549'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"DATE_ACTIONED"'
    - step:
        id: '550'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"R_DATE"'
    - step:
        id: '551'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"SUFFIX"'
    - step:
        id: '552'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"TXTNUMDAYS"'
    - step:
        id: '553'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"TXT_CSUM"'
    - step:
        id: '554'
        action: Script
        object_path: ElseIf ReportType = "Interval" Then
    - step:
        id: '555'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"NMI"'
    - step:
        id: '556'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"START_DATE"'
    - step:
        id: '557'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"END_DATE"'
    - step:
        id: '558'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"SUFFIX"'
    - step:
        id: '559'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"COMMENTS"'
    - step:
        id: '560'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"ACTIONED_BY"'
    - step:
        id: '561'
        object_path: DataTable.GetSheet(dtLocalsheet)
        action: DeleteParameter
        args: '"DATE_ACTIONED"'
    - step:
        id: '562'
        action: Script
        object_path: End If
    - step:
        id: '563'
        action: Script
        object_path: ElseIf (InStr(1, ReportName, "ESTIMATES") > 0) and (nSheetRows
          > 0) and (ReportName <> "") Then
    - step:
        id: '564'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"COMMENTS", ""'
    - step:
        id: '565'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"ACTIONED_BY", ""'
    - step:
        id: '566'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: AddParameter
        args: '"DATE_ACTIONED", ""'
    - step:
        id: '567'
        action: Script
        object_path: '''Save the sheet as XLSX document'
    - step:
        id: '568'
        action: Script
        object_path: If ReportType = "Basic" Then
    - step:
        id: '569'
        action: Script
        object_path: If InStr(1, ReportName, "ESTIMATES WEEK A") > 0 Then
    - step:
        id: '570'
        action: Script
        object_path: If rptEstimateWeekABasic = "" Then
    - step:
        id: '571'
        object_path: Datatable
        action: ExportSheet
        args: estimatesBasicFileName, dtGlobalSheet, ReportName
    - step:
        id: '572'
        action: Script
        object_path: rptEstimateWeekABasic = "Done"
    - step:
        id: '573'
        action: Script
        object_path: ElseIf rptEstimateWeekABasic = "Done" Then
    - step:
        id: '574'
        action: Script
        object_path: Call AppendRptIfExists(estimatesBasicFileName, ReportName, "Global")
    - step:
        id: '575'
        action: Script
        object_path: End If
    - step:
        id: '576'
        action: Script
        object_path: '''delete columns'
    - step:
        id: '577'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '578'
        action: Script
        object_path: j = 1
    - step:
        id: '579'
        action: Script
        object_path: For i = 1 to ColNums
    - step:
        id: '580'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: j
    - step:
        id: '581'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '582'
        action: Script
        object_path: If ColNums = 0 Then
    - step:
        id: '583'
        action: Script
        object_path: Exit for
    - step:
        id: '584'
        action: Script
        object_path: End If
    - step:
        id: '585'
        action: Script
        object_path: Next
    - step:
        id: '586'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "ESTIMATES WEEK B") > 0 Then
    - step:
        id: '587'
        action: Script
        object_path: If rptEstimateWeekBBasic = "" Then
    - step:
        id: '588'
        object_path: Datatable
        action: ExportSheet
        args: estimatesBasicFileName, dtGlobalSheet, ReportName
    - step:
        id: '589'
        action: Script
        object_path: rptEstimateWeekBBasic = "Done"
    - step:
        id: '590'
        action: Script
        object_path: ElseIf rptEstimateWeekBBasic = "Done" Then
    - step:
        id: '591'
        action: Script
        object_path: Call AppendRptIfExists(estimatesBasicFileName, ReportName, "Global")
    - step:
        id: '592'
        action: Script
        object_path: End If
    - step:
        id: '593'
        action: Script
        object_path: '''delete columns'
    - step:
        id: '594'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '595'
        action: Script
        object_path: j = 1
    - step:
        id: '596'
        action: Script
        object_path: For i = 1 to ColNums
    - step:
        id: '597'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: j
    - step:
        id: '598'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '599'
        action: Script
        object_path: If ColNums = 0 Then
    - step:
        id: '600'
        action: Script
        object_path: Exit for
    - step:
        id: '601'
        action: Script
        object_path: End If
    - step:
        id: '602'
        action: Script
        object_path: Next
    - step:
        id: '603'
        action: Script
        object_path: End If
    - step:
        id: '604'
        action: Script
        object_path: ElseIf ReportType = "Interval" Then
    - step:
        id: '605'
        action: Script
        object_path: If InStr(1, ReportName, "ESTIMATES WEEK A") > 0 Then
    - step:
        id: '606'
        action: Script
        object_path: If rptEstimateWeekAInterval = "" Then
    - step:
        id: '607'
        object_path: Datatable
        action: ExportSheet
        args: estimatesIntervalFileName, dtGlobalSheet, ReportName
    - step:
        id: '608'
        action: Script
        object_path: rptEstimateWeekAInterval = "Done"
    - step:
        id: '609'
        action: Script
        object_path: ElseIf rptEstimateWeekAInterval = "Done" Then
    - step:
        id: '610'
        action: Script
        object_path: Call AppendRptIfExists(estimatesIntervalFileName, ReportName,
          "Global")
    - step:
        id: '611'
        action: Script
        object_path: End If
    - step:
        id: '612'
        action: Script
        object_path: '''delete columns'
    - step:
        id: '613'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '614'
        action: Script
        object_path: j = 1
    - step:
        id: '615'
        action: Script
        object_path: For i = 1 to ColNums
    - step:
        id: '616'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: j
    - step:
        id: '617'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '618'
        action: Script
        object_path: If ColNums = 0 Then
    - step:
        id: '619'
        action: Script
        object_path: Exit for
    - step:
        id: '620'
        action: Script
        object_path: End If
    - step:
        id: '621'
        action: Script
        object_path: Next
    - step:
        id: '622'
        action: Script
        object_path: ElseIf InStr(1, ReportName, "ESTIMATES WEEK B") > 0 Then
    - step:
        id: '623'
        action: Script
        object_path: If rptEstimateWeekBInterval = "" Then
    - step:
        id: '624'
        object_path: Datatable
        action: ExportSheet
        args: estimatesIntervalFileName, dtGlobalSheet, ReportName
    - step:
        id: '625'
        action: Script
        object_path: rptEstimateWeekBInterval = "Done"
    - step:
        id: '626'
        action: Script
        object_path: ElseIf rptEstimateWeekBInterval = "Done" Then
    - step:
        id: '627'
        action: Script
        object_path: Call AppendRptIfExists(estimatesIntervalFileName, ReportName,
          "Global")
    - step:
        id: '628'
        action: Script
        object_path: End If
    - step:
        id: '629'
        action: Script
        object_path: '''delete columns'
    - step:
        id: '630'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '631'
        action: Script
        object_path: j = 1
    - step:
        id: '632'
        action: Script
        object_path: For i = 1 to ColNums
    - step:
        id: '633'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: j
    - step:
        id: '634'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '635'
        action: Script
        object_path: If ColNums = 0 Then
    - step:
        id: '636'
        action: Script
        object_path: Exit for
    - step:
        id: '637'
        action: Script
        object_path: End If
    - step:
        id: '638'
        action: Script
        object_path: Next
    - step:
        id: '639'
        action: Script
        object_path: End If
    - step:
        id: '640'
        action: Script
        object_path: End If
    - step:
        id: '641'
        action: Script
        object_path: nSheetRows = DataTable.GetSheet("Global").GetRowCount
    - step:
        id: '642'
        action: Script
        object_path: ColNums=DataTable.GetSheet(dtGlobalSheet).getparametercount
    - step:
        id: '643'
        action: Script
        object_path: If (nSheetRows = 0) and (ColNums <> 0)  Then
    - step:
        id: '644'
        action: Script
        object_path: If ReportType = "Basic" Then
    - step:
        id: '645'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"NMI"'
    - step:
        id: '646'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"SFX"'
    - step:
        id: '647'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"START_DATE"'
    - step:
        id: '648'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"END_DATE"'
    - step:
        id: '649'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"FRMP"'
    - step:
        id: '650'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"LR"'
    - step:
        id: '651'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"MDP"'
    - step:
        id: '652'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"FLAG"'
    - step:
        id: '653'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"KWH"'
    - step:
        id: '654'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"COMMENTS"'
    - step:
        id: '655'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"ACTIONED_BY"'
    - step:
        id: '656'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"DATE_ACTIONED"'
    - step:
        id: '657'
        action: Script
        object_path: ElseIf ReportType = "Interval" Then
    - step:
        id: '658'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"NMI"'
    - step:
        id: '659'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"Checksum"'
    - step:
        id: '660'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"SFX"'
    - step:
        id: '661'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"SettDate"'
    - step:
        id: '662'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"FRMP"'
    - step:
        id: '663'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"LR"'
    - step:
        id: '664'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"MDP"'
    - step:
        id: '665'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"FLAG"'
    - step:
        id: '666'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"METER_TYPE"'
    - step:
        id: '667'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"COMMENTS"'
    - step:
        id: '668'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"ACTIONED_BY"'
    - step:
        id: '669'
        object_path: DataTable.GetSheet(dtGlobalSheet)
        action: DeleteParameter
        args: '"DATE_ACTIONED"'
    - step:
        id: '670'
        action: Script
        object_path: End If
    - step:
        id: '671'
        action: Script
        object_path: End If
    - step:
        id: '672'
        action: Script
        object_path: "'\t\tDataTable.GetSheet(dtGlobalSheet).DeleteParameter \"COMMENTS\""
    - step:
        id: '673'
        action: Script
        object_path: "'\t\tDataTable.GetSheet(dtGlobalSheet).DeleteParameter \"ACTIONED_BY\""
    - step:
        id: '674'
        action: Script
        object_path: "'\t\tDataTable.GetSheet(dtGlobalSheet).DeleteParameter \"DATE_ACTIONED\""
    - step:
        id: '675'
        action: Script
        object_path: End If
    - step:
        id: '676'
        action: Script
        object_path: rptParamName = empty
    - step:
        id: '677'
        action: Script
        object_path: ReportType = empty
    - step:
        id: '678'
        action: Script
        object_path: ColNums = empty
    - step:
        id: '679'
        action: Script
        object_path: nSheetRows = empty
    - step:
        id: '680'
        action: Script
        object_path: End If
    - step:
        id: '681'
        action: Script
        object_path: Next
    - step:
        id: '682'
        action: Script
        object_path: '''Clear variable'
    - step:
        id: '683'
        action: Script
        object_path: xmlFolder = empty
    - step:
        id: '684'
        action: Script
        object_path: excelFolder = empty
    - step:
        id: '685'
        action: Script
        object_path: formattedFolder = empty
    - step:
        id: '686'
        action: Script
        object_path: today = empty
    - step:
        id: '687'
        action: Script
        object_path: todaysFormattedfolder = empty
    - step:
        id: '688'
        action: Script
        object_path: fileName = empty
    - step:
        id: '689'
        action: Script
        object_path: rpt = empty
    - step:
        id: '690'
        action: Script
        object_path: rptPrefix = empty
    - step:
        id: '691'
        action: Script
        object_path: rptParameterName =  empty
    - step:
        id: '692'
        action: Script
        object_path: rptParameterVal =  empty
    - step:
        id: '693'
        action: Script
        object_path: ReportName = empty
    - step:
        id: '694'
        action: Script
        object_path: csvFile = empty
    - step:
        id: '695'
        action: Script
        object_path: sheetRows = empty
    - step:
        id: '696'
        action: Script
        object_path: i = empty
    - step:
        id: '697'
        action: Script
        object_path: ToDate =  empty
    - step:
        id: '698'
        action: Script
        object_path: FromDate =  empty
    - step:
        id: '699'
        action: Script
        object_path: nullsFileName = empty
    - step:
        id: '700'
        action: Script
        object_path: estimatesFileName = empty
    - step:
        id: '701'
        action: Script
        object_path: Set oDic = nothing
    - step:
        id: '702'
        action: Script
        object_path: Set oDicStartDate = nothing
    - step:
        id: '703'
        action: Script
        object_path: Set oDicEndDate = nothing
    - step:
        id: '704'
        action: Script
        object_path: Set oDicSuffix = nothing
    - step:
        id: '705'
        action: Script
        object_path: Set reportDetails = nothing
    - step:
        id: '706'
        action: Script
        object_path: estimatesBasicFileName = empty
    - step:
        id: '707'
        action: Script
        object_path: estimatesIntervalFileName = empty
    - step:
        id: '708'
        action: Script
        object_path: nullsBasicFileName = empty
    - step:
        id: '709'
        action: Script
        object_path: nullsIntervalFileName = empty
    - step:
        id: '710'
        action: Script
        object_path: rptParamName = empty
    - step:
        id: '711'
        action: Script
        object_path: ReportType = empty
    - step:
        id: '712'
        action: Script
        object_path: rptNullsPrelimABasic = empty
    - step:
        id: '713'
        action: Script
        object_path: rptNullsPrelimBBasic = empty
    - step:
        id: '714'
        action: Script
        object_path: rptNullsR1ABasic = empty
    - step:
        id: '715'
        action: Script
        object_path: rptNullsR1BBasic = empty
    - step:
        id: '716'
        action: Script
        object_path: rptNullsR2ABasic = empty
    - step:
        id: '717'
        action: Script
        object_path: rptNullsR2BBasic = empty
    - step:
        id: '718'
        action: Script
        object_path: rptNullsFinalABasic = empty
    - step:
        id: '719'
        action: Script
        object_path: rptNullsFinalBBasic = empty
    - step:
        id: '720'
        action: Script
        object_path: rptEstimateWeekABasic = empty
    - step:
        id: '721'
        action: Script
        object_path: rptEstimateWeekBBasic = empty
    - step:
        id: '722'
        action: Script
        object_path: rptNullsPrelimAInterval = empty
    - step:
        id: '723'
        action: Script
        object_path: rptNullsPrelimBInterval = empty
    - step:
        id: '724'
        action: Script
        object_path: rptNullsR1AInterval = empty
    - step:
        id: '725'
        action: Script
        object_path: rptNullsR1BInterval = empty
    - step:
        id: '726'
        action: Script
        object_path: rptNullsR2AInterval = empty
    - step:
        id: '727'
        action: Script
        object_path: rptNullsR2BInterval = empty
    - step:
        id: '728'
        action: Script
        object_path: rptNullsFinalAInterval = empty
    - step:
        id: '729'
        action: Script
        object_path: rptNullsFinalBInterval = empty
    - step:
        id: '730'
        action: Script
        object_path: rptEstimateWeekAInterval = empty
    - step:
        id: '731'
        action: Script
        object_path: rptEstimateWeekBInterval = empty
    - step:
        id: '732'
        action: Script
        object_path: ExitTest
    - step:
        id: '733'
        action: Script
        object_path: Function AppendRptIfExists(File, sheetName, dtSheet)
    - step:
        id: '734'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '735'
        action: Script
        object_path: If objFSO.FileExists(File) Then
    - step:
        id: '736'
        action: Script
        object_path: Set xls = createObject("excel.application")
    - step:
        id: '737'
        object_path: xls
        action: visible=False
    - step:
        id: '738'
        object_path: xls
        action: DisplayAlerts
        args: = False
    - step:
        id: '739'
        action: Script
        object_path: Set workbook = xls.workbooks.open(File)
    - step:
        id: '740'
        action: Script
        object_path: Set sheet = workbook.worksheets(sheetName)
    - step:
        id: '741'
        action: Script
        object_path: sheetRows = sheet.usedrange.rows.count
    - step:
        id: '742'
        action: Script
        object_path: '''sheetColumns = sheet.usedrange.Columns.count'
    - step:
        id: '743'
        action: Script
        object_path: cntRows= DataTable.GlobalSheet.GetRowCount
    - step:
        id: '744'
        action: Script
        object_path: cntColumns= DataTable.GlobalSheet.GetParameterCount
    - step:
        id: '745'
        action: Script
        object_path: For i = 1 To cntRows
    - step:
        id: '746'
        object_path: DataTable.GlobalSheet
        action: SetCurrentRow(i)
    - step:
        id: '747'
        action: Script
        object_path: sheetRows = sheetRows + 1
    - step:
        id: '748'
        action: Script
        object_path: For j = 1 To cntColumns
    - step:
        id: '749'
        action: Script
        object_path: '''NOW FILLUP EXCEL SHEET BY DATATABLE VALUE'
    - step:
        id: '750'
        object_path: sheet.Cells(sheetRows,j) = DataTable
        action: Value(j,dtSheet)
    - step:
        id: '751'
        action: Script
        object_path: Next
    - step:
        id: '752'
        action: Script
        object_path: Next
    - step:
        id: '753'
        object_path: workbook
        action: Save
    - step:
        id: '754'
        object_path: workbook
        action: Close
    - step:
        id: '755'
        object_path: xls
        action: Quit
    - step:
        id: '756'
        action: Script
        object_path: End If
    - step:
        id: '757'
        action: Script
        object_path: Set objFS = NOTHING
    - step:
        id: '758'
        action: Script
        object_path: Set xls = NOTHING
    - step:
        id: '759'
        action: Script
        object_path: End Function
    - step:
        id: '760'
        action: Script
        object_path: '''FilePath = "C:\Users\SVCRPABOT\Desktop\BCRM Reports\formattedFiles\"
          ''CHANGE THE FILE PATH ACCORDINGLY'
    - step:
        id: '761'
        action: Script
        object_path: '''FileName = "05.09.2022 ETSAMDP-BASIC-ESTIMATES-202209050816.xlsx"'
    - step:
        id: '762'
        action: Script
        object_path: '''ReportName = "ESTIMATES WEEK A - WEEK 10"'
    - step:
        id: '763'
        action: Script
        object_path: '''Set objFSO = CreateObject("Scripting.FileSystemObject")'
    - step:
        id: '764'
        action: Script
        object_path: '''If objFSO.FileExists(FilePath & FileName) Then'
    - step:
        id: '765'
        action: Script
        object_path: "'\tSet xls = createObject(\"excel.application\")"
    - step:
        id: '766'
        action: Script
        object_path: "'\txls.visible=True"
    - step:
        id: '767'
        action: Script
        object_path: "'\txls.DisplayAlerts = False"
    - step:
        id: '768'
        action: Script
        object_path: "'\tSet workbook = xls.workbooks.open(FilePath & FileName)"
    - step:
        id: '769'
        action: Script
        object_path: "'\tSet sheet = workbook.worksheets(ReportName)"
    - step:
        id: '770'
        action: Script
        object_path: "'\tsheetRows = sheet.usedrange.rows.count"
    - step:
        id: '771'
        action: Script
        object_path: "'\tsheetColumns = sheet.usedrange.Columns.count"
    - step:
        id: '772'
        action: Script
        object_path: "'\tcntRows= DataTable.GlobalSheet.GetRowCount"
    - step:
        id: '773'
        action: Script
        object_path: "'\tcntColumns= DataTable.GlobalSheet.GetParameterCount"
    - step:
        id: '774'
        action: Script
        object_path: "'\tFor i = 1 To cntLoop"
    - step:
        id: '775'
        action: Script
        object_path: "'\t\tDataTable.GlobalSheet.SetCurrentRow(i)"
    - step:
        id: '776'
        action: Script
        object_path: "'\t\tsheetRows = sheetRows + i"
    - step:
        id: '777'
        action: Script
        object_path: "'\t\tFor j = 1 To cntColumns"
    - step:
        id: '778'
        action: Script
        object_path: "'\t\t\t'NOW FILLUP EXCEL SHEET BY DATATABLE VALUE"
    - step:
        id: '779'
        action: Script
        object_path: "'\t\t\tsheet.Cells(sheetRows,1) = DataTable.Value(j,ReportName)"
    - step:
        id: '780'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '781'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '782'
        action: Script
        object_path: "'\tworkbook.Save"
    - step:
        id: '783'
        action: Script
        object_path: "'\tworkbook.Close"
    - step:
        id: '784'
        action: Script
        object_path: "'\txls.Quit"
    - step:
        id: '785'
        action: Script
        object_path: '''End If'
    - step:
        id: '786'
        action: Script
        object_path: '''Set objFS = NOTHING'
    - step:
        id: '787'
        action: Script
        object_path: '''cntRows= DataTable.GlobalSheet.GetRowCount'
    - step:
        id: '788'
        action: Script
        object_path: '''For i = 1 To cntRows'
    - step:
        id: '789'
        action: Script
        object_path: "'\tDataTable.GlobalSheet.SetCurrentRow i"
    - step:
        id: '790'
        action: Script
        object_path: "'\ttest = DataTable.Value(1,dtGlobalSheet)"
    - step:
        id: '791'
        action: Script
        object_path: "'\tWait 2"
    - step:
        id: '792'
        action: Script
        object_path: '''Next'
    - step:
        id: '793'
        args: '"2"'
        object_path: '''Wait 2'
        action: Script
  outputs:
  - currentFormatFolder:
      robot: true
      value: ${currentFormatFolder}
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
