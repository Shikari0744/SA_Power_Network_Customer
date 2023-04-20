namespace: EnervenMeterTesting
operation:
  name: CreateSummaryTestSheet_Type6
  inputs:
  - filelocation: C:\Users\svcrpabot\OneDrive - SA Power Networks\Enerven Meter Testing\Type
      6\
  sequential_action:
    gav: com.microfocus.seq:EnervenMeterTesting.CreateSummaryTestSheet_Type6:1.0.0
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
        object_path: '''OPEN THE TESTING RESULTS EXCEL'
    - step:
        id: '2'
        action: Script
        object_path: filelocation = Parameter("filelocation")
    - step:
        id: '3'
        action: Script
        object_path: filelocation = Replace(filelocation, "/", "\")
    - step:
        id: '4'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '5'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '6'
        action: Script
        object_path: Set objWord = CreateObject("Word.Application")
    - step:
        id: '7'
        object_path: objWord
        action: Visible
        args: = True
    - step:
        id: '8'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '9'
        action: Script
        object_path: Set objFolder = objFSO.GetFolder(filelocation)
    - step:
        id: '10'
        action: Script
        object_path: Set colFiles = objFolder.Files
    - step:
        id: '11'
        action: Script
        object_path: For Each objFile in colFiles
    - step:
        id: '12'
        action: Script
        object_path: attachmentFolder = Replace(objFile.Name, "Results.xlsx", "")
    - step:
        id: '13'
        action: Script
        object_path: attachmentFolder = attachmentFolder & "Attachments"
    - step:
        id: '14'
        action: Script
        object_path: summaryFolder = Replace(objFile.Name, "Results.xlsx", "")
    - step:
        id: '15'
        action: Script
        object_path: summaryFolder = summaryFolder & "Summary Sheets"
    - step:
        id: '16'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '17'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(filelocation&objFile.Name)
    - step:
        id: '18'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '19'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets("Sheet1")
    - step:
        id: '20'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '21'
        action: Script
        object_path: excelRowCount = objWorksheet.UsedRange.Rows.Count
    - step:
        id: '22'
        action: Script
        object_path: '''LOOP THROUGH THE EXCEL AND CREATE A SUMMARY SHEET'
    - step:
        id: '23'
        action: Script
        object_path: For x = 2 To excelRowCount
    - step:
        id: '24'
        action: Script
        object_path: summarySheetCreated = objWorksheet.cells(x,90).value
    - step:
        id: '25'
        action: Script
        object_path: If summarySheetCreated = "" Then
    - step:
        id: '26'
        action: Script
        object_path: '''CREATE A NEW EXCEL DOCUMENT'
    - step:
        id: '27'
        action: Script
        object_path: Set objDoc = objWord.Documents.Add()
    - step:
        id: '28'
        action: Script
        object_path: Set objSelection = objWord.Selection
    - step:
        id: '29'
        action: Script
        object_path: typeOfTest = objWorksheet.cells(x,1).value
    - step:
        id: '30'
        action: Script
        object_path: testSetType = objWorksheet.cells(x,2).value
    - step:
        id: '31'
        action: Script
        object_path: testSetNo = objWorksheet.cells(x,3).value
    - step:
        id: '32'
        action: Script
        object_path: stockItem = objWorksheet.cells(x,4).value
    - step:
        id: '33'
        action: Script
        object_path: meterNum = objWorksheet.cells(x,5).value
    - step:
        id: '34'
        action: Script
        object_path: If InStr(stockItem, "/") or InStr(stockItem, "-") Then
    - step:
        id: '35'
        action: Script
        object_path: stockItemheader = Replace(stockItem, "/", "-")
    - step:
        id: '36'
        action: Script
        object_path: stockItemheader = Replace(stockItemheader, " ", "")
    - step:
        id: '37'
        action: Script
        object_path: ElseIf stockItem <> "" and meterNum <> "" Then
    - step:
        id: '38'
        action: Script
        object_path: stockItemheader = stockItem & "-" & meterNum
    - step:
        id: '39'
        action: Script
        object_path: ElseIf stockItem = "" and meterNum <> ""  Then
    - step:
        id: '40'
        action: Script
        object_path: stockItemheader = meterNum
    - step:
        id: '41'
        action: Script
        object_path: End If
    - step:
        id: '42'
        action: Script
        object_path: program = objWorksheet.cells(x,6).value
    - step:
        id: '43'
        action: Script
        object_path: sampleLotNumber = objWorksheet.cells(x,7).value
    - step:
        id: '44'
        action: Script
        object_path: nmiNo = objWorksheet.cells(x,8).value
    - step:
        id: '45'
        action: Script
        object_path: noti = objWorksheet.cells(x,9).value
    - step:
        id: '46'
        action: Script
        object_path: suburb = objWorksheet.cells(x,10).value
    - step:
        id: '47'
        action: Script
        object_path: streetName = objWorksheet.cells(x,11).value
    - step:
        id: '48'
        action: Script
        object_path: streetNumber = objWorksheet.cells(x,12).value
    - step:
        id: '49'
        action: Script
        object_path: unitNumber = objWorksheet.cells(x,13).value
    - step:
        id: '50'
        action: Script
        object_path: rpk = objWorksheet.cells(x,14).value
    - step:
        id: '51'
        action: Script
        object_path: currentRating = objWorksheet.cells(x,15).value
    - step:
        id: '52'
        action: Script
        object_path: dateofTest = objWorksheet.cells(x,16).value
    - step:
        id: '53'
        action: Script
        object_path: dateofTestTitle = Replace(dateofTest, "/", "-")
    - step:
        id: '54'
        action: Script
        object_path: ambientTemp = objWorksheet.cells(x,17).value
    - step:
        id: '55'
        action: Script
        object_path: calibrationDate = objWorksheet.cells(x,18).value
    - step:
        id: '56'
        action: Script
        object_path: highReading = objWorksheet.cells(x,19).value
    - step:
        id: '57'
        action: Script
        object_path: lowReading = objWorksheet.cells(x,20).value
    - step:
        id: '58'
        action: Script
        object_path: export = objWorksheet.cells(x,21).value
    - step:
        id: '59'
        action: Script
        object_path: opcl = objWorksheet.cells(x,22).value
    - step:
        id: '60'
        action: Script
        object_path: neutralPhase = objWorksheet.cells(x,23).value
    - step:
        id: '61'
        action: Script
        object_path: redPhase = objWorksheet.cells(x,24).value
    - step:
        id: '62'
        action: Script
        object_path: whitePhase = objWorksheet.cells(x,25).value
    - step:
        id: '63'
        action: Script
        object_path: bluePhase = objWorksheet.cells(x,26).value
    - step:
        id: '64'
        action: Script
        object_path: lowLoadPFred1 = objWorksheet.cells(x,27).value
    - step:
        id: '65'
        action: Script
        object_path: lowLoadPFred2 = objWorksheet.cells(x,28).value
    - step:
        id: '66'
        action: Script
        object_path: lowLoadPFred3 = objWorksheet.cells(x,29).value
    - step:
        id: '67'
        action: Script
        object_path: lowLoadPFredSum = objWorksheet.cells(x,30).value
    - step:
        id: '68'
        action: Script
        object_path: lowLoadPFredAverage = objWorksheet.cells(x,31).value
    - step:
        id: '69'
        action: Script
        object_path: lowLoadPFwhite1 = objWorksheet.cells(x,32).value
    - step:
        id: '70'
        action: Script
        object_path: lowLoadPFwhite2 = objWorksheet.cells(x,33).value
    - step:
        id: '71'
        action: Script
        object_path: lowLoadPFwhite3 = objWorksheet.cells(x,34).value
    - step:
        id: '72'
        action: Script
        object_path: lowLoadPFwhiteSum = objWorksheet.cells(x,35).value
    - step:
        id: '73'
        action: Script
        object_path: lowLoadPFwhiteAverage = objWorksheet.cells(x,36).value
    - step:
        id: '74'
        action: Script
        object_path: lowLoadPFblue1 = objWorksheet.cells(x,37).value
    - step:
        id: '75'
        action: Script
        object_path: lowLoadPFblue2 = objWorksheet.cells(x,38).value
    - step:
        id: '76'
        action: Script
        object_path: lowLoadPFblue3 = objWorksheet.cells(x,39).value
    - step:
        id: '77'
        action: Script
        object_path: lowLoadPFblueSum = objWorksheet.cells(x,40).value
    - step:
        id: '78'
        action: Script
        object_path: lowLoadPFblueAverage = objWorksheet.cells(x,41).value
    - step:
        id: '79'
        action: Script
        object_path: lowLoadPFSum = objWorksheet.cells(x,42).value
    - step:
        id: '80'
        action: Script
        object_path: lowLoadPFAverage = objWorksheet.cells(x,43).value
    - step:
        id: '81'
        action: Script
        object_path: fullLoadPFred1 = objWorksheet.cells(x,44).value
    - step:
        id: '82'
        action: Script
        object_path: fullLoadPFred2 = objWorksheet.cells(x,45).value
    - step:
        id: '83'
        action: Script
        object_path: fullLoadPFred3 = objWorksheet.cells(x,46).value
    - step:
        id: '84'
        action: Script
        object_path: fullLoadPFredSum = objWorksheet.cells(x,47).value
    - step:
        id: '85'
        action: Script
        object_path: fullLoadPFredAverage = objWorksheet.cells(x,48).value
    - step:
        id: '86'
        action: Script
        object_path: fullLoadPFwhite1 = objWorksheet.cells(x,49).value
    - step:
        id: '87'
        action: Script
        object_path: fullLoadPFwhite2 = objWorksheet.cells(x,50).value
    - step:
        id: '88'
        action: Script
        object_path: fullLoadPFwhite3 = objWorksheet.cells(x,51).value
    - step:
        id: '89'
        action: Script
        object_path: fullLoadPFwhiteSum = objWorksheet.cells(x,52).value
    - step:
        id: '90'
        action: Script
        object_path: fullLoadPFwhiteAverage = objWorksheet.cells(x,53).value
    - step:
        id: '91'
        action: Script
        object_path: fullLoadPFblue1 = objWorksheet.cells(x,54).value
    - step:
        id: '92'
        action: Script
        object_path: fullLoadPFblue2 = objWorksheet.cells(x,55).value
    - step:
        id: '93'
        action: Script
        object_path: fullLoadPFblue3 = objWorksheet.cells(x,56).value
    - step:
        id: '94'
        action: Script
        object_path: fullLoadPFblueSum = objWorksheet.cells(x,57).value
    - step:
        id: '95'
        action: Script
        object_path: fullLoadPFblueAverage = objWorksheet.cells(x,58).value
    - step:
        id: '96'
        action: Script
        object_path: fullLoadPFSum = objWorksheet.cells(x,59).value
    - step:
        id: '97'
        action: Script
        object_path: fullLoadPFAverage = objWorksheet.cells(x,60).value
    - step:
        id: '98'
        action: Script
        object_path: fullLoad05red1 = objWorksheet.cells(x,61).value
    - step:
        id: '99'
        action: Script
        object_path: fullLoad05red2 = objWorksheet.cells(x,62).value
    - step:
        id: '100'
        action: Script
        object_path: fullLoad05red3 = objWorksheet.cells(x,63).value
    - step:
        id: '101'
        action: Script
        object_path: fullLoad05redSum = objWorksheet.cells(x,64).value
    - step:
        id: '102'
        action: Script
        object_path: fullLoad05redAverage = objWorksheet.cells(x,65).value
    - step:
        id: '103'
        action: Script
        object_path: fullLoad05white1 = objWorksheet.cells(x,66).value
    - step:
        id: '104'
        action: Script
        object_path: fullLoad05white2 = objWorksheet.cells(x,67).value
    - step:
        id: '105'
        action: Script
        object_path: fullLoad05white3 = objWorksheet.cells(x,68).value
    - step:
        id: '106'
        action: Script
        object_path: fullLoad05whiteSum = objWorksheet.cells(x,69).value
    - step:
        id: '107'
        action: Script
        object_path: fullLoad05whiteAverage = objWorksheet.cells(x,70).value
    - step:
        id: '108'
        action: Script
        object_path: fullLoad05blue1 = objWorksheet.cells(x,71).value
    - step:
        id: '109'
        action: Script
        object_path: fullLoad05blue2 = objWorksheet.cells(x,72).value
    - step:
        id: '110'
        action: Script
        object_path: fullLoad05blue3 = objWorksheet.cells(x,73).value
    - step:
        id: '111'
        action: Script
        object_path: fullLoad05blueSum = objWorksheet.cells(x,74).value
    - step:
        id: '112'
        action: Script
        object_path: fullLoad05blueAverage = objWorksheet.cells(x,75).value
    - step:
        id: '113'
        action: Script
        object_path: fullLoad05Sum = objWorksheet.cells(x,76).value
    - step:
        id: '114'
        action: Script
        object_path: fullLoad05Average = objWorksheet.cells(x,77).value
    - step:
        id: '115'
        action: Script
        object_path: overallFullLoad = objWorksheet.cells(x,78).value
    - step:
        id: '116'
        action: Script
        object_path: overallFullLoad = overallFullLoad * 100
    - step:
        id: '117'
        action: Script
        object_path: overallLowLoad = objWorksheet.cells(x,79).value
    - step:
        id: '118'
        action: Script
        object_path: overallLowLoad = overallLowLoad * 100
    - step:
        id: '119'
        action: Script
        object_path: meterTamp = objWorksheet.cells(x,80).value
    - step:
        id: '120'
        action: Script
        object_path: creep = objWorksheet.cells(x,81).value
    - step:
        id: '121'
        action: Script
        object_path: registration = objWorksheet.cells(x,82).value
    - step:
        id: '122'
        action: Script
        object_path: asbestos = objWorksheet.cells(x,83).value
    - step:
        id: '123'
        action: Script
        object_path: sticker = objWorksheet.cells(x,84).value
    - step:
        id: '124'
        action: Script
        object_path: passFail = objWorksheet.cells(x,85).value
    - step:
        id: '125'
        action: Script
        object_path: comments = objWorksheet.cells(x,86).value
    - step:
        id: '126'
        action: Script
        object_path: attachments = objWorksheet.cells(x,87).value
    - step:
        id: '127'
        action: Script
        object_path: id = objWorksheet.cells(x,88).value
    - step:
        id: '128'
        action: Script
        object_path: technicianName = objWorksheet.cells(x,89).value
    - step:
        id: '129'
        action: Script
        object_path: Call AddHeader(stockItemheader,id)
    - step:
        id: '130'
        action: Script
        object_path: Call AddTextData("Type of Test",typeOfTest)
    - step:
        id: '131'
        action: Script
        object_path: Call AddTextData("Test Set Type",testSetType)
    - step:
        id: '132'
        action: Script
        object_path: Call AddTextData("Test Set Number",testSetNo)
    - step:
        id: '133'
        action: Script
        object_path: Call AddTextData("Stock Item",stockItem)
    - step:
        id: '134'
        action: Script
        object_path: Call AddTextData("Meter",meterNum)
    - step:
        id: '135'
        action: Script
        object_path: Call AddTextData("Program",program)
    - step:
        id: '136'
        action: Script
        object_path: Call AddTextDataLong("Operators Name", technicianName, "/ Comments:",
          comments)
    - step:
        id: '137'
        action: Script
        object_path: Call AddAddressData("Address",unitNumber,streetNumber,streetName,suburb)
    - step:
        id: '138'
        action: Script
        object_path: Call AddTextData("Sample Lot",sampleLotNumber)
    - step:
        id: '139'
        action: Script
        object_path: Call AddTextData("NMI",nmiNo)
    - step:
        id: '140'
        action: Script
        object_path: Call AddTextData("Noti Details (If Applicable)",noti)
    - step:
        id: '141'
        action: Script
        object_path: Call AddTextData("RPK",rpk)
    - step:
        id: '142'
        action: Script
        object_path: Call AddTextData("Current Rating",currentRating)
    - step:
        id: '143'
        action: Script
        object_path: Call AddTextData("Date of Test",dateofTest)
    - step:
        id: '144'
        action: Script
        object_path: Call AddTextData("Ambient Temperature (°C)",ambientTemp)
    - step:
        id: '145'
        action: Script
        object_path: Call AddTextData("Calibration Date",calibrationDate)
    - step:
        id: '146'
        action: Script
        object_path: Call AddTextData("High Reading",highReading)
    - step:
        id: '147'
        action: Script
        object_path: Call AddTextData("Low Reading",lowReading)
    - step:
        id: '148'
        action: Script
        object_path: Call AddTextData("Export",export)
    - step:
        id: '149'
        action: Script
        object_path: Call AddTextData("OPCL",opcl)
    - step:
        id: '150'
        action: Script
        object_path: Call AddTextData("Neutral to Phase (Volts)",neutralPhase)
    - step:
        id: '151'
        action: Script
        object_path: Call AddTextData("Red to Phase (Volts)",redPhase)
    - step:
        id: '152'
        action: Script
        object_path: Call AddTextData("White to Phase (Volts)",whitePhase)
    - step:
        id: '153'
        action: Script
        object_path: Call AddTextData("Blue to Phase (Volts)",bluePhase)
    - step:
        id: '154'
        action: Script
        object_path: Call AddTableDataLong("Low Load (Unity PF) Red Test", lowLoadPFred1,
          lowLoadPFred2, lowLoadPFred3, lowLoadPFredSum, lowLoadPFredAverage)
    - step:
        id: '155'
        action: Script
        object_path: Call AddTableDataLong("Low Load (Unity PF) White Test", lowLoadPFwhite1,
          lowLoadPFwhite2, lowLoadPFwhite3, lowLoadPFwhiteSum, lowLoadPFwhiteAverage)
    - step:
        id: '156'
        action: Script
        object_path: Call AddTableDataLong("Low Load (Unity PF) Blue Test", lowLoadPFblue1,
          lowLoadPFblue2, lowLoadPFblue3, lowLoadPFblueSum, lowLoadPFblueAverage)
    - step:
        id: '157'
        action: Script
        object_path: Call AddTableData("Low Load (Unity PF)", lowLoadPFSum, lowLoadPFAverage)
    - step:
        id: '158'
        action: Script
        object_path: Call AddTableDataLong("Full Load (Unity PF) Red Test", fullLoadPFred1,
          fullLoadPFred2, fullLoadPFred3, fullLoadPFredSum, fullLoadPFredAverage)
    - step:
        id: '159'
        action: Script
        object_path: Call AddTableDataLong("Full Load (Unity PF) White Test", fullLoadPFwhite1,
          fullLoadPFwhite2, fullLoadPFwhite3, fullLoadPFwhiteSum, fullLoadPFwhiteAverage)
    - step:
        id: '160'
        action: Script
        object_path: Call AddTableDataLong("Full Load (Unity PF) Blue Test", fullLoadPFblue1,
          fullLoadPFblue2, fullLoadPFblue3, fullLoadPFblueSum, fullLoadPFblueAverage)
    - step:
        id: '161'
        action: Script
        object_path: Call AddTableData("Full Load (Unity PF)", fullLoadPFSum, fullLoadPFAverage)
    - step:
        id: '162'
        action: Script
        object_path: Call AddTableDataLong("Full Load (0.5 PF) Red Test", fullLoad05red1,
          fullLoad05red2, fullLoad05red3, fullLoad05redSum, fullLoad05redAverage)
    - step:
        id: '163'
        action: Script
        object_path: Call AddTableDataLong("Full Load (0.5 PF) White Test", fullLoad05white1,
          fullLoad05white2, fullLoad05white3, fullLoad05whiteSum, fullLoad05whiteAverage)
    - step:
        id: '164'
        action: Script
        object_path: Call AddTableDataLong("Full Load (0.5 PF) Blue Test", fullLoad05blue1,
          fullLoad05blue2, fullLoad05blue3, fullLoad05blueSum, fullLoad05blueAverage)
    - step:
        id: '165'
        action: Script
        object_path: Call AddTableData("Full Load (0.5 PF)", fullLoad05Sum, fullLoad05Average)
    - step:
        id: '166'
        action: Script
        object_path: Call AddTextData("Overall Error Full Load (%)",overallFullLoad)
    - step:
        id: '167'
        action: Script
        object_path: Call AddTextData("Overall Error Low Load (%)",overallLowLoad)
    - step:
        id: '168'
        action: Script
        object_path: Call AddMeterChecks("Meter Checks", meterTamp, creep, registration,
          asbestos, sticker)
    - step:
        id: '169'
        action: Script
        object_path: Call AddTextData("Test Result",passFail)
    - step:
        id: '170'
        action: Script
        object_path: If attachments <> "" Then
    - step:
        id: '171'
        action: Script
        object_path: Call AddAttachment(filelocation&attachmentFolder, id)
    - step:
        id: '172'
        action: Script
        object_path: End If
    - step:
        id: '173'
        action: Script
        object_path: fileName = filelocation&summaryFolder&"\Test Summary Sheet "&stockItemheader&"
          "&dateofTestTitle&" ID "&id&".docx"
    - step:
        id: '174'
        action: Script
        object_path: fileNamePDF = filelocation&summaryFolder&"\Test Summary Sheet
          "&stockItemheader&" "&dateofTestTitle&" ID "&id&".pdf"
    - step:
        id: '175'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '176'
        action: Script
        object_path: If Not fso.FolderExists(filelocation&summaryFolder) Then
    - step:
        id: '177'
        object_path: fso
        action: CreateFolder(filelocation&summaryFolder)
    - step:
        id: '178'
        action: Script
        object_path: End If
    - step:
        id: '179'
        action: Script
        object_path: If fso.FileExists(fileName)Then
    - step:
        id: '180'
        object_path: fso
        action: DeleteFile(fileName)
    - step:
        id: '181'
        action: Script
        object_path: End If
    - step:
        id: '182'
        action: Script
        object_path: If fso.FileExists(fileNamePDF)Then
    - step:
        id: '183'
        object_path: fso
        action: DeleteFile(fileNamePDF)
    - step:
        id: '184'
        action: Script
        object_path: End If
    - step:
        id: '185'
        action: Script
        object_path: Parameter("lastFileName") = fileNamePDF
    - step:
        id: '186'
        object_path: objDoc
        action: SaveAs(fileName)
    - step:
        id: '187'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '188'
        action: Script
        object_path: '''CONVERT TO PDF'
    - step:
        id: '189'
        object_path: objDoc
        action: SaveAs
        args: fileNamePDF,17
    - step:
        id: '190'
        object_path: objDoc
        action: Close
    - step:
        id: '191'
        action: Script
        object_path: '''DELETE DOCX'
    - step:
        id: '192'
        action: Script
        object_path: If fso.FileExists(fileName)Then
    - step:
        id: '193'
        object_path: fso
        action: DeleteFile(fileName)
    - step:
        id: '194'
        action: Script
        object_path: End If
    - step:
        id: '195'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '196'
        action: Script
        object_path: Set objShape = Nothing
    - step:
        id: '197'
        action: Script
        object_path: Set objSelection = Nothing
    - step:
        id: '198'
        action: Script
        object_path: Set objDoc = Nothing
    - step:
        id: '199'
        object_path: objWorksheet.cells(x,90)
        action: value
        args: = "YES"
    - step:
        id: '200'
        object_path: objWorkbook
        action: save
    - step:
        id: '201'
        action: Script
        object_path: End If
    - step:
        id: '202'
        action: Script
        object_path: Next
    - step:
        id: '203'
        object_path: objWorkbook
        action: close
    - step:
        id: '204'
        action: Script
        object_path: Next
    - step:
        id: '205'
        object_path: objExcel
        action: Quit
    - step:
        id: '206'
        object_path: objWord
        action: Quit
    - step:
        id: '207'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '208'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '209'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '210'
        action: Script
        object_path: Set objWord = Nothing
    - step:
        id: '211'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '212'
        action: Script
        object_path: Function AddHeader(header, id)
    - step:
        id: '213'
        object_path: objSelection.Font
        action: Name
        args: = "Arial"
    - step:
        id: '214'
        object_path: objSelection.Font
        action: Size
        args: = "14"
    - step:
        id: '215'
        object_path: objSelection
        action: TypeText
        args: '"Type 6 Meter Test: " & header'
    - step:
        id: '216'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '217'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '218'
        object_path: objSelection
        action: TypeText
        args: '"(SharePoint List ID: " & id & ")"'
    - step:
        id: '219'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '220'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '221'
        action: Script
        object_path: End Function
    - step:
        id: '222'
        action: Script
        object_path: Function AddTextData(subtitle,value)
    - step:
        id: '223'
        action: Script
        object_path: value = CStr(value)
    - step:
        id: '224'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '225'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '226'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '227'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '228'
        object_path: objSelection
        action: TypeText
        args: value
    - step:
        id: '229'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '230'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '231'
        action: Script
        object_path: End Function
    - step:
        id: '232'
        action: Script
        object_path: Function AddTextDataLong(subtitle,value1,value2,value3)
    - step:
        id: '233'
        action: Script
        object_path: value1 = CStr(value1)
    - step:
        id: '234'
        action: Script
        object_path: value2 = CStr(value2)
    - step:
        id: '235'
        action: Script
        object_path: value3 = CStr(value3)
    - step:
        id: '236'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '237'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '238'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '239'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '240'
        object_path: objSelection
        action: TypeText
        args: value1 &" "& value2 &" "& value3
    - step:
        id: '241'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '242'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '243'
        action: Script
        object_path: End Function
    - step:
        id: '244'
        action: Script
        object_path: Function AddAddressData(subtitle,unit,streetNo,streetName,subject)
    - step:
        id: '245'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '246'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '247'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '248'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '249'
        object_path: objSelection
        action: TypeText
        args: unit &" "& streetNo &" "& streetName &" "& subject
    - step:
        id: '250'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '251'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '252'
        action: Script
        object_path: End Function
    - step:
        id: '253'
        action: Script
        object_path: Function AddTableData(subtitle, test1, test2)
    - step:
        id: '254'
        action: Script
        object_path: test1 = CStr(test1)
    - step:
        id: '255'
        action: Script
        object_path: test2 = CStr(test2)
    - step:
        id: '256'
        action: Script
        object_path: Const END_OF_STORY = 6
    - step:
        id: '257'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '258'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '259'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '260'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '261'
        action: Script
        object_path: Set objRange = objDoc.Range()
    - step:
        id: '262'
        object_path: objRange.Start = objRange
        action: End
    - step:
        id: '263'
        object_path: objRange.tables
        action: Add
        args: objRange, 2, 2
    - step:
        id: '264'
        action: Script
        object_path: Set objTable = objDoc.tables(objDoc.tables.Count)
    - step:
        id: '265'
        object_path: objTable.Cell(1, 1).Range
        action: Text
        args: = "Total"
    - step:
        id: '266'
        object_path: objTable.Cell(1, 1).Range.Font
        action: Bold
        args: = True
    - step:
        id: '267'
        object_path: objTable.Cell(1, 1).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '268'
        object_path: objTable.Cell(2, 1).Range
        action: Text
        args: = test1
    - step:
        id: '269'
        object_path: objTable.Cell(1, 2).Range
        action: text
        args: = "Average"
    - step:
        id: '270'
        object_path: objTable.Cell(1, 2).Range.Font
        action: Bold
        args: = True
    - step:
        id: '271'
        object_path: objTable.Cell(1, 2).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '272'
        object_path: objTable.Cell(2, 2).Range
        action: Text
        args: = test2
    - step:
        id: '273'
        object_path: objSelection
        action: EndKey
        args: END_OF_STORY
    - step:
        id: '274'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '275'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '276'
        action: Script
        object_path: End Function
    - step:
        id: '277'
        action: Script
        object_path: Function AddTableDataLong(subtitle, test1, test2, test3, testSum,
          testAvg)
    - step:
        id: '278'
        action: Script
        object_path: test1 = CStr(test1)
    - step:
        id: '279'
        action: Script
        object_path: test2 = CStr(test2)
    - step:
        id: '280'
        action: Script
        object_path: test3 = CStr(test3)
    - step:
        id: '281'
        action: Script
        object_path: testSum = CStr(testSum)
    - step:
        id: '282'
        action: Script
        object_path: testAvg = CStr(testAvg)
    - step:
        id: '283'
        action: Script
        object_path: Const END_OF_STORY = 6
    - step:
        id: '284'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '285'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '286'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '287'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '288'
        action: Script
        object_path: Set objRange = objDoc.Range()
    - step:
        id: '289'
        object_path: objRange.Start = objRange
        action: End
    - step:
        id: '290'
        object_path: objRange.tables
        action: Add
        args: objRange, 2, 5
    - step:
        id: '291'
        action: Script
        object_path: Set objTable = objDoc.tables(objDoc.tables.Count)
    - step:
        id: '292'
        object_path: objTable.Cell(1, 1).Range
        action: Text
        args: = "Test 1"
    - step:
        id: '293'
        object_path: objTable.Cell(1, 1).Range.Font
        action: Bold
        args: = True
    - step:
        id: '294'
        object_path: objTable.Cell(1, 1).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '295'
        object_path: objTable.Cell(2, 1).Range
        action: Text
        args: = test1
    - step:
        id: '296'
        object_path: objTable.Cell(1, 2).Range
        action: text
        args: = "Test 2"
    - step:
        id: '297'
        object_path: objTable.Cell(1, 2).Range.Font
        action: Bold
        args: = True
    - step:
        id: '298'
        object_path: objTable.Cell(1, 2).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '299'
        object_path: objTable.Cell(2, 2).Range
        action: Text
        args: = test2
    - step:
        id: '300'
        object_path: objTable.Cell(1, 3).Range
        action: text
        args: = "Test 3"
    - step:
        id: '301'
        object_path: objTable.Cell(1, 3).Range.Font
        action: Bold
        args: = True
    - step:
        id: '302'
        object_path: objTable.Cell(1, 3).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '303'
        object_path: objTable.Cell(2, 3).Range
        action: Text
        args: = test3
    - step:
        id: '304'
        object_path: objTable.Cell(1, 4).Range
        action: text
        args: = "Total"
    - step:
        id: '305'
        object_path: objTable.Cell(1, 4).Range.Font
        action: Bold
        args: = True
    - step:
        id: '306'
        object_path: objTable.Cell(1, 4).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '307'
        object_path: objTable.Cell(2, 4).Range
        action: Text
        args: = testSum
    - step:
        id: '308'
        object_path: objTable.Cell(1, 5).Range
        action: text
        args: = "Average"
    - step:
        id: '309'
        object_path: objTable.Cell(1, 5).Range.Font
        action: Bold
        args: = True
    - step:
        id: '310'
        object_path: objTable.Cell(1, 5).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '311'
        object_path: objTable.Cell(2, 5).Range
        action: Text
        args: = testAvg
    - step:
        id: '312'
        object_path: objSelection
        action: EndKey
        args: END_OF_STORY
    - step:
        id: '313'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '314'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '315'
        action: Script
        object_path: End Function
    - step:
        id: '316'
        action: Script
        object_path: Function AddAttachment(filelocation,id)
    - step:
        id: '317'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '318'
        object_path: objSelection
        action: TypeText
        args: '"Attachments"'
    - step:
        id: '319'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '320'
        action: Script
        object_path: Set objAFolder = objFSO.GetFolder(filelocation)
    - step:
        id: '321'
        action: Script
        object_path: Set colAFiles = objAFolder.Files
    - step:
        id: '322'
        action: Script
        object_path: For Each attachment in colAFiles
    - step:
        id: '323'
        action: Script
        object_path: If InStr(attachment.name, "ID "&id) Then
    - step:
        id: '324'
        action: Script
        object_path: Set objShape = objSelection.InlineShapes.AddPicture(filelocation&"\"&attachment.name)
    - step:
        id: '325'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '326'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '327'
        action: Script
        object_path: Set objShape = Nothing
    - step:
        id: '328'
        action: Script
        object_path: End If
    - step:
        id: '329'
        action: Script
        object_path: Next
    - step:
        id: '330'
        action: Script
        object_path: Set objAFolder = Nothing
    - step:
        id: '331'
        action: Script
        object_path: Set colAFiles = Nothing
    - step:
        id: '332'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '333'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '334'
        action: Script
        object_path: End Function
    - step:
        id: '335'
        action: Script
        object_path: Function AddMeterChecks(subtitle,value1,value2,value3,value4,value5)
    - step:
        id: '336'
        action: Script
        object_path: value1 = CStr(value1)
    - step:
        id: '337'
        action: Script
        object_path: value2 = CStr(value2)
    - step:
        id: '338'
        action: Script
        object_path: value3 = CStr(value3)
    - step:
        id: '339'
        action: Script
        object_path: value4 = CStr(value4)
    - step:
        id: '340'
        action: Script
        object_path: value5 = CStr(value5)
    - step:
        id: '341'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '342'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '343'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '344'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '345'
        object_path: objSelection
        action: TypeText
        args: '"Meter Tampering: " & value1'
    - step:
        id: '346'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '347'
        object_path: objSelection
        action: TypeText
        args: '"Creep (Fwd/Rev): " & value2'
    - step:
        id: '348'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '349'
        object_path: objSelection
        action: TypeText
        args: '"Registration/Register Check: " & value3'
    - step:
        id: '350'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '351'
        object_path: objSelection
        action: TypeText
        args: '"Asbestos Panel: " & value4'
    - step:
        id: '352'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '353'
        object_path: objSelection
        action: TypeText
        args: '"Sticker Attached to Fast Reader: " & value5'
    - step:
        id: '354'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '355'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '356'
        action: Script
        object_path: End Function
  outputs:
  - lastFileName:
      robot: true
      value: ${lastFileName}
  - lastAttachmentName:
      robot: true
      value: ${lastAttachmentName}
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
