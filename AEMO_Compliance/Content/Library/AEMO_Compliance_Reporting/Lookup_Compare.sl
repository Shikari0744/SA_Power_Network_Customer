namespace: AEMO_Compliance_Reporting
operation:
  name: Lookup_Compare
  inputs:
  - PreviousDayFile: LNSP-2022.11.21-Week 48.xlsx
  - PresentDayFile: LNSP-2022.11.28-Week 49.xlsx
  - todayWeekday: Monday
  - location
  sequential_action:
    gav: com.microfocus.seq:AEMO_Compliance_Reporting.Lookup_Compare:1.0.0
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
        object_path: location = Parameter("location")
    - step:
        id: '2'
        action: Script
        object_path: formattedFolder = location&"Formatted Files\"
    - step:
        id: '3'
        action: Script
        object_path: PresentDayFile = Parameter("PresentDayFile")
    - step:
        id: '4'
        action: Script
        object_path: PreviousDayFile = Parameter("PreviousDayFile")
    - step:
        id: '5'
        action: Script
        object_path: oldfile = formattedFolder&PreviousDayFile
    - step:
        id: '6'
        action: Script
        object_path: newFile = formattedFolder&PresentDayFile
    - step:
        id: '7'
        action: Script
        object_path: todayWeekday = Parameter("todayWeekday")
    - step:
        id: '8'
        action: Script
        object_path: set xls = createObject("excel.application")
    - step:
        id: '9'
        object_path: xls
        action: visible=false
    - step:
        id: '10'
        action: Script
        object_path: 'set workbook1 = xls.workbooks.open(newFile) '
        comment: Recent File
    - step:
        id: '11'
        action: Script
        object_path: set workbook2 = xls.workbooks.open(oldfile)
    - step:
        id: '12'
        action: Script
        object_path: '''Create Dictionary for the sheet names from current days reeport'
    - step:
        id: '13'
        action: Script
        object_path: Set oDicWksht = CreateObject("Scripting.Dictionary")
    - step:
        id: '14'
        action: Script
        object_path: For Each getwksht in workbook1.Worksheets
    - step:
        id: '15'
        object_path: oDicWksht.Add getwksht
        action: Name,
        args: '"Not Found"'
    - step:
        id: '16'
        action: Script
        object_path: Next
    - step:
        id: '17'
        action: Script
        object_path: For Each wksht in workbook1.Worksheets
    - step:
        id: '18'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '19'
        action: Script
        object_path: If (todayWeekday = "Monday") and (wkshtNameStr = "ADWNAN") Then
    - step:
        id: '20'
        object_path: oDicWksht.Remove wksht
        action: Name
    - step:
        id: '21'
        action: Script
        object_path: 'set sheet1 = workbook1.worksheets(wkshtNameStr)  '
        comment: ' set worksheet for current report'
    - step:
        id: '22'
        action: Script
        object_path: '''get used column'
    - step:
        id: '23'
        action: Script
        object_path: colCount = sheet1.Evaluate("COUNTA(1:1)")
    - step:
        id: '24'
        action: Script
        object_path: '''Get NMI Column'
    - step:
        id: '25'
        action: Script
        object_path: For i = 1 to colCount
    - step:
        id: '26'
        action: Script
        object_path: colHeader = sheet1.Cells(1,i)
    - step:
        id: '27'
        action: Script
        object_path: If inStr(1, colHeader, "NMI") > 0 Then
    - step:
        id: '28'
        action: Script
        object_path: colNMI = i
    - step:
        id: '29'
        action: Script
        object_path: colNMI = UCase(Chr(colNMI+96))
    - step:
        id: '30'
        action: Script
        object_path: Exit for
    - step:
        id: '31'
        action: Script
        object_path: End If
    - step:
        id: '32'
        action: Script
        object_path: Next
    - step:
        id: '33'
        action: Script
        object_path: '''Get Notes Column'
    - step:
        id: '34'
        action: Script
        object_path: For j = 1 to colCount
    - step:
        id: '35'
        action: Script
        object_path: colHeader = sheet1.Cells(1,j)
    - step:
        id: '36'
        action: Script
        object_path: If inStr(1, colHeader, "Notes") > 0 Then
    - step:
        id: '37'
        action: Script
        object_path: colNotes = j
    - step:
        id: '38'
        action: Script
        object_path: colNotes = UCase(Chr(colNotes+96))
    - step:
        id: '39'
        action: Script
        object_path: Exit for
    - step:
        id: '40'
        action: Script
        object_path: End If
    - step:
        id: '41'
        action: Script
        object_path: Next
    - step:
        id: '42'
        action: Script
        object_path: '''Get MDP Notes Column'
    - step:
        id: '43'
        action: Script
        object_path: For k = 1 to colCount
    - step:
        id: '44'
        action: Script
        object_path: colHeader = sheet1.Cells(1,k)
    - step:
        id: '45'
        action: Script
        object_path: If inStr(1, colHeader, "MDP Notes") > 0  or inStr(1, colHeader,
          "Instructions to MDP") > 0 Then
    - step:
        id: '46'
        action: Script
        object_path: colMDPNotes = k
    - step:
        id: '47'
        action: Script
        object_path: colMDPNotes = UCase(Chr(colMDPNotes+96))
    - step:
        id: '48'
        action: Script
        object_path: Exit for
    - step:
        id: '49'
        action: Script
        object_path: End If
    - step:
        id: '50'
        action: Script
        object_path: Next
    - step:
        id: '51'
        action: Script
        object_path: '''Get Other Column'
    - step:
        id: '52'
        action: Script
        object_path: For l = 1 to colCount
    - step:
        id: '53'
        action: Script
        object_path: colHeader = sheet1.Cells(1,l)
    - step:
        id: '54'
        action: Script
        object_path: If inStr(1, colHeader, "Other") > 0 or inStr(1, colHeader, "Action
          - Return to SA Power Networks") > 0 Then
    - step:
        id: '55'
        action: Script
        object_path: colOther = l
    - step:
        id: '56'
        action: Script
        object_path: colOther = UCase(Chr(colOther+96))
    - step:
        id: '57'
        action: Script
        object_path: Exit for
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Script
        object_path: Next
    - step:
        id: '60'
        action: Script
        object_path: '''Get New/Old Column'
    - step:
        id: '61'
        action: Script
        object_path: For n = 1 to colCount
    - step:
        id: '62'
        action: Script
        object_path: colHeader = sheet1.Cells(1,n)
    - step:
        id: '63'
        action: Script
        object_path: If inStr(1, colHeader, "New/Old") > 0 Then
    - step:
        id: '64'
        action: Script
        object_path: colOldNew = n
    - step:
        id: '65'
        action: Script
        object_path: colOldNew = UCase(Chr(colOldNew+96))
    - step:
        id: '66'
        action: Script
        object_path: Exit for
    - step:
        id: '67'
        action: Script
        object_path: End If
    - step:
        id: '68'
        action: Script
        object_path: Next
    - step:
        id: '69'
        action: Script
        object_path: for each  wksht1 in workbook2.Worksheets
    - step:
        id: '70'
        action: Script
        object_path: If wksht1.Name = wkshtNameStr Then
    - step:
        id: '71'
        action: Script
        object_path: set sheet2 = workbook2.worksheets(wkshtNameStr)
    - step:
        id: '72'
        action: Script
        object_path: oldColCount = sheet2.Evaluate("COUNTA(1:1)")
    - step:
        id: '73'
        action: Script
        object_path: '''Get NMI column name for the old sheet'
    - step:
        id: '74'
        action: Script
        object_path: For a = 1 to oldColCount
    - step:
        id: '75'
        action: Script
        object_path: oldColHeader = sheet2.Cells(1,a)
    - step:
        id: '76'
        action: Script
        object_path: If InStr(1,oldColHeader, "NMI") Then
    - step:
        id: '77'
        action: Script
        object_path: oldColNMI = a
    - step:
        id: '78'
        action: Script
        object_path: oldColNMI = UCase(Chr(oldColNMI+96))
    - step:
        id: '79'
        action: Script
        object_path: Exit For
    - step:
        id: '80'
        action: Script
        object_path: End If
    - step:
        id: '81'
        action: Script
        object_path: Next
    - step:
        id: '82'
        action: Script
        object_path: '''Get Notes column name for the old sheet'
    - step:
        id: '83'
        action: Script
        object_path: For b = 1 to oldColCount
    - step:
        id: '84'
        action: Script
        object_path: oldColHeader = sheet2.Cells(1,b)
    - step:
        id: '85'
        action: Script
        object_path: If InStr(1,oldColHeader, "Notes") Then
    - step:
        id: '86'
        action: Script
        object_path: oldColNotes = b
    - step:
        id: '87'
        action: Script
        object_path: oldColNotes = UCase(Chr(oldColNotes+96))
    - step:
        id: '88'
        action: Script
        object_path: Exit For
    - step:
        id: '89'
        action: Script
        object_path: End If
    - step:
        id: '90'
        action: Script
        object_path: Next
    - step:
        id: '91'
        action: Script
        object_path: '''Get MDP Notes column name for the old sheet'
    - step:
        id: '92'
        action: Script
        object_path: For c = 1 to oldColCount
    - step:
        id: '93'
        action: Script
        object_path: oldColHeader = sheet2.Cells(1,c)
    - step:
        id: '94'
        action: Script
        object_path: If InStr(1,oldColHeader, "MDP Notes") Then
    - step:
        id: '95'
        action: Script
        object_path: oldColMDPNotes = c
    - step:
        id: '96'
        action: Script
        object_path: oldColMDPNotes = UCase(Chr(oldColMDPNotes+96))
    - step:
        id: '97'
        action: Script
        object_path: Exit For
    - step:
        id: '98'
        action: Script
        object_path: End If
    - step:
        id: '99'
        action: Script
        object_path: Next
    - step:
        id: '100'
        action: Script
        object_path: '''Get Other column name for the old sheet'
    - step:
        id: '101'
        action: Script
        object_path: For d = 1 to oldColCount
    - step:
        id: '102'
        action: Script
        object_path: oldColHeader = sheet2.Cells(1,d)
    - step:
        id: '103'
        action: Script
        object_path: If InStr(1,oldColHeader, "Other") Then
    - step:
        id: '104'
        action: Script
        object_path: oldColOther = d
    - step:
        id: '105'
        action: Script
        object_path: oldColOther = UCase(Chr(oldColOther+96))
    - step:
        id: '106'
        action: Script
        object_path: Exit For
    - step:
        id: '107'
        action: Script
        object_path: End If
    - step:
        id: '108'
        action: Script
        object_path: Next
    - step:
        id: '109'
        action: Script
        object_path: '''Get Old/New column name for the old sheet'
    - step:
        id: '110'
        action: Script
        object_path: For e = 1 to oldColCount
    - step:
        id: '111'
        action: Script
        object_path: oldColHeader = sheet2.Cells(1,e)
    - step:
        id: '112'
        action: Script
        object_path: If InStr(1,oldColHeader, "New/Old") Then
    - step:
        id: '113'
        action: Script
        object_path: oldColOldNew = e
    - step:
        id: '114'
        action: Script
        object_path: oldColOldNew = UCase(Chr(oldColOldNew+96))
    - step:
        id: '115'
        action: Script
        object_path: Exit For
    - step:
        id: '116'
        action: Script
        object_path: End If
    - step:
        id: '117'
        action: Script
        object_path: Next
    - step:
        id: '118'
        action: Script
        object_path: currRows = Sheet1.UsedRange.Rows.Count
    - step:
        id: '119'
        action: Script
        object_path: oldRows = Sheet2.UsedRange.Rows.Count
    - step:
        id: '120'
        action: Script
        object_path: If (currRows > 1) and (oldRows > 1) Then
    - step:
        id: '121'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '122'
        action: Script
        object_path: Set oDic1 = Nothing
    - step:
        id: '123'
        action: Script
        object_path: Set oDic2 = Nothing
    - step:
        id: '124'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '125'
        action: Script
        object_path: Set oDic1 = CreateObject("Scripting.Dictionary")
    - step:
        id: '126'
        action: Script
        object_path: Set oDic2 = CreateObject("Scripting.Dictionary")
    - step:
        id: '127'
        action: Script
        object_path: For m = 2 to oldRows
    - step:
        id: '128'
        action: Script
        object_path: nmiVal = Trim(Sheet2.Range(oldColNMI & m))
    - step:
        id: '129'
        action: Script
        object_path: If Len(nmiVal) = 11 Then
    - step:
        id: '130'
        action: Script
        object_path: nmiVal = Mid(Trim(Sheet2.Range(oldColNMI & m)),1,Len(Trim(Sheet2.Range(oldColNMI
          & m)))-1)
    - step:
        id: '131'
        action: Script
        object_path: End If
    - step:
        id: '132'
        action: Script
        object_path: If oDic.Exists(nmiVal) Then
    - step:
        id: '133'
        action: Script
        object_path: Else
    - step:
        id: '134'
        object_path: oDic.Add nmiVal,Trim(Sheet2
        action: Range(oldColNotes
        args: '& m))'
    - step:
        id: '135'
        object_path: oDic1.Add nmiVal,Trim(Sheet2
        action: Range(oldColMDPNotes
        args: '& m))'
    - step:
        id: '136'
        object_path: oDic2.Add nmiVal,Trim(Sheet2
        action: Range(oldColOther
        args: '& m))'
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
        object_path: m = Empty
    - step:
        id: '140'
        action: Script
        object_path: For m = 2 to currRows
    - step:
        id: '141'
        action: Script
        object_path: curRowNMI = Sheet1.Cells(m,colNMI)
    - step:
        id: '142'
        action: Script
        object_path: If oDic.Exists(Trim(curRowNMI)) Then
    - step:
        id: '143'
        object_path: Sheet1
        action: Cells(m,colOldNew)
        args: = "Old"
    - step:
        id: '144'
        object_path: Sheet1.Cells(m,colNotes) = oDic
        action: Item(Trim(curRowNMI))
    - step:
        id: '145'
        object_path: Sheet1.Cells(m,colMDPNotes) = oDic1
        action: Item(Trim(curRowNMI))
    - step:
        id: '146'
        object_path: Sheet1.Cells(m,colOther) = oDic2
        action: Item(Trim(curRowNMI))
    - step:
        id: '147'
        action: Script
        object_path: Else
    - step:
        id: '148'
        object_path: Sheet1
        action: Cells(m,colOldNew)
        args: = "New"
    - step:
        id: '149'
        action: Script
        object_path: End If
    - step:
        id: '150'
        action: Script
        object_path: Next
    - step:
        id: '151'
        action: Script
        object_path: End If
    - step:
        id: '152'
        action: Script
        object_path: End If
    - step:
        id: '153'
        action: Script
        object_path: Next
    - step:
        id: '154'
        action: Script
        object_path: Else
    - step:
        id: '155'
        action: Script
        object_path: 'set sheet1 = workbook1.worksheets(wkshtNameStr)  '
        comment: ' set worksheet for current report'
    - step:
        id: '156'
        action: Script
        object_path: '''get used column'
    - step:
        id: '157'
        action: Script
        object_path: colCount = sheet1.Evaluate("COUNTA(1:1)")
    - step:
        id: '158'
        action: Script
        object_path: '''Get NMi Column'
    - step:
        id: '159'
        action: Script
        object_path: For i = 1 to colCount
    - step:
        id: '160'
        action: Script
        object_path: colHeader = sheet1.Cells(1,i)
    - step:
        id: '161'
        action: Script
        object_path: If inStr(1, colHeader, "NMI") > 0 Then
    - step:
        id: '162'
        action: Script
        object_path: colNMI = i
    - step:
        id: '163'
        action: Script
        object_path: colNMI = UCase(Chr(colNMI+96))
    - step:
        id: '164'
        action: Script
        object_path: Exit for
    - step:
        id: '165'
        action: Script
        object_path: End If
    - step:
        id: '166'
        action: Script
        object_path: Next
    - step:
        id: '167'
        action: Script
        object_path: '''Get Notes Column'
    - step:
        id: '168'
        action: Script
        object_path: For j = 1 to colCount
    - step:
        id: '169'
        action: Script
        object_path: colHeader = sheet1.Cells(1,j)
    - step:
        id: '170'
        action: Script
        object_path: If inStr(1, colHeader, "Notes") > 0 Then
    - step:
        id: '171'
        action: Script
        object_path: colNotes = j
    - step:
        id: '172'
        action: Script
        object_path: colNotes = UCase(Chr(colNotes+96))
    - step:
        id: '173'
        action: Script
        object_path: Exit for
    - step:
        id: '174'
        action: Script
        object_path: End If
    - step:
        id: '175'
        action: Script
        object_path: Next
    - step:
        id: '176'
        action: Script
        object_path: '''Get OldNew Column'
    - step:
        id: '177'
        action: Script
        object_path: For m = 1 to colCount
    - step:
        id: '178'
        action: Script
        object_path: colHeader = sheet1.Cells(1,m)
    - step:
        id: '179'
        action: Script
        object_path: If inStr(1, colHeader, "New/Old") > 0 Then
    - step:
        id: '180'
        action: Script
        object_path: colOldNew = m
    - step:
        id: '181'
        action: Script
        object_path: colOldNew  = UCase(Chr(colOldNew+96))
    - step:
        id: '182'
        action: Script
        object_path: Exit for
    - step:
        id: '183'
        action: Script
        object_path: End If
    - step:
        id: '184'
        action: Script
        object_path: Next
    - step:
        id: '185'
        action: Script
        object_path: for each  wksht1 in workbook2.Worksheets
    - step:
        id: '186'
        action: Script
        object_path: If wksht1.Name = wkshtNameStr Then
    - step:
        id: '187'
        object_path: oDicWksht.Remove wksht1
        comment: ' remove the worksheet name from the dictionary if found in the old
          report'
        action: Name
    - step:
        id: '188'
        action: Script
        object_path: 'set sheet2 = workbook2.worksheets(wkshtNameStr)     '
        comment: ' set worksheet for previous weeks report'
    - step:
        id: '189'
        action: Script
        object_path: oldColCount = sheet2.Evaluate("COUNTA(1:1)")
    - step:
        id: '190'
        action: Script
        object_path: '''Get NMI column name for the old sheet'
    - step:
        id: '191'
        action: Script
        object_path: For a = 1 to oldColCount
    - step:
        id: '192'
        action: Script
        object_path: oldColHeader = sheet2.Cells(1,a)
    - step:
        id: '193'
        action: Script
        object_path: If InStr(1,oldColHeader, "NMI") Then
    - step:
        id: '194'
        action: Script
        object_path: oldColNMI = a
    - step:
        id: '195'
        action: Script
        object_path: oldColNMI = UCase(Chr(oldColNMI+96))
    - step:
        id: '196'
        action: Script
        object_path: Exit For
    - step:
        id: '197'
        action: Script
        object_path: End If
    - step:
        id: '198'
        action: Script
        object_path: Next
    - step:
        id: '199'
        action: Script
        object_path: '''Get Notes column name for the old sheet'
    - step:
        id: '200'
        action: Script
        object_path: For b = 1 to oldColCount
    - step:
        id: '201'
        action: Script
        object_path: oldColHeader = sheet2.Cells(1,b)
    - step:
        id: '202'
        action: Script
        object_path: If InStr(1,oldColHeader, "Notes") Then
    - step:
        id: '203'
        action: Script
        object_path: oldColNotes = b
    - step:
        id: '204'
        action: Script
        object_path: oldColNotes = UCase(Chr(oldColNotes+96))
    - step:
        id: '205'
        action: Script
        object_path: Exit For
    - step:
        id: '206'
        action: Script
        object_path: End If
    - step:
        id: '207'
        action: Script
        object_path: Next
    - step:
        id: '208'
        action: Script
        object_path: '''Get Notes column name for the old sheet'
    - step:
        id: '209'
        action: Script
        object_path: For c = 1 to oldColCount
    - step:
        id: '210'
        action: Script
        object_path: oldColHeader = sheet2.Cells(1,c)
    - step:
        id: '211'
        action: Script
        object_path: If InStr(1,oldColHeader, "New/Old") Then
    - step:
        id: '212'
        action: Script
        object_path: oldColOldNew = c
    - step:
        id: '213'
        action: Script
        object_path: oldColOldNew = UCase(Chr(oldColOldNew+96))
    - step:
        id: '214'
        action: Script
        object_path: Exit For
    - step:
        id: '215'
        action: Script
        object_path: End If
    - step:
        id: '216'
        action: Script
        object_path: Next
    - step:
        id: '217'
        action: Script
        object_path: currRows = Sheet1.UsedRange.Rows.Count
    - step:
        id: '218'
        action: Script
        object_path: oldRows = Sheet2.UsedRange.Rows.Count
    - step:
        id: '219'
        action: Script
        object_path: If (currRows > 1) and (oldRows > 1) Then
    - step:
        id: '220'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '221'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '222'
        action: Script
        object_path: For k = 2 to oldRows
    - step:
        id: '223'
        action: Script
        object_path: nmiVal = Trim(Sheet2.Range(oldColNMI & k))
    - step:
        id: '224'
        action: Script
        object_path: If Len(nmiVal) = 11 Then
    - step:
        id: '225'
        action: Script
        object_path: nmiVal = Mid(Trim(Sheet2.Range(oldColNMI & k)),1,Len(Trim(Sheet2.Range(oldColNMI
          & k)))-1)
    - step:
        id: '226'
        action: Script
        object_path: End If
    - step:
        id: '227'
        action: Script
        object_path: If oDic.Exists(nmiVal) Then
    - step:
        id: '228'
        action: Script
        object_path: Else
    - step:
        id: '229'
        object_path: oDic.Add nmiVal,Trim(Sheet2
        action: Range(oldColNotes
        args: '& k))'
    - step:
        id: '230'
        action: Script
        object_path: End If
    - step:
        id: '231'
        action: Script
        object_path: Next
    - step:
        id: '232'
        action: Script
        object_path: For l = 2 to currRows
    - step:
        id: '233'
        action: Script
        object_path: curRowNMI = Sheet1.Cells(l,colNMI)
    - step:
        id: '234'
        action: Script
        object_path: If oDic.Exists(Trim(curRowNMI)) Then
    - step:
        id: '235'
        object_path: Sheet1.Cells(l,colNotes) = oDic
        action: Item(Trim(curRowNMI))
    - step:
        id: '236'
        object_path: Sheet1
        action: Cells(l,colOldNew)
        args: = "Old"
    - step:
        id: '237'
        action: Script
        object_path: Else
    - step:
        id: '238'
        object_path: Sheet1
        action: Cells(l,colOldNew)
        args: = "New"
    - step:
        id: '239'
        action: Script
        object_path: End If
    - step:
        id: '240'
        action: Script
        object_path: Next
    - step:
        id: '241'
        action: Script
        object_path: End If
    - step:
        id: '242'
        action: Script
        object_path: End If
    - step:
        id: '243'
        action: Script
        object_path: Next
    - step:
        id: '244'
        action: Script
        object_path: End If
    - step:
        id: '245'
        action: Script
        object_path: Next
    - step:
        id: '246'
        action: Script
        object_path: '''if current report worksheet is not found in the old report
          then write NMI as new in the New/old column'
    - step:
        id: '247'
        action: Script
        object_path: For Each wksht in workbook1.Worksheets
    - step:
        id: '248'
        action: Script
        object_path: If oDicWksht.Exists(wksht.Name) Then
    - step:
        id: '249'
        action: Script
        object_path: 'set sheet3 = workbook1.worksheets(wksht.Name)  '
        comment: ' set worksheet for current report'
    - step:
        id: '250'
        action: Script
        object_path: colCount = sheet3.Evaluate("COUNTA(1:1)")
    - step:
        id: '251'
        action: Script
        object_path: currRows = Sheet3.UsedRange.Rows.Count
    - step:
        id: '252'
        action: Script
        object_path: For n = 1 to colCount
    - step:
        id: '253'
        action: Script
        object_path: colHeader = sheet3.Cells(1,n)
    - step:
        id: '254'
        action: Script
        object_path: If inStr(1, colHeader, "New/Old") > 0 Then
    - step:
        id: '255'
        action: Script
        object_path: colOldNew = n
    - step:
        id: '256'
        action: Script
        object_path: colOldNew = UCase(Chr(colOldNew+96))
    - step:
        id: '257'
        action: Script
        object_path: Exit for
    - step:
        id: '258'
        action: Script
        object_path: End If
    - step:
        id: '259'
        action: Script
        object_path: Next
    - step:
        id: '260'
        action: Script
        object_path: For j = 2 to currRows
    - step:
        id: '261'
        object_path: Sheet3
        action: Cells(j,colOldNew)
        args: = "New"
    - step:
        id: '262'
        action: Script
        object_path: Next
    - step:
        id: '263'
        action: Script
        object_path: End If
    - step:
        id: '264'
        action: Script
        object_path: Next
    - step:
        id: '265'
        action: Script
        object_path: '''Saving Workbook'
    - step:
        id: '266'
        object_path: workbook2
        action: Save
    - step:
        id: '267'
        object_path: workbook1
        action: Save
    - step:
        id: '268'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '269'
        action: Script
        object_path: Set oDic1 = Nothing
    - step:
        id: '270'
        action: Script
        object_path: Set oDic2 = Nothing
    - step:
        id: '271'
        action: Script
        object_path: Set oDicWksht = Nothing
    - step:
        id: '272'
        action: Script
        object_path: set sheet3 = Nothing
    - step:
        id: '273'
        action: Script
        object_path: '''Add Pivot Table'
    - step:
        id: '274'
        action: Script
        object_path: Sheetname = "Pivot_Table"
    - step:
        id: '275'
        action: Script
        object_path: set workbook1 = xls.workbooks.open(newFile)
    - step:
        id: '276'
        action: Script
        object_path: sheetcount = xls.Worksheets.count
    - step:
        id: '277'
        action: Script
        object_path: Set sheet = workbook1.Sheets.Add(workbook1.Worksheets(1))
    - step:
        id: '278'
        object_path: sheet
        action: Name
        args: = Sheetname
    - step:
        id: '279'
        action: Script
        object_path: '''create columns for the new pivot table worksheet'
    - step:
        id: '280'
        object_path: sheet
        action: Cells(1,1)
        args: = "Notes"
    - step:
        id: '281'
        object_path: sheet
        action: Cells(1,2)
        args: = "QueryID"
    - step:
        id: '282'
        object_path: sheet
        action: Cells(1,3)
        args: = "Number"
    - step:
        id: '283'
        action: Script
        object_path: r = 2
    - step:
        id: '284'
        action: Script
        object_path: '''navigate through all the worksheets and count the occurances
          of the notes column values'
    - step:
        id: '285'
        action: Script
        object_path: For Each wksht in workbook1.Worksheets
    - step:
        id: '286'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '287'
        action: Script
        object_path: If wkshtNameStr <> Sheetname Then
    - step:
        id: '288'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '289'
        action: Script
        object_path: sheetRows = wksht.usedrange.rows.count
    - step:
        id: '290'
        action: Script
        object_path: '''Get notes column number'
    - step:
        id: '291'
        action: Script
        object_path: usedcolumn = wksht.Evaluate("COUNTA(1:1)")
    - step:
        id: '292'
        action: Script
        object_path: For cols = 1 to usedcolumn
    - step:
        id: '293'
        action: Script
        object_path: cellValue = wksht.Cells(1,cols)
    - step:
        id: '294'
        action: Script
        object_path: If cellValue = "Notes" Then
    - step:
        id: '295'
        action: Script
        object_path: notesCol = cols
    - step:
        id: '296'
        action: Script
        object_path: Exit for
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
        action: Script
        object_path: For i = 2 to sheetRows
    - step:
        id: '300'
        action: Script
        object_path: notesText = Trim(wksht.Cells(i, notesCol).Value)
    - step:
        id: '301'
        action: Script
        object_path: If notesText <> "" Then
    - step:
        id: '302'
        action: Script
        object_path: If oDic.Exists(notesText) Then
    - step:
        id: '303'
        object_path: oDic.Item(notesText) = oDic
        action: Item(notesText)
        args: + 1
    - step:
        id: '304'
        action: Script
        object_path: Else
    - step:
        id: '305'
        object_path: oDic
        action: add
        args: notesText,1
    - step:
        id: '306'
        action: Script
        object_path: End If
    - step:
        id: '307'
        action: Script
        object_path: End If
    - step:
        id: '308'
        action: Script
        object_path: Next
    - step:
        id: '309'
        action: Script
        object_path: '''write dictionary values to the pivot table worksheet'
    - step:
        id: '310'
        action: Script
        object_path: For each key in oDic
    - step:
        id: '311'
        object_path: sheet
        action: Cells(r,1)
        args: = key
    - step:
        id: '312'
        object_path: sheet
        action: Cells(r,2)
        args: = wkshtNameStr
    - step:
        id: '313'
        object_path: sheet.Cells(r,3) = oDic
        action: item(key)
    - step:
        id: '314'
        action: Script
        object_path: r = r + 1
    - step:
        id: '315'
        action: Script
        object_path: Next
    - step:
        id: '316'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '317'
        action: Script
        object_path: End If
    - step:
        id: '318'
        action: Script
        object_path: Next
    - step:
        id: '319'
        object_path: workbook1
        action: Save
    - step:
        id: '320'
        object_path: workbook2
        action: Close
    - step:
        id: '321'
        object_path: workbook1
        action: Close
    - step:
        id: '322'
        object_path: xls
        action: Quit
    - step:
        id: '323'
        action: Script
        object_path: '''Clear variables'
    - step:
        id: '324'
        action: Script
        object_path: Set oFSO = nothing
    - step:
        id: '325'
        action: Script
        object_path: set workbook2 = NOTHING
    - step:
        id: '326'
        action: Script
        object_path: set workbook1 = NOTHING
    - step:
        id: '327'
        action: Script
        object_path: set sheet1 = NOTHING
    - step:
        id: '328'
        action: Script
        object_path: set sheet2 = NOTHING
    - step:
        id: '329'
        action: Script
        object_path: Set xls = NOTHING
    - step:
        id: '330'
        action: Script
        object_path: Row1 = Empty
    - step:
        id: '331'
        action: Script
        object_path: Row2 = Empty
    - step:
        id: '332'
        action: Script
        object_path: Comment = EMPTY
    - step:
        id: '333'
        action: Script
        object_path: j = empty
    - step:
        id: '334'
        action: Script
        object_path: i = empty
    - step:
        id: '335'
        action: Script
        object_path: k = empty
    - step:
        id: '336'
        action: Script
        object_path: l = empty
    - step:
        id: '337'
        action: Script
        object_path: m = empty
    - step:
        id: '338'
        action: Script
        object_path: a = empty
    - step:
        id: '339'
        action: Script
        object_path: b = empty
    - step:
        id: '340'
        action: Script
        object_path: c = empty
    - step:
        id: '341'
        action: Script
        object_path: d = empty
    - step:
        id: '342'
        action: Script
        object_path: e = empty
    - step:
        id: '343'
        action: Script
        object_path: currRows = empty
    - step:
        id: '344'
        action: Script
        object_path: oldRows = empty
    - step:
        id: '345'
        action: Script
        object_path: curRowNMI = empty
    - step:
        id: '346'
        action: Script
        object_path: oldfile = empty
    - step:
        id: '347'
        action: Script
        object_path: newFile = empty
    - step:
        id: '348'
        action: Script
        object_path: oldColCount = Empty
    - step:
        id: '349'
        action: Script
        object_path: oldColNMI = empty
    - step:
        id: '350'
        action: Script
        object_path: oldColNotes = empty
    - step:
        id: '351'
        action: Script
        object_path: oldColMDPNotes = empty
    - step:
        id: '352'
        action: Script
        object_path: oldColOther = empty
    - step:
        id: '353'
        action: Script
        object_path: oldColHeader = empty
    - step:
        id: '354'
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
