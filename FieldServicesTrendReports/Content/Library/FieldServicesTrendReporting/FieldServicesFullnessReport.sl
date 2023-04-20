namespace: FieldServicesTrendReporting
operation:
  name: FieldServicesFullnessReport
  sequential_action:
    gav: com.microfocus.seq:FieldServicesTrendReporting.FieldServicesFullnessReport:1.0.0
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
        object_path: '''###################################################################################################################'
    - step:
        id: '2'
        action: Script
        object_path: '''Process Name: "Field Services Performance Reports Update"'
    - step:
        id: '3'
        action: Script
        object_path: '''Created: 22/10/2021'
    - step:
        id: '4'
        action: Script
        object_path: '''Created By: Mohammed Ripon (MODIS)'
    - step:
        id: '5'
        action: Script
        object_path: '''Version: 1.0 Initial version'
    - step:
        id: '6'
        action: Script
        object_path: '''###################################################################################################################'
    - step:
        id: '7'
        action: Script
        object_path: '''Change Log: Record date and reason for change here.'
    - step:
        id: '8'
        action: Script
        object_path: '''Jasmin Haas - Removed the closing of objects as this already
          happens within the flow - 02/05/22'
    - step:
        id: '9'
        action: Script
        object_path: '''Jasmin Haas - Week 3 columns are in different order, added
          handling - 30/06/22'
    - step:
        id: '10'
        action: Script
        object_path: '''Jasmin Haas - Updated the saving of excel files to use Excel
          objects rather than UI - 22/11/22'
    - step:
        id: '11'
        action: Script
        object_path: '''###################################################################################################################'
    - step:
        id: '12'
        action: Script
        object_path: '''Create Folder if doesn''t exist'
    - step:
        id: '13'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '14'
        action: Script
        object_path: If Not objFSO.FolderExists("C:\Users\svcrpabot\OneDrive - SA
          Power Networks\Field Services Trend Report\") Then
    - step:
        id: '15'
        object_path: objFSO
        action: CreateFolder
        args: ("C:\Users\svcrpabot\OneDrive - SA Power Networks\Field Services Trend
          Report\")
    - step:
        id: '16'
        action: Script
        object_path: End If
    - step:
        id: '17'
        action: Script
        object_path: '''Delete all Week files'
    - step:
        id: '18'
        action: Script
        object_path: For i = 1 To 6
    - step:
        id: '19'
        action: Script
        object_path: i = CStr(i)
    - step:
        id: '20'
        action: Script
        object_path: If objFSO.FileExists("C:\Users\svcrpabot\OneDrive - SA Power
          Networks\Field Services Trend Report\Week"&i&".xlsx") Then
    - step:
        id: '21'
        object_path: objFSO
        action: DeleteFile("C:\Users\svcrpabot\OneDrive
        args: '- SA Power Networks\Field Services Trend Report\Week"&i&".xlsx")'
    - step:
        id: '22'
        action: Script
        object_path: End If
    - step:
        id: '23'
        action: Script
        object_path: Next
    - step:
        id: '24'
        action: Script
        object_path: Set objFSO = NOTHING
    - step:
        id: '25'
        action: Script
        object_path: '''Access Power BI Work Management Reporting'
    - step:
        id: '26'
        action: Script
        object_path: URL = "https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/5c89e7b1-aee1-4edf-9ded-c4b90b517ae4/ReportSection"
    - step:
        id: '27'
        action: Script
        object_path: fnAccessURLviaEdge(URL)
    - step:
        id: '28'
        action: Script
        object_path: If Browser("SM-4 Schedule Fullness").Page("Sign in to your account").WebElement("Pick
          an account").Exist(1) Then
    - step:
        id: '29'
        object_path: Browser("SM-4 Schedule Fullness").Page("Sign in to your account").WebButton("Sign
          in with svcrpabot@sapower")
        action: Click
    - step:
        id: '30'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '31'
        action: Script
        object_path: End If
    - step:
        id: '32'
        object_path: Browser("Field Services Performance")
        action: Maximize
    - step:
        id: '33'
        object_path: Browser("Field Services Performance").Page("Reports Main Menu
          - Power").Link("SM-4 Schedule Fullness")
        action: Click
    - step:
        id: '34'
        action: Script
        object_path: While Not Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule
          Fullness").WebElement("innertext:=Fullness %.*","html tag:=H3","index:=0").Exist(0)
    - step:
        id: '35'
        action: Script
        object_path: Wend
    - step:
        id: '36'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '37'
        action: Script
        object_path: '''Updating Week-1 Data'
    - step:
        id: '38'
        action: Script
        object_path: "fn_InputWeekByWeekUtilization\t\"1\""
    - step:
        id: '39'
        action: Script
        object_path: '''Updating Week-2 Data'
    - step:
        id: '40'
        action: Script
        object_path: "fn_InputWeekByWeekUtilization\t\"2\""
    - step:
        id: '41'
        action: Script
        object_path: '''Updating Week-3 Data'
    - step:
        id: '42'
        action: Script
        object_path: "fn_InputWeekByWeekUtilization\t\"3\""
    - step:
        id: '43'
        action: Script
        object_path: '''Updating Week-4 Data'
    - step:
        id: '44'
        action: Script
        object_path: "fn_InputWeekByWeekUtilization\t\"4\""
    - step:
        id: '45'
        action: Script
        object_path: '''Updating Week-5 Data'
    - step:
        id: '46'
        action: Script
        object_path: "fn_InputWeekByWeekUtilization\t\"5\""
    - step:
        id: '47'
        action: Script
        object_path: '''Updating Week-6 Data'
    - step:
        id: '48'
        action: Script
        object_path: "fn_InputWeekByWeekUtilization\t\"6\""
    - step:
        id: '49'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '50'
        object_path: Browser("Field Services Performance")
        action: Close
    - step:
        id: '51'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '52'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '53'
        action: Script
        object_path: URL = EMPTY
    - step:
        id: '54'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '55'
        action: Script
        object_path: ExitTest
    - step:
        id: '56'
        action: Script
        object_path: '''Function for updating'
    - step:
        id: '57'
        action: Script
        object_path: Function fn_InputWeekByWeekUtilization(WeekNo)
    - step:
        id: '58'
        action: Script
        object_path: print weekNo
    - step:
        id: '59'
        action: Script
        object_path: print indx
    - step:
        id: '60'
        action: Script
        object_path: indx = WeekNo - 1
    - step:
        id: '61'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx)
        action: HighLight
    - step:
        id: '62'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '63'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx)
        action: Click
    - step:
        id: '64'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '65'
        action: Script
        object_path: title = Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule
          Fullness").WebElement("innertext:=Week.*","html tag:=H3","index:=" & indx).GetROProperty("innertext")
    - step:
        id: '66'
        action: Script
        object_path: Set regex = New regExp
    - step:
        id: '67'
        object_path: regex
        action: Pattern
        args: = "Week \d+"
    - step:
        id: '68'
        object_path: regex
        action: Global
        args: = True
    - step:
        id: '69'
        action: Script
        object_path: Set Matches = regex.Execute(title)
    - step:
        id: '70'
        action: Script
        object_path: week = Matches(0)
    - step:
        id: '71'
        action: Script
        object_path: dateFrom = Cstr(Right("0" & Day(Date),2) & "/" & Right("0" &
          Month(Date),2) & "/" & Year(date))
    - step:
        id: '72'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx)
        action: Highlight
    - step:
        id: '73'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '74'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 2
    - step:
        id: '75'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx)
        action: Click
    - step:
        id: '76'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '77'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx)
        action: Highlight
    - step:
        id: '78'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '79'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","visible:=True","index:=" & indx)
        comment: 100,5
        action: RightClick
    - step:
        id: '80'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '81'
        action: Script
        object_path: For i = 1 To 5
    - step:
        id: '82'
        action: Script
        object_path: If Not Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule
          Fullness").WebMenu("Add a comment Chat in").Exist(0) Then
    - step:
        id: '83'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx)
        action: Click
    - step:
        id: '84'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '85'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx)
        action: RightClick
    - step:
        id: '86'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '87'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '88'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebMenu("Add
          a comment Chat in")
        action: Highlight
    - step:
        id: '89'
        action: Script
        object_path: Else
    - step:
        id: '90'
        action: Script
        object_path: On Error Resume Next
    - step:
        id: '91'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebMenu("Add
          a comment Chat in")
        action: Highlight
    - step:
        id: '92'
        action: Script
        object_path: Exit For
    - step:
        id: '93'
        action: Script
        object_path: End If
    - step:
        id: '94'
        action: Script
        object_path: If i = 5 And Not Browser("SM-4 Schedule Fullness").Page("SM-4
          Schedule Fullness").WebMenu("Add a comment Chat in").Exist(0) Then
    - step:
        id: '95'
        object_path: Reporter
        action: ReportEvent
        args: micWarning,"Unable to click on SHow as a table object for Week " & WeekNo,""
    - step:
        id: '96'
        action: Script
        object_path: ExitTest
    - step:
        id: '97'
        action: Script
        object_path: End If
    - step:
        id: '98'
        action: Script
        object_path: Next
    - step:
        id: '99'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebMenu("Add
          a comment Chat in")
        action: Select
        args: '"Show as a table"'
    - step:
        id: '100'
        object_path: Setting
        action: WebPackage("ReplayType")
        args: = 1
    - step:
        id: '101'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '102'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebButton("More
          options")
        action: Click
    - step:
        id: '103'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '104'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebMenu("Add
          a comment Chat in")
        action: Select
        args: '"Export data"'
    - step:
        id: '105'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '106'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebButton("Export")
        action: Click
    - step:
        id: '107'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '108'
        action: Script
        object_path: If Window("Excel").WinObject("Message Bars").WinButton("Enable
          Editing").Exist(0) Then
    - step:
        id: '109'
        object_path: Window("Excel").WinObject("Message Bars").WinButton("Enable Editing")
        action: Click
    - step:
        id: '110'
        action: Wait
        args: '"4"'
        default_args: '"1"'
    - step:
        id: '111'
        action: Script
        object_path: End If
    - step:
        id: '112'
        action: Script
        object_path: Set xls = CreateObject("Excel.Application")
    - step:
        id: '113'
        object_path: xls
        action: visible
        args: = true
    - step:
        id: '114'
        action: Script
        object_path: Set objExcel = GetObject(,"Excel.Application")
    - step:
        id: '115'
        action: Script
        object_path: Set workbook1 = objExcel.ActiveWorkbook
    - step:
        id: '116'
        object_path: workbook1
        action: SaveAs("C:\Users\svcrpabot\OneDrive
        args: '- SA Power Networks\Field Services Trend Report\Week" &WeekNo &".xlsx")'
    - step:
        id: '117'
        action: Script
        object_path: set sheet1 = workbook1.worksheets("Sheet1")
    - step:
        id: '118'
        action: Script
        object_path: Rows = sheet1.UsedRange.Rows.Count
    - step:
        id: '119'
        action: Script
        object_path: Set oDicInfo = CreateObject("Scripting.Dictionary")
    - step:
        id: '120'
        action: Script
        object_path: If sheet1.Cells(3,"B").text = "Max of Target" Then
    - step:
        id: '121'
        action: Script
        object_path: colA = "A"
    - step:
        id: '122'
        action: Script
        object_path: colB = "C"
    - step:
        id: '123'
        action: Script
        object_path: colC = "B"
    - step:
        id: '124'
        action: Script
        object_path: Else
    - step:
        id: '125'
        action: Script
        object_path: colA = "A"
    - step:
        id: '126'
        action: Script
        object_path: colB = "B"
    - step:
        id: '127'
        action: Script
        object_path: colC = "C"
    - step:
        id: '128'
        action: Script
        object_path: End If
    - step:
        id: '129'
        action: Script
        object_path: For i = 4 To Rows
    - step:
        id: '130'
        action: Script
        object_path: str = dateFrom & "|" & week & "|" & sheet1.Cells(i,colA) & "|"
          & sheet1.Cells(i,colB) & "|" & sheet1.Cells(i,colC)
    - step:
        id: '131'
        object_path: oDicInfo
        action: Add
        args: str,1
    - step:
        id: '132'
        action: Script
        object_path: str = Empty
    - step:
        id: '133'
        action: Script
        object_path: Next
    - step:
        id: '134'
        action: Script
        object_path: Set workbook2 = xls.workbooks.open("C:\Users\svcrpabot\OneDrive
          - SA Power Networks\Field Services Trend Report\SM-4 Trend v2.xlsx")
    - step:
        id: '135'
        action: Script
        object_path: Set sheet2 = workbook2.worksheets("Data")
    - step:
        id: '136'
        action: Script
        object_path: Rows = sheet2.UsedRange.Rows.Count
    - step:
        id: '137'
        action: Script
        object_path: Rows = Rows + 2
    - step:
        id: '138'
        action: Script
        object_path: "'\tFor i = 3 To Rows"
    - step:
        id: '139'
        action: Script
        object_path: "'\t\tIf sheet2.Cells(i,\"A\") = EMPTY Then"
    - step:
        id: '140'
        action: Script
        object_path: "'\t\t\tExit For"
    - step:
        id: '141'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '142'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '143'
        action: Script
        object_path: "'\tcnt = i - 1"
    - step:
        id: '144'
        action: Script
        object_path: cnt = Rows
    - step:
        id: '145'
        action: Script
        object_path: For each key in oDicInfo.Keys
    - step:
        id: '146'
        action: Script
        object_path: cnt = cnt + 1
    - step:
        id: '147'
        action: Script
        object_path: Arr = Split(key,"|")
    - step:
        id: '148'
        object_path: sheet2
        action: Cells(cnt,"A")
        args: = "'" & Arr(0)
    - step:
        id: '149'
        object_path: sheet2
        action: Cells(cnt,"B")
        args: = Right(Arr(1),Len(Arr(1)) - 5)
    - step:
        id: '150'
        object_path: sheet2
        action: Cells(cnt,"C")
        args: = Arr(2)
    - step:
        id: '151'
        action: Script
        object_path: utilisation = Round(Arr(3) * 100,2)
    - step:
        id: '152'
        object_path: sheet2
        action: Cells(cnt,"D")
        args: = utilisation & "%"
    - step:
        id: '153'
        action: Script
        object_path: maxOfTarget = Round(Arr(4) * 100,2)
    - step:
        id: '154'
        object_path: sheet2
        action: Cells(cnt,"E")
        args: = maxOfTarget & "%"
    - step:
        id: '155'
        action: Script
        object_path: Next
    - step:
        id: '156'
        object_path: workbook1
        action: Close
    - step:
        id: '157'
        object_path: workbook2
        action: Save
    - step:
        id: '158'
        object_path: workbook2
        action: Close
    - step:
        id: '159'
        object_path: xls
        action: Quit
    - step:
        id: '160'
        action: Script
        object_path: If Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx).Exist() = False Then
    - step:
        id: '161'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebButton("Back
          to report")
        action: Click
    - step:
        id: '162'
        action: Script
        object_path: End If
    - step:
        id: '163'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '164'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '165'
        action: Script
        object_path: indx = EMPTY
    - step:
        id: '166'
        action: Script
        object_path: title = EMPTY
    - step:
        id: '167'
        action: Script
        object_path: Set regex = NOTHING
    - step:
        id: '168'
        action: Script
        object_path: week = EMPTY
    - step:
        id: '169'
        action: Script
        object_path: dateFrom = EMPTY
    - step:
        id: '170'
        action: Script
        object_path: set workbook1 = NOTHING
    - step:
        id: '171'
        action: Script
        object_path: set sheet1 = NOTHING
    - step:
        id: '172'
        action: Script
        object_path: Set xls = Nothing
    - step:
        id: '173'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '174'
        action: Script
        object_path: Rows = EMPTY
    - step:
        id: '175'
        action: Script
        object_path: Set oDicInfo = NOTHING
    - step:
        id: '176'
        action: Script
        object_path: i = EMPTY
    - step:
        id: '177'
        action: Script
        object_path: str = Empty
    - step:
        id: '178'
        action: Script
        object_path: Set workbook2 = NOTHING
    - step:
        id: '179'
        action: Script
        object_path: Set sheet2 = NOTHING
    - step:
        id: '180'
        action: Script
        object_path: cnt = EMPTY
    - step:
        id: '181'
        action: Script
        object_path: Arr = EMPTY
    - step:
        id: '182'
        action: Script
        object_path: utilisation = EMPTY
    - step:
        id: '183'
        action: Script
        object_path: maxOfTarget = EMPTY
    - step:
        id: '184'
        action: Script
        object_path: End Function
    - step:
        id: '185'
        action: Script
        object_path: Function fnAccessURLviaEdge(URL)
    - step:
        id: '186'
        object_path: SystemUtil
        action: CloseProcessByName("msedge.exe")
    - step:
        id: '187'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '188'
        object_path: SystemUtil
        action: Run
        args: '"msedge.exe",URL,,,3'
    - step:
        id: '189'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '190'
        action: Script
        object_path: End Function
    - step:
        id: '191'
        action: Script
        object_path: indx = 0
    - step:
        id: '192'
        object_path: Browser("SM-4 Schedule Fullness").Page("SM-4 Schedule Fullness").WebElement("innertext:=Week.*","html
          tag:=H3","index:=" & indx)
        action: highlight
    - step:
        id: '193'
        action: Wait
        args: '"2"'
        default_args: '"1"'
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
      name: Excel
      properties:
      - property:
          value:
            value: Excel
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: XLMAIN
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
          value: XLMAIN
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Monday, 28 November 2022 4:48:25 PM
      child_objects:
      - object:
          class: WinObject
          name: WinObject
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: acc_name
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
              value: window
              name: simclass
              type: STRING
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: WinList
              name: File
              properties:
              - property:
                  value:
                    value: list
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: File
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: list
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WinButton
              name: Browse
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: push button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Browse
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: push button
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
      - object:
          class: WinObject
          name: Ribbon
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Ribbon
                regular_expression: false
              name: acc_name
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: WinButton
              name: File Tab
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: push button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: File Tab
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: push button
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
      - object:
          class: WinObject
          name: Message Bars
          properties:
          - property:
              value:
                value: NetUIHWND
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Message Bars
                regular_expression: false
              name: acc_name
              hidden: false
              read_only: false
              type: STRING
          basic_identification:
            property_ref:
            - regexpwndclass
            - acc_name
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: window
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: WinButton
              name: Enable Editing
              properties:
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: push button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Enable Editing
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - acc_name
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: push button
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
      - object:
          class: Dialog
          name: Save As
          properties:
          - property:
              value:
                value: Save As
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
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
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: WinTreeView
              name: WinTreeView
              properties:
              - property:
                  value:
                    value: SysTreeView32
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: SysTreeView32
                  name: simclass
                  type: STRING
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WinEdit
              name: 'File name:'
              properties:
              - property:
                  value:
                    value: Edit
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'File name:'
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WinButton
              name: Save
              properties:
              - property:
                  value:
                    value: '&Save'
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WinButton
              name: Cancel
              properties:
              - property:
                  value:
                    value: Cancel
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
  - object:
      class: Browser
      name: SM-4 Schedule Fullness
      properties:
      - property:
          value:
            value: SM-4 Schedule Fullness % - Power BI
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Hub Home - Home
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
            value: SM-4 Schedule Fullness % - Power BI
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
            value: '6'
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
      last_update_time: Monday, 28 November 2022 4:48:25 PM
      child_objects:
      - object:
          class: Page
          name: SM-4 Schedule Fullness
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
                value: https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/6daa163c-f9fc-4372-b04e-f3a84b7188eb/ReportSection82e4041d0185bba78196
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/6daa163c-f9fc-4372-b04e-f3a84b7188eb/ReportSection82e4041d0185bba78196
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: SM-4 Schedule Fullness % - Power BI
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
                value: '60083'
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
            active: false
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: WebMenu
              name: Add a comment Chat in
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
                    value: //DIV[7]/DIV[2]/DIV[1]/NG-COMPONENT[1]/PBI-MENU[@role="menu"][1]
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
                    value: PBI-MENU
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
                    value: Add a comment
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: pbi-menu-compact themeableElement pbi-menu-checkable pbi-menu-with-icons
                      ng-star-inserted
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
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: Wk 6
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Wk 6:.*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
                    value: textRun
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
                    value: //VISUAL-CONTAINER[25]/TRANSFORM[1]/DIV[@role="group"][1]/DIV[3]/DIV[1]/VISUAL-MODERN[1]/DIV[1]/DIV[@role="document"][1]/DIV[1]/P[1]/SPAN[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: Wk 5
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Wk 5:.*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
                    value: textRun
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
                    value: //VISUAL-CONTAINER[25]/TRANSFORM[1]/DIV[@role="group"][1]/DIV[3]/DIV[1]/VISUAL-MODERN[1]/DIV[1]/DIV[@role="document"][1]/DIV[1]/P[1]/SPAN[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: Wk 4
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Wk 4:.*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
                    value: textRun
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
                    value: //VISUAL-CONTAINER[25]/TRANSFORM[1]/DIV[@role="group"][1]/DIV[3]/DIV[1]/VISUAL-MODERN[1]/DIV[1]/DIV[@role="document"][1]/DIV[1]/P[1]/SPAN[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: Wk 3
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Wk 3:.*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
                    value: textRun
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
                    value: //VISUAL-CONTAINER[25]/TRANSFORM[1]/DIV[@role="group"][1]/DIV[3]/DIV[1]/VISUAL-MODERN[1]/DIV[1]/DIV[@role="document"][1]/DIV[1]/P[1]/SPAN[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: Wk 2
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Wk 2:.*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
                    value: textRun
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
                    value: //VISUAL-CONTAINER[25]/TRANSFORM[1]/DIV[@role="group"][1]/DIV[3]/DIV[1]/VISUAL-MODERN[1]/DIV[1]/DIV[@role="document"][1]/DIV[1]/P[1]/SPAN[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: Wk 1
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Wk 1:.*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
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
                    value: textRun
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
                    value: //VISUAL-CONTAINER[25]/TRANSFORM[1]/DIV[@role="group"][1]/DIV[3]/DIV[1]/VISUAL-MODERN[1]/DIV[1]/DIV[@role="document"][1]/DIV[1]/P[1]/SPAN[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: Week
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Week.*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: H3
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
                    value: preTextWithEllipsis ng-star-inserted
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
                    value: //VISUAL-CONTAINER/TRANSFORM/DIV[@role="group"]/DIV/DIV/DIV/DIV/DIV/H3[normalize-space()="Week
                      44 - 25/10/2021"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
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
                    value: cdk-overlay-backdrop cdk-overlay-transparent-backdrop cdk-overlay-backdrop-showing
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
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
                    value: //DIV[7]/DIV[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebButton
              name: More options
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
                    value: //VISUAL-CONTAINER[24]/TRANSFORM[1]/DIV[@role="group"][1]/VISUAL-CONTAINER-HEADER[1]/DIV[1]/DIV[1]/DIV[1]/VISUAL-CONTAINER-OPTIONS-MENU[1]/VISUAL-HEADER-ITEM-CONTAINER[1]/DIV[1]/BUTTON[1]
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
                    value: ''
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
                    value: ''
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
                    value: vcMenuBtn
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: More options
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
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
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebButton
              name: Export
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
                    value: //DIV[7]/DIV[2]/DIV[1]/MAT-DIALOG-CONTAINER[@role="dialog"][1]/EXPORT-DATA-DIALOG[1]/MAT-DIALOG-ACTIONS[1]/BUTTON[1]
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
                    value: Export
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Export
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
                    value: mat-focus-indicator pbi-modern-button primaryBtn exportButton
                      mat-button mat-button-base cdk-focused cdk-mouse-focused
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Export
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
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
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebButton
              name: Back to report
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
                    value: //VISUAL-CONTAINER/TRANSFORM/DIV[@role="group"]/DIV/VISUAL-CONTAINER-POP-OUT-BAR/DIV/DIV/BUTTON[normalize-space()="Back
                      to report"]
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
                    value: Back to report
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
                    value: Back to report
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
                    value: ''
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
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
      - object:
          class: Page
          name: Sign in to your account
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
                value: https://login.microsoftonline.com/common/oauth2/authorize
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://login.microsoftonline.com/common/oauth2/authorize?client_id=871c010f-5e61-4fb1-83ac-98610a7e9110&response_type=code+id_token&scope=openid+profile+offline_access&state=OpenIdConnect.AuthenticationProperties%3djDPREcRvikrLauu8m-jDprpqESfXJ38xda6uQxgV7hFM8a1aV_cdETZ_LKgXpmRpzKYlo_IDHLjHlTgZt8b5AuQWZPOMMCTbJx-Dm5Ka_kmfcW04CWoLRVPwxoQRYAyn7ILxfFpQnhpJLwdLPDlLvozFB--6aRXONhWB7beyl4VARrAP7niwRgXTzOZcLPLj48Qf35AbSV2-HibFhP1dYrh5pZlqxfF8uGbxsVPQYaS9rzHfn0Y3UhE4pEbafdRe-HwVi5iarEZJ1MJ6pRN2Hs09Uf9ZoR7TIY_OJYp2lPU&response_mode=form_post&nonce=637708111037123659.MTgwZGNhOTAtZmM4OC00NzhiLWFlZTUtNjNkNTc1NjE5NDUwNzI5NDI5OGMtMmMwMC00M2I2LWE0ODItNjQwZGYwMmJmM2U2&site_id=500453&redirect_uri=https%3a%2f%2fapp.powerbi.com%2fgroups%2fme%2fapps%2fac6a304c-62b7-4e13-bdd8-7491ab237593%2freports%2f5c89e7b1-aee1-4edf-9ded-c4b90b517ae4%2fReportSection&post_logout_redirect_uri=https%3a%2f%2fapp.powerbi.com%2fgroups%2fme%2fapps%2fac6a304c-62b7-4e13-bdd8-7491ab237593%2freports%2f5c89e7b1-aee1-4edf-9ded-c4b90b517ae4%2fReportSection&resource=https%3a%2f%2fanalysis.windows.net%2fpowerbi%2fapi&nux=1&msafed=0&x-client-SKU=ID_NET461&x-client-ver=5.6.0.0&sso_nonce=AwABAAAAAAACAOz_BAD0_--CwgjIfuYFGS_8WLwblEkRrbmu_5ObilDeE4BsUIBiW2SWattwaHKe6diAI0_2NSMQHUGNQW18Is1WeSaaeHogAA&client-request-id=8ab70530-14a9-4f0b-a1eb-6e01835bfbc8&mscrid=8ab70530-14a9-4f0b-a1eb-6e01835bfbc8
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Sign in to your account
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
                value: '10007'
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
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: WebElement
              name: Pick an account
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Pick an account
                    regular_expression: false
                  name: innertext
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
                    value: ''
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="loginHeader"]/DIV[@role="heading"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier:
                  value: 1
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: false
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebButton
              name: Sign in with svcrpabot@sapower
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
                    value: //DIV[@id="tilesHolder"]/DIV[1]/DIV[@role="listitem"][1]/DIV[@role="button"][1]
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
                    value: svcrpabot                                svcrpabot@sapowernetworks.com.au                                                                                Connected
                      to Windows
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
                    value: .*sapowernetworks.com.au.*
                    regular_expression: true
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
                    value: table
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Sign in with svcrpabot@sapowernetworks.com.au work or school
                      account.
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
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
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
  - object:
      class: Browser
      name: Reports Main Menu - Power
      properties:
      - property:
          value:
            value: Reports Main Menu - Power BI
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://login.microsoftonline.com/common/oauth2/authorize?client_id=871c010f-5e61-4fb1-83ac-98610a7e9110&response_type=code%20id_token&scope=openid%20profile%20offline_access&state=OpenIdConnect.AuthenticationProperties%3DdBcbkBvZMlyN7fuyvPwU9xHQb7Hxj3vp2lMg-KmuLcLCA3u9TuXHExR-XayHqqOQxLwFQoWx-D52k2DQ7sUr7e9M51Y5n3ETEqT2cPsAHCQBdoXS1NQfWRBKI7Kb2jaQ1iFNaPyvqzedxcOrGzJqhEvBJSdPpSt_rfNgvX54HL5Vcj3IamMpA4uT0Wkj9v95LBmk7Nz4vcN3Zq3zbKqGpU_77n3KgZ8KKT_llCe4SEwevm6KgGmOcihciRbSxBtnMGly0tGWb575b0Wgc7gcG7PSjR9TFeEM8DA6g24VM8g&response_mode=form_post&nonce=637704642169722923.OGU5NTg0NTItODkwMi00Y2M4LTljNWYtY2UzZjFlZDNkNjI1MTlkNWNkNGYtZGM2OC00MzljLWFlMjktY2Y0Y2Q2OGE5OWEy&site_id=500453&redirect_uri=https%3A%2F%2Fapp.powerbi.com%2Fgroups%2Fme%2Fapps%2Fac6a304c-62b7-4e13-bdd8-7491ab237593%2Freports%2F5c89e7b1-aee1-4edf-9ded-c4b90b517ae4%2FReportSection&post_logout_redirect_uri=https%3A%2F%2Fapp.powerbi.com%2Fgroups%2Fme%2Fapps%2Fac6a304c-62b7-4e13-bdd8-7491ab237593%2Freports%2F5c89e7b1-aee1-4edf-9ded-c4b90b517ae4%2FReportSection&resource=https%3A%2F%2Fanalysis.windows.net%2Fpowerbi%2Fapi&nux=1&msafed=0&x-client-SKU=ID_NET461&x-client-ver=5.6.0.0
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
            value: Reports Main Menu - Power BI
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
        active: false
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 28 November 2022 4:48:25 PM
      child_objects:
      - object:
          class: Page
          name: Reports Main Menu - Power
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
                value: https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/5c89e7b1-aee1-4edf-9ded-c4b90b517ae4/ReportSection
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/5c89e7b1-aee1-4edf-9ded-c4b90b517ae4/ReportSection
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Reports Main Menu - Power BI
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
                value: ''
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: STRING
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
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects: []
  - object:
      class: Browser
      name: Field Services Performance
      properties:
      - property:
          value:
            value: Field Services Performance
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com/sites/FieldServices/SitePages/Field-Services-Performance.aspx
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Field Services Performance
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
            value: Field Services Performance
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
        active: false
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 28 November 2022 4:48:25 PM
      child_objects:
      - object:
          class: Page
          name: SM-4 Schedule Fullness
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
                value: https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/6daa163c-f9fc-4372-b04e-f3a84b7188eb/ReportSection82e4041d0185bba78196
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/6daa163c-f9fc-4372-b04e-f3a84b7188eb/ReportSection82e4041d0185bba78196
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: SM-4 Schedule Fullness % - Power BI
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
                value: '50083'
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
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: WebMenu
              name: Add a comment Chat in
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
                    value: //DIV[6]/DIV[2]/DIV[1]/NG-COMPONENT[1]/PBI-MENU[@role="menu"][1]
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
                    value: PBI-MENU
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
                    value: Add a comment
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: pbi-menu-compact themeableElement pbi-menu-checkable pbi-menu-with-icons
                      ng-star-inserted
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
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement
              properties:
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
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
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
                    value: cdk-overlay-backdrop cdk-overlay-transparent-backdrop cdk-overlay-backdrop-showing
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
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
                    value: //DIV[6]/DIV[3]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - _xpath
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
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebButton
              name: More options
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
                    value: //VISUAL-CONTAINER[24]/TRANSFORM[1]/DIV[@role="group"][1]/VISUAL-CONTAINER-HEADER[1]/DIV[1]/DIV[1]/DIV[1]/VISUAL-CONTAINER-OPTIONS-MENU[1]/VISUAL-HEADER-ITEM-CONTAINER[1]/DIV[1]/BUTTON[1]
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
                    value: ''
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
                    value: ''
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
                    value: vcMenuBtn
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: More options
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
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
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebButton
              name: Filters Show/hide pane
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
                    value: //EXPLORATION-HOST[@id="pvExplorationHost"]/DIV[1]/DIV[1]/EXPLORATION[1]/DIV[@role="application"][1]/EXPLORE-CANVAS[1]/DIV[1]/DIV[2]/OUTSPACE-PANE[1]/ARTICLE[@role="presentation"][1]/DIV[1]/BUTTON[2]
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
                    value: ''
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
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
                    value: btn collapseIcon pbi-borderless-button glyphicon glyph-mini
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Filters Show/hide pane
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
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
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebButton
              name: Export
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
                    value: //DIV[6]/DIV[2]/DIV[1]/MAT-DIALOG-CONTAINER[@role="dialog"][1]/EXPORT-DATA-DIALOG[1]/MAT-DIALOG-ACTIONS[1]/BUTTON[1]
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
                    value: Export
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Export
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
                    value: mat-focus-indicator pbi-modern-button primaryBtn exportButton
                      mat-button mat-button-base cdk-focused cdk-mouse-focused
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Export
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - role
                - name
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
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
          - object:
              class: WebButton
              name: .xlsx (Excel 150,000-row
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
                    value: //DIV[3]/PBI-DROPDOWN[1]/BUTTON[1]
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
                    value: .xlsx (Excel 150,000-row max)
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
                    value: .xlsx (Excel 150,000-row max)
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
                    value: popout-button themeableElement ng-star-inserted
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
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
      - object:
          class: Page
          name: Reports Main Menu - Power
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
                value: https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/5c89e7b1-aee1-4edf-9ded-c4b90b517ae4/ReportSection
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://app.powerbi.com/groups/me/apps/ac6a304c-62b7-4e13-bdd8-7491ab237593/reports/5c89e7b1-aee1-4edf-9ded-c4b90b517ae4/ReportSection
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Reports Main Menu - Power BI
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
                value: '50083'
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
            active: false
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: Link
              name: SM-4 Schedule Fullness
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
                    value: //MAT-LIST-ITEM[7]/DIV[1]/DIV[@role="link"][1]
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
                    value: .*SM-4.*Schedule.*Fullness.*%.*
                    regular_expression: true
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SM-4 Schedule Fullness %
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
                    value: undefined
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: itemRow pbi-focus-outline
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
                - _xpath
                - text
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
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
      - object:
          class: Page
          name: Field Services Performance
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
                value: https://sapowernetworks.sharepoint.com/sites/FieldServices/SitePages/Field-Services-Performance.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/FieldServices/SitePages/Field-Services-Performance.aspx
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Field Services Performance
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
                value: '10082'
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
          last_update_time: Monday, 28 November 2022 4:48:25 PM
          child_objects:
          - object:
              class: Image
              name: FSP034%20Work%20Management%20D
              properties:
              - property:
                  value:
                    value: Image
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@role="presentation"][4]/DIV[1]/DIV[1]/DIV[@role="listitem"][1]/A[1]/DIV[1]/DIV[1]/DIV[@role="img"][1]/SPAN[1]/DIV[1]/IMG[@role="presentation"][1]
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
                    value: Image
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Image Link
                    regular_expression: false
                  name: image type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: IMG
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
                    value: FSP034%20Work%20Management%20Dashbaord.png?_oat_=1634918743_d75c7e70a7832e3152d9643d8ad927a075e4774711df3f2699905441bd51a44f&P1=1634869752&P2=-798338080&P3=1&P4=CJAIJNlPQeUwqtEcCmZ51Ed%2fsf87MYP5ia8kJpoYslcXk%2byz%2bQSHeYsP9j9vO95v3h4F2jY3BVygNWlHN1j9iT1NNR7PbWcoEXuEalSFTp7VdWra3e6dovOIH9BX6bTlgqkhDrUp8r9mTZ%2bic44mAoDjdPOsYroAnNBisdIHDi4xZnfTzQgyX%2fT1%2frJEpL8S9gzVw1Dg9unYPL7PhM4EdRYQncRtjfs%2fIXsQ3hbzzagcXyDM63GswT9sF54fHOOSr5hO36gWTROKn1Dm%2fvF3Ns8BvBp3EcdhyFo5NiYbsTEIha7DQ0Yaa%2b8%2fwHXW5Xyd8hUeqzfmz%2fYZWqalqddRqw%3d%3d&width=400
                    regular_expression: false
                  name: file name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-Image-image is-loaded ms-Image-image--cover ms-Image-image--portrait
                      is-fadeIn image-172
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: alt
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - image type
                - html tag
                - alt
                ordinal_identifier:
                  value: 5
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - alt
                  - image type
                  - html id
                  - name
                  - file name
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 28 November 2022 4:48:25 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
