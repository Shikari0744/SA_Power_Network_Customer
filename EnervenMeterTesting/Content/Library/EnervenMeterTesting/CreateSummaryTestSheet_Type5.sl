namespace: EnervenMeterTesting
operation:
  name: CreateSummaryTestSheet_Type5
  inputs:
  - filelocation: C:\Users\svcrpabot\OneDrive - SA Power Networks\Enerven Meter Testing\Type
      5\
  sequential_action:
    gav: com.microfocus.seq:EnervenMeterTesting.CreateSummaryTestSheet_Type5:1.0.0
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
        object_path: attachmentFolder = Replace(objFile.Name, "Results.xlsx", "Attachments")
    - step:
        id: '13'
        action: Script
        object_path: summaryFolder = Replace(objFile.Name, "Results.xlsx", "Summary
          Sheets")
    - step:
        id: '14'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(filelocation&objFile.Name)
    - step:
        id: '15'
        action: Script
        object_path: Set objWorksheet = objWorkbook.Worksheets(1)
    - step:
        id: '16'
        action: Script
        object_path: excelRowCount = objWorksheet.UsedRange.Rows.Count
    - step:
        id: '17'
        action: Script
        object_path: '''LOOP THROUGH THE EXCEL AND CREATE A SUMMARY SHEET'
    - step:
        id: '18'
        action: Script
        object_path: For x = 2 To excelRowCount
    - step:
        id: '19'
        action: Script
        object_path: typeOfTest = objWorksheet.cells(x,1).value
    - step:
        id: '20'
        action: Script
        object_path: If typeOfTest = "Sample Meter Test"  Then
    - step:
        id: '21'
        action: Script
        object_path: s = 84
    - step:
        id: '22'
        action: Script
        object_path: ElseIf typeOfTest = "Site Inspection"  Then
    - step:
        id: '23'
        action: Script
        object_path: s = 50
    - step:
        id: '24'
        action: Script
        object_path: End If
    - step:
        id: '25'
        action: Script
        object_path: summarySheetCreated = objWorksheet.cells(x,s).value
    - step:
        id: '26'
        action: Script
        object_path: If summarySheetCreated = "" Then
    - step:
        id: '27'
        action: Script
        object_path: '''CREATE A NEW EXCEL DOCUMENT'
    - step:
        id: '28'
        action: Script
        object_path: Set objDoc = objWord.Documents.Add()
    - step:
        id: '29'
        action: Script
        object_path: Set objSelection = objWord.Selection
    - step:
        id: '30'
        action: Script
        object_path: typeOfTest = objWorksheet.cells(x,1).value
    - step:
        id: '31'
        action: Script
        object_path: If typeOfTest = "Sample Meter Test"  Then
    - step:
        id: '32'
        action: Script
        object_path: testSet = objWorksheet.cells(x,2).value
    - step:
        id: '33'
        action: Script
        object_path: meterClass = objWorksheet.cells(x,3).value
    - step:
        id: '34'
        action: Script
        object_path: meterNumber = objWorksheet.cells(x,4).value
    - step:
        id: '35'
        action: Script
        object_path: meterType = objWorksheet.cells(x,5).value
    - step:
        id: '36'
        action: Script
        object_path: stockItem = objWorksheet.cells(x,6).value
    - step:
        id: '37'
        action: Script
        object_path: stockHead = Split(stockItem,"/")
    - step:
        id: '38'
        action: Script
        object_path: stockItemheader = stockHead(0) &"-"& meterNumber
    - step:
        id: '39'
        action: Script
        object_path: kFactor = objWorksheet.cells(x,7).value
    - step:
        id: '40'
        action: Script
        object_path: nmi = objWorksheet.cells(x,8).value
    - step:
        id: '41'
        action: Script
        object_path: sampleLot = objWorksheet.cells(x,9).value
    - step:
        id: '42'
        action: Script
        object_path: suburb = objWorksheet.cells(x,10).value
    - step:
        id: '43'
        action: Script
        object_path: streetName = objWorksheet.cells(x,11).value
    - step:
        id: '44'
        action: Script
        object_path: streetNumber = objWorksheet.cells(x,12).value
    - step:
        id: '45'
        action: Script
        object_path: unitNumber = objWorksheet.cells(x,13).value
    - step:
        id: '46'
        action: Script
        object_path: dateofTest = objWorksheet.cells(x,14).value
    - step:
        id: '47'
        action: Script
        object_path: dateofTestTitle = Replace(dateofTest, "/", "-")
    - step:
        id: '48'
        action: Script
        object_path: testStartTime = objWorksheet.cells(x,15).value
    - step:
        id: '49'
        action: Script
        object_path: testEndTime = objWorksheet.cells(x,16).value
    - step:
        id: '50'
        action: Script
        object_path: calibrationDate = objWorksheet.cells(x,17).value
    - step:
        id: '51'
        action: Script
        object_path: ctAvailableRatio = objWorksheet.cells(x,18).value
    - step:
        id: '52'
        action: Script
        object_path: ctActualRatio = objWorksheet.cells(x,19).value
    - step:
        id: '53'
        action: Script
        object_path: ctMake = objWorksheet.cells(x,20).value
    - step:
        id: '54'
        action: Script
        object_path: ctStandard = objWorksheet.cells(x,21).value
    - step:
        id: '55'
        action: Script
        object_path: ctBurden = objWorksheet.cells(x,22).value
    - step:
        id: '56'
        action: Script
        object_path: ctClass = objWorksheet.cells(x,23).value
    - step:
        id: '57'
        action: Script
        object_path: ctType = objWorksheet.cells(x,24).value
    - step:
        id: '58'
        action: Script
        object_path: ctHousingType = objWorksheet.cells(x,25).value
    - step:
        id: '59'
        action: Script
        object_path: ctRedSerial = objWorksheet.cells(x,26).value
    - step:
        id: '60'
        action: Script
        object_path: ctRedPrimary = objWorksheet.cells(x,27).value
    - step:
        id: '61'
        action: Script
        object_path: ctRedSecondary = objWorksheet.cells(x,28).value
    - step:
        id: '62'
        action: Script
        object_path: ctRedConstant = objWorksheet.cells(x,29).value
    - step:
        id: '63'
        action: Script
        object_path: ctRedVoltage = objWorksheet.cells(x,30).value
    - step:
        id: '64'
        action: Script
        object_path: ctRedBurdenVI = objWorksheet.cells(x,31).value
    - step:
        id: '65'
        action: Script
        object_path: ctWhiteSerial = objWorksheet.cells(x,32).value
    - step:
        id: '66'
        action: Script
        object_path: ctWhitePrimary = objWorksheet.cells(x,33).value
    - step:
        id: '67'
        action: Script
        object_path: ctWhiteSecondary = objWorksheet.cells(x,34).value
    - step:
        id: '68'
        action: Script
        object_path: ctWhiteConstant = objWorksheet.cells(x,35).value
    - step:
        id: '69'
        action: Script
        object_path: ctWhiteVoltage = objWorksheet.cells(x,36).value
    - step:
        id: '70'
        action: Script
        object_path: ctWhiteBurdenVI = objWorksheet.cells(x,37).value
    - step:
        id: '71'
        action: Script
        object_path: ctBlueSerial = objWorksheet.cells(x,38).value
    - step:
        id: '72'
        action: Script
        object_path: ctBluePrimary = objWorksheet.cells(x,39).value
    - step:
        id: '73'
        action: Script
        object_path: ctBlueSecondary = objWorksheet.cells(x,40).value
    - step:
        id: '74'
        action: Script
        object_path: ctBlueConstant = objWorksheet.cells(x,41).value
    - step:
        id: '75'
        action: Script
        object_path: ctBlueVoltage = objWorksheet.cells(x,42).value
    - step:
        id: '76'
        action: Script
        object_path: ctBlueBurdenVI = objWorksheet.cells(x,43).value
    - step:
        id: '77'
        action: Script
        object_path: RNSecondaryCurrent = objWorksheet.cells(x,44).value
    - step:
        id: '78'
        action: Script
        object_path: RNVolts = objWorksheet.cells(x,45).value
    - step:
        id: '79'
        action: Script
        object_path: RNVoltsAmps = objWorksheet.cells(x,46).value
    - step:
        id: '80'
        action: Script
        object_path: RNPowerFactor = objWorksheet.cells(x,47).value
    - step:
        id: '81'
        action: Script
        object_path: RNWatts = objWorksheet.cells(x,48).value
    - step:
        id: '82'
        action: Script
        object_path: WNSecondaryCurrent = objWorksheet.cells(x,49).value
    - step:
        id: '83'
        action: Script
        object_path: WNVolts = objWorksheet.cells(x,50).value
    - step:
        id: '84'
        action: Script
        object_path: WNVoltsAmps = objWorksheet.cells(x,51).value
    - step:
        id: '85'
        action: Script
        object_path: WNPowerFactor = objWorksheet.cells(x,52).value
    - step:
        id: '86'
        action: Script
        object_path: WNWatts = objWorksheet.cells(x,53).value
    - step:
        id: '87'
        action: Script
        object_path: BNSecondaryCurrent = objWorksheet.cells(x,54).value
    - step:
        id: '88'
        action: Script
        object_path: BNVolts = objWorksheet.cells(x,55).value
    - step:
        id: '89'
        action: Script
        object_path: BNVoltsAmps = objWorksheet.cells(x,56).value
    - step:
        id: '90'
        action: Script
        object_path: BNPowerFactor = objWorksheet.cells(x,57).value
    - step:
        id: '91'
        action: Script
        object_path: BNWatts = objWorksheet.cells(x,58).value
    - step:
        id: '92'
        action: Script
        object_path: SDVoltsAmpsTotal = objWorksheet.cells(x,59).value
    - step:
        id: '93'
        action: Script
        object_path: SDWattsTotal = objWorksheet.cells(x,60).value
    - step:
        id: '94'
        action: Script
        object_path: PDCalcSecKW = objWorksheet.cells(x,61).value
    - step:
        id: '95'
        action: Script
        object_path: PDCalcSecKVA = objWorksheet.cells(x,62).value
    - step:
        id: '96'
        action: Script
        object_path: kwid10Reading = objWorksheet.cells(x,63).value
    - step:
        id: '97'
        action: Script
        object_path: kwid11Reading = objWorksheet.cells(x,64).value
    - step:
        id: '98'
        action: Script
        object_path: PDRegisterKW = objWorksheet.cells(x,65).value
    - step:
        id: '99'
        action: Script
        object_path: PDRegisterKVA = objWorksheet.cells(x,66).value
    - step:
        id: '100'
        action: Script
        object_path: tp01unityactive = objWorksheet.cells(x,67).value
    - step:
        id: '101'
        action: Script
        object_path: tp05unityactive = objWorksheet.cells(x,68).value
    - step:
        id: '102'
        action: Script
        object_path: tp10unityactive = objWorksheet.cells(x,69).value
    - step:
        id: '103'
        action: Script
        object_path: tp10in05lagging = objWorksheet.cells(x,70).value
    - step:
        id: '104'
        action: Script
        object_path: tp2inorImax = objWorksheet.cells(x,71).value
    - step:
        id: '105'
        action: Script
        object_path: loadingDeviceUsed = objWorksheet.cells(x,72).value
    - step:
        id: '106'
        action: Script
        object_path: commsConfirmed = objWorksheet.cells(x,73).value
    - step:
        id: '107'
        action: Script
        object_path: equipmentSealed = objWorksheet.cells(x,74).value
    - step:
        id: '108'
        action: Script
        object_path: meterTimeDate = objWorksheet.cells(x,75).value
    - step:
        id: '109'
        action: Script
        object_path: sequenceOK = objWorksheet.cells(x,76).value
    - step:
        id: '110'
        action: Script
        object_path: meterReadScreenAmpsValidated = objWorksheet.cells(x,77).value
    - step:
        id: '111'
        action: Script
        object_path: secondaryCableTonged = objWorksheet.cells(x,78).value
    - step:
        id: '112'
        action: Script
        object_path: testResult = objWorksheet.cells(x,79).value
    - step:
        id: '113'
        action: Script
        object_path: attachments = objWorksheet.cells(x,80).value
    - step:
        id: '114'
        action: Script
        object_path: comments = objWorksheet.cells(x,81).value
    - step:
        id: '115'
        action: Script
        object_path: id = objWorksheet.cells(x,82).value
    - step:
        id: '116'
        action: Script
        object_path: technicianName = objWorksheet.cells(x,83).value
    - step:
        id: '117'
        action: Script
        object_path: ElseIf typeOfTest = "Site Inspection" Then
    - step:
        id: '118'
        action: Script
        object_path: meterClass = objWorksheet.cells(x,2).value
    - step:
        id: '119'
        action: Script
        object_path: meterNumber = objWorksheet.cells(x,3).value
    - step:
        id: '120'
        action: Script
        object_path: stockItem = objWorksheet.cells(x,4).value
    - step:
        id: '121'
        action: Script
        object_path: meterHeader = Replace(stockItem,"/","-")
    - step:
        id: '122'
        action: Script
        object_path: kFactor = objWorksheet.cells(x,5).value
    - step:
        id: '123'
        action: Script
        object_path: nmi = objWorksheet.cells(x,6).value
    - step:
        id: '124'
        action: Script
        object_path: suburb = objWorksheet.cells(x,7).value
    - step:
        id: '125'
        action: Script
        object_path: streetName = objWorksheet.cells(x,8).value
    - step:
        id: '126'
        action: Script
        object_path: streetNumber = objWorksheet.cells(x,9).value
    - step:
        id: '127'
        action: Script
        object_path: unitNumber = objWorksheet.cells(x,10).value
    - step:
        id: '128'
        action: Script
        object_path: dateofTest = objWorksheet.cells(x,11).value
    - step:
        id: '129'
        action: Script
        object_path: dateofTestTitle = Replace(dateofTest, "/", "-")
    - step:
        id: '130'
        action: Script
        object_path: ctAvailableRatio = objWorksheet.cells(x,12).value
    - step:
        id: '131'
        action: Script
        object_path: ctActualRatio = objWorksheet.cells(x,13).value
    - step:
        id: '132'
        action: Script
        object_path: ctMake = objWorksheet.cells(x,14).value
    - step:
        id: '133'
        action: Script
        object_path: ctStandard = objWorksheet.cells(x,15).value
    - step:
        id: '134'
        action: Script
        object_path: ctBurden = objWorksheet.cells(x,16).value
    - step:
        id: '135'
        action: Script
        object_path: ctClass = objWorksheet.cells(x,17).value
    - step:
        id: '136'
        action: Script
        object_path: ctType = objWorksheet.cells(x,18).value
    - step:
        id: '137'
        action: Script
        object_path: ctHousingType = objWorksheet.cells(x,19).value
    - step:
        id: '138'
        action: Script
        object_path: ctRedSerial = objWorksheet.cells(x,20).value
    - step:
        id: '139'
        action: Script
        object_path: ctRedPrimary = objWorksheet.cells(x,21).value
    - step:
        id: '140'
        action: Script
        object_path: ctRedSecondary = objWorksheet.cells(x,22).value
    - step:
        id: '141'
        action: Script
        object_path: ctRedConstant = objWorksheet.cells(x,23).value
    - step:
        id: '142'
        action: Script
        object_path: ctRedVoltage = objWorksheet.cells(x,24).value
    - step:
        id: '143'
        action: Script
        object_path: ctRedBurdenVI = objWorksheet.cells(x,25).value
    - step:
        id: '144'
        action: Script
        object_path: ctWhiteSerial = objWorksheet.cells(x,26).value
    - step:
        id: '145'
        action: Script
        object_path: ctWhitePrimary = objWorksheet.cells(x,27).value
    - step:
        id: '146'
        action: Script
        object_path: ctWhiteSecondary = objWorksheet.cells(x,28).value
    - step:
        id: '147'
        action: Script
        object_path: ctWhiteConstant = objWorksheet.cells(x,29).value
    - step:
        id: '148'
        action: Script
        object_path: ctWhiteVoltage = objWorksheet.cells(x,30).value
    - step:
        id: '149'
        action: Script
        object_path: ctWhiteBurdenVI = objWorksheet.cells(x,31).value
    - step:
        id: '150'
        action: Script
        object_path: ctBlueSerial = objWorksheet.cells(x,32).value
    - step:
        id: '151'
        action: Script
        object_path: ctBluePrimary = objWorksheet.cells(x,33).value
    - step:
        id: '152'
        action: Script
        object_path: ctBlueSecondary = objWorksheet.cells(x,34).value
    - step:
        id: '153'
        action: Script
        object_path: ctBlueConstant = objWorksheet.cells(x,35).value
    - step:
        id: '154'
        action: Script
        object_path: ctBlueVoltage = objWorksheet.cells(x,36).value
    - step:
        id: '155'
        action: Script
        object_path: ctBlueBurdenVI = objWorksheet.cells(x,37).value
    - step:
        id: '156'
        action: Script
        object_path: loadingDeviceUsed = objWorksheet.cells(x,38).value
    - step:
        id: '157'
        action: Script
        object_path: commsConfirmed = objWorksheet.cells(x,39).value
    - step:
        id: '158'
        action: Script
        object_path: equipmentSealed = objWorksheet.cells(x,40).value
    - step:
        id: '159'
        action: Script
        object_path: meterTimeDate = objWorksheet.cells(x,41).value
    - step:
        id: '160'
        action: Script
        object_path: sequenceOK = objWorksheet.cells(x,42).value
    - step:
        id: '161'
        action: Script
        object_path: meterReadScreenAmpsValidated = objWorksheet.cells(x,43).value
    - step:
        id: '162'
        action: Script
        object_path: secondaryCableTonged = objWorksheet.cells(x,44).value
    - step:
        id: '163'
        action: Script
        object_path: siteResult = objWorksheet.cells(x,45).value
    - step:
        id: '164'
        action: Script
        object_path: attachments = objWorksheet.cells(x,46).value
    - step:
        id: '165'
        action: Script
        object_path: comments = objWorksheet.cells(x,47).value
    - step:
        id: '166'
        action: Script
        object_path: id = objWorksheet.cells(x,48).value
    - step:
        id: '167'
        action: Script
        object_path: technicianName = objWorksheet.cells(x,49).value
    - step:
        id: '168'
        action: Script
        object_path: End If
    - step:
        id: '169'
        action: Script
        object_path: If typeOfTest = "Sample Meter Test"  Then
    - step:
        id: '170'
        action: Script
        object_path: Call AddHeaderTest(stockItem, id)
    - step:
        id: '171'
        action: Script
        object_path: Call AddTextDataLong("Operators Name", technicianName, "/ Comments:",
          comments)
    - step:
        id: '172'
        action: Script
        object_path: 'Call AddTextDataLong("Test Information", "Start Time: "&testStartTime,
          "Finish Time: "&testEndTime, "Calibration Date: "&calibrationDate)'
    - step:
        id: '173'
        action: Script
        object_path: Call AddTextData("Test Set Number",testSet)
    - step:
        id: '174'
        action: Script
        object_path: Call AddTextData("Stock Item",stockItem)
    - step:
        id: '175'
        action: Script
        object_path: Call AddTextData("K Factor",kFactor)
    - step:
        id: '176'
        action: Script
        object_path: 'Call AddTextDataLong("Meter", "Meter Class: "&meterClass, "Meter
          Number: "&meterNumber, "Meter Type: "&meterType)'
    - step:
        id: '177'
        action: Script
        object_path: Call AddTextData("Sample Lot",sampleLot)
    - step:
        id: '178'
        action: Script
        object_path: Call AddTextData("NMI",nmi)
    - step:
        id: '179'
        action: Script
        object_path: Call AddAddressData("Address",unitNumber,streetNumber,streetName,suburb)
    - step:
        id: '180'
        action: Script
        object_path: Call AddTextDataExtraLong("Current Transformer Details", ctAvailableRatio,
          ctActualRatio, ctMake, ctStandard, ctBurden, ctClass, ctType, ctHousingType)
    - step:
        id: '181'
        action: Script
        object_path: Call AddTableDataLong("CT Red", ctRedSerial, ctRedPrimary, ctRedSecondary,
          ctRedConstant, ctRedVoltage, ctRedBurdenVI)
    - step:
        id: '182'
        action: Script
        object_path: Call AddTableDataLong("CT White", ctWhiteSerial, ctWhitePrimary,
          ctWhiteSecondary, ctWhiteConstant, ctWhiteVoltage, ctWhiteBurdenVI)
    - step:
        id: '183'
        action: Script
        object_path: Call AddTableDataLong("CT Blue", ctBlueSerial, ctBluePrimary,
          ctBlueSecondary, ctBlueConstant, ctBlueVoltage, ctBlueBurdenVI)
    - step:
        id: '184'
        action: Script
        object_path: Call AddTableDataMed2("Secondary Demands RN", RNSecondaryCurrent,
          RNVolts, RNVoltsAmps, RNPowerFactor, RNWatts)
    - step:
        id: '185'
        action: Script
        object_path: Call AddTableDataMed2("Secondary Demands WN", WNSecondaryCurrent,
          WNVolts, WNVoltsAmps, WNPowerFactor, WNWatts)
    - step:
        id: '186'
        action: Script
        object_path: Call AddTableDataMed2("Secondary Demands BN", BNSecondaryCurrent,
          BNVolts, BNVoltsAmps, BNPowerFactor, BNWatts)
    - step:
        id: '187'
        action: Script
        object_path: Call AddTableData("Secondary Demands Totals", SDVoltsAmpsTotal,
          SDWattsTotal)
    - step:
        id: '188'
        action: Script
        object_path: Call AddTableDataMed("Primary Demands", PDCalcSecKVA, PDCalcSecKW,
          PDRegisterKVA, PDRegisterKW)
    - step:
        id: '189'
        action: Script
        object_path: Call AddTextData("KW ID 10 Reading",kwid10Reading)
    - step:
        id: '190'
        action: Script
        object_path: Call AddTextData("KVA ID 11 Reading",kwid11Reading)
    - step:
        id: '191'
        action: Script
        object_path: Call AddTableDataLong2("Test Points", tp01unityactive, tp05unityactive,
          tp10unityactive, tp10in05lagging, tp2inorImax)
    - step:
        id: '192'
        action: Script
        object_path: Call AddMeterChecks("Meter Checks", loadingDeviceUsed, commsConfirmed,
          equipmentSealed, meterTimeDate, sequenceOK, meterReadScreenAmpsValidated,
          secondaryCableTonged)
    - step:
        id: '193'
        action: Script
        object_path: Call AddTextData("Test Result",testResult)
    - step:
        id: '194'
        action: Script
        object_path: Call AddAttachmen(filelocation&attachmentFolder, id)
    - step:
        id: '195'
        action: Script
        object_path: fileName = filelocation&summaryFolder&"\Test Summary Sheet "&stockItemheader&"
          "&dateofTestTitle&" ID "&id&".docx"
    - step:
        id: '196'
        action: Script
        object_path: fileNamePDF = filelocation&summaryFolder&"\Test Summary Sheet
          "&stockItemheader&" "&dateofTestTitle&" ID "&id&".pdf"
    - step:
        id: '197'
        action: Script
        object_path: ElseIf typeOfTest = "Site Inspection" Then
    - step:
        id: '198'
        action: Script
        object_path: Call AddHeaderInspect(meterHeader, id)
    - step:
        id: '199'
        action: Script
        object_path: Call AddTextDataLong("Operators Name", technicianName, "- Comments:",
          comments)
    - step:
        id: '200'
        action: Script
        object_path: Call AddTextData("Date of Inspection",dateofTest)
    - step:
        id: '201'
        action: Script
        object_path: Call AddTextData("K Factor",kFactor)
    - step:
        id: '202'
        action: Script
        object_path: 'Call AddTextDataLong("Meter", "Meter Class: "&meterClass, "Meter
          Number: "&meterNumber, "Stock Item: "&stockItem)'
    - step:
        id: '203'
        action: Script
        object_path: Call AddTextData("NMI",nmi)
    - step:
        id: '204'
        action: Script
        object_path: Call AddAddressData("Address",unitNumber,streetNumber,streetName,suburb)
    - step:
        id: '205'
        action: Script
        object_path: Call AddTextDataExtraLong("Current Transformer Details", ctAvailableRatio,
          ctActualRatio, ctMake, ctStandard, ctBurden, ctClass, ctType, ctHousingType)
    - step:
        id: '206'
        action: Script
        object_path: Call AddTableDataLong("CT Blue", ctBlueSerial, ctBluePrimary,
          ctBlueSecondary, ctBlueConstant, ctBlueVoltage, ctBlueBurdenVI)
    - step:
        id: '207'
        action: Script
        object_path: Call AddTableDataLong("CT Red", ctRedSerial, ctRedPrimary, ctRedSecondary,
          ctRedConstant, ctRedVoltage, ctRedBurdenVI)
    - step:
        id: '208'
        action: Script
        object_path: Call AddTableDataLong("CT White", ctWhiteSerial, ctWhitePrimary,
          ctWhiteSecondary, ctWhiteConstant, ctWhiteVoltage, ctWhiteBurdenVI)
    - step:
        id: '209'
        action: Script
        object_path: Call AddMeterChecks("Meter Checks", loadingDeviceUsed, commsConfirmed,
          equipmentSealed, meterTimeDate, sequenceOK, meterReadScreenAmpsValidated,
          secondaryCableTonged)
    - step:
        id: '210'
        action: Script
        object_path: Call AddTextData("Site Result",testResult)
    - step:
        id: '211'
        action: Script
        object_path: Call AddAttachment(filelocation&attachmentFolder, id)
    - step:
        id: '212'
        action: Script
        object_path: fileName = filelocation&summaryFolder&"\Inspection Summary Sheet
          "&meterHeader&" "&dateofTestTitle&" ID "&id&".docx"
    - step:
        id: '213'
        action: Script
        object_path: fileNamePDF = filelocation&summaryFolder&"\Inspection Summary
          Sheet "&meterHeader&" "&dateofTestTitle&" ID "&id&".pdf"
    - step:
        id: '214'
        action: Script
        object_path: End If
    - step:
        id: '215'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '216'
        action: Script
        object_path: If Not fso.FolderExists(filelocation&summaryFolder) Then
    - step:
        id: '217'
        action: Script
        object_path: Set newfolder = fso.CreateFolder(filelocation&summaryFolder)
    - step:
        id: '218'
        action: Script
        object_path: End If
    - step:
        id: '219'
        action: Script
        object_path: If fso.FileExists(fileName)Then
    - step:
        id: '220'
        object_path: fso
        action: DeleteFile(fileName)
    - step:
        id: '221'
        action: Script
        object_path: End If
    - step:
        id: '222'
        action: Script
        object_path: If fso.FileExists(fileNamePDF)Then
    - step:
        id: '223'
        object_path: fso
        action: DeleteFile(fileNamePDF)
    - step:
        id: '224'
        action: Script
        object_path: End If
    - step:
        id: '225'
        action: Script
        object_path: Parameter("lastFileName") = fileNamePDF
    - step:
        id: '226'
        object_path: objDoc
        action: SaveAs(fileName)
    - step:
        id: '227'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '228'
        action: Script
        object_path: '''CONVERT TO PDF'
    - step:
        id: '229'
        object_path: objDoc
        action: SaveAs
        args: fileNamePDF,17
    - step:
        id: '230'
        object_path: objDoc
        action: Close
    - step:
        id: '231'
        action: Script
        object_path: '''DELETE DOCX'
    - step:
        id: '232'
        action: Script
        object_path: If fso.FileExists(fileName)Then
    - step:
        id: '233'
        object_path: fso
        action: DeleteFile(fileName)
    - step:
        id: '234'
        action: Script
        object_path: End If
    - step:
        id: '235'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '236'
        action: Script
        object_path: Set objShape = Nothing
    - step:
        id: '237'
        action: Script
        object_path: Set objSelection = Nothing
    - step:
        id: '238'
        action: Script
        object_path: Set objDoc = Nothing
    - step:
        id: '239'
        object_path: objWorksheet.cells(x,s)
        action: value
        args: = "YES"
    - step:
        id: '240'
        action: Script
        object_path: End If
    - step:
        id: '241'
        action: Script
        object_path: Next
    - step:
        id: '242'
        object_path: objWorkbook
        action: close
    - step:
        id: '243'
        action: Script
        object_path: Next
    - step:
        id: '244'
        object_path: objExcel
        action: Quit
    - step:
        id: '245'
        object_path: objWord
        action: Quit
    - step:
        id: '246'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '247'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '248'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '249'
        action: Script
        object_path: Set objWord = Nothing
    - step:
        id: '250'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '251'
        action: Script
        object_path: Function AddHeaderTest(header, id)
    - step:
        id: '252'
        object_path: objSelection.Font
        action: Name
        args: = "Arial"
    - step:
        id: '253'
        object_path: objSelection.Font
        action: Size
        args: = "14"
    - step:
        id: '254'
        object_path: objSelection
        action: TypeText
        args: '"Type 5 Meter Test: " & header'
    - step:
        id: '255'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '256'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '257'
        object_path: objSelection
        action: TypeText
        args: '"(SharePoint List ID: " & id & ")"'
    - step:
        id: '258'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '259'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '260'
        action: Script
        object_path: End Function
    - step:
        id: '261'
        action: Script
        object_path: Function AddHeaderInspect(header, id)
    - step:
        id: '262'
        object_path: objSelection.Font
        action: Name
        args: = "Arial"
    - step:
        id: '263'
        object_path: objSelection.Font
        action: Size
        args: = "14"
    - step:
        id: '264'
        object_path: objSelection
        action: TypeText
        args: '"Type 5 Meter Inspection: " & header'
    - step:
        id: '265'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '266'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '267'
        object_path: objSelection
        action: TypeText
        args: '"(SharePoint List ID: " & id & ")"'
    - step:
        id: '268'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '269'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '270'
        action: Script
        object_path: End Function
    - step:
        id: '271'
        action: Script
        object_path: Function AddTextData(subtitle,value)
    - step:
        id: '272'
        action: Script
        object_path: value = CStr(value)
    - step:
        id: '273'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '274'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '275'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '276'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '277'
        object_path: objSelection
        action: TypeText
        args: value
    - step:
        id: '278'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '279'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '280'
        action: Script
        object_path: End Function
    - step:
        id: '281'
        action: Script
        object_path: Function AddTextDataLong(subtitle,value1,value2,value3)
    - step:
        id: '282'
        action: Script
        object_path: value1 = CStr(value1)
    - step:
        id: '283'
        action: Script
        object_path: value2 = CStr(value2)
    - step:
        id: '284'
        action: Script
        object_path: value3 = CStr(value3)
    - step:
        id: '285'
        action: Script
        object_path: If value3 = "" Then
    - step:
        id: '286'
        action: Script
        object_path: value3 = "NA"
    - step:
        id: '287'
        action: Script
        object_path: End If
    - step:
        id: '288'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '289'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '290'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '291'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '292'
        object_path: objSelection
        action: TypeText
        args: value1 &" "& value2 &" "& value3
    - step:
        id: '293'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '294'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '295'
        action: Script
        object_path: End Function
    - step:
        id: '296'
        action: Script
        object_path: Function AddTextDataExtraLong(subtitle,value1,value2,value3,value4,value5,value6,value7,value8)
    - step:
        id: '297'
        action: Script
        object_path: value1 = CStr(value1)
    - step:
        id: '298'
        action: Script
        object_path: value2 = CStr(value2)
    - step:
        id: '299'
        action: Script
        object_path: value3 = CStr(value3)
    - step:
        id: '300'
        action: Script
        object_path: value4 = CStr(value4)
    - step:
        id: '301'
        action: Script
        object_path: value5 = CStr(value5)
    - step:
        id: '302'
        action: Script
        object_path: value6 = CStr(value6)
    - step:
        id: '303'
        action: Script
        object_path: value7 = CStr(value7)
    - step:
        id: '304'
        action: Script
        object_path: value8 = CStr(value8)
    - step:
        id: '305'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '306'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '307'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '308'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '309'
        object_path: objSelection
        action: TypeText
        args: '"CT Available: " & value1'
    - step:
        id: '310'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '311'
        object_path: objSelection
        action: TypeText
        args: '"CT Actual: " & value2'
    - step:
        id: '312'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '313'
        object_path: objSelection
        action: TypeText
        args: '"CT Make: " & value3'
    - step:
        id: '314'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '315'
        object_path: objSelection
        action: TypeText
        args: '"CT Standard: " & value4'
    - step:
        id: '316'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '317'
        object_path: objSelection
        action: TypeText
        args: '"CT Burden: " & value5'
    - step:
        id: '318'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '319'
        object_path: objSelection
        action: TypeText
        args: '"CT Class: " & value6'
    - step:
        id: '320'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '321'
        object_path: objSelection
        action: TypeText
        args: '"CT Type: " & value7'
    - step:
        id: '322'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '323'
        object_path: objSelection
        action: TypeText
        args: '"CT Housing Type: " & value8'
    - step:
        id: '324'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '325'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '326'
        action: Script
        object_path: End Function
    - step:
        id: '327'
        action: Script
        object_path: Function AddAddressData(subtitle,unit,streetNo,streetName,subject)
    - step:
        id: '328'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '329'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '330'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '331'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '332'
        object_path: objSelection
        action: TypeText
        args: unit &" "& streetNo &" "& streetName &" "& subject
    - step:
        id: '333'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '334'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '335'
        action: Script
        object_path: End Function
    - step:
        id: '336'
        action: Script
        object_path: Function AddTableData(subtitle, input1, input2)
    - step:
        id: '337'
        action: Script
        object_path: input1 = CStr(input1)
    - step:
        id: '338'
        action: Script
        object_path: input1 = CStr(input1)
    - step:
        id: '339'
        action: Script
        object_path: Const END_OF_STORY = 6
    - step:
        id: '340'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '341'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '342'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '343'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '344'
        action: Script
        object_path: Set objRange = objDoc.Range()
    - step:
        id: '345'
        object_path: objRange.Start = objRange
        action: End
    - step:
        id: '346'
        object_path: objRange.tables
        action: Add
        args: objRange, 2, 2
    - step:
        id: '347'
        action: Script
        object_path: Set objTable = objDoc.tables(objDoc.tables.Count)
    - step:
        id: '348'
        object_path: objTable.Cell(1, 1).Range
        action: Text
        args: = "Volts/Amps Total"
    - step:
        id: '349'
        object_path: objTable.Cell(1, 1).Range.Font
        action: Bold
        args: = True
    - step:
        id: '350'
        object_path: objTable.Cell(1, 1).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '351'
        object_path: objTable.Cell(2, 1).Range
        action: Text
        args: = input1
    - step:
        id: '352'
        object_path: objTable.Cell(1, 2).Range
        action: text
        args: = "Watts Total"
    - step:
        id: '353'
        object_path: objTable.Cell(1, 2).Range.Font
        action: Bold
        args: = True
    - step:
        id: '354'
        object_path: objTable.Cell(1, 2).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '355'
        object_path: objTable.Cell(2, 2).Range
        action: Text
        args: = input2
    - step:
        id: '356'
        object_path: objSelection
        action: EndKey
        args: END_OF_STORY
    - step:
        id: '357'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '358'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '359'
        action: Script
        object_path: End Function
    - step:
        id: '360'
        action: Script
        object_path: Function AddTableDataMed(subtitle, input1, input2, input3, input4)
    - step:
        id: '361'
        action: Script
        object_path: input1 = CStr(input1)
    - step:
        id: '362'
        action: Script
        object_path: input2 = CStr(input2)
    - step:
        id: '363'
        action: Script
        object_path: input3 = CStr(input3)
    - step:
        id: '364'
        action: Script
        object_path: input4 = CStr(input4)
    - step:
        id: '365'
        action: Script
        object_path: Const END_OF_STORY = 6
    - step:
        id: '366'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '367'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '368'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '369'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '370'
        action: Script
        object_path: Set objRange = objDoc.Range()
    - step:
        id: '371'
        object_path: objRange.Start = objRange
        action: End
    - step:
        id: '372'
        object_path: objRange.tables
        action: Add
        args: objRange, 2, 5
    - step:
        id: '373'
        action: Script
        object_path: Set objTable = objDoc.tables(objDoc.tables.Count)
    - step:
        id: '374'
        object_path: objTable.Cell(1, 1).Range
        action: Text
        args: = "Calc from Sec kVA"
    - step:
        id: '375'
        object_path: objTable.Cell(1, 1).Range.Font
        action: Bold
        args: = True
    - step:
        id: '376'
        object_path: objTable.Cell(1, 1).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '377'
        object_path: objTable.Cell(2, 1).Range
        action: Text
        args: = input1
    - step:
        id: '378'
        object_path: objTable.Cell(1, 2).Range
        action: text
        args: = "Calc from Sec kW"
    - step:
        id: '379'
        object_path: objTable.Cell(1, 2).Range.Font
        action: Bold
        args: = True
    - step:
        id: '380'
        object_path: objTable.Cell(1, 2).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '381'
        object_path: objTable.Cell(2, 2).Range
        action: Text
        args: = input2
    - step:
        id: '382'
        object_path: objTable.Cell(1, 3).Range
        action: text
        args: = "Register Read kVA"
    - step:
        id: '383'
        object_path: objTable.Cell(1, 3).Range.Font
        action: Bold
        args: = True
    - step:
        id: '384'
        object_path: objTable.Cell(1, 3).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '385'
        object_path: objTable.Cell(2, 3).Range
        action: Text
        args: = input3
    - step:
        id: '386'
        object_path: objTable.Cell(1, 4).Range
        action: text
        args: = "Register Read kW"
    - step:
        id: '387'
        object_path: objTable.Cell(1, 4).Range.Font
        action: Bold
        args: = True
    - step:
        id: '388'
        object_path: objTable.Cell(1, 4).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '389'
        object_path: objTable.Cell(2, 4).Range
        action: Text
        args: = input4
    - step:
        id: '390'
        object_path: objSelection
        action: EndKey
        args: END_OF_STORY
    - step:
        id: '391'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '392'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '393'
        action: Script
        object_path: End Function
    - step:
        id: '394'
        action: Script
        object_path: Function AddTableDataMed2(subtitle, input1, input2, input3, input4,input5)
    - step:
        id: '395'
        action: Script
        object_path: input1 = CStr(input1)
    - step:
        id: '396'
        action: Script
        object_path: input2 = CStr(input2)
    - step:
        id: '397'
        action: Script
        object_path: input3 = CStr(input3)
    - step:
        id: '398'
        action: Script
        object_path: input4 = CStr(input4)
    - step:
        id: '399'
        action: Script
        object_path: input5 = CStr(input5)
    - step:
        id: '400'
        action: Script
        object_path: Const END_OF_STORY = 6
    - step:
        id: '401'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '402'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '403'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '404'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '405'
        action: Script
        object_path: Set objRange = objDoc.Range()
    - step:
        id: '406'
        object_path: objRange.Start = objRange
        action: End
    - step:
        id: '407'
        object_path: objRange.tables
        action: Add
        args: objRange, 2, 5
    - step:
        id: '408'
        action: Script
        object_path: Set objTable = objDoc.tables(objDoc.tables.Count)
    - step:
        id: '409'
        object_path: objTable.Cell(1, 1).Range
        action: Text
        args: = "Power Factor"
    - step:
        id: '410'
        object_path: objTable.Cell(1, 1).Range.Font
        action: Bold
        args: = True
    - step:
        id: '411'
        object_path: objTable.Cell(1, 1).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '412'
        object_path: objTable.Cell(2, 1).Range
        action: Text
        args: = input1
    - step:
        id: '413'
        object_path: objTable.Cell(1, 2).Range
        action: text
        args: = "Secondary Current"
    - step:
        id: '414'
        object_path: objTable.Cell(1, 2).Range.Font
        action: Bold
        args: = True
    - step:
        id: '415'
        object_path: objTable.Cell(1, 2).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '416'
        object_path: objTable.Cell(2, 2).Range
        action: Text
        args: = input2
    - step:
        id: '417'
        object_path: objTable.Cell(1, 3).Range
        action: text
        args: = "Volts"
    - step:
        id: '418'
        object_path: objTable.Cell(1, 3).Range.Font
        action: Bold
        args: = True
    - step:
        id: '419'
        object_path: objTable.Cell(1, 3).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '420'
        object_path: objTable.Cell(2, 3).Range
        action: Text
        args: = input3
    - step:
        id: '421'
        object_path: objTable.Cell(1, 4).Range
        action: text
        args: = "Volts/Amps"
    - step:
        id: '422'
        object_path: objTable.Cell(1, 4).Range.Font
        action: Bold
        args: = True
    - step:
        id: '423'
        object_path: objTable.Cell(1, 4).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '424'
        object_path: objTable.Cell(2, 4).Range
        action: Text
        args: = input4
    - step:
        id: '425'
        object_path: objTable.Cell(1, 5).Range
        action: text
        args: = "Watts"
    - step:
        id: '426'
        object_path: objTable.Cell(1, 5).Range.Font
        action: Bold
        args: = True
    - step:
        id: '427'
        object_path: objTable.Cell(1, 5).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '428'
        object_path: objTable.Cell(2, 5).Range
        action: Text
        args: = input5
    - step:
        id: '429'
        object_path: objSelection
        action: EndKey
        args: END_OF_STORY
    - step:
        id: '430'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '431'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '432'
        action: Script
        object_path: End Function
    - step:
        id: '433'
        action: Script
        object_path: Function AddTableDataLong(subtitle, input1, input2, input3, input4,
          input5, input6)
    - step:
        id: '434'
        action: Script
        object_path: input1 = CStr(input1)
    - step:
        id: '435'
        action: Script
        object_path: input2 = CStr(input2)
    - step:
        id: '436'
        action: Script
        object_path: input3 = CStr(input3)
    - step:
        id: '437'
        action: Script
        object_path: input4 = CStr(input4)
    - step:
        id: '438'
        action: Script
        object_path: input5 = CStr(input5)
    - step:
        id: '439'
        action: Script
        object_path: input6 = CStr(input6)
    - step:
        id: '440'
        action: Script
        object_path: Const END_OF_STORY = 6
    - step:
        id: '441'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '442'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '443'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '444'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '445'
        action: Script
        object_path: Set objRange = objDoc.Range()
    - step:
        id: '446'
        object_path: objRange.Start = objRange
        action: End
    - step:
        id: '447'
        object_path: objRange.tables
        action: Add
        args: objRange, 2, 6
    - step:
        id: '448'
        action: Script
        object_path: Set objTable = objDoc.tables(objDoc.tables.Count)
    - step:
        id: '449'
        object_path: objTable.Cell(1, 1).Range
        action: Text
        args: = "Serial"
    - step:
        id: '450'
        object_path: objTable.Cell(1, 1).Range.Font
        action: Bold
        args: = True
    - step:
        id: '451'
        object_path: objTable.Cell(1, 1).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '452'
        object_path: objTable.Cell(2, 1).Range
        action: Text
        args: = input1
    - step:
        id: '453'
        object_path: objTable.Cell(1, 2).Range
        action: text
        args: = "Primary Current"
    - step:
        id: '454'
        object_path: objTable.Cell(1, 2).Range.Font
        action: Bold
        args: = True
    - step:
        id: '455'
        object_path: objTable.Cell(1, 2).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '456'
        object_path: objTable.Cell(2, 2).Range
        action: Text
        args: = input2
    - step:
        id: '457'
        object_path: objTable.Cell(1, 3).Range
        action: text
        args: = "Secondary Current"
    - step:
        id: '458'
        object_path: objTable.Cell(1, 3).Range.Font
        action: Bold
        args: = True
    - step:
        id: '459'
        object_path: objTable.Cell(1, 3).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '460'
        object_path: objTable.Cell(2, 3).Range
        action: Text
        args: = input3
    - step:
        id: '461'
        object_path: objTable.Cell(1, 4).Range
        action: text
        args: = "Constant"
    - step:
        id: '462'
        object_path: objTable.Cell(1, 4).Range.Font
        action: Bold
        args: = True
    - step:
        id: '463'
        object_path: objTable.Cell(1, 4).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '464'
        object_path: objTable.Cell(2, 4).Range
        action: Text
        args: = input4
    - step:
        id: '465'
        object_path: objTable.Cell(1, 5).Range
        action: text
        args: = "Voltage"
    - step:
        id: '466'
        object_path: objTable.Cell(1, 5).Range.Font
        action: Bold
        args: = True
    - step:
        id: '467'
        object_path: objTable.Cell(1, 5).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '468'
        object_path: objTable.Cell(2, 5).Range
        action: Text
        args: = input5
    - step:
        id: '469'
        object_path: objTable.Cell(1, 6).Range
        action: text
        args: = "Burden V/I"
    - step:
        id: '470'
        object_path: objTable.Cell(1, 6).Range.Font
        action: Bold
        args: = True
    - step:
        id: '471'
        object_path: objTable.Cell(1, 6).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '472'
        object_path: objTable.Cell(2, 6).Range
        action: Text
        args: = input6
    - step:
        id: '473'
        object_path: objSelection
        action: EndKey
        args: END_OF_STORY
    - step:
        id: '474'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '475'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '476'
        action: Script
        object_path: End Function
    - step:
        id: '477'
        action: Script
        object_path: Function AddTableDataLong2(subtitle, input1, input2, input3,
          input4, input5)
    - step:
        id: '478'
        action: Script
        object_path: input1 = CStr(input1)
    - step:
        id: '479'
        action: Script
        object_path: input2 = CStr(input2)
    - step:
        id: '480'
        action: Script
        object_path: input3 = CStr(input3)
    - step:
        id: '481'
        action: Script
        object_path: input4 = CStr(input4)
    - step:
        id: '482'
        action: Script
        object_path: input5 = CStr(input5)
    - step:
        id: '483'
        action: Script
        object_path: input6 = CStr(input6)
    - step:
        id: '484'
        action: Script
        object_path: Const END_OF_STORY = 6
    - step:
        id: '485'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '486'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '487'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '488'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '489'
        action: Script
        object_path: Set objRange = objDoc.Range()
    - step:
        id: '490'
        object_path: objRange.Start = objRange
        action: End
    - step:
        id: '491'
        object_path: objRange.tables
        action: Add
        args: objRange, 2, 5
    - step:
        id: '492'
        action: Script
        object_path: Set objTable = objDoc.tables(objDoc.tables.Count)
    - step:
        id: '493'
        object_path: objTable.Cell(1, 1).Range
        action: Text
        args: = "0.1 In @ Unity (1) Active"
    - step:
        id: '494'
        object_path: objTable.Cell(1, 1).Range.Font
        action: Bold
        args: = True
    - step:
        id: '495'
        object_path: objTable.Cell(1, 1).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '496'
        object_path: objTable.Cell(2, 1).Range
        action: Text
        args: = input1
    - step:
        id: '497'
        object_path: objTable.Cell(1, 2).Range
        action: text
        args: = "0.5 In @ Unity (1) Active"
    - step:
        id: '498'
        object_path: objTable.Cell(1, 2).Range.Font
        action: Bold
        args: = True
    - step:
        id: '499'
        object_path: objTable.Cell(1, 2).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '500'
        object_path: objTable.Cell(2, 2).Range
        action: Text
        args: = input2
    - step:
        id: '501'
        object_path: objTable.Cell(1, 3).Range
        action: text
        args: = "1.0 In @ Unity (1) Active"
    - step:
        id: '502'
        object_path: objTable.Cell(1, 3).Range.Font
        action: Bold
        args: = True
    - step:
        id: '503'
        object_path: objTable.Cell(1, 3).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '504'
        object_path: objTable.Cell(2, 3).Range
        action: Text
        args: = input3
    - step:
        id: '505'
        object_path: objTable.Cell(1, 4).Range
        action: text
        args: = "1.0 In @ 0.5 LAGGING"
    - step:
        id: '506'
        object_path: objTable.Cell(1, 4).Range.Font
        action: Bold
        args: = True
    - step:
        id: '507'
        object_path: objTable.Cell(1, 4).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '508'
        object_path: objTable.Cell(2, 4).Range
        action: Text
        args: = input4
    - step:
        id: '509'
        object_path: objTable.Cell(1, 5).Range
        action: text
        args: = "2 x In or Imax "
    - step:
        id: '510'
        object_path: objTable.Cell(1, 5).Range.Font
        action: Bold
        args: = True
    - step:
        id: '511'
        object_path: objTable.Cell(1, 5).Borders(-3)
        action: LineStyle
        args: = 1
    - step:
        id: '512'
        object_path: objTable.Cell(2, 5).Range
        action: Text
        args: = input5
    - step:
        id: '513'
        object_path: objSelection
        action: EndKey
        args: END_OF_STORY
    - step:
        id: '514'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '515'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '516'
        action: Script
        object_path: End Function
    - step:
        id: '517'
        action: Script
        object_path: Function AddAttachment(filelocation, id)
    - step:
        id: '518'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '519'
        object_path: objSelection
        action: TypeText
        args: '"Attachments"'
    - step:
        id: '520'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '521'
        action: Script
        object_path: Set objAFolder = objFSO.GetFolder(filelocation)
    - step:
        id: '522'
        action: Script
        object_path: Set colAFiles = objAFolder.Files
    - step:
        id: '523'
        action: Script
        object_path: For Each attachment in colAFiles
    - step:
        id: '524'
        action: Script
        object_path: If InStr(attachment.name, "ID "&id&" ") Then
    - step:
        id: '525'
        action: Script
        object_path: Set objShape = objSelection.InlineShapes.AddPicture(filelocation&"\"&attachment.name)
    - step:
        id: '526'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '527'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '528'
        action: Script
        object_path: Set objShape = Nothing
    - step:
        id: '529'
        action: Script
        object_path: End If
    - step:
        id: '530'
        action: Script
        object_path: Next
    - step:
        id: '531'
        action: Script
        object_path: Set objAFolder = Nothing
    - step:
        id: '532'
        action: Script
        object_path: Set colAFiles = Nothing
    - step:
        id: '533'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '534'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '535'
        action: Script
        object_path: End Function
    - step:
        id: '536'
        action: Script
        object_path: Function AddMeterChecks(subtitle,value1,value2,value3,value4,value5,value6,value7)
    - step:
        id: '537'
        action: Script
        object_path: value1 = CStr(value1)
    - step:
        id: '538'
        action: Script
        object_path: value2 = CStr(value2)
    - step:
        id: '539'
        action: Script
        object_path: value3 = CStr(value3)
    - step:
        id: '540'
        action: Script
        object_path: value4 = CStr(value4)
    - step:
        id: '541'
        action: Script
        object_path: value5 = CStr(value5)
    - step:
        id: '542'
        action: Script
        object_path: value6 = CStr(value6)
    - step:
        id: '543'
        action: Script
        object_path: value7 = CStr(value7)
    - step:
        id: '544'
        object_path: objSelection.Font
        action: Size
        args: = "12"
    - step:
        id: '545'
        object_path: objSelection
        action: TypeText
        args: subtitle
    - step:
        id: '546'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '547'
        object_path: objSelection.Font
        action: Size
        args: = "10"
    - step:
        id: '548'
        object_path: objSelection
        action: TypeText
        args: '"Loading Device Used: " & value1'
    - step:
        id: '549'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '550'
        object_path: objSelection
        action: TypeText
        args: '"Comms Confirmed: " & value2'
    - step:
        id: '551'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '552'
        object_path: objSelection
        action: TypeText
        args: '"Equipment Sealed: " & value3'
    - step:
        id: '553'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '554'
        object_path: objSelection
        action: TypeText
        args: '"Meter Time & Date: " & value4'
    - step:
        id: '555'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '556'
        object_path: objSelection
        action: TypeText
        args: '"Sequence OK: " & value5'
    - step:
        id: '557'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '558'
        object_path: objSelection
        action: TypeText
        args: '"Meter Read Screen Amps Validated: " & value6'
    - step:
        id: '559'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '560'
        object_path: objSelection
        action: TypeText
        args: '"Secondary Cable Tonged: " & value7'
    - step:
        id: '561'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '562'
        object_path: objSelection
        action: TypeParagraph()
    - step:
        id: '563'
        action: Script
        object_path: End Function
  outputs:
  - lastFileName:
      robot: true
      value: ${lastFileName}
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
