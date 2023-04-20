namespace: BCRM_Reports
operation:
  name: LookupandCompare
  inputs:
  - currentWeekDay
  - reportDate
  - location
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.LookupandCompare:1.0.0
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
        object_path: todaysFormattedfolder = Parameter("location")&"Formatted Files\"
    - step:
        id: '2'
        action: Script
        object_path: previousdayfolder = Parameter("location")&"Old Reports\"
    - step:
        id: '3'
        action: Script
        object_path: currentWeekDay = Parameter("currentWeekDay")
    - step:
        id: '4'
        action: Script
        object_path: reportDate = Parameter("reportDate")
    - step:
        id: '5'
        action: Script
        object_path: reportDate = Replace(reportDate,"/",".")
    - step:
        id: '6'
        action: Script
        object_path: If currentWeekDay <> "Monday" then
    - step:
        id: '7'
        action: Script
        object_path: Set oFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '8'
        action: Script
        object_path: For Each cFile In oFSO.GetFolder(todaysFormattedfolder).Files
    - step:
        id: '9'
        action: Script
        object_path: If InStr(cFile.Name, reportDate) = 0 Then
    - step:
        id: '10'
        action: Script
        object_path: If oFSO.FileExists(previousdayfolder&cFile.Name) = false Then
    - step:
        id: '11'
        object_path: oFSO.MoveFile todaysFormattedfolder&cFile.Name, previousdayfolder&cFile
        action: Name
    - step:
        id: '12'
        action: Script
        object_path: Else
    - step:
        id: '13'
        object_path: oFSO.DeleteFile(todaysFormattedfolder&cFile
        action: Name)
    - step:
        id: '14'
        action: Script
        object_path: End If
    - step:
        id: '15'
        action: Script
        object_path: Else
    - step:
        id: '16'
        action: Script
        object_path: currentFileName = cFile.Name
    - step:
        id: '17'
        action: Script
        object_path: rptCategory = Mid(currentFileName,instr(currentFileName,"-")+1)
    - step:
        id: '18'
        action: Script
        object_path: reqfilename = Instr(1, rptCategory, "-")
    - step:
        id: '19'
        action: Script
        object_path: reqfilename = Instr(reqfilename+1, rptCategory, "-")
    - step:
        id: '20'
        action: Script
        object_path: reqfilename = Left(rptCategory, reqfilename-1)
    - step:
        id: '21'
        action: Script
        object_path: For Each pFile In oFSO.GetFolder(previousdayfolder).Files
    - step:
        id: '22'
        action: Script
        object_path: prevFileName = pFile.Name
    - step:
        id: '23'
        action: Script
        object_path: If Instr(1, prevFileName, reqfilename) > 0 Then
    - step:
        id: '24'
        action: Script
        object_path: Exit For
    - step:
        id: '25'
        action: Script
        object_path: End If
    - step:
        id: '26'
        action: Script
        object_path: Next
    - step:
        id: '27'
        action: Script
        object_path: set xls = createObject("excel.application")
    - step:
        id: '28'
        object_path: xls
        action: visible=false
    - step:
        id: '29'
        action: Script
        object_path: 'set workbook2 = xls.workbooks.open(todaysFormattedfolder&currentFileName) '
        comment: Recent File
    - step:
        id: '30'
        action: Script
        object_path: 'set workbook1 = xls.workbooks.open(previousdayfolder&prevFileName) '
        comment: ' old file'
    - step:
        id: '31'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '32'
        object_path: workbook2
        action: Save
    - step:
        id: '33'
        object_path: workbook1
        action: Save
    - step:
        id: '34'
        action: Script
        object_path: '''Old File'
    - step:
        id: '35'
        action: Script
        object_path: For Each wksht in workbook1.Worksheets
    - step:
        id: '36'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '37'
        action: Script
        object_path: lenStr = Instr(1, wkshtNameStr, "- WEEK")
    - step:
        id: '38'
        action: Script
        object_path: lenStr = lenStr+6
    - step:
        id: '39'
        action: Script
        object_path: currentSheetName = Mid(wkshtNameStr, 1, lenStr)
    - step:
        id: '40'
        action: Script
        object_path: For Each wksht2 in workbook2.Worksheets
    - step:
        id: '41'
        action: Script
        object_path: wkshtNameStr2 = wksht2.Name
    - step:
        id: '42'
        action: Script
        object_path: 'If InStr(1, wkshtNameStr2, currentSheetName) > 0 Then '
        comment: Recent Sheet
    - step:
        id: '43'
        action: Script
        object_path: Exit For
    - step:
        id: '44'
        action: Script
        object_path: End If
    - step:
        id: '45'
        action: Script
        object_path: Next
    - step:
        id: '46'
        action: Script
        object_path: 'set sheet1 = workbook1.worksheets(wkshtNameStr)  '
        comment: sheet in old file
    - step:
        id: '47'
        action: Script
        object_path: 'set sheet2 = workbook2.worksheets(wkshtNameStr2)  '
        comment: ' sheet in new file'
    - step:
        id: '48'
        action: Script
        object_path: If Instr(1, wkshtNameStr, "ESTIMATES") > 0 Then
    - step:
        id: '49'
        action: Script
        object_path: columnNum = "K"
    - step:
        id: '50'
        action: Script
        object_path: columnNum1 = "L"
    - step:
        id: '51'
        action: Script
        object_path: columnNum2 = "M"
    - step:
        id: '52'
        action: Script
        object_path: '''columnNum = "J"'
    - step:
        id: '53'
        action: Script
        object_path: '''columnNum1 = "K"'
    - step:
        id: '54'
        action: Script
        object_path: '''columnNum2 = "L"'
    - step:
        id: '55'
        action: Script
        object_path: ElseIf (reqfilename = "BASIC-NULLS")  and (Instr(1, wkshtNameStr,
          "NULLS") > 0) Then
    - step:
        id: '56'
        action: Script
        object_path: columnNum = "H"
    - step:
        id: '57'
        action: Script
        object_path: columnNum1 = "I"
    - step:
        id: '58'
        action: Script
        object_path: columnNum2 = "J"
    - step:
        id: '59'
        action: Script
        object_path: ElseIf (reqfilename = "INTERVAL-NULLS")  and (Instr(1, wkshtNameStr,
          "NULLS") > 0) Then
    - step:
        id: '60'
        action: Script
        object_path: columnNum = "E"
    - step:
        id: '61'
        action: Script
        object_path: columnNum1 = "F"
    - step:
        id: '62'
        action: Script
        object_path: columnNum2 = "G"
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        action: Script
        object_path: Row1 = Sheet1.UsedRange.Rows.Count
    - step:
        id: '65'
        action: Script
        object_path: Row2 = Sheet2.UsedRange.Rows.Count
    - step:
        id: '66'
        action: Script
        object_path: If (Row1 > 1) and (Row2 > 1) Then
    - step:
        id: '67'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '68'
        action: Script
        object_path: Set oDic3 = CreateObject("Scripting.Dictionary")
    - step:
        id: '69'
        action: Script
        object_path: Set oDic4 = CreateObject("Scripting.Dictionary")
    - step:
        id: '70'
        action: Script
        object_path: For i = 2 To Row1
    - step:
        id: '71'
        action: Script
        object_path: If oDic.Exists(Trim(Sheet1.Range("A" & i))) Then
    - step:
        id: '72'
        action: Script
        object_path: Else
    - step:
        id: '73'
        object_path: oDic.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum
        args: '& i))'
    - step:
        id: '74'
        object_path: oDic3.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum1
        args: '& i))'
    - step:
        id: '75'
        object_path: oDic4.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum2
        args: '& i))'
    - step:
        id: '76'
        action: Script
        object_path: End If
    - step:
        id: '77'
        action: Script
        object_path: Next
    - step:
        id: '78'
        action: Script
        object_path: Set oDic2 = CreateObject("Scripting.Dictionary")
    - step:
        id: '79'
        action: Script
        object_path: For j = 2 To Row2
    - step:
        id: '80'
        action: Script
        object_path: If oDic2.Exists(Trim(Sheet2.Range("A" & j))) Then
    - step:
        id: '81'
        object_path: oDic2(Trim(Sheet2.Range("A" & j))).Add j,Trim(Sheet2
        action: Range(columnNum
        args: '& j))'
    - step:
        id: '82'
        action: Script
        object_path: Else
    - step:
        id: '83'
        object_path: oDic2.Add Trim(Sheet2
        action: Range("A"
        args: '& j)),CreateObject("Scripting.Dictionary")'
    - step:
        id: '84'
        object_path: oDic2(Trim(Sheet2.Range("A" & j))).Add j,Trim(Sheet2
        action: Range(columnNum
        args: '& j))'
    - step:
        id: '85'
        action: Script
        object_path: End If
    - step:
        id: '86'
        action: Script
        object_path: Next
    - step:
        id: '87'
        action: Script
        object_path: For Each key In oDic2.Keys
    - step:
        id: '88'
        action: Script
        object_path: If oDic.Exists(key) Then
    - step:
        id: '89'
        action: Script
        object_path: Comment = oDic.Item(key)
    - step:
        id: '90'
        action: Script
        object_path: actionedBy = oDic3.Item(key)
    - step:
        id: '91'
        action: Script
        object_path: dateActioned = oDic4.Item(key)
    - step:
        id: '92'
        action: Script
        object_path: End If
    - step:
        id: '93'
        action: Script
        object_path: If Comment <> EMPTY Then
    - step:
        id: '94'
        action: Script
        object_path: For Each key2 In oDic2.Item(key).Keys
    - step:
        id: '95'
        object_path: Sheet2
        action: Range(columnNum
        args: '& key2) = Comment'
    - step:
        id: '96'
        object_path: Sheet2
        action: Range(columnNum1
        args: '& key2) = actionedBy'
    - step:
        id: '97'
        object_path: Sheet2
        action: Range(columnNum2
        args: '& key2) = dateActioned'
    - step:
        id: '98'
        action: Script
        object_path: Next
    - step:
        id: '99'
        action: Script
        object_path: End If
    - step:
        id: '100'
        action: Script
        object_path: Comment = EMPTY
    - step:
        id: '101'
        action: Script
        object_path: Next
    - step:
        id: '102'
        action: Script
        object_path: End If
    - step:
        id: '103'
        action: Script
        object_path: '''Saving Workbook'
    - step:
        id: '104'
        object_path: workbook2
        action: Save
    - step:
        id: '105'
        object_path: workbook1
        action: Save
    - step:
        id: '106'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '107'
        action: Script
        object_path: Set oDic2 = Nothing
    - step:
        id: '108'
        action: Script
        object_path: Set oDic3 = Nothing
    - step:
        id: '109'
        action: Script
        object_path: Set oDic4 = Nothing
    - step:
        id: '110'
        action: Script
        object_path: Next
    - step:
        id: '111'
        object_path: workbook2
        action: Save
    - step:
        id: '112'
        object_path: workbook1
        action: Save
    - step:
        id: '113'
        object_path: workbook2
        action: Close
    - step:
        id: '114'
        object_path: workbook1
        action: Close
    - step:
        id: '115'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '116'
        object_path: xls
        action: Quit
    - step:
        id: '117'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '118'
        action: Script
        object_path: End If
    - step:
        id: '119'
        action: Script
        object_path: next
    - step:
        id: '120'
        action: Script
        object_path: Else
    - step:
        id: '121'
        action: Script
        object_path: Set oFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '122'
        action: Script
        object_path: For Each cFile In oFSO.GetFolder(todaysFormattedfolder).Files
    - step:
        id: '123'
        action: Script
        object_path: currentFileName = cFile.Name
    - step:
        id: '124'
        action: Script
        object_path: rptCategory = Mid(currentFileName,instr(currentFileName,"-")+1)
    - step:
        id: '125'
        action: Script
        object_path: reqfilename = Instr(1, rptCategory, "-")
    - step:
        id: '126'
        action: Script
        object_path: reqfilename = Instr(reqfilename+1, rptCategory, "-")
    - step:
        id: '127'
        action: Script
        object_path: reqfilename = Left(rptCategory, reqfilename-1)
    - step:
        id: '128'
        action: Script
        object_path: prevFileName = Empty
    - step:
        id: '129'
        action: Script
        object_path: '''loop through the old reports folder and pick the right file'
    - step:
        id: '130'
        action: Script
        object_path: For Each pFile In oFSO.GetFolder(previousdayfolder).Files
    - step:
        id: '131'
        action: Script
        object_path: pFileName = pFile.Name
    - step:
        id: '132'
        action: Script
        object_path: If Instr(1, pFileName, reqfilename) > 0 Then
    - step:
        id: '133'
        action: Script
        object_path: prevFileName = pFile.Name
    - step:
        id: '134'
        action: Script
        object_path: Exit For
    - step:
        id: '135'
        action: Script
        object_path: End If
    - step:
        id: '136'
        action: Script
        object_path: Next
    - step:
        id: '137'
        action: Script
        object_path: If prevFileName <> Empty Then
    - step:
        id: '138'
        action: Script
        object_path: set xls = createObject("excel.application")
    - step:
        id: '139'
        object_path: xls
        action: visible
        args: =false
    - step:
        id: '140'
        action: Script
        object_path: 'set workbook2 = xls.workbooks.open(todaysFormattedfolder&currentFileName) '
        comment: Recent File
    - step:
        id: '141'
        action: Script
        object_path: 'set workbook1 = xls.workbooks.open(previousdayfolder&prevFileName) '
        comment: ' old file'
    - step:
        id: '142'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '143'
        object_path: workbook2
        action: Save
    - step:
        id: '144'
        object_path: workbook1
        action: Save
    - step:
        id: '145'
        action: Script
        object_path: If InStr(1, reqfilename, "ESTIMATES") > 0 Then
    - step:
        id: '146'
        action: Script
        object_path: Count = 1
    - step:
        id: '147'
        action: Script
        object_path: For Each wksht in workbook1.Worksheets
    - step:
        id: '148'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '149'
        action: Script
        object_path: lenStr = Instr(1, wkshtNameStr, "- WEEK")
    - step:
        id: '150'
        action: Script
        object_path: lenStr = lenStr+6
    - step:
        id: '151'
        action: Script
        object_path: currentSheetName = Mid(wkshtNameStr, 1, lenStr)
    - step:
        id: '152'
        action: Script
        object_path: If InStr(1, currentSheetName, "Sheet") <> 1  Then
    - step:
        id: '153'
        action: Script
        object_path: If Count = 1 Then
    - step:
        id: '154'
        action: Script
        object_path: 'set sheet1 = workbook1.worksheets(wkshtNameStr)  '
        comment: sheet in old file
    - step:
        id: '155'
        action: Script
        object_path: Count  = Count + 1
    - step:
        id: '156'
        action: Script
        object_path: Row1 = Empty
    - step:
        id: '157'
        action: Script
        object_path: Row1 = Sheet1.UsedRange.Rows.Count
    - step:
        id: '158'
        action: Script
        object_path: ElseIF  Count = 2 Then
    - step:
        id: '159'
        action: Script
        object_path: set sheet3 = workbook1.worksheets(wkshtNameStr)
    - step:
        id: '160'
        action: Script
        object_path: Row3 = Empty
    - step:
        id: '161'
        action: Script
        object_path: Row3 = Sheet3.UsedRange.Rows.Count
    - step:
        id: '162'
        action: Script
        object_path: End If
    - step:
        id: '163'
        action: Script
        object_path: End If
    - step:
        id: '164'
        action: Script
        object_path: Next
    - step:
        id: '165'
        action: Script
        object_path: '''Set columns based on report category'
    - step:
        id: '166'
        action: Script
        object_path: '''If Instr(1, wkshtNameStr, "ESTIMATES") > 0 Then'
    - step:
        id: '167'
        action: Script
        object_path: If InStr(1, reqfilename, "ESTIMATES") > 0 Then
    - step:
        id: '168'
        action: Script
        object_path: "'\t\t\t\t\tcolumnNum = \"J\""
    - step:
        id: '169'
        action: Script
        object_path: "'\t\t\t\t\tcolumnNum1 = \"K\""
    - step:
        id: '170'
        action: Script
        object_path: "'\t\t\t\t\tcolumnNum2 = \"L\""
    - step:
        id: '171'
        action: Script
        object_path: columnNum = "K"
    - step:
        id: '172'
        action: Script
        object_path: columnNum1 = "L"
    - step:
        id: '173'
        action: Script
        object_path: columnNum2 = "M"
    - step:
        id: '174'
        action: Script
        object_path: End If
    - step:
        id: '175'
        action: Script
        object_path: If (Row1 > 1) Then
    - step:
        id: '176'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '177'
        action: Script
        object_path: Set oDic3 = CreateObject("Scripting.Dictionary")
    - step:
        id: '178'
        action: Script
        object_path: Set oDic4 = CreateObject("Scripting.Dictionary")
    - step:
        id: '179'
        action: Script
        object_path: For i = 2 To Row1
    - step:
        id: '180'
        action: Script
        object_path: If oDic.Exists(Trim(Sheet1.Range("A" & i))) = False Then
    - step:
        id: '181'
        object_path: oDic.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum
        args: '& i))'
    - step:
        id: '182'
        object_path: oDic3.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum1
        args: '& i))'
    - step:
        id: '183'
        object_path: oDic4.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum2
        args: '& i))'
    - step:
        id: '184'
        action: Script
        object_path: End If
    - step:
        id: '185'
        action: Script
        object_path: Next
    - step:
        id: '186'
        action: Script
        object_path: End If
    - step:
        id: '187'
        action: Script
        object_path: If (Row3 > 1) Then
    - step:
        id: '188'
        action: Script
        object_path: Set oDic5 = CreateObject("Scripting.Dictionary")
    - step:
        id: '189'
        action: Script
        object_path: Set oDic6 = CreateObject("Scripting.Dictionary")
    - step:
        id: '190'
        action: Script
        object_path: Set oDic7 = CreateObject("Scripting.Dictionary")
    - step:
        id: '191'
        action: Script
        object_path: For i = 2 To Row3
    - step:
        id: '192'
        action: Script
        object_path: If oDic5.Exists(Trim(Sheet3.Range("A" & i))) = False Then
    - step:
        id: '193'
        object_path: oDic5.Add Trim(Sheet3.Range("A" & i)),Trim(Sheet3
        action: Range(columnNum
        args: '& i))'
    - step:
        id: '194'
        object_path: oDic6.Add Trim(Sheet3.Range("A" & i)),Trim(Sheet3
        action: Range(columnNum1
        args: '& i))'
    - step:
        id: '195'
        object_path: oDic7.Add Trim(Sheet3.Range("A" & i)),Trim(Sheet3
        action: Range(columnNum2
        args: '& i))'
    - step:
        id: '196'
        action: Script
        object_path: End If
    - step:
        id: '197'
        action: Script
        object_path: Next
    - step:
        id: '198'
        action: Script
        object_path: End If
    - step:
        id: '199'
        action: Script
        object_path: For Each wksht2 in workbook2.Worksheets
    - step:
        id: '200'
        action: Script
        object_path: wkshtNameStr2 = wksht2.Name
    - step:
        id: '201'
        action: Script
        object_path: 'set sheet2 = workbook2.worksheets(wkshtNameStr2)    '
        comment: ' sheet in new file'
    - step:
        id: '202'
        action: Script
        object_path: If wkshtNameStr2 <> "Sheet1" Then
    - step:
        id: '203'
        action: Script
        object_path: Row2 = Sheet2.UsedRange.Rows.Count
    - step:
        id: '204'
        action: Script
        object_path: If Row2 > 1 Then
    - step:
        id: '205'
        action: Script
        object_path: Set oDic2 = CreateObject("Scripting.Dictionary")
    - step:
        id: '206'
        action: Script
        object_path: For j = 2 To Row2
    - step:
        id: '207'
        action: Script
        object_path: If oDic2.Exists(Trim(Sheet2.Range("A" & j))) Then
    - step:
        id: '208'
        object_path: oDic2(Trim(Sheet2.Range("A" & j))).Add j,Trim(Sheet2
        action: Range(columnNum
        args: '& j))'
    - step:
        id: '209'
        action: Script
        object_path: Else
    - step:
        id: '210'
        object_path: oDic2.Add Trim(Sheet2
        action: Range("A"
        args: '& j)),CreateObject("Scripting.Dictionary")'
    - step:
        id: '211'
        object_path: oDic2(Trim(Sheet2.Range("A" & j))).Add j,Trim(Sheet2
        action: Range(columnNum
        args: '& j))'
    - step:
        id: '212'
        action: Script
        object_path: End If
    - step:
        id: '213'
        action: Script
        object_path: Next
    - step:
        id: '214'
        action: Script
        object_path: For Each key In oDic2.Keys
    - step:
        id: '215'
        action: Script
        object_path: If (Row2 > 1) and (Row1 > 1)  Then
    - step:
        id: '216'
        action: Script
        object_path: If oDic.Exists(key)  Then
    - step:
        id: '217'
        action: Script
        object_path: Comment = oDic.Item(key)
    - step:
        id: '218'
        action: Script
        object_path: actionedBy = oDic3.Item(key)
    - step:
        id: '219'
        action: Script
        object_path: dateActioned = oDic4.Item(key)
    - step:
        id: '220'
        action: Script
        object_path: End If
    - step:
        id: '221'
        action: Script
        object_path: End If
    - step:
        id: '222'
        action: Script
        object_path: If (Row2 > 1) and (Row3 > 1)  Then
    - step:
        id: '223'
        action: Script
        object_path: If oDic5.Exists(key) Then
    - step:
        id: '224'
        action: Script
        object_path: Comment = oDic5.Item(key)
    - step:
        id: '225'
        action: Script
        object_path: actionedBy = oDic6.Item(key)
    - step:
        id: '226'
        action: Script
        object_path: dateActioned = oDic7.Item(key)
    - step:
        id: '227'
        action: Script
        object_path: End If
    - step:
        id: '228'
        action: Script
        object_path: End If
    - step:
        id: '229'
        action: Script
        object_path: If Comment <> EMPTY Then
    - step:
        id: '230'
        action: Script
        object_path: For Each key2 In oDic2.Item(key).Keys
    - step:
        id: '231'
        object_path: Sheet2
        action: Range(columnNum
        args: '& key2) = Comment'
    - step:
        id: '232'
        object_path: Sheet2
        action: Range(columnNum1
        args: '& key2) = actionedBy'
    - step:
        id: '233'
        object_path: Sheet2
        action: Range(columnNum2
        args: '& key2) = dateActioned'
    - step:
        id: '234'
        action: Script
        object_path: Next
    - step:
        id: '235'
        action: Script
        object_path: End If
    - step:
        id: '236'
        action: Script
        object_path: Comment = EMPTY
    - step:
        id: '237'
        action: Script
        object_path: Next
    - step:
        id: '238'
        action: Script
        object_path: Set oDic2 = Nothing
    - step:
        id: '239'
        action: Script
        object_path: End If
    - step:
        id: '240'
        action: Script
        object_path: '''Saving Workbook'
    - step:
        id: '241'
        object_path: workbook2
        action: Save
    - step:
        id: '242'
        object_path: workbook1
        action: Save
    - step:
        id: '243'
        action: Script
        object_path: End If
    - step:
        id: '244'
        action: Script
        object_path: Next
    - step:
        id: '245'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '246'
        action: Script
        object_path: Set oDic2 = Nothing
    - step:
        id: '247'
        action: Script
        object_path: Set oDic3 = Nothing
    - step:
        id: '248'
        action: Script
        object_path: Set oDic4 = Nothing
    - step:
        id: '249'
        action: Script
        object_path: Set oDic5 = Nothing
    - step:
        id: '250'
        action: Script
        object_path: Set oDic6 = Nothing
    - step:
        id: '251'
        action: Script
        object_path: Set oDic7 = Nothing
    - step:
        id: '252'
        action: Script
        object_path: Else
    - step:
        id: '253'
        action: Script
        object_path: For Each wksht in workbook1.Worksheets
    - step:
        id: '254'
        action: Script
        object_path: wkshtNameStr = wksht.Name
    - step:
        id: '255'
        action: Script
        object_path: lenStr = Instr(1, wkshtNameStr, "- WEEK")
    - step:
        id: '256'
        action: Script
        object_path: lenStr = lenStr+6
    - step:
        id: '257'
        action: Script
        object_path: currentSheetName = Mid(wkshtNameStr, 1, lenStr)
    - step:
        id: '258'
        action: Script
        object_path: For Each wksht2 in workbook2.Worksheets
    - step:
        id: '259'
        action: Script
        object_path: wkshtNameStr2 = wksht2.Name
    - step:
        id: '260'
        action: Script
        object_path: 'If InStr(1, wkshtNameStr2, currentSheetName) > 0 Then '
        comment: Recent Sheet
    - step:
        id: '261'
        action: Script
        object_path: Exit For
    - step:
        id: '262'
        action: Script
        object_path: End If
    - step:
        id: '263'
        action: Script
        object_path: Next
    - step:
        id: '264'
        action: Script
        object_path: 'set sheet1 = workbook1.worksheets(wkshtNameStr)  '
        comment: sheet in old file
    - step:
        id: '265'
        action: Script
        object_path: 'set sheet2 = workbook2.worksheets(wkshtNameStr2)  '
        comment: ' sheet in new file'
    - step:
        id: '266'
        action: Script
        object_path: If (reqfilename = "BASIC-NULLS")  and (Instr(1, wkshtNameStr,
          "NULLS") > 0) Then
    - step:
        id: '267'
        action: Script
        object_path: columnNum = "H"
    - step:
        id: '268'
        action: Script
        object_path: columnNum1 = "I"
    - step:
        id: '269'
        action: Script
        object_path: columnNum2 = "J"
    - step:
        id: '270'
        action: Script
        object_path: ElseIf (reqfilename = "INTERVAL-NULLS")  and (Instr(1, wkshtNameStr,
          "NULLS") > 0) Then
    - step:
        id: '271'
        action: Script
        object_path: columnNum = "E"
    - step:
        id: '272'
        action: Script
        object_path: columnNum1 = "F"
    - step:
        id: '273'
        action: Script
        object_path: columnNum2 = "G"
    - step:
        id: '274'
        action: Script
        object_path: End If
    - step:
        id: '275'
        action: Script
        object_path: Row1 = Sheet1.UsedRange.Rows.Count
    - step:
        id: '276'
        action: Script
        object_path: Row2 = Sheet2.UsedRange.Rows.Count
    - step:
        id: '277'
        action: Script
        object_path: If (Row1 > 1) and (Row2 > 1) Then
    - step:
        id: '278'
        action: Script
        object_path: Set oDic = CreateObject("Scripting.Dictionary")
    - step:
        id: '279'
        action: Script
        object_path: Set oDic3 = CreateObject("Scripting.Dictionary")
    - step:
        id: '280'
        action: Script
        object_path: Set oDic4 = CreateObject("Scripting.Dictionary")
    - step:
        id: '281'
        action: Script
        object_path: For i = 2 To Row1
    - step:
        id: '282'
        action: Script
        object_path: If oDic.Exists(Trim(Sheet1.Range("A" & i))) Then
    - step:
        id: '283'
        action: Script
        object_path: Else
    - step:
        id: '284'
        object_path: oDic.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum
        args: '& i))'
    - step:
        id: '285'
        object_path: oDic3.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum1
        args: '& i))'
    - step:
        id: '286'
        object_path: oDic4.Add Trim(Sheet1.Range("A" & i)),Trim(Sheet1
        action: Range(columnNum2
        args: '& i))'
    - step:
        id: '287'
        action: Script
        object_path: End If
    - step:
        id: '288'
        action: Script
        object_path: Next
    - step:
        id: '289'
        action: Script
        object_path: Set oDic2 = CreateObject("Scripting.Dictionary")
    - step:
        id: '290'
        action: Script
        object_path: For j = 2 To Row2
    - step:
        id: '291'
        action: Script
        object_path: If oDic2.Exists(Trim(Sheet2.Range("A" & j))) Then
    - step:
        id: '292'
        object_path: oDic2(Trim(Sheet2.Range("A" & j))).Add j,Trim(Sheet2
        action: Range(columnNum
        args: '& j))'
    - step:
        id: '293'
        action: Script
        object_path: Else
    - step:
        id: '294'
        object_path: oDic2.Add Trim(Sheet2
        action: Range("A"
        args: '& j)),CreateObject("Scripting.Dictionary")'
    - step:
        id: '295'
        object_path: oDic2(Trim(Sheet2.Range("A" & j))).Add j,Trim(Sheet2
        action: Range(columnNum
        args: '& j))'
    - step:
        id: '296'
        action: Script
        object_path: End If
    - step:
        id: '297'
        action: Script
        object_path: Next
    - step:
        id: '298'
        action: Script
        object_path: For Each key In oDic2.Keys
    - step:
        id: '299'
        action: Script
        object_path: If oDic.Exists(key) Then
    - step:
        id: '300'
        action: Script
        object_path: Comment = oDic.Item(key)
    - step:
        id: '301'
        action: Script
        object_path: actionedBy = oDic3.Item(key)
    - step:
        id: '302'
        action: Script
        object_path: dateActioned = oDic4.Item(key)
    - step:
        id: '303'
        action: Script
        object_path: End If
    - step:
        id: '304'
        action: Script
        object_path: If Comment <> EMPTY Then
    - step:
        id: '305'
        action: Script
        object_path: For Each key2 In oDic2.Item(key).Keys
    - step:
        id: '306'
        object_path: Sheet2
        action: Range(columnNum
        args: '& key2) = Comment'
    - step:
        id: '307'
        object_path: Sheet2
        action: Range(columnNum1
        args: '& key2) = actionedBy'
    - step:
        id: '308'
        object_path: Sheet2
        action: Range(columnNum2
        args: '& key2) = dateActioned'
    - step:
        id: '309'
        action: Script
        object_path: Next
    - step:
        id: '310'
        action: Script
        object_path: End If
    - step:
        id: '311'
        action: Script
        object_path: Comment = EMPTY
    - step:
        id: '312'
        action: Script
        object_path: Next
    - step:
        id: '313'
        action: Script
        object_path: End If
    - step:
        id: '314'
        action: Script
        object_path: '''Saving Workbook'
    - step:
        id: '315'
        object_path: workbook2
        action: Save
    - step:
        id: '316'
        object_path: workbook1
        action: Save
    - step:
        id: '317'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '318'
        action: Script
        object_path: Set oDic2 = Nothing
    - step:
        id: '319'
        action: Script
        object_path: Set oDic3 = Nothing
    - step:
        id: '320'
        action: Script
        object_path: Set oDic4 = Nothing
    - step:
        id: '321'
        action: Script
        object_path: Next
    - step:
        id: '322'
        object_path: workbook2
        action: Save
    - step:
        id: '323'
        object_path: workbook1
        action: Save
    - step:
        id: '324'
        action: Script
        object_path: End If
    - step:
        id: '325'
        object_path: workbook2
        action: Save
    - step:
        id: '326'
        object_path: workbook1
        action: Save
    - step:
        id: '327'
        object_path: workbook2
        action: Close
    - step:
        id: '328'
        object_path: workbook1
        action: Close
    - step:
        id: '329'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '330'
        object_path: xls
        action: Quit
    - step:
        id: '331'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '332'
        action: Script
        object_path: End If
    - step:
        id: '333'
        action: Script
        object_path: Next
    - step:
        id: '334'
        action: Script
        object_path: End If
    - step:
        id: '335'
        action: Script
        object_path: '''Saving Workbook'
    - step:
        id: '336'
        action: Script
        object_path: Set oDic = Nothing
    - step:
        id: '337'
        action: Script
        object_path: Set oDic2 = Nothing
    - step:
        id: '338'
        action: Script
        object_path: Set oDic3 = Nothing
    - step:
        id: '339'
        action: Script
        object_path: Set oDic4 = Nothing
    - step:
        id: '340'
        action: Script
        object_path: Set oDic5 = Nothing
    - step:
        id: '341'
        action: Script
        object_path: Set oDic6 = Nothing
    - step:
        id: '342'
        action: Script
        object_path: Set oDic7 = Nothing
    - step:
        id: '343'
        action: Script
        object_path: '''clear variables'
    - step:
        id: '344'
        action: Script
        object_path: Set oFSO = nothing
    - step:
        id: '345'
        action: Script
        object_path: set workbook2 = NOTHING
    - step:
        id: '346'
        action: Script
        object_path: set workbook1 = NOTHING
    - step:
        id: '347'
        action: Script
        object_path: set sheet1 = NOTHING
    - step:
        id: '348'
        action: Script
        object_path: set sheet2 = NOTHING
    - step:
        id: '349'
        action: Script
        object_path: set sheet3 = NOTHING
    - step:
        id: '350'
        action: Script
        object_path: Set xls = NOTHING
    - step:
        id: '351'
        action: Script
        object_path: Row1 = Empty
    - step:
        id: '352'
        action: Script
        object_path: Row2 = Empty
    - step:
        id: '353'
        action: Script
        object_path: Comment = EMPTY
    - step:
        id: '354'
        action: Script
        object_path: j = empty
    - step:
        id: '355'
        action: Script
        object_path: i = empty
    - step:
        id: '356'
        action: Script
        object_path: lenStr = empty
    - step:
        id: '357'
        action: Script
        object_path: columnNum = empty
    - step:
        id: '358'
        action: Script
        object_path: columnNum1 = empty
    - step:
        id: '359'
        action: Script
        object_path: columnNum2 = empty
    - step:
        id: '360'
        action: Script
        object_path: wkshtNameStr = empty
    - step:
        id: '361'
        action: Script
        object_path: wkshtNameStr2 = empty
    - step:
        id: '362'
        action: Script
        object_path: reqfilename = empty
    - step:
        id: '363'
        action: Script
        object_path: previousdayfolder = empty
    - step:
        id: '364'
        action: Script
        object_path: todaysFormattedfolder = empty
    - step:
        id: '365'
        action: Script
        object_path: currentFileName = Empty
    - step:
        id: '366'
        action: Script
        object_path: rptCategory = empty
    - step:
        id: '367'
        action: Script
        object_path: prevFileName =  empty
    - step:
        id: '368'
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '369'
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '370'
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
