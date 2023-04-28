namespace: EnablonReports
operation:
  name: WorkplaceInspections_Regional
  inputs:
    - attachment_regionalNorth
    - attachment_regionalSouth
  sequential_action:
    gav: 'com.microfocus.seq:EnablonReports.WorkplaceInspections_Regional:1.1.0'
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
          object_path: "'REGIONAL WORKPLACE INSPECTIONS ENABLON UPDATES"
      - step:
          id: '2'
          action: Script
          object_path: "'CREATE EXCEL OBJECT"
      - step:
          id: '3'
          action: Script
          object_path: 'Set objExcel = CreateObject("Excel.Application")'
      - step:
          id: '4'
          object_path: objExcel
          action: visible
          args: = true
      - step:
          id: '5'
          action: Script
          object_path: "'OPEN EXTRACTED REGIONAL SOUTH REPORT"
      - step:
          id: '6'
          action: Script
          object_path: "Set objExtractionRegionalSouth = objExcel.Workbooks.open(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enablon Reports\\\"&Parameter(\"attachment_regionalSouth\"))"
      - step:
          id: '7'
          action: Script
          object_path: "'OPEN EXTRACTED REGIONAL SOUTH SHEET"
      - step:
          id: '8'
          action: Script
          object_path: 'Set objExtractionRegionalSouthSheet = objExtractionRegionalSouth.Worksheets("Regional South, Workplace Inspe")'
      - step:
          id: '9'
          action: Script
          object_path: "'OPEN EXTRACTED REGIONAL NORTH REPORT"
      - step:
          id: '10'
          action: Script
          object_path: "Set objExtractionRegionalNorth = objExcel.Workbooks.open(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enablon Reports\\\"&Parameter(\"attachment_regionalNorth\"))"
      - step:
          id: '11'
          action: Script
          object_path: "'OPEN EXTRACTED REGIONAL NORTH SHEET"
      - step:
          id: '12'
          action: Script
          object_path: 'Set objExtractionRegionalNorthSheet = objExtractionRegionalNorth.Worksheets("Regional North, Workplace Inspe")'
      - step:
          id: '13'
          action: Script
          object_path: "'OPEN REGIONAL INSPECTIONS REPORT"
      - step:
          id: '14'
          action: Script
          object_path: "Set objRegional = objExcel.Workbooks.open(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enablon Reports\\Regional Field Services Combined Workplace Inspections Report.xlsx\")"
      - step:
          id: '15'
          action: Script
          object_path: "'OPEN FIELD SERVICES COMBINED WORKPLACE SHEET"
      - step:
          id: '16'
          action: Script
          object_path: 'Set objFieldServicesCombinedWorkpla = objRegional.Worksheets("Field Services Combined Workpla")'
      - step:
          id: '17'
          action: Script
          object_path: "'OPEN REGIONAL SOUTH SHEET"
      - step:
          id: '18'
          action: Script
          object_path: 'Set objRegionalSouth = objRegional.Worksheets("Regional South")'
      - step:
          id: '19'
          action: Script
          object_path: "'OPEN REGIONAL NORTH SHEET"
      - step:
          id: '20'
          action: Script
          object_path: 'Set objRegionalNorth = objRegional.Worksheets("Regional North")'
      - step:
          id: '21'
          action: Script
          object_path: "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''CLEAR TABLES''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
      - step:
          id: '22'
          action: Script
          object_path: "'GET ROW COUNT OF INSPECTIONS SOUTH"
      - step:
          id: '23'
          action: Script
          object_path: numberOfInspectionsSouth = objExtractionRegionalSouthSheet.usedrange.Rows.Count
      - step:
          id: '24'
          action: Script
          object_path: "'GET ROW COUNT OF INSPECTIONS NORTH"
      - step:
          id: '25'
          action: Script
          object_path: numberOfInspectionsNorth = objExtractionRegionalNorthSheet.usedrange.Rows.Count
      - step:
          id: '26'
          action: Script
          object_path: "'GET ROW COUNT OF FIELD SERVICES COMBINED WORKPLACE SHEET"
      - step:
          id: '27'
          action: Script
          object_path: numberOfCombinedWorkplace = objFieldServicesCombinedWorkpla.usedrange.Rows.Count
      - step:
          id: '28'
          action: Script
          object_path: "'GET ROW COUNT OF FIELD SERVICES COMBINED WORKPLACE SHEET"
      - step:
          id: '29'
          action: Script
          object_path: numberOfRegionalSouth = objRegionalSouth.usedrange.Rows.Count
      - step:
          id: '30'
          action: Script
          object_path: "'GET ROW COUNT OF FIELD SERVICES COMBINED WORKPLACE SHEET"
      - step:
          id: '31'
          action: Script
          object_path: numberOfRegionalNorth = objRegionalNorth.usedrange.Rows.Count
      - step:
          id: '32'
          action: Script
          object_path: "'CLEAR CURRENT FIELD SERVICES COMBINBED WORKPLACE SHEET"
      - step:
          id: '33'
          action: Script
          object_path: For o = 18 To numberOfCombinedWorkplace
      - step:
          id: '34'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,1)'
          action: clearcontents
      - step:
          id: '35'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,2)'
          action: clearcontents
      - step:
          id: '36'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,3)'
          action: clearcontents
      - step:
          id: '37'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,4)'
          action: clearcontents
      - step:
          id: '38'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,5)'
          action: clearcontents
      - step:
          id: '39'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,6)'
          action: clearcontents
      - step:
          id: '40'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,7)'
          action: clearcontents
      - step:
          id: '41'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,8)'
          action: clearcontents
      - step:
          id: '42'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,9)'
          action: clearcontents
      - step:
          id: '43'
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,9).interior'
          action: ColorIndex
          args: = xlNone
      - step:
          id: '44'
          action: Script
          object_path: Next
      - step:
          id: '45'
          action: Script
          object_path: "'CLEAR CURRENT REGIONAL SOUTH SHEET"
      - step:
          id: '46'
          action: Script
          object_path: For o = 2 To numberOfRegionalSouth
      - step:
          id: '47'
          object_path: 'objRegionalSouth.cells(o,1)'
          action: clearcontents
      - step:
          id: '48'
          object_path: 'objRegionalSouth.cells(o,2)'
          action: clearcontents
      - step:
          id: '49'
          object_path: 'objRegionalSouth.cells(o,3)'
          action: clearcontents
      - step:
          id: '50'
          object_path: 'objRegionalSouth.cells(o,4)'
          action: clearcontents
      - step:
          id: '51'
          object_path: 'objRegionalSouth.cells(o,5)'
          action: clearcontents
      - step:
          id: '52'
          object_path: 'objRegionalSouth.cells(o,6)'
          action: clearcontents
      - step:
          id: '53'
          object_path: 'objRegionalSouth.cells(o,7)'
          action: clearcontents
      - step:
          id: '54'
          object_path: 'objRegionalSouth.cells(o,8)'
          action: clearcontents
      - step:
          id: '55'
          object_path: 'objRegionalSouth.cells(o,9)'
          action: clearcontents
      - step:
          id: '56'
          object_path: 'objRegionalSouth.cells(o,9).interior'
          action: ColorIndex
          args: = xlNone
      - step:
          id: '57'
          action: Script
          object_path: Next
      - step:
          id: '58'
          action: Script
          object_path: "'CLEAR CURRENT REGIONAL NORTH SHEET"
      - step:
          id: '59'
          action: Script
          object_path: For o = 2 To numberOfRegionalNorth
      - step:
          id: '60'
          object_path: 'objRegionalNorth.cells(o,1)'
          action: clearcontents
      - step:
          id: '61'
          object_path: 'objRegionalNorth.cells(o,2)'
          action: clearcontents
      - step:
          id: '62'
          object_path: 'objRegionalNorth.cells(o,3)'
          action: clearcontents
      - step:
          id: '63'
          object_path: 'objRegionalNorth.cells(o,4)'
          action: clearcontents
      - step:
          id: '64'
          object_path: 'objRegionalNorth.cells(o,5)'
          action: clearcontents
      - step:
          id: '65'
          object_path: 'objRegionalNorth.cells(o,6)'
          action: clearcontents
      - step:
          id: '66'
          object_path: 'objRegionalNorth.cells(o,7)'
          action: clearcontents
      - step:
          id: '67'
          object_path: 'objRegionalNorth.cells(o,8)'
          action: clearcontents
      - step:
          id: '68'
          object_path: 'objRegionalNorth.cells(o,9)'
          action: clearcontents
      - step:
          id: '69'
          object_path: 'objRegionalNorth.cells(o,9).interior'
          action: ColorIndex
          args: = xlNone
      - step:
          id: '70'
          action: Script
          object_path: Next
      - step:
          id: '71'
          action: Script
          object_path: "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''EXTRACT DATA''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
      - step:
          id: '72'
          action: Script
          object_path: "'SET ACTIVE ROW TO 18 FOR REGIONAL SOUTH SHEET"
      - step:
          id: '73'
          action: Script
          object_path: x = 2
      - step:
          id: '74'
          action: Script
          object_path: "'EXTRACT ROWS FROM INSPECTIONS AND ADD TO DEPOT LOCATION"
      - step:
          id: '75'
          action: Script
          object_path: For i = 4 To numberOfInspectionsSouth
      - step:
          id: '76'
          action: Script
          object_path: 'manager = objExtractionRegionalSouthSheet.cells(i,17).value'
      - step:
          id: '77'
          action: Script
          object_path: 'workGroup = objExtractionRegionalSouthSheet.cells(i,2).value'
      - step:
          id: '78'
          action: Script
          object_path: 'If InStr(workGroup, "OBSOLETE") > 0 Then'
      - step:
          id: '79'
          action: Script
          object_path: 'workGroup = Replace(workGroup, "OBSOLETE ", "")'
      - step:
          id: '80'
          action: Script
          object_path: End If
      - step:
          id: '81'
          action: Script
          object_path: 'inspectionType = objExtractionRegionalSouthSheet.cells(i,9).value'
      - step:
          id: '82'
          action: Script
          object_path: 'title = objExtractionRegionalSouthSheet.cells(i,4).value'
      - step:
          id: '83'
          action: Script
          object_path: 'startDate = objExtractionRegionalSouthSheet.cells(i,6).value'
      - step:
          id: '84'
          action: Script
          object_path: startDate = CStr(startDate)
      - step:
          id: '85'
          action: Script
          object_path: 'start = Split(startDate," ")'
      - step:
          id: '86'
          action: Script
          object_path: startDate = start(0)
      - step:
          id: '87'
          action: Script
          object_path: 'start = Split(startDate, "/")'
      - step:
          id: '88'
          action: Script
          object_path: month1 = start(1)
      - step:
          id: '89'
          action: Script
          object_path: 'monthName1 = monthName(month1, true)'
      - step:
          id: '90'
          action: Script
          object_path: year1 = start(02)
      - step:
          id: '91'
          action: Script
          object_path: If len(year1) = 2  Then
      - step:
          id: '92'
          action: Script
          object_path: 'year1 = "20"&year1'
      - step:
          id: '93'
          action: Script
          object_path: End If
      - step:
          id: '94'
          action: Script
          object_path: 'startDate = start(0)&"/"&monthName1&"/"&year1'
      - step:
          id: '95'
          action: Script
          object_path: 'dueDate = objExtractionRegionalSouthSheet.cells(i,7).value'
      - step:
          id: '96'
          action: Script
          object_path: dueDate = CStr(dueDate)
      - step:
          id: '97'
          action: Script
          object_path: 'finish = Split(dueDate," ")'
      - step:
          id: '98'
          action: Script
          object_path: dueDate = finish(0)
      - step:
          id: '99'
          action: Script
          object_path: 'due = Split(dueDate, "/")'
      - step:
          id: '100'
          action: Script
          object_path: month2 = due(1)
      - step:
          id: '101'
          action: Script
          object_path: 'monthName2 = monthName(month2, true)'
      - step:
          id: '102'
          action: Script
          object_path: dueyear = due(02)
      - step:
          id: '103'
          action: Script
          object_path: If len(dueyear) = 2  Then
      - step:
          id: '104'
          action: Script
          object_path: 'dueyear = "20"&dueyear'
      - step:
          id: '105'
          action: Script
          object_path: End If
      - step:
          id: '106'
          action: Script
          object_path: 'dueDate = due(0)&"/"&monthName2&"/"&dueyear'
      - step:
          id: '107'
          action: Script
          object_path: 'owner = objExtractionRegionalSouthSheet.cells(i,8).value'
      - step:
          id: '108'
          action: Script
          object_path: 'percentDone = objExtractionRegionalSouthSheet.cells(i,12).value'
      - step:
          id: '109'
          action: Script
          object_path: 'status = objExtractionRegionalSouthSheet.cells(i,11).value'
      - step:
          id: '110'
          action: Script
          object_path: "'ADD EXTRACTION TO COMBINED WORKPLACE SHEET"
      - step:
          id: '111'
          object_path: 'objRegionalSouth.cells(x,1)'
          action: value
          args: = manager
      - step:
          id: '112'
          object_path: 'objRegionalSouth.cells(x,2)'
          action: value
          args: = workGroup
      - step:
          id: '113'
          object_path: 'objRegionalSouth.cells(x,3)'
          action: value
          args: = inspectionType
      - step:
          id: '114'
          object_path: 'objRegionalSouth.cells(x,4)'
          action: value
          args: = title
      - step:
          id: '115'
          object_path: 'objRegionalSouth.cells(x,5)'
          action: value
          args: = startDate
      - step:
          id: '116'
          object_path: 'objRegionalSouth.cells(x,6)'
          action: value
          args: = dueDate
      - step:
          id: '117'
          object_path: 'objRegionalSouth.cells(x,7)'
          action: value
          args: = owner
      - step:
          id: '118'
          object_path: 'objRegionalSouth.cells(x,8)'
          action: value
          args: = percentDone
      - step:
          id: '119'
          object_path: 'objRegionalSouth.cells(x,9)'
          action: value
          args: = status
      - step:
          id: '120'
          action: Script
          object_path: 'If status = "Completed" Then'
      - step:
          id: '121'
          object_path: 'objRegionalSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 43
      - step:
          id: '122'
          action: Script
          object_path: 'ElseIf status = "Overdue" Then'
      - step:
          id: '123'
          object_path: 'objRegionalSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 46
      - step:
          id: '124'
          action: Script
          object_path: 'ElseIf status = "Scheduled" Then'
      - step:
          id: '125'
          object_path: 'objRegionalSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 45
      - step:
          id: '126'
          action: Script
          object_path: 'ElseIf status = "In Progress" Then'
      - step:
          id: '127'
          object_path: 'objRegionalSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 44
      - step:
          id: '128'
          action: Script
          object_path: 'ElseIf status = "Cancelled" Then'
      - step:
          id: '129'
          object_path: 'objRegionalSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 48
      - step:
          id: '130'
          action: Script
          object_path: End If
      - step:
          id: '131'
          action: Script
          object_path: x = x + 1
      - step:
          id: '132'
          action: Script
          object_path: Next
      - step:
          id: '133'
          action: Script
          object_path: "'SET ACTIVE ROW TO 18 FOR REGIONAL SOUTH SHEET"
      - step:
          id: '134'
          action: Script
          object_path: x = 2
      - step:
          id: '135'
          action: Script
          object_path: "'EXTRACT ROWS FROM INSPECTIONS AND ADD TO DEPOT LOCATION"
      - step:
          id: '136'
          action: Script
          object_path: For i = 4 To numberOfInspectionsNorth
      - step:
          id: '137'
          action: Script
          object_path: 'manager = objExtractionRegionalSouthSheet.cells(i,17).value'
      - step:
          id: '138'
          action: Script
          object_path: 'workGroup = objExtractionRegionalNorthSheet.cells(i,2).value'
      - step:
          id: '139'
          action: Script
          object_path: 'If InStr(workGroup, "OBSOLETE") > 0 Then'
      - step:
          id: '140'
          action: Script
          object_path: 'workGroup = Replace(workGroup, "OBSOLETE ", "")'
      - step:
          id: '141'
          action: Script
          object_path: End If
      - step:
          id: '142'
          action: Script
          object_path: 'inspectionType = objExtractionRegionalNorthSheet.cells(i,9).value'
      - step:
          id: '143'
          action: Script
          object_path: 'title = objExtractionRegionalNorthSheet.cells(i,4).value'
      - step:
          id: '144'
          action: Script
          object_path: 'startDate = objExtractionRegionalNorthSheet.cells(i,6).value'
      - step:
          id: '145'
          action: Script
          object_path: startDate = CStr(startDate)
      - step:
          id: '146'
          action: Script
          object_path: 'start = Split(startDate," ")'
      - step:
          id: '147'
          action: Script
          object_path: startDate = start(0)
      - step:
          id: '148'
          action: Script
          object_path: 'start = Split(startDate, "/")'
      - step:
          id: '149'
          action: Script
          object_path: month1 = start(1)
      - step:
          id: '150'
          action: Script
          object_path: 'monthName1 = monthName(month1, true)'
      - step:
          id: '151'
          action: Script
          object_path: year1 = start(02)
      - step:
          id: '152'
          action: Script
          object_path: If len(year1) = 2  Then
      - step:
          id: '153'
          action: Script
          object_path: 'year1 = "20"&year1'
      - step:
          id: '154'
          action: Script
          object_path: End If
      - step:
          id: '155'
          action: Script
          object_path: 'startDate = start(0)&"/"&monthName1&"/"&year1'
      - step:
          id: '156'
          action: Script
          object_path: 'dueDate = objExtractionRegionalNorthSheet.cells(i,7).value'
      - step:
          id: '157'
          action: Script
          object_path: dueDate = CStr(dueDate)
      - step:
          id: '158'
          action: Script
          object_path: 'finish = Split(dueDate," ")'
      - step:
          id: '159'
          action: Script
          object_path: dueDate = finish(0)
      - step:
          id: '160'
          action: Script
          object_path: 'due = Split(dueDate, "/")'
      - step:
          id: '161'
          action: Script
          object_path: month2 = due(1)
      - step:
          id: '162'
          action: Script
          object_path: 'monthName2 = monthName(month2, true)'
      - step:
          id: '163'
          action: Script
          object_path: dueyear = due(02)
      - step:
          id: '164'
          action: Script
          object_path: If len(dueyear) = 2  Then
      - step:
          id: '165'
          action: Script
          object_path: 'dueyear = "20"&dueyear'
      - step:
          id: '166'
          action: Script
          object_path: End If
      - step:
          id: '167'
          action: Script
          object_path: 'dueDate = due(0)&"/"&monthName2&"/"&dueyear'
      - step:
          id: '168'
          action: Script
          object_path: 'owner = objExtractionRegionalNorthSheet.cells(i,8).value'
      - step:
          id: '169'
          action: Script
          object_path: 'percentDone = objExtractionRegionalNorthSheet.cells(i,12).value'
      - step:
          id: '170'
          action: Script
          object_path: 'status = objExtractionRegionalNorthSheet.cells(i,11).value'
      - step:
          id: '171'
          action: Script
          object_path: "'ADD EXTRACTION TO COMBINED WORKPLACE SHEET"
      - step:
          id: '172'
          object_path: 'objRegionalSouth.cells(x,1)'
          action: value
          args: = manager
      - step:
          id: '173'
          object_path: 'objRegionalNorth.cells(x,2)'
          action: value
          args: = workGroup
      - step:
          id: '174'
          object_path: 'objRegionalNorth.cells(x,3)'
          action: value
          args: = inspectionType
      - step:
          id: '175'
          object_path: 'objRegionalNorth.cells(x,4)'
          action: value
          args: = title
      - step:
          id: '176'
          object_path: 'objRegionalNorth.cells(x,5)'
          action: value
          args: = startDate
      - step:
          id: '177'
          object_path: 'objRegionalNorth.cells(x,6)'
          action: value
          args: = dueDate
      - step:
          id: '178'
          object_path: 'objRegionalNorth.cells(x,7)'
          action: value
          args: = owner
      - step:
          id: '179'
          object_path: 'objRegionalNorth.cells(x,8)'
          action: value
          args: = percentDone
      - step:
          id: '180'
          object_path: 'objRegionalNorth.cells(x,9)'
          action: value
          args: = status
      - step:
          id: '181'
          action: Script
          object_path: 'If status = "Completed" Then'
      - step:
          id: '182'
          object_path: 'objRegionalNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 43
      - step:
          id: '183'
          action: Script
          object_path: 'ElseIf status = "Overdue" Then'
      - step:
          id: '184'
          object_path: 'objRegionalNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 46
      - step:
          id: '185'
          action: Script
          object_path: 'ElseIf status = "Scheduled" Then'
      - step:
          id: '186'
          object_path: 'objRegionalNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 45
      - step:
          id: '187'
          action: Script
          object_path: 'ElseIf status = "In Progress" Then'
      - step:
          id: '188'
          object_path: 'objRegionalNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 44
      - step:
          id: '189'
          action: Script
          object_path: 'ElseIf status = "Cancelled" Then'
      - step:
          id: '190'
          object_path: 'objRegionalNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 48
      - step:
          id: '191'
          action: Script
          object_path: End If
      - step:
          id: '192'
          action: Script
          object_path: x = x + 1
      - step:
          id: '193'
          action: Script
          object_path: Next
      - step:
          id: '194'
          action: Script
          object_path: "'SET ACTIVE ROW TO 18 FOR FIELD SERVICES COMBINED WORKPLACE SHEET"
      - step:
          id: '195'
          action: Script
          object_path: 'x = 18 '
          comment: ' need to set to next empty row'
      - step:
          id: '196'
          action: Script
          object_path: "'EXTRACT ROWS FROM INSPECTIONSSOUTH AND ADD TO COMBINED WORKPLACE"
      - step:
          id: '197'
          action: Script
          object_path: For i = 4 To numberOfInspectionsSouth
      - step:
          id: '198'
          action: Script
          object_path: 'manager = objExtractionRegionalSouthSheet.cells(i,17).value'
      - step:
          id: '199'
          action: Script
          object_path: 'workGroup = objExtractionRegionalSouthSheet.cells(i,2).value'
      - step:
          id: '200'
          action: Script
          object_path: 'If InStr(workGroup, "OBSOLETE") > 0 Then'
      - step:
          id: '201'
          action: Script
          object_path: 'workGroup = Replace(workGroup, "OBSOLETE ", "")'
      - step:
          id: '202'
          action: Script
          object_path: End If
      - step:
          id: '203'
          action: Script
          object_path: 'inspectionType = objExtractionRegionalSouthSheet.cells(i,9).value'
      - step:
          id: '204'
          action: Script
          object_path: 'title = objExtractionRegionalSouthSheet.cells(i,4).value'
      - step:
          id: '205'
          action: Script
          object_path: 'startDate = objExtractionRegionalSouthSheet.cells(i,6).value'
      - step:
          id: '206'
          action: Script
          object_path: startDate = CStr(startDate)
      - step:
          id: '207'
          action: Script
          object_path: 'start = Split(startDate," ")'
      - step:
          id: '208'
          action: Script
          object_path: startDate = start(0)
      - step:
          id: '209'
          action: Script
          object_path: 'start = Split(startDate, "/")'
      - step:
          id: '210'
          action: Script
          object_path: month1 = start(1)
      - step:
          id: '211'
          action: Script
          object_path: 'monthName1 = monthName(month1, true)'
      - step:
          id: '212'
          action: Script
          object_path: year1 = start(02)
      - step:
          id: '213'
          action: Script
          object_path: If len(year1) = 2  Then
      - step:
          id: '214'
          action: Script
          object_path: 'year1 = "20"&year1'
      - step:
          id: '215'
          action: Script
          object_path: End If
      - step:
          id: '216'
          action: Script
          object_path: 'startDate = start(0)&"/"&monthName1&"/"&year1'
      - step:
          id: '217'
          action: Script
          object_path: 'dueDate = objExtractionRegionalSouthSheet.cells(i,7).value'
      - step:
          id: '218'
          action: Script
          object_path: dueDate = CStr(dueDate)
      - step:
          id: '219'
          action: Script
          object_path: 'finish = Split(dueDate," ")'
      - step:
          id: '220'
          action: Script
          object_path: dueDate = finish(0)
      - step:
          id: '221'
          action: Script
          object_path: 'due = Split(dueDate, "/")'
      - step:
          id: '222'
          action: Script
          object_path: month2 = due(1)
      - step:
          id: '223'
          action: Script
          object_path: 'monthName2 = monthName(month2, true)'
      - step:
          id: '224'
          action: Script
          object_path: dueyear = due(02)
      - step:
          id: '225'
          action: Script
          object_path: If len(dueyear) = 2  Then
      - step:
          id: '226'
          action: Script
          object_path: 'dueyear = "20"&dueyear'
      - step:
          id: '227'
          action: Script
          object_path: End If
      - step:
          id: '228'
          action: Script
          object_path: 'dueDate = due(0)&"/"&monthName2&"/"&dueyear'
      - step:
          id: '229'
          action: Script
          object_path: 'owner = objExtractionRegionalSouthSheet.cells(i,8).value'
      - step:
          id: '230'
          action: Script
          object_path: 'percentDone = objExtractionRegionalSouthSheet.cells(i,12).value'
      - step:
          id: '231'
          action: Script
          object_path: 'status = objExtractionRegionalSouthSheet.cells(i,11).value'
      - step:
          id: '232'
          action: Script
          object_path: "'ADD EXTRACTION TO COMBINED WORKPLACE SHEET"
      - step:
          id: '233'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,1)'
          action: value
          args: = manager
      - step:
          id: '234'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,2)'
          action: value
          args: = workGroup
      - step:
          id: '235'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,3)'
          action: value
          args: = inspectionType
      - step:
          id: '236'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,4)'
          action: value
          args: = title
      - step:
          id: '237'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,5)'
          action: value
          args: = startDate
      - step:
          id: '238'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,6)'
          action: value
          args: = dueDate
      - step:
          id: '239'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,7)'
          action: value
          args: = owner
      - step:
          id: '240'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,8)'
          action: value
          args: = percentDone
      - step:
          id: '241'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9)'
          action: value
          args: = status
      - step:
          id: '242'
          action: Script
          object_path: 'If status = "Completed" Then'
      - step:
          id: '243'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 43
      - step:
          id: '244'
          action: Script
          object_path: 'ElseIf status = "Overdue" Then'
      - step:
          id: '245'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 46
      - step:
          id: '246'
          action: Script
          object_path: 'ElseIf status = "Scheduled" Then'
      - step:
          id: '247'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 45
      - step:
          id: '248'
          action: Script
          object_path: 'ElseIf status = "In Progress" Then'
      - step:
          id: '249'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 44
      - step:
          id: '250'
          action: Script
          object_path: 'ElseIf status = "Cancelled" Then'
      - step:
          id: '251'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 48
      - step:
          id: '252'
          action: Script
          object_path: End If
      - step:
          id: '253'
          action: Script
          object_path: x = x + 1
      - step:
          id: '254'
          action: Script
          object_path: Next
      - step:
          id: '255'
          action: Script
          object_path: "'EXTRACT ROWS FROM INSPECTIONSNORTH AND ADD TO COMBINED WORKPLACE"
      - step:
          id: '256'
          action: Script
          object_path: For i = 4 To numberOfInspectionsNorth
      - step:
          id: '257'
          action: Script
          object_path: 'manager = objExtractionRegionalNorthSheet.cells(i,17).value'
      - step:
          id: '258'
          action: Script
          object_path: 'workGroup = objExtractionRegionalNorthSheet.cells(i,2).value'
      - step:
          id: '259'
          action: Script
          object_path: 'If InStr(workGroup, "OBSOLETE") > 0 Then'
      - step:
          id: '260'
          action: Script
          object_path: 'workGroup = Replace(workGroup, "OBSOLETE ", "")'
      - step:
          id: '261'
          action: Script
          object_path: End If
      - step:
          id: '262'
          action: Script
          object_path: 'inspectionType = objExtractionRegionalNorthSheet.cells(i,9).value'
      - step:
          id: '263'
          action: Script
          object_path: 'title = objExtractionRegionalNorthSheet.cells(i,4).value'
      - step:
          id: '264'
          action: Script
          object_path: 'startDate = objExtractionRegionalNorthSheet.cells(i,6).value'
      - step:
          id: '265'
          action: Script
          object_path: startDate = CStr(startDate)
      - step:
          id: '266'
          action: Script
          object_path: 'start = Split(startDate," ")'
      - step:
          id: '267'
          action: Script
          object_path: startDate = start(0)
      - step:
          id: '268'
          action: Script
          object_path: 'start = Split(startDate, "/")'
      - step:
          id: '269'
          action: Script
          object_path: month1 = start(1)
      - step:
          id: '270'
          action: Script
          object_path: 'monthName1 = monthName(month1, true)'
      - step:
          id: '271'
          action: Script
          object_path: year1 = start(02)
      - step:
          id: '272'
          action: Script
          object_path: If len(year1) = 2  Then
      - step:
          id: '273'
          action: Script
          object_path: 'year1 = "20"&year1'
      - step:
          id: '274'
          action: Script
          object_path: End If
      - step:
          id: '275'
          action: Script
          object_path: 'startDate = start(0)&"/"&monthName1&"/"&year1'
      - step:
          id: '276'
          action: Script
          object_path: 'dueDate = objExtractionRegionalNorthSheet.cells(i,7).value'
      - step:
          id: '277'
          action: Script
          object_path: dueDate = CStr(dueDate)
      - step:
          id: '278'
          action: Script
          object_path: 'finish = Split(dueDate," ")'
      - step:
          id: '279'
          action: Script
          object_path: dueDate = finish(0)
      - step:
          id: '280'
          action: Script
          object_path: 'due = Split(dueDate, "/")'
      - step:
          id: '281'
          action: Script
          object_path: month2 = due(1)
      - step:
          id: '282'
          action: Script
          object_path: 'monthName2 = monthName(month2, true)'
      - step:
          id: '283'
          action: Script
          object_path: dueyear = due(02)
      - step:
          id: '284'
          action: Script
          object_path: If len(dueyear) = 2  Then
      - step:
          id: '285'
          action: Script
          object_path: 'dueyear = "20"&dueyear'
      - step:
          id: '286'
          action: Script
          object_path: End If
      - step:
          id: '287'
          action: Script
          object_path: 'dueDate = due(0)&"/"&monthName2&"/"&dueyear'
      - step:
          id: '288'
          action: Script
          object_path: 'owner = objExtractionRegionalNorthSheet.cells(i,8).value'
      - step:
          id: '289'
          action: Script
          object_path: 'percentDone = objExtractionRegionalNorthSheet.cells(i,12).value'
      - step:
          id: '290'
          action: Script
          object_path: 'status = objExtractionRegionalNorthSheet.cells(i,11).value'
      - step:
          id: '291'
          action: Script
          object_path: "'ADD EXTRACTION TO COMBINED WORKPLACE SHEET"
      - step:
          id: '292'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,1)'
          action: value
          args: = manager
      - step:
          id: '293'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,2)'
          action: value
          args: = workGroup
      - step:
          id: '294'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,3)'
          action: value
          args: = inspectionType
      - step:
          id: '295'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,4)'
          action: value
          args: = title
      - step:
          id: '296'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,5)'
          action: value
          args: = startDate
      - step:
          id: '297'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,6)'
          action: value
          args: = dueDate
      - step:
          id: '298'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,7)'
          action: value
          args: = owner
      - step:
          id: '299'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,8)'
          action: value
          args: = percentDone
      - step:
          id: '300'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9)'
          action: value
          args: = status
      - step:
          id: '301'
          action: Script
          object_path: 'If status = "Completed" Then'
      - step:
          id: '302'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 43
      - step:
          id: '303'
          action: Script
          object_path: 'ElseIf status = "Overdue" Then'
      - step:
          id: '304'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 46
      - step:
          id: '305'
          action: Script
          object_path: 'ElseIf status = "Scheduled" Then'
      - step:
          id: '306'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 45
      - step:
          id: '307'
          action: Script
          object_path: 'ElseIf status = "In Progress" Then'
      - step:
          id: '308'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 44
      - step:
          id: '309'
          action: Script
          object_path: 'ElseIf status = "Cancelled" Then'
      - step:
          id: '310'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 48
      - step:
          id: '311'
          action: Script
          object_path: End If
      - step:
          id: '312'
          action: Script
          object_path: x = x + 1
      - step:
          id: '313'
          action: Script
          object_path: Next
      - step:
          id: '314'
          action: Script
          object_path: "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
      - step:
          id: '315'
          action: Script
          object_path: "'REFRESH WORKBOOK TO UPDATE PIVOT TABLE"
      - step:
          id: '316'
          object_path: objRegional
          action: RefreshAll
      - step:
          id: '317'
          action: Script
          object_path: "'RENAME FILE"
      - step:
          id: '318'
          action: Script
          object_path: currentDate = Date()
      - step:
          id: '319'
          action: Script
          object_path: currentDate = CStr(currentDate)
      - step:
          id: '320'
          action: Script
          object_path: 'currentDate = Split(currentDate,"/")'
      - step:
          id: '321'
          action: Script
          object_path: 'newDate = currentDate(2)&"-"&currentDate(1)&"-"&currentDate(0)'
      - step:
          id: '322'
          action: Script
          object_path: 'Parameter("new_regional") = newDate&" Regional Field Services Combined Workplace Inspections Report.xlsx"'
      - step:
          id: '323'
          object_path: objRegional
          action: "SaveAs(\"C:\\Users\\svcrpabot\\OneDrive"
          args: "- SA Power Networks\\Enablon Reports\\\"&newDate&\" Regional Field Services Combined Workplace Inspections Report.xlsx\")"
      - step:
          id: '324'
          action: Script
          object_path: "'SAVE AND CLOSE REGIONAL INSPECTIONS REPORT"
      - step:
          id: '325'
          object_path: objExtractionRegionalSouth
          action: save
      - step:
          id: '326'
          object_path: objExtractionRegionalSouth
          action: close
      - step:
          id: '327'
          object_path: objExtractionRegionalNorth
          action: save
      - step:
          id: '328'
          object_path: objExtractionRegionalNorth
          action: close
      - step:
          id: '329'
          object_path: objRegional
          action: save
      - step:
          id: '330'
          object_path: objRegional
          action: close
      - step:
          id: '331'
          object_path: objExcel
          action: Quit
      - step:
          id: '332'
          action: Script
          object_path: "'RELEASE OBJECTS"
      - step:
          id: '333'
          action: Script
          object_path: Set objExcel = Nothing
      - step:
          id: '334'
          action: Script
          object_path: Set objExtractionRegionalSouth = Nothing
      - step:
          id: '335'
          action: Script
          object_path: Set objExtractionRegionalSouthSheet = Nothing
      - step:
          id: '336'
          action: Script
          object_path: Set objExtractionRegionalNorth = Nothing
      - step:
          id: '337'
          action: Script
          object_path: Set objExtractionRegionalNorthSheet = Nothing
      - step:
          id: '338'
          action: Script
          object_path: Set objRegional = Nothing
      - step:
          id: '339'
          action: Script
          object_path: Set objFieldServicesCombinedWorkpla = Nothing
      - step:
          id: '340'
          action: Script
          object_path: Set objRegionalSouth = Nothing
      - step:
          id: '341'
          action: Script
          object_path: Set objRegionalNorth = Nothing
  outputs:
    - new_regional:
        robot: true
        value: '${new_regional}'
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
