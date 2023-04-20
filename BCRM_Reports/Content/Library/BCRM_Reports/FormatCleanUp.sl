namespace: BCRM_Reports
operation:
  name: FormatCleanUp
  inputs:
  - FormattedFolder: C:\Users\svcrpabot\OneDrive - SA Power Networks\AEMO Reports\MDP_Reports\formattedFiles
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.FormatCleanUp:1.0.0
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
        address: https://lbvssaphanaqas.utilities.etsa.net.au:2080/sap/bc/nwbc/etsa_xss/?sap-nwbc-node=0000000005&sap-nwbc-context=03HM358CD10A82301846DFA6BBB6DF962282C4B21F1AD8B26D0A5D8D25628188B0453D7E8BE8E683EF703890329212961CAEB652B66AB5399F50598DAA13155A858D15B28324859F081B6000900FC13BFBF61ED8856B60DB24424820CBEE212CBEA0B4DE775AF3E6C8258F06698DA88511A8091ACD894443785B6C2007EADD426F3D9D5F71FE59BA8B74DD4F8F610E658CAFBE7772F3F874E350A2FC00&sap-client=410&sap-language=EN&sap-nwbc-history_item=&sap-theme=sap_tradeshow
        browser: IE64
        close_on_exit: true
    steps:
    - step:
        id: '1'
        action: Script
        object_path: FormattedFolder = Parameter("FormattedFolder")
    - step:
        id: '2'
        action: Script
        object_path: Set oFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '3'
        action: Script
        object_path: For Each cFile In oFSO.GetFolder(FormattedFolder).Files
    - step:
        id: '4'
        action: Script
        object_path: currentFileName = cFile.Name
    - step:
        id: '5'
        action: Script
        object_path: rptCategory = Mid(currentFileName,instr(currentFileName,"-")+1)
    - step:
        id: '6'
        action: Script
        object_path: reqfilename = Instr(1, rptCategory, "-")
    - step:
        id: '7'
        action: Script
        object_path: reqfilename = Instr(reqfilename+1, rptCategory, "-")
    - step:
        id: '8'
        action: Script
        object_path: reqfilename = Left(rptCategory, reqfilename-1)
    - step:
        id: '9'
        action: Script
        object_path: xlShiftToRight = -4161
    - step:
        id: '10'
        action: Script
        object_path: If Instr(1, reqfilename, "INTERVAL-NULLS") > 0 Then
    - step:
        id: '11'
        action: Script
        object_path: set xls = createObject("excel.application")
    - step:
        id: '12'
        object_path: xls
        action: visible=False
    - step:
        id: '13'
        action: Script
        object_path: set workbook = xls.workbooks.open(FormattedFolder&"\"&currentFileName)
    - step:
        id: '14'
        action: Script
        object_path: For Each wksht in workbook.Worksheets
    - step:
        id: '15'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '16'
        action: Script
        object_path: set sheet = workbook.worksheets(wkshtNameStr)
    - step:
        id: '17'
        action: Script
        object_path: usedRows = Sheet.UsedRange.Rows.Count
    - step:
        id: '18'
        action: Script
        object_path: val = sheet.Cells(1,1)
    - step:
        id: '19'
        action: Script
        object_path: If wkshtNameStr <> "Sheet1" Then
    - step:
        id: '20'
        action: Script
        object_path: ''' Add columns if the columns are blank'
    - step:
        id: '21'
        action: Script
        object_path: If val = EMPTY Then
    - step:
        id: '22'
        object_path: sheet
        action: Cells(1,1)
        args: = "NMI"
    - step:
        id: '23'
        object_path: sheet
        action: Cells(1,2)
        args: = "START DATE"
    - step:
        id: '24'
        object_path: sheet
        action: Cells(1,3)
        args: = "END_DATE"
    - step:
        id: '25'
        object_path: sheet
        action: Cells(1,4)
        args: = "SUFFIX"
    - step:
        id: '26'
        object_path: sheet
        action: Cells(1,5)
        args: = "COMMENTS"
    - step:
        id: '27'
        object_path: sheet
        action: Cells(1,6)
        args: = "ACTIONED_BY"
    - step:
        id: '28'
        object_path: sheet
        action: Cells(1,7)
        args: = "DATE_ACTIONED"
    - step:
        id: '29'
        action: Script
        object_path: End If
    - step:
        id: '30'
        action: Script
        object_path: '''Format Column header cells'
    - step:
        id: '31'
        action: Script
        object_path: colCount = sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '32'
        action: Script
        object_path: For i = 1 to colCount
    - step:
        id: '33'
        object_path: sheet.cells(1,i).Interior
        action: ColorIndex=48
    - step:
        id: '34'
        object_path: sheet.Cells(1,i).Font
        action: Bold
        args: = true
    - step:
        id: '35'
        object_path: sheet.cells(1,i).Font
        action: Color=vbWhite
    - step:
        id: '36'
        action: Script
        object_path: Next
    - step:
        id: '37'
        object_path: sheet.cells(1,1).Entirerow.Columns
        action: AutoFit
    - step:
        id: '38'
        object_path: workbook
        action: Save
    - step:
        id: '39'
        action: Script
        object_path: End If
    - step:
        id: '40'
        action: Script
        object_path: Next
    - step:
        id: '41'
        object_path: xls
        action: Quit
    - step:
        id: '42'
        action: Script
        object_path: wkshtNameStr = Empty
    - step:
        id: '43'
        action: Script
        object_path: set xls = Nothing
    - step:
        id: '44'
        action: Script
        object_path: set workbook = Nothing
    - step:
        id: '45'
        action: Script
        object_path: set sheet = Nothing
    - step:
        id: '46'
        action: Script
        object_path: End If
    - step:
        id: '47'
        action: Script
        object_path: If  Instr(1, reqfilename, "BASIC-NULLS") > 0  Then
    - step:
        id: '48'
        action: Script
        object_path: set xls = createObject("excel.application")
    - step:
        id: '49'
        object_path: xls
        action: visible=False
    - step:
        id: '50'
        action: Script
        object_path: set workbook = xls.workbooks.open(FormattedFolder&"\"&currentFileName)
    - step:
        id: '51'
        action: Script
        object_path: For Each wksht in workbook.Worksheets
    - step:
        id: '52'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '53'
        action: Script
        object_path: set sheet = workbook.worksheets(wkshtNameStr)
    - step:
        id: '54'
        action: Script
        object_path: usedRows = Sheet.UsedRange.Rows.Count
    - step:
        id: '55'
        action: Script
        object_path: val = sheet.Cells(1,1)
    - step:
        id: '56'
        action: Script
        object_path: If wkshtNameStr <> "Sheet1" Then
    - step:
        id: '57'
        action: Script
        object_path: ''' Add columns if the columns are blank'
    - step:
        id: '58'
        action: Script
        object_path: If val = EMPTY Then
    - step:
        id: '59'
        object_path: sheet
        action: Cells(1,1)
        args: = "NMI"
    - step:
        id: '60'
        object_path: sheet
        action: Cells(1,2)
        args: = "START DATE"
    - step:
        id: '61'
        object_path: sheet
        action: Cells(1,3)
        args: = "END DATE"
    - step:
        id: '62'
        object_path: sheet
        action: Cells(1,4)
        args: = "ABCON"
    - step:
        id: '63'
        object_path: sheet
        action: Cells(1,5)
        args: = "INTERVAL"
    - step:
        id: '64'
        object_path: sheet
        action: Cells(1,6)
        args: = "EARLIEST REVISION"
    - step:
        id: '65'
        object_path: sheet
        action: Cells(1,7)
        args: = "LATEST REVISION"
    - step:
        id: '66'
        object_path: sheet
        action: Cells(1,8)
        args: = "COMMENTS"
    - step:
        id: '67'
        object_path: sheet
        action: Cells(1,9)
        args: = "ACTIONED BY"
    - step:
        id: '68'
        object_path: sheet
        action: Cells(1,10)
        args: = "DATE ACTIONED"
    - step:
        id: '69'
        object_path: sheet
        action: Cells(1,11)
        args: = "R_DATE"
    - step:
        id: '70'
        object_path: sheet
        action: Cells(1,12)
        args: = "SUFFIX"
    - step:
        id: '71'
        object_path: sheet
        action: Cells(1,13)
        args: = "TXTNUMDAYS"
    - step:
        id: '72'
        object_path: sheet
        action: Cells(1,14)
        args: = "TXT_CSUM"
    - step:
        id: '73'
        action: Script
        object_path: Else
    - step:
        id: '74'
        action: Script
        object_path: Set objRange = sheet.Range("K1").EntireColumn
    - step:
        id: '75'
        object_path: objRange
        action: Insert(xlShiftToRight)
    - step:
        id: '76'
        object_path: sheet
        action: Cells(1,11)
        args: = "R_DATE"
    - step:
        id: '77'
        action: Script
        object_path: End If
    - step:
        id: '78'
        action: Script
        object_path: '''Format Column header cells'
    - step:
        id: '79'
        action: Script
        object_path: colCount = sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '80'
        action: Script
        object_path: For i = 1 to colCount
    - step:
        id: '81'
        object_path: sheet.cells(1,i).Interior
        action: ColorIndex=48
    - step:
        id: '82'
        object_path: sheet.Cells(1,i).Font
        action: Bold
        args: = true
    - step:
        id: '83'
        object_path: sheet.cells(1,i).Font
        action: Color=vbWhite
    - step:
        id: '84'
        action: Script
        object_path: Next
    - step:
        id: '85'
        object_path: sheet.cells(1,1).Entirerow.Columns
        action: AutoFit
    - step:
        id: '86'
        object_path: workbook
        action: Save
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
        object_path: xls
        action: Quit
    - step:
        id: '90'
        action: Script
        object_path: wkshtNameStr = Empty
    - step:
        id: '91'
        action: Script
        object_path: set xls = Nothing
    - step:
        id: '92'
        action: Script
        object_path: set workbook = Nothing
    - step:
        id: '93'
        action: Script
        object_path: set sheet = Nothing
    - step:
        id: '94'
        action: Script
        object_path: Set objRange = Nothing
    - step:
        id: '95'
        action: Script
        object_path: End If
    - step:
        id: '96'
        action: Script
        object_path: If  Instr(1, reqfilename, "BASIC-ESTIMATES") > 0  Then
    - step:
        id: '97'
        action: Script
        object_path: set xls = createObject("excel.application")
    - step:
        id: '98'
        object_path: xls
        action: visible=False
    - step:
        id: '99'
        action: Script
        object_path: set workbook = xls.workbooks.open(FormattedFolder&"\"&currentFileName)
    - step:
        id: '100'
        action: Script
        object_path: For Each wksht in workbook.Worksheets
    - step:
        id: '101'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '102'
        action: Script
        object_path: set sheet = workbook.worksheets(wkshtNameStr)
    - step:
        id: '103'
        action: Script
        object_path: usedRows = Sheet.UsedRange.Rows.Count
    - step:
        id: '104'
        action: Script
        object_path: val = sheet.Cells(1,1)
    - step:
        id: '105'
        action: Script
        object_path: If wkshtNameStr <> "Sheet1" Then
    - step:
        id: '106'
        action: Script
        object_path: ''' Add columns if the columns are blank'
    - step:
        id: '107'
        action: Script
        object_path: If val = EMPTY Then
    - step:
        id: '108'
        object_path: sheet
        action: Cells(1,1)
        args: = "NMI"
    - step:
        id: '109'
        object_path: sheet
        action: Cells(1,2)
        args: = "SFX"
    - step:
        id: '110'
        object_path: sheet
        action: Cells(1,3)
        args: = "START_DTE"
    - step:
        id: '111'
        object_path: sheet
        action: Cells(1,4)
        args: = "END_DTE"
    - step:
        id: '112'
        object_path: sheet
        action: Cells(1,5)
        args: = "FRMP"
    - step:
        id: '113'
        object_path: sheet
        action: Cells(1,6)
        args: = "LR"
    - step:
        id: '114'
        object_path: sheet
        action: Cells(1,7)
        args: = "MDP"
    - step:
        id: '115'
        object_path: sheet
        action: Cells(1,8)
        args: = "FLAG"
    - step:
        id: '116'
        object_path: sheet
        action: Cells(1,9)
        args: = "KWH"
    - step:
        id: '117'
        object_path: sheet
        action: Cells(1,10)
        args: = "COMMENTS"
    - step:
        id: '118'
        object_path: sheet
        action: Cells(1,11)
        args: = "ACTIONED_BY"
    - step:
        id: '119'
        object_path: sheet
        action: Cells(1,12)
        args: = "DATE_ACTIONED"
    - step:
        id: '120'
        action: Script
        object_path: End If
    - step:
        id: '121'
        action: Script
        object_path: '''Format Column header cells'
    - step:
        id: '122'
        action: Script
        object_path: colCount = sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '123'
        action: Script
        object_path: For i = 1 to colCount
    - step:
        id: '124'
        object_path: sheet.cells(1,i).Interior
        action: ColorIndex=48
    - step:
        id: '125'
        object_path: sheet.Cells(1,i).Font
        action: Bold
        args: = true
    - step:
        id: '126'
        object_path: sheet.cells(1,i).Font
        action: Color=vbWhite
    - step:
        id: '127'
        action: Script
        object_path: Next
    - step:
        id: '128'
        object_path: sheet.cells(1,1).Entirerow.Columns
        action: AutoFit
    - step:
        id: '129'
        object_path: workbook
        action: Save
    - step:
        id: '130'
        action: Script
        object_path: End If
    - step:
        id: '131'
        action: Script
        object_path: Next
    - step:
        id: '132'
        object_path: xls
        action: Quit
    - step:
        id: '133'
        action: Script
        object_path: wkshtNameStr = Empty
    - step:
        id: '134'
        action: Script
        object_path: set xls = Nothing
    - step:
        id: '135'
        action: Script
        object_path: set workbook = Nothing
    - step:
        id: '136'
        action: Script
        object_path: set sheet = Nothing
    - step:
        id: '137'
        action: Script
        object_path: Set objRange = Nothing
    - step:
        id: '138'
        action: Script
        object_path: End If
    - step:
        id: '139'
        action: Script
        object_path: If  Instr(1, reqfilename, "INTERVAL-ESTIMATES") > 0  Then
    - step:
        id: '140'
        action: Script
        object_path: set xls = createObject("excel.application")
    - step:
        id: '141'
        object_path: xls
        action: visible=False
    - step:
        id: '142'
        action: Script
        object_path: set workbook = xls.workbooks.open(FormattedFolder&"\"&currentFileName)
    - step:
        id: '143'
        action: Script
        object_path: For Each wksht in workbook.Worksheets
    - step:
        id: '144'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '145'
        action: Script
        object_path: set sheet = workbook.worksheets(wkshtNameStr)
    - step:
        id: '146'
        action: Script
        object_path: usedRows = Sheet.UsedRange.Rows.Count
    - step:
        id: '147'
        action: Script
        object_path: val = sheet.Cells(1,1)
    - step:
        id: '148'
        action: Script
        object_path: If wkshtNameStr <> "Sheet1" Then
    - step:
        id: '149'
        action: Script
        object_path: ''' Add columns if the columns are blank'
    - step:
        id: '150'
        action: Script
        object_path: If val = EMPTY Then
    - step:
        id: '151'
        object_path: sheet
        action: Cells(1,1)
        args: = "NMI"
    - step:
        id: '152'
        object_path: sheet
        action: Cells(1,2)
        args: = "Checksum"
    - step:
        id: '153'
        object_path: sheet
        action: Cells(1,3)
        args: = "SFX"
    - step:
        id: '154'
        object_path: sheet
        action: Cells(1,4)
        args: = "SettDate"
    - step:
        id: '155'
        object_path: sheet
        action: Cells(1,5)
        args: = "FRMP"
    - step:
        id: '156'
        object_path: sheet
        action: Cells(1,6)
        args: = "LR"
    - step:
        id: '157'
        object_path: sheet
        action: Cells(1,7)
        args: = "MDP"
    - step:
        id: '158'
        object_path: sheet
        action: Cells(1,8)
        args: = "FLAG"
    - step:
        id: '159'
        object_path: sheet
        action: Cells(1,9)
        args: = "METER TYPE"
    - step:
        id: '160'
        object_path: sheet
        action: Cells(1,10)
        args: = "COMMENTS"
    - step:
        id: '161'
        object_path: sheet
        action: Cells(1,11)
        args: = "ACTIONED_BY"
    - step:
        id: '162'
        object_path: sheet
        action: Cells(1,12)
        args: = "DATE_ACTIONED"
    - step:
        id: '163'
        action: Script
        object_path: Else
    - step:
        id: '164'
        action: Script
        object_path: Set objRange = sheet.Range("B1").EntireColumn
    - step:
        id: '165'
        object_path: objRange
        action: Insert(xlShiftToRight)
    - step:
        id: '166'
        object_path: sheet
        action: Cells(1,2)
        args: = "Checksum"
    - step:
        id: '167'
        action: Script
        object_path: Set objRange = sheet.Range("I1").EntireColumn
    - step:
        id: '168'
        object_path: objRange
        action: Insert(xlShiftToRight)
    - step:
        id: '169'
        object_path: sheet
        action: Cells(1,9)
        args: = "METER TYPE"
    - step:
        id: '170'
        action: Script
        object_path: End If
    - step:
        id: '171'
        action: Script
        object_path: '''Format Column header cells'
    - step:
        id: '172'
        action: Script
        object_path: colCount = sheet.Evaluate("COUNTA(1:1)")
    - step:
        id: '173'
        action: Script
        object_path: For i = 1 to colCount
    - step:
        id: '174'
        object_path: sheet.cells(1,i).Interior
        action: ColorIndex=48
    - step:
        id: '175'
        object_path: sheet.Cells(1,i).Font
        action: Bold
        args: = true
    - step:
        id: '176'
        object_path: sheet.cells(1,i).Font
        action: Color=vbWhite
    - step:
        id: '177'
        action: Script
        object_path: Next
    - step:
        id: '178'
        object_path: sheet.cells(1,1).Entirerow.Columns
        action: AutoFit
    - step:
        id: '179'
        object_path: workbook
        action: Save
    - step:
        id: '180'
        action: Script
        object_path: End If
    - step:
        id: '181'
        action: Script
        object_path: Next
    - step:
        id: '182'
        object_path: xls
        action: Quit
    - step:
        id: '183'
        action: Script
        object_path: wkshtNameStr = Empty
    - step:
        id: '184'
        action: Script
        object_path: set xls = Nothing
    - step:
        id: '185'
        action: Script
        object_path: set workbook = Nothing
    - step:
        id: '186'
        action: Script
        object_path: set sheet = Nothing
    - step:
        id: '187'
        action: Script
        object_path: Set objRange = Nothing
    - step:
        id: '188'
        action: Script
        object_path: End If
    - step:
        id: '189'
        action: Script
        object_path: Next
    - step:
        id: '190'
        action: Script
        object_path: '''Clear Variables'
    - step:
        id: '191'
        action: Script
        object_path: i = empty
    - step:
        id: '192'
        action: Script
        object_path: val = empty
    - step:
        id: '193'
        action: Script
        object_path: colCount = empty
    - step:
        id: '194'
        action: Script
        object_path: usedRows = empty
    - step:
        id: '195'
        action: Script
        object_path: currentFileName = empty
    - step:
        id: '196'
        action: Script
        object_path: rptCategory = empty
    - step:
        id: '197'
        action: Script
        object_path: reqfilename = empty
    - step:
        id: '198'
        action: Script
        object_path: reqfilename = empty
    - step:
        id: '199'
        action: Script
        object_path: reqfilename = empty
    - step:
        id: '200'
        action: Script
        object_path: FormattedFolder = empty
    - step:
        id: '201'
        action: Script
        object_path: Set oFSO = Nothing
    - step:
        id: '202'
        action: Script
        object_path: ExitTest
  outputs:
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
