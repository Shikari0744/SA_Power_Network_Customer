namespace: AEMO_Compliance_Reporting
operation:
  name: FormatCleanup
  inputs:
  - wipFile
  - weekDay
  - location
  sequential_action:
    gav: com.microfocus.seq:AEMO_Compliance_Reporting.FormatCleanup:1.0.0
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
        object_path: '''Format Cleanup'
    - step:
        id: '2'
        action: Script
        object_path: location = Parameter("location")
    - step:
        id: '3'
        action: Script
        object_path: formatFileLoc = location&"Formatted Files\"
    - step:
        id: '4'
        action: Script
        object_path: ExcelFileLoc = location&"Excel Files\"
    - step:
        id: '5'
        action: Script
        object_path: wipFile = Parameter("wipFile")
    - step:
        id: '6'
        action: Script
        object_path: dayofWeek = Parameter("weekDay")
    - step:
        id: '7'
        action: Script
        object_path: currentFileName = ExcelFileLoc&wipFile
    - step:
        id: '8'
        action: Script
        object_path: formatFile = formatFileLoc&wipFile
    - step:
        id: '9'
        action: Script
        object_path: Set oFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '10'
        action: Script
        object_path: If oFSO.FileExists(currentFileName) Then
    - step:
        id: '11'
        object_path: oFSO
        comment: ' copy file by overwrite'
        action: CopyFile
        args: currentFileName, formatFileLoc, True
    - step:
        id: '12'
        action: Script
        object_path: End If
    - step:
        id: '13'
        action: Script
        object_path: Set oFSO = Nothing
    - step:
        id: '14'
        action: Script
        object_path: set xls = createObject("excel.application")
    - step:
        id: '15'
        object_path: xls
        action: visible=false
    - step:
        id: '16'
        action: Script
        object_path: set workbook = xls.workbooks.open(formatFile)
    - step:
        id: '17'
        action: Script
        object_path: For Each wksht in workbook.Worksheets
    - step:
        id: '18'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '19'
        action: Script
        object_path: set sheet = workbook.worksheets(wkshtNameStr)
    - step:
        id: '20'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '21'
        action: Script
        object_path: If (dayofWeek = "Monday") and (wkshtNameStr = "ADWNAN") Then
    - step:
        id: '22'
        object_path: sheet
        action: Cells(1,usedcolumn+1)
        args: = "New/Old"
    - step:
        id: '23'
        object_path: sheet
        action: Cells(1,usedcolumn+2)
        args: = "Notes"
    - step:
        id: '24'
        object_path: sheet
        action: Cells(1,usedcolumn+3)
        args: = "MDP Notes"
    - step:
        id: '25'
        object_path: sheet
        action: Cells(1,usedcolumn+4)
        args: = "Other"
    - step:
        id: '26'
        object_path: sheet.cells(1,1).Entirerow.Columns
        action: AutoFit
    - step:
        id: '27'
        action: Script
        object_path: Else
    - step:
        id: '28'
        object_path: sheet
        action: Cells(1,usedcolumn+1)
        args: = "New/Old"
    - step:
        id: '29'
        object_path: sheet
        action: Cells(1,usedcolumn+2)
        args: = "Notes"
    - step:
        id: '30'
        object_path: sheet.cells(1,1).Entirerow.Columns
        action: AutoFit
    - step:
        id: '31'
        action: Script
        object_path: End If
    - step:
        id: '32'
        object_path: workbook
        action: Save
    - step:
        id: '33'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '34'
        action: Script
        object_path: Next
    - step:
        id: '35'
        action: Script
        object_path: '''set xls = createObject("excel.application")'
    - step:
        id: '36'
        object_path: '''xls'
        action: visible=false
    - step:
        id: '37'
        action: Script
        object_path: For Each wksht in workbook.Worksheets
    - step:
        id: '38'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '39'
        action: Script
        object_path: set sheet = workbook.worksheets(wkshtNameStr)
    - step:
        id: '40'
        action: Script
        object_path: Select Case dayofWeek
    - step:
        id: '41'
        action: Script
        object_path: Case "Monday"
    - step:
        id: '42'
        action: Script
        object_path: ''' delete dolumns for worksheet "ADWNAN_BASIC"'
    - step:
        id: '43'
        action: Script
        object_path: If wkshtNameStr = "ADWNAN" Then
    - step:
        id: '44'
        action: Script
        object_path: '''Delete "RoleId" Column'
    - step:
        id: '45'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '46'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '47'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '48'
        action: Script
        object_path: If cellValue = "RoleId" Then
    - step:
        id: '49'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '50'
        action: Script
        object_path: Exit For
    - step:
        id: '51'
        action: Script
        object_path: End If
    - step:
        id: '52'
        action: Script
        object_path: Next
    - step:
        id: '53'
        action: Script
        object_path: '''Delete "Source" Column'
    - step:
        id: '54'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '55'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '56'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '57'
        action: Script
        object_path: If cellValue = "Source" Then
    - step:
        id: '58'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '59'
        action: Script
        object_path: Exit For
    - step:
        id: '60'
        action: Script
        object_path: End If
    - step:
        id: '61'
        action: Script
        object_path: Next
    - step:
        id: '62'
        action: Script
        object_path: '''Delete "Table" Column'
    - step:
        id: '63'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '64'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '65'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '66'
        action: Script
        object_path: If cellValue = "Table" Then
    - step:
        id: '67'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
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
        action: Script
        object_path: '''Delete "SDR_Key2" Column'
    - step:
        id: '72'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '73'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '74'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '75'
        action: Script
        object_path: If cellValue = "SDR_Key2" Then
    - step:
        id: '76'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '77'
        action: Script
        object_path: Exit For
    - step:
        id: '78'
        action: Script
        object_path: End If
    - step:
        id: '79'
        action: Script
        object_path: Next
    - step:
        id: '80'
        action: Script
        object_path: '''Delete "SDR_Key3" Column'
    - step:
        id: '81'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '82'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '83'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '84'
        action: Script
        object_path: If cellValue = "SDR_Key3" Then
    - step:
        id: '85'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '86'
        action: Script
        object_path: Exit For
    - step:
        id: '87'
        action: Script
        object_path: End If
    - step:
        id: '88'
        action: Script
        object_path: Next
    - step:
        id: '89'
        action: Script
        object_path: '''Delete "SDR_Key4" Column'
    - step:
        id: '90'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '91'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '92'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '93'
        action: Script
        object_path: If cellValue = "SDR_Key4" Then
    - step:
        id: '94'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '95'
        action: Script
        object_path: Exit For
    - step:
        id: '96'
        action: Script
        object_path: End If
    - step:
        id: '97'
        action: Script
        object_path: Next
    - step:
        id: '98'
        action: Script
        object_path: '''Delete "SDR_Key5" Column'
    - step:
        id: '99'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '100'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '101'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '102'
        action: Script
        object_path: If cellValue = "SDR_Key5" Then
    - step:
        id: '103'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '104'
        action: Script
        object_path: Exit For
    - step:
        id: '105'
        action: Script
        object_path: End If
    - step:
        id: '106'
        action: Script
        object_path: Next
    - step:
        id: '107'
        action: Script
        object_path: '''Delete "Field" Column'
    - step:
        id: '108'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '109'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '110'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '111'
        action: Script
        object_path: If cellValue = "Field" Then
    - step:
        id: '112'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '113'
        action: Script
        object_path: Exit For
    - step:
        id: '114'
        action: Script
        object_path: End If
    - step:
        id: '115'
        action: Script
        object_path: Next
    - step:
        id: '116'
        action: Script
        object_path: End If
    - step:
        id: '117'
        action: Script
        object_path: "'\t' delete dolumns for worksheet \"ADWNAN_INTERVAL\""
    - step:
        id: '118'
        action: Script
        object_path: "'\tIf wkshtNameStr = \"ADWNAN_INTERVAL\" Then"
    - step:
        id: '119'
        action: Script
        object_path: "'\t\t'Delete \"RoleId\" Column"
    - step:
        id: '120'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '121'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '122'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '123'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"RoleId\" Then"
    - step:
        id: '124'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '125'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '126'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '127'
        action: Script
        object_path: "'\t\t'Delete \"Source\" Column"
    - step:
        id: '128'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '129'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '130'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '131'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Source\" Then"
    - step:
        id: '132'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '133'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '134'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '135'
        action: Script
        object_path: "'\t\t'Delete \"Table\" Column"
    - step:
        id: '136'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '137'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '138'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '139'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Table\" Then"
    - step:
        id: '140'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '141'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '142'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '143'
        action: Script
        object_path: "'\t\t'Delete \"SDR_Key2\" Column"
    - step:
        id: '144'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '145'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '146'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '147'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"SDR_Key2\" Then"
    - step:
        id: '148'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '149'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '150'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '151'
        action: Script
        object_path: "'\t\t'Delete \"SDR_Key3\" Column"
    - step:
        id: '152'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '153'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '154'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '155'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"SDR_Key3\" Then"
    - step:
        id: '156'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '157'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '158'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '159'
        action: Script
        object_path: "'\t\t'Delete \"SDR_Key4\" Column"
    - step:
        id: '160'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '161'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '162'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '163'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"SDR_Key4\" Then"
    - step:
        id: '164'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '165'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '166'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '167'
        action: Script
        object_path: "'\t\t'Delete \"SDR_Key5\" Column"
    - step:
        id: '168'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '169'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '170'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '171'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"SDR_Key5\" Then"
    - step:
        id: '172'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '173'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '174'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '175'
        action: Script
        object_path: "'\t\t'Delete \"Field\" Column"
    - step:
        id: '176'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '177'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '178'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '179'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Field\" Then"
    - step:
        id: '180'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '181'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '182'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '183'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '184'
        action: Script
        object_path: ''' delete dolumns for worksheet "NMIST1"'
    - step:
        id: '185'
        action: Script
        object_path: If wkshtNameStr = "NMIST" Then
    - step:
        id: '186'
        action: Script
        object_path: '''Delete "RoleId" Column'
    - step:
        id: '187'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '188'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '189'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '190'
        action: Script
        object_path: If cellValue = "RoleId" Then
    - step:
        id: '191'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '192'
        action: Script
        object_path: Exit For
    - step:
        id: '193'
        action: Script
        object_path: End If
    - step:
        id: '194'
        action: Script
        object_path: Next
    - step:
        id: '195'
        action: Script
        object_path: '''Delete "Source" Column'
    - step:
        id: '196'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '197'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '198'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '199'
        action: Script
        object_path: If cellValue = "Source" Then
    - step:
        id: '200'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '201'
        action: Script
        object_path: Exit For
    - step:
        id: '202'
        action: Script
        object_path: End If
    - step:
        id: '203'
        action: Script
        object_path: Next
    - step:
        id: '204'
        action: Script
        object_path: '''Delete "Table" Column'
    - step:
        id: '205'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '206'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '207'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '208'
        action: Script
        object_path: If cellValue = "Table" Then
    - step:
        id: '209'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '210'
        action: Script
        object_path: Exit For
    - step:
        id: '211'
        action: Script
        object_path: End If
    - step:
        id: '212'
        action: Script
        object_path: Next
    - step:
        id: '213'
        action: Script
        object_path: '''Delete "SDR_Key2" Column'
    - step:
        id: '214'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '215'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '216'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '217'
        action: Script
        object_path: If cellValue = "SDR_Key2" Then
    - step:
        id: '218'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '219'
        action: Script
        object_path: Exit For
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
        object_path: '''Delete "SDR_Key3" Column'
    - step:
        id: '223'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '224'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '225'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '226'
        action: Script
        object_path: If cellValue = "SDR_Key3" Then
    - step:
        id: '227'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '228'
        action: Script
        object_path: Exit For
    - step:
        id: '229'
        action: Script
        object_path: End If
    - step:
        id: '230'
        action: Script
        object_path: Next
    - step:
        id: '231'
        action: Script
        object_path: '''Delete "Value5" Column'
    - step:
        id: '232'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '233'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '234'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '235'
        action: Script
        object_path: If cellValue = "Value5" Then
    - step:
        id: '236'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '237'
        action: Script
        object_path: Exit For
    - step:
        id: '238'
        action: Script
        object_path: End If
    - step:
        id: '239'
        action: Script
        object_path: Next
    - step:
        id: '240'
        action: Script
        object_path: '''Delete "Field" Column'
    - step:
        id: '241'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '242'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '243'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '244'
        action: Script
        object_path: If cellValue = "Field" Then
    - step:
        id: '245'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '246'
        action: Script
        object_path: Exit For
    - step:
        id: '247'
        action: Script
        object_path: End If
    - step:
        id: '248'
        action: Script
        object_path: Next
    - step:
        id: '249'
        action: Script
        object_path: End If
    - step:
        id: '250'
        action: Script
        object_path: "'\t' delete dolumns for worksheet \"NMIST2\""
    - step:
        id: '251'
        action: Script
        object_path: "'\tIf wkshtNameStr = \"NMIST2\" Then"
    - step:
        id: '252'
        action: Script
        object_path: "'\t\t'Delete \"RoleId\" Column"
    - step:
        id: '253'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '254'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '255'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '256'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"RoleId\" Then"
    - step:
        id: '257'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '258'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '259'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '260'
        action: Script
        object_path: "'\t\t'Delete \"Source\" Column"
    - step:
        id: '261'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '262'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '263'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '264'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Source\" Then"
    - step:
        id: '265'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '266'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '267'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '268'
        action: Script
        object_path: "'\t\t'Delete \"Table\" Column"
    - step:
        id: '269'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '270'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '271'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '272'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Table\" Then"
    - step:
        id: '273'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '274'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '275'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '276'
        action: Script
        object_path: "'\t\t'Delete \"SDR_Key2\" Column"
    - step:
        id: '277'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '278'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '279'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '280'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"SDR_Key2\" Then"
    - step:
        id: '281'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '282'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '283'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '284'
        action: Script
        object_path: "'\t\t'Delete \"SDR_Key3\" Column"
    - step:
        id: '285'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '286'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '287'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '288'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"SDR_Key3\" Then"
    - step:
        id: '289'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '290'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '291'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '292'
        action: Script
        object_path: "'\t\t'Delete \"Value5\" Column"
    - step:
        id: '293'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '294'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '295'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '296'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Value5\" Then"
    - step:
        id: '297'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '298'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '299'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '300'
        action: Script
        object_path: "'\t\t'Delete \"Field\" Column"
    - step:
        id: '301'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '302'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '303'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '304'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Field\" Then"
    - step:
        id: '305'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '306'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '307'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '308'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '309'
        action: Script
        object_path: "'\t' delete dolumns for worksheet \"NMIST3\""
    - step:
        id: '310'
        action: Script
        object_path: "'\tIf wkshtNameStr = \"NMIST3\" Then"
    - step:
        id: '311'
        action: Script
        object_path: "'\t\t'Delete \"RoleId\" Column"
    - step:
        id: '312'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '313'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '314'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '315'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"RoleId\" Then"
    - step:
        id: '316'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '317'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '318'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '319'
        action: Script
        object_path: "'\t\t'Delete \"Source\" Column"
    - step:
        id: '320'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '321'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '322'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '323'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Source\" Then"
    - step:
        id: '324'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '325'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '326'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '327'
        action: Script
        object_path: "'\t\t'Delete \"Table\" Column"
    - step:
        id: '328'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '329'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '330'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '331'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Table\" Then"
    - step:
        id: '332'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '333'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '334'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '335'
        action: Script
        object_path: "'\t\t'Delete \"SDR_Key2\" Column"
    - step:
        id: '336'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '337'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '338'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '339'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"SDR_Key2\" Then"
    - step:
        id: '340'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '341'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '342'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '343'
        action: Script
        object_path: "'\t\t'Delete \"SDR_Key3\" Column"
    - step:
        id: '344'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '345'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '346'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '347'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"SDR_Key3\" Then"
    - step:
        id: '348'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '349'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '350'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '351'
        action: Script
        object_path: "'\t\t'Delete \"Value5\" Column"
    - step:
        id: '352'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '353'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '354'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '355'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Value5\" Then"
    - step:
        id: '356'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '357'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '358'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '359'
        action: Script
        object_path: "'\t\t'Delete \"Field\" Column"
    - step:
        id: '360'
        action: Script
        object_path: "'\t\tusedcolumn = Sheet.Evaluate(\"COUNTA(1:1)\")"
    - step:
        id: '361'
        action: Script
        object_path: "'\t\tFor i = 1 to usedcolumn"
    - step:
        id: '362'
        action: Script
        object_path: "'\t\t\tcellValue = sheet.Cells(1,i)"
    - step:
        id: '363'
        action: Script
        object_path: "'\t\t\tIf cellValue = \"Field\" Then"
    - step:
        id: '364'
        action: Script
        object_path: "'\t\t\t\tsheet.Cells(1,i).EntireColumn.Delete"
    - step:
        id: '365'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '366'
        action: Script
        object_path: "'\t\tNext"
    - step:
        id: '367'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '368'
        action: Script
        object_path: Case "Wednesday"
    - step:
        id: '369'
        action: Script
        object_path: ''' delete dolumns for worksheet "15ERRS"'
    - step:
        id: '370'
        action: Script
        object_path: If wkshtNameStr = "15ERRS" Then
    - step:
        id: '371'
        action: Script
        object_path: '''Delete "QueryId" Column'
    - step:
        id: '372'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '373'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '374'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '375'
        action: Script
        object_path: If cellValue = "QueryId" Then
    - step:
        id: '376'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '377'
        action: Script
        object_path: Exit For
    - step:
        id: '378'
        action: Script
        object_path: End If
    - step:
        id: '379'
        action: Script
        object_path: Next
    - step:
        id: '380'
        action: Script
        object_path: '''Delete "RoleId" Column'
    - step:
        id: '381'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '382'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '383'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '384'
        action: Script
        object_path: If cellValue = "RoleId" Then
    - step:
        id: '385'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '386'
        action: Script
        object_path: Exit For
    - step:
        id: '387'
        action: Script
        object_path: End If
    - step:
        id: '388'
        action: Script
        object_path: Next
    - step:
        id: '389'
        action: Script
        object_path: '''Delete "Source" Column'
    - step:
        id: '390'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '391'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '392'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '393'
        action: Script
        object_path: If cellValue = "Source" Then
    - step:
        id: '394'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '395'
        action: Script
        object_path: Exit For
    - step:
        id: '396'
        action: Script
        object_path: End If
    - step:
        id: '397'
        action: Script
        object_path: Next
    - step:
        id: '398'
        action: Script
        object_path: '''Delete "Table" Column'
    - step:
        id: '399'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '400'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '401'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '402'
        action: Script
        object_path: If cellValue = "Table" Then
    - step:
        id: '403'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '404'
        action: Script
        object_path: Exit For
    - step:
        id: '405'
        action: Script
        object_path: End If
    - step:
        id: '406'
        action: Script
        object_path: Next
    - step:
        id: '407'
        action: Script
        object_path: '''Delete "SDR_KEY3" Column'
    - step:
        id: '408'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '409'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '410'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '411'
        action: Script
        object_path: If cellValue = "SDR_KEY3" Then
    - step:
        id: '412'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '413'
        action: Script
        object_path: Exit For
    - step:
        id: '414'
        action: Script
        object_path: End If
    - step:
        id: '415'
        action: Script
        object_path: Next
    - step:
        id: '416'
        action: Script
        object_path: '''Delete "Field" Column'
    - step:
        id: '417'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '418'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '419'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '420'
        action: Script
        object_path: If cellValue = "Field" Then
    - step:
        id: '421'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '422'
        action: Script
        object_path: Exit For
    - step:
        id: '423'
        action: Script
        object_path: End If
    - step:
        id: '424'
        action: Script
        object_path: Next
    - step:
        id: '425'
        action: Script
        object_path: '''Delete "Value2" Column'
    - step:
        id: '426'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '427'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '428'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '429'
        action: Script
        object_path: If cellValue = "Value2" Then
    - step:
        id: '430'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '431'
        action: Script
        object_path: Exit For
    - step:
        id: '432'
        action: Script
        object_path: End If
    - step:
        id: '433'
        action: Script
        object_path: Next
    - step:
        id: '434'
        action: Script
        object_path: '''Delete "Value3" Column'
    - step:
        id: '435'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '436'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '437'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '438'
        action: Script
        object_path: If cellValue = "Value3" Then
    - step:
        id: '439'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '440'
        action: Script
        object_path: Exit For
    - step:
        id: '441'
        action: Script
        object_path: End If
    - step:
        id: '442'
        action: Script
        object_path: Next
    - step:
        id: '443'
        action: Script
        object_path: '''Delete "Value4" Column'
    - step:
        id: '444'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '445'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '446'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '447'
        action: Script
        object_path: If cellValue = "Value4" Then
    - step:
        id: '448'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '449'
        action: Script
        object_path: Exit For
    - step:
        id: '450'
        action: Script
        object_path: End If
    - step:
        id: '451'
        action: Script
        object_path: Next
    - step:
        id: '452'
        action: Script
        object_path: '''Delete "Value5" Column'
    - step:
        id: '453'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '454'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '455'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '456'
        action: Script
        object_path: If cellValue = "Value5" Then
    - step:
        id: '457'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '458'
        action: Script
        object_path: Exit For
    - step:
        id: '459'
        action: Script
        object_path: End If
    - step:
        id: '460'
        action: Script
        object_path: Next
    - step:
        id: '461'
        action: Script
        object_path: End If
    - step:
        id: '462'
        action: Script
        object_path: ''' delete dolumns for worksheet "NSRD"'
    - step:
        id: '463'
        action: Script
        object_path: If wkshtNameStr = "NSRD" Then
    - step:
        id: '464'
        action: Script
        object_path: '''Delete "QueryId" Column'
    - step:
        id: '465'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '466'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '467'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '468'
        action: Script
        object_path: If cellValue = "QueryId" Then
    - step:
        id: '469'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '470'
        action: Script
        object_path: Exit For
    - step:
        id: '471'
        action: Script
        object_path: End If
    - step:
        id: '472'
        action: Script
        object_path: Next
    - step:
        id: '473'
        action: Script
        object_path: '''Delete "RoleId" Column'
    - step:
        id: '474'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '475'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '476'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '477'
        action: Script
        object_path: If cellValue = "RoleId" Then
    - step:
        id: '478'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '479'
        action: Script
        object_path: Exit For
    - step:
        id: '480'
        action: Script
        object_path: End If
    - step:
        id: '481'
        action: Script
        object_path: Next
    - step:
        id: '482'
        action: Script
        object_path: '''Delete "Source" Column'
    - step:
        id: '483'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '484'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '485'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '486'
        action: Script
        object_path: If cellValue = "Source" Then
    - step:
        id: '487'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '488'
        action: Script
        object_path: Exit For
    - step:
        id: '489'
        action: Script
        object_path: End If
    - step:
        id: '490'
        action: Script
        object_path: Next
    - step:
        id: '491'
        action: Script
        object_path: '''Delete "Table" Column'
    - step:
        id: '492'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '493'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '494'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '495'
        action: Script
        object_path: If cellValue = "Table" Then
    - step:
        id: '496'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '497'
        action: Script
        object_path: Exit For
    - step:
        id: '498'
        action: Script
        object_path: End If
    - step:
        id: '499'
        action: Script
        object_path: Next
    - step:
        id: '500'
        action: Script
        object_path: '''Delete "Field" Column'
    - step:
        id: '501'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '502'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '503'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '504'
        action: Script
        object_path: If cellValue = "Field" Then
    - step:
        id: '505'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '506'
        action: Script
        object_path: Exit For
    - step:
        id: '507'
        action: Script
        object_path: End If
    - step:
        id: '508'
        action: Script
        object_path: Next
    - step:
        id: '509'
        action: Script
        object_path: '''Delete "Value1" Column'
    - step:
        id: '510'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '511'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '512'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '513'
        action: Script
        object_path: If cellValue = "Value1" Then
    - step:
        id: '514'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '515'
        action: Script
        object_path: Exit For
    - step:
        id: '516'
        action: Script
        object_path: End If
    - step:
        id: '517'
        action: Script
        object_path: Next
    - step:
        id: '518'
        action: Script
        object_path: '''Delete "Value2" Column'
    - step:
        id: '519'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '520'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '521'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '522'
        action: Script
        object_path: If cellValue = "Value2" Then
    - step:
        id: '523'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '524'
        action: Script
        object_path: Exit For
    - step:
        id: '525'
        action: Script
        object_path: End If
    - step:
        id: '526'
        action: Script
        object_path: Next
    - step:
        id: '527'
        action: Script
        object_path: '''Delete "Value3" Column'
    - step:
        id: '528'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '529'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '530'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '531'
        action: Script
        object_path: If cellValue = "Value3" Then
    - step:
        id: '532'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '533'
        action: Script
        object_path: Exit For
    - step:
        id: '534'
        action: Script
        object_path: End If
    - step:
        id: '535'
        action: Script
        object_path: Next
    - step:
        id: '536'
        action: Script
        object_path: '''Delete "Value4" Column'
    - step:
        id: '537'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '538'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '539'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '540'
        action: Script
        object_path: If cellValue = "Value4" Then
    - step:
        id: '541'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '542'
        action: Script
        object_path: Exit For
    - step:
        id: '543'
        action: Script
        object_path: End If
    - step:
        id: '544'
        action: Script
        object_path: Next
    - step:
        id: '545'
        action: Script
        object_path: '''Delete "Value5" Column'
    - step:
        id: '546'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '547'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '548'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '549'
        action: Script
        object_path: If cellValue = "Value5" Then
    - step:
        id: '550'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '551'
        action: Script
        object_path: Exit For
    - step:
        id: '552'
        action: Script
        object_path: End If
    - step:
        id: '553'
        action: Script
        object_path: Next
    - step:
        id: '554'
        action: Script
        object_path: End If
    - step:
        id: '555'
        action: Script
        object_path: ''' delete dolumns for worksheet "NWADS"'
    - step:
        id: '556'
        action: Script
        object_path: If wkshtNameStr = "NWADS" Then
    - step:
        id: '557'
        action: Script
        object_path: '''Delete "QueryId" Column'
    - step:
        id: '558'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '559'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '560'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '561'
        action: Script
        object_path: If cellValue = "QueryId" Then
    - step:
        id: '562'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '563'
        action: Script
        object_path: Exit For
    - step:
        id: '564'
        action: Script
        object_path: End If
    - step:
        id: '565'
        action: Script
        object_path: Next
    - step:
        id: '566'
        action: Script
        object_path: '''Delete "RoleId" Column'
    - step:
        id: '567'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '568'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '569'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '570'
        action: Script
        object_path: If cellValue = "RoleId" Then
    - step:
        id: '571'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '572'
        action: Script
        object_path: Exit For
    - step:
        id: '573'
        action: Script
        object_path: End If
    - step:
        id: '574'
        action: Script
        object_path: Next
    - step:
        id: '575'
        action: Script
        object_path: '''Delete "Source" Column'
    - step:
        id: '576'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '577'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '578'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '579'
        action: Script
        object_path: If cellValue = "Source" Then
    - step:
        id: '580'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '581'
        action: Script
        object_path: Exit For
    - step:
        id: '582'
        action: Script
        object_path: End If
    - step:
        id: '583'
        action: Script
        object_path: Next
    - step:
        id: '584'
        action: Script
        object_path: '''Delete "Table" Column'
    - step:
        id: '585'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '586'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '587'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '588'
        action: Script
        object_path: If cellValue = "Table" Then
    - step:
        id: '589'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '590'
        action: Script
        object_path: Exit For
    - step:
        id: '591'
        action: Script
        object_path: End If
    - step:
        id: '592'
        action: Script
        object_path: Next
    - step:
        id: '593'
        action: Script
        object_path: '''Delete "Field" Column'
    - step:
        id: '594'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '595'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '596'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '597'
        action: Script
        object_path: If cellValue = "Field" Then
    - step:
        id: '598'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '599'
        action: Script
        object_path: Exit For
    - step:
        id: '600'
        action: Script
        object_path: End If
    - step:
        id: '601'
        action: Script
        object_path: Next
    - step:
        id: '602'
        action: Script
        object_path: '''Delete "Value2" Column'
    - step:
        id: '603'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '604'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '605'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '606'
        action: Script
        object_path: If cellValue = "Value2" Then
    - step:
        id: '607'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '608'
        action: Script
        object_path: Exit For
    - step:
        id: '609'
        action: Script
        object_path: End If
    - step:
        id: '610'
        action: Script
        object_path: Next
    - step:
        id: '611'
        action: Script
        object_path: '''Delete "Value3" Column'
    - step:
        id: '612'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '613'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '614'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '615'
        action: Script
        object_path: If cellValue = "Value3" Then
    - step:
        id: '616'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '617'
        action: Script
        object_path: Exit For
    - step:
        id: '618'
        action: Script
        object_path: End If
    - step:
        id: '619'
        action: Script
        object_path: Next
    - step:
        id: '620'
        action: Script
        object_path: '''Delete "Value4" Column'
    - step:
        id: '621'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '622'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '623'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '624'
        action: Script
        object_path: If cellValue = "Value4" Then
    - step:
        id: '625'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '626'
        action: Script
        object_path: Exit For
    - step:
        id: '627'
        action: Script
        object_path: End If
    - step:
        id: '628'
        action: Script
        object_path: Next
    - step:
        id: '629'
        action: Script
        object_path: '''Delete "Value5" Column'
    - step:
        id: '630'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '631'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '632'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '633'
        action: Script
        object_path: If cellValue = "Value5" Then
    - step:
        id: '634'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '635'
        action: Script
        object_path: Exit For
    - step:
        id: '636'
        action: Script
        object_path: End If
    - step:
        id: '637'
        action: Script
        object_path: Next
    - step:
        id: '638'
        action: Script
        object_path: End If
    - step:
        id: '639'
        action: Script
        object_path: ''' delete dolumns for worksheet "TWADS"'
    - step:
        id: '640'
        action: Script
        object_path: If wkshtNameStr = "TWADS" Then
    - step:
        id: '641'
        action: Script
        object_path: '''Delete "QueryId" Column'
    - step:
        id: '642'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '643'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '644'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '645'
        action: Script
        object_path: If cellValue = "QueryId" Then
    - step:
        id: '646'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '647'
        action: Script
        object_path: Exit For
    - step:
        id: '648'
        action: Script
        object_path: End If
    - step:
        id: '649'
        action: Script
        object_path: Next
    - step:
        id: '650'
        action: Script
        object_path: '''Delete "RoleId" Column'
    - step:
        id: '651'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '652'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '653'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '654'
        action: Script
        object_path: If cellValue = "RoleId" Then
    - step:
        id: '655'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '656'
        action: Script
        object_path: Exit For
    - step:
        id: '657'
        action: Script
        object_path: End If
    - step:
        id: '658'
        action: Script
        object_path: Next
    - step:
        id: '659'
        action: Script
        object_path: '''Delete "Source" Column'
    - step:
        id: '660'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '661'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '662'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '663'
        action: Script
        object_path: If cellValue = "Source" Then
    - step:
        id: '664'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '665'
        action: Script
        object_path: Exit For
    - step:
        id: '666'
        action: Script
        object_path: End If
    - step:
        id: '667'
        action: Script
        object_path: Next
    - step:
        id: '668'
        action: Script
        object_path: '''Delete "Table" Column'
    - step:
        id: '669'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '670'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '671'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '672'
        action: Script
        object_path: If cellValue = "Table" Then
    - step:
        id: '673'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '674'
        action: Script
        object_path: Exit For
    - step:
        id: '675'
        action: Script
        object_path: End If
    - step:
        id: '676'
        action: Script
        object_path: Next
    - step:
        id: '677'
        action: Script
        object_path: '''Delete "Field" Column'
    - step:
        id: '678'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '679'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '680'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '681'
        action: Script
        object_path: If cellValue = "Field" Then
    - step:
        id: '682'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '683'
        action: Script
        object_path: Exit For
    - step:
        id: '684'
        action: Script
        object_path: End If
    - step:
        id: '685'
        action: Script
        object_path: Next
    - step:
        id: '686'
        action: Script
        object_path: '''Delete "Value3" Column'
    - step:
        id: '687'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '688'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '689'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '690'
        action: Script
        object_path: If cellValue = "Value3" Then
    - step:
        id: '691'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '692'
        action: Script
        object_path: Exit For
    - step:
        id: '693'
        action: Script
        object_path: End If
    - step:
        id: '694'
        action: Script
        object_path: Next
    - step:
        id: '695'
        action: Script
        object_path: '''Delete "Value4" Column'
    - step:
        id: '696'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '697'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '698'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '699'
        action: Script
        object_path: If cellValue = "Value4" Then
    - step:
        id: '700'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '701'
        action: Script
        object_path: Exit For
    - step:
        id: '702'
        action: Script
        object_path: End If
    - step:
        id: '703'
        action: Script
        object_path: Next
    - step:
        id: '704'
        action: Script
        object_path: '''Delete "Value5" Column'
    - step:
        id: '705'
        action: Script
        object_path: usedcolumn = Sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '706'
        action: Script
        object_path: For i = 1 to usedcolumn
    - step:
        id: '707'
        action: Script
        object_path: cellValue = sheet.Cells(1,i)
    - step:
        id: '708'
        action: Script
        object_path: If cellValue = "Value5" Then
    - step:
        id: '709'
        object_path: sheet.Cells(1,i).EntireColumn
        action: Delete
    - step:
        id: '710'
        action: Script
        object_path: Exit For
    - step:
        id: '711'
        action: Script
        object_path: End If
    - step:
        id: '712'
        action: Script
        object_path: Next
    - step:
        id: '713'
        action: Script
        object_path: End If
    - step:
        id: '714'
        action: Script
        object_path: Case "Thursday"
    - step:
        id: '715'
        action: Script
        object_path: '''delete worksheet'
    - step:
        id: '716'
        action: Script
        object_path: End Select
    - step:
        id: '717'
        action: Script
        object_path: Next
    - step:
        id: '718'
        action: Script
        object_path: Parameter("FormattedFile") = formatFile
    - step:
        id: '719'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '720'
        object_path: workbook
        action: Save
    - step:
        id: '721'
        object_path: xls
        action: Quit
    - step:
        id: '722'
        action: Script
        object_path: set xls = Nothing
    - step:
        id: '723'
        action: Script
        object_path: set workbook = Nothing
    - step:
        id: '724'
        action: Script
        object_path: set sheet = Nothing
    - step:
        id: '725'
        action: Script
        object_path: formatFileLoc = Empty
    - step:
        id: '726'
        action: Script
        object_path: currentFileName = Empty
    - step:
        id: '727'
        action: Script
        object_path: dayofWeek = Empty
    - step:
        id: '728'
        action: Script
        object_path: formatFile = Empty
    - step:
        id: '729'
        action: Script
        object_path: usedcolumn = Empty
    - step:
        id: '730'
        action: Script
        object_path: i = Empty
    - step:
        id: '731'
        action: Script
        object_path: cellValue = Empty
    - step:
        id: '732'
        action: Script
        object_path: wkshtNameStr = Empty
    - step:
        id: '733'
        action: Script
        object_path: ExitTest
    - step:
        id: '734'
        action: Script
        object_path: '''set xls = createObject("excel.application")'
    - step:
        id: '735'
        object_path: '''xls'
        action: visible=false
    - step:
        id: '736'
        action: Script
        object_path: '''set workbook = xls.workbooks.open(FilePath)'
    - step:
        id: '737'
        action: Script
        object_path: '''For Each wksht in workbook.Worksheets'
    - step:
        id: '738'
        action: Script
        object_path: '''wkshtNameStr = wksht.Name'
    - step:
        id: '739'
        action: Script
        object_path: '''set sheet = workbook.worksheets(wkshtNameStr)'
    - step:
        id: '740'
        action: Script
        object_path: '''usedcolumn = Sheet.Evaluate("COUNTA(1:1)")'
    - step:
        id: '741'
        action: Script
        object_path: '''For cols = 1 to usedcolumn'
    - step:
        id: '742'
        action: Script
        object_path: "'\tcellValue = sheet.Cells(2,cols)"
    - step:
        id: '743'
        action: Script
        object_path: "'\tIf IsDate(cellValue) Then"
    - step:
        id: '744'
        action: Script
        object_path: "'\t\tcolNMI = UCase(Chr(cols+96))"
    - step:
        id: '745'
        action: Script
        object_path: "'\t\tsheet.Cells(1,cols).EntireColumn.NumberFormat = \"@\""
    - step:
        id: '746'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '747'
        action: Script
        object_path: '''Next'
    - step:
        id: '748'
        action: Script
        object_path: '''Next'
  outputs:
  - FormattedFile:
      robot: true
      value: ${FormattedFile}
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
