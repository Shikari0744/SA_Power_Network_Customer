namespace: EnablonReports
operation:
  name: FieldObservations_Metro_1
  inputs:
    - attachment_metroNorth
    - attachment_metroSouth
  sequential_action:
    gav: 'com.microfocus.seq:EnablonReports.FieldObservations_Metro_1:1.0.3'
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
          object_path: "'METRO FIELD OBSERVATIONS ENABLON UPDATES"
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
          object_path: "'OPEN EXTRACTED METRO SOUTH REPORT"
      - step:
          id: '6'
          action: Script
          object_path: "Set objExtractionMetroSouth = objExcel.Workbooks.open(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enablon Reports\\\"&Parameter(\"attachment_metroSouth\"))"
      - step:
          id: '7'
          action: Script
          object_path: "'OPEN EXTRACTED METRO SOUTH SHEET"
      - step:
          id: '8'
          action: Script
          object_path: 'Set objExtractionMetroSouthSheet = objExtractionMetroSouth.Worksheets("Operations Metro South, Field O")'
      - step:
          id: '9'
          action: Script
          object_path: "'OPEN EXTRACTED METRO NORTH REPORT"
      - step:
          id: '10'
          action: Script
          object_path: "Set objExtractionMetroNorth = objExcel.Workbooks.open(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enablon Reports\\\"&Parameter(\"attachment_metroNorth\"))"
      - step:
          id: '11'
          action: Script
          object_path: "'OPEN EXTRACTED METRO NORTH SHEET"
      - step:
          id: '12'
          action: Script
          object_path: 'Set objExtractionMetroNorthSheet = objExtractionMetroNorth.Worksheets("Operations Metro North, Field O")'
      - step:
          id: '13'
          action: Script
          object_path: "'OPEN METRO INSPECTIONS REPORT"
      - step:
          id: '14'
          action: Script
          object_path: "Set objMetro = objExcel.Workbooks.open(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enablon Reports\\Metro Field Services Combined Field Observations Report.xlsx\")"
      - step:
          id: '15'
          action: Script
          object_path: "'OPEN FIELD SERVICES COMBINED WORKPLACE SHEET"
      - step:
          id: '16'
          action: Script
          object_path: 'Set objFieldServicesCombinedWorkpla = objMetro.Worksheets("Field Services Combined Workpla")'
      - step:
          id: '17'
          action: Script
          object_path: "'OPEN METRO SOUTH SHEET"
      - step:
          id: '18'
          action: Script
          object_path: 'Set objMetroSouth = objMetro.Worksheets("Metro South")'
      - step:
          id: '19'
          action: Script
          object_path: "'OPEN METRO NORTH SHEET"
      - step:
          id: '20'
          action: Script
          object_path: 'Set objMetroNorth = objMetro.Worksheets("Metro North")'
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
          object_path: numberOfInspectionsSouth = objExtractionMetroSouthSheet.usedrange.Rows.Count
      - step:
          id: '24'
          action: Script
          object_path: "'GET ROW COUNT OF INSPECTIONS NORTH"
      - step:
          id: '25'
          action: Script
          object_path: numberOfInspectionsNorth = objExtractionMetroNorthSheet.usedrange.Rows.Count
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
          object_path: "'GET ROW COUNT OF METRO SOUTH SHEET"
      - step:
          id: '29'
          action: Script
          object_path: numberOfMetroSouth = objMetroSouth.usedrange.Rows.Count
      - step:
          id: '30'
          action: Script
          object_path: "'GET ROW COUNT OF METRO NORTH SHEET"
      - step:
          id: '31'
          action: Script
          object_path: numberOfMetroNorth = objMetroNorth.usedrange.Rows.Count
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
          object_path: 'objFieldServicesCombinedWorkpla.cells(o,10)'
          action: clearcontents
      - step:
          id: '45'
          action: Script
          object_path: Next
      - step:
          id: '46'
          action: Script
          object_path: "'CLEAR CURRENT METRO SOUTH SHEET"
      - step:
          id: '47'
          action: Script
          object_path: For o = 2 To numberOfMetroSouth
      - step:
          id: '48'
          object_path: 'objMetroSouth.cells(o,1)'
          action: clearcontents
      - step:
          id: '49'
          object_path: 'objMetroSouth.cells(o,2)'
          action: clearcontents
      - step:
          id: '50'
          object_path: 'objMetroSouth.cells(o,3)'
          action: clearcontents
      - step:
          id: '51'
          object_path: 'objMetroSouth.cells(o,4)'
          action: clearcontents
      - step:
          id: '52'
          object_path: 'objMetroSouth.cells(o,5)'
          action: clearcontents
      - step:
          id: '53'
          object_path: 'objMetroSouth.cells(o,6)'
          action: clearcontents
      - step:
          id: '54'
          object_path: 'objMetroSouth.cells(o,7)'
          action: clearcontents
      - step:
          id: '55'
          object_path: 'objMetroSouth.cells(o,8)'
          action: clearcontents
      - step:
          id: '56'
          object_path: 'objMetroSouth.cells(o,9)'
          action: clearcontents
      - step:
          id: '57'
          object_path: 'objMetroSouth.cells(o,9).interior'
          action: ColorIndex
          args: = xlNone
      - step:
          id: '58'
          object_path: 'objMetroSouth.cells(o,10)'
          action: clearcontents
      - step:
          id: '59'
          action: Script
          object_path: Next
      - step:
          id: '60'
          action: Script
          object_path: "'CLEAR CURRENT METRO NORTH SHEET"
      - step:
          id: '61'
          action: Script
          object_path: For o = 2 To numberOfMetroNorth
      - step:
          id: '62'
          object_path: 'objMetroNorth.cells(o,1)'
          action: clearcontents
      - step:
          id: '63'
          object_path: 'objMetroNorth.cells(o,2)'
          action: clearcontents
      - step:
          id: '64'
          object_path: 'objMetroNorth.cells(o,3)'
          action: clearcontents
      - step:
          id: '65'
          object_path: 'objMetroNorth.cells(o,4)'
          action: clearcontents
      - step:
          id: '66'
          object_path: 'objMetroNorth.cells(o,5)'
          action: clearcontents
      - step:
          id: '67'
          object_path: 'objMetroNorth.cells(o,6)'
          action: clearcontents
      - step:
          id: '68'
          object_path: 'objMetroNorth.cells(o,7)'
          action: clearcontents
      - step:
          id: '69'
          object_path: 'objMetroNorth.cells(o,8)'
          action: clearcontents
      - step:
          id: '70'
          object_path: 'objMetroNorth.cells(o,9)'
          action: clearcontents
      - step:
          id: '71'
          object_path: 'objMetroNorth.cells(o,9).interior'
          action: ColorIndex
          args: = xlNone
      - step:
          id: '72'
          object_path: 'objMetroNorth.cells(o,10)'
          action: clearcontents
      - step:
          id: '73'
          action: Script
          object_path: Next
      - step:
          id: '74'
          action: Script
          object_path: "'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''EXTRACT DATA''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
      - step:
          id: '75'
          action: Script
          object_path: "'SET ACTIVE ROW TO 18 FOR METRO SOUTH SHEET"
      - step:
          id: '76'
          action: Script
          object_path: x = 2
      - step:
          id: '77'
          action: Script
          object_path: "'EXTRACT ROWS FROM INSPECTIONS SOUTH AND ADD TO DEPOT LOCATION"
      - step:
          id: '78'
          action: Script
          object_path: For i = 4 To numberOfInspectionsSouth
      - step:
          id: '79'
          action: Script
          object_path: 'manager = objExtractionMetroSouthSheet.cells(i,17).value'
      - step:
          id: '80'
          action: Script
          object_path: 'workGroup = objExtractionMetroSouthSheet.cells(i,2).value'
      - step:
          id: '81'
          action: Script
          object_path: 'If InStr(workGroup, "OBSOLETE") > 0 Then'
      - step:
          id: '82'
          action: Script
          object_path: 'workGroup = Replace(workGroup, "OBSOLETE ", "")'
      - step:
          id: '83'
          action: Script
          object_path: End If
      - step:
          id: '84'
          action: Script
          object_path: 'inspectionType = objExtractionMetroSouthSheet.cells(i,5).value'
      - step:
          id: '85'
          action: Script
          object_path: 'title = objExtractionMetroSouthSheet.cells(i,4).value'
      - step:
          id: '86'
          action: Script
          object_path: 'startDate = objExtractionMetroSouthSheet.cells(i,6).value'
      - step:
          id: '87'
          action: Script
          object_path: startDate = CStr(startDate)
      - step:
          id: '88'
          action: Script
          object_path: 'start = Split(startDate," ")'
      - step:
          id: '89'
          action: Script
          object_path: startDate = start(0)
      - step:
          id: '90'
          action: Script
          object_path: 'start = Split(startDate, "/")'
      - step:
          id: '91'
          action: Script
          object_path: month1 = start(1)
      - step:
          id: '92'
          action: Script
          object_path: 'monthName1 = monthName(month1, true)'
      - step:
          id: '93'
          action: Script
          object_path: year1 = start(02)
      - step:
          id: '94'
          action: Script
          object_path: If len(year1) = 2  Then
      - step:
          id: '95'
          action: Script
          object_path: 'year1 = "20"&year1'
      - step:
          id: '96'
          action: Script
          object_path: End If
      - step:
          id: '97'
          action: Script
          object_path: 'startDate = start(0)&"/"&monthName1&"/"&year1'
      - step:
          id: '98'
          action: Script
          object_path: 'dueDate = objExtractionMetroSouthSheet.cells(i,7).value'
      - step:
          id: '99'
          action: Script
          object_path: dueDate = CStr(dueDate)
      - step:
          id: '100'
          action: Script
          object_path: 'finish = Split(dueDate," ")'
      - step:
          id: '101'
          action: Script
          object_path: dueDate = finish(0)
      - step:
          id: '102'
          action: Script
          object_path: 'due = Split(dueDate, "/")'
      - step:
          id: '103'
          action: Script
          object_path: month2 = due(1)
      - step:
          id: '104'
          action: Script
          object_path: 'monthName2 = monthName(month2, true)'
      - step:
          id: '105'
          action: Script
          object_path: dueyear = due(02)
      - step:
          id: '106'
          action: Script
          object_path: If len(dueyear) = 2  Then
      - step:
          id: '107'
          action: Script
          object_path: 'dueyear = "20"&dueyear'
      - step:
          id: '108'
          action: Script
          object_path: End If
      - step:
          id: '109'
          action: Script
          object_path: 'dueDate = due(0)&"/"&monthName2&"/"&dueyear'
      - step:
          id: '110'
          action: Script
          object_path: 'owner = objExtractionMetroSouthSheet.cells(i,8).value'
      - step:
          id: '111'
          action: Script
          object_path: 'percentDone = objExtractionMetroSouthSheet.cells(i,12).value'
      - step:
          id: '112'
          action: Script
          object_path: 'status = objExtractionMetroSouthSheet.cells(i,11).value'
      - step:
          id: '113'
          action: Script
          object_path: 'cancellation = objExtractionMetroSouthSheet.cells(i,18).value'
      - step:
          id: '114'
          action: Script
          object_path: "'ADD EXTRACTION TO COMBINED WORKPLACE SHEET"
      - step:
          id: '115'
          object_path: 'objMetroSouth.cells(x,1)'
          action: value
          args: = manager
      - step:
          id: '116'
          object_path: 'objMetroSouth.cells(x,2)'
          action: value
          args: = workGroup
      - step:
          id: '117'
          object_path: 'objMetroSouth.cells(x,3)'
          action: value
          args: = inspectionType
      - step:
          id: '118'
          object_path: 'objMetroSouth.cells(x,4)'
          action: value
          args: = title
      - step:
          id: '119'
          object_path: 'objMetroSouth.cells(x,5)'
          action: value
          args: = startDate
      - step:
          id: '120'
          object_path: 'objMetroSouth.cells(x,6)'
          action: value
          args: = dueDate
      - step:
          id: '121'
          object_path: 'objMetroSouth.cells(x,7)'
          action: value
          args: = owner
      - step:
          id: '122'
          object_path: 'objMetroSouth.cells(x,8)'
          action: value
          args: = percentDone
      - step:
          id: '123'
          object_path: 'objMetroSouth.cells(x,9)'
          action: value
          args: = status
      - step:
          id: '124'
          action: Script
          object_path: 'If status = "Completed" Then'
      - step:
          id: '125'
          object_path: 'objMetroSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 43
      - step:
          id: '126'
          action: Script
          object_path: 'ElseIf status = "Overdue" Then'
      - step:
          id: '127'
          object_path: 'objMetroSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 46
      - step:
          id: '128'
          action: Script
          object_path: 'ElseIf status = "Scheduled" Then'
      - step:
          id: '129'
          object_path: 'objMetroSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 45
      - step:
          id: '130'
          action: Script
          object_path: 'ElseIf status = "In Progress" Then'
      - step:
          id: '131'
          object_path: 'objMetroSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 44
      - step:
          id: '132'
          action: Script
          object_path: 'ElseIf status = "Cancelled" Then'
      - step:
          id: '133'
          object_path: 'objMetroSouth.cells(x,9).interior'
          action: ColorIndex
          args: = 48
      - step:
          id: '134'
          action: Script
          object_path: End If
      - step:
          id: '135'
          object_path: 'objMetroSouth.cells(x,10)'
          action: value
          args: = cancellation
      - step:
          id: '136'
          action: Script
          object_path: x = x + 1
      - step:
          id: '137'
          action: Script
          object_path: Next
      - step:
          id: '138'
          action: Script
          object_path: "'SET ACTIVE ROW TO 18 FOR METRO NORTH SHEET"
      - step:
          id: '139'
          action: Script
          object_path: x = 2
      - step:
          id: '140'
          action: Script
          object_path: "'EXTRACT ROWS FROM INSPECTIONS NORTH AND ADD TO DEPOT LOCATION"
      - step:
          id: '141'
          action: Script
          object_path: For i = 4 To numberOfInspectionsNorth
      - step:
          id: '142'
          action: Script
          object_path: 'manager = objExtractionMetroNorthSheet.cells(i,17).value'
      - step:
          id: '143'
          action: Script
          object_path: 'workGroup = objExtractionMetroNorthSheet.cells(i,2).value'
      - step:
          id: '144'
          action: Script
          object_path: 'If InStr(workGroup, "OBSOLETE") > 0 Then'
      - step:
          id: '145'
          action: Script
          object_path: 'workGroup = Replace(workGroup, "OBSOLETE ", "")'
      - step:
          id: '146'
          action: Script
          object_path: End If
      - step:
          id: '147'
          action: Script
          object_path: 'inspectionType = objExtractionMetroNorthSheet.cells(i,5).value'
      - step:
          id: '148'
          action: Script
          object_path: 'title = objExtractionMetroNorthSheet.cells(i,4).value'
      - step:
          id: '149'
          action: Script
          object_path: 'startDate = objExtractionMetroNorthSheet.cells(i,6).value'
      - step:
          id: '150'
          action: Script
          object_path: startDate = CStr(startDate)
      - step:
          id: '151'
          action: Script
          object_path: 'start = Split(startDate," ")'
      - step:
          id: '152'
          action: Script
          object_path: startDate = start(0)
      - step:
          id: '153'
          action: Script
          object_path: 'start = Split(startDate, "/")'
      - step:
          id: '154'
          action: Script
          object_path: month1 = start(1)
      - step:
          id: '155'
          action: Script
          object_path: 'monthName1 = monthName(month1, true)'
      - step:
          id: '156'
          action: Script
          object_path: year1 = start(02)
      - step:
          id: '157'
          action: Script
          object_path: If len(year1) = 2  Then
      - step:
          id: '158'
          action: Script
          object_path: 'year1 = "20"&year1'
      - step:
          id: '159'
          action: Script
          object_path: End If
      - step:
          id: '160'
          action: Script
          object_path: 'startDate = start(0)&"/"&monthName1&"/"&year1'
      - step:
          id: '161'
          action: Script
          object_path: 'dueDate = objExtractionMetroNorthSheet.cells(i,7).value'
      - step:
          id: '162'
          action: Script
          object_path: dueDate = CStr(dueDate)
      - step:
          id: '163'
          action: Script
          object_path: 'finish = Split(dueDate," ")'
      - step:
          id: '164'
          action: Script
          object_path: dueDate = finish(0)
      - step:
          id: '165'
          action: Script
          object_path: 'due = Split(dueDate, "/")'
      - step:
          id: '166'
          action: Script
          object_path: month2 = due(1)
      - step:
          id: '167'
          action: Script
          object_path: 'monthName2 = monthName(month2, true)'
      - step:
          id: '168'
          action: Script
          object_path: dueyear = due(02)
      - step:
          id: '169'
          action: Script
          object_path: If len(dueyear) = 2  Then
      - step:
          id: '170'
          action: Script
          object_path: 'dueyear = "20"&dueyear'
      - step:
          id: '171'
          action: Script
          object_path: End If
      - step:
          id: '172'
          action: Script
          object_path: 'dueDate = due(0)&"/"&monthName2&"/"&dueyear'
      - step:
          id: '173'
          action: Script
          object_path: 'owner = objExtractionMetroNorthSheet.cells(i,8).value'
      - step:
          id: '174'
          action: Script
          object_path: 'percentDone = objExtractionMetroNorthSheet.cells(i,12).value'
      - step:
          id: '175'
          action: Script
          object_path: 'status = objExtractionMetroNorthSheet.cells(i,11).value'
      - step:
          id: '176'
          action: Script
          object_path: 'cancellation = objExtractionMetroNorthSheet.cells(i,18).value'
      - step:
          id: '177'
          action: Script
          object_path: "'ADD EXTRACTION TO COMBINED WORKPLACE SHEET"
      - step:
          id: '178'
          object_path: 'objMetroNorth.cells(x,1)'
          action: value
          args: = manager
      - step:
          id: '179'
          object_path: 'objMetroNorth.cells(x,2)'
          action: value
          args: = workGroup
      - step:
          id: '180'
          object_path: 'objMetroNorth.cells(x,3)'
          action: value
          args: = inspectionType
      - step:
          id: '181'
          object_path: 'objMetroNorth.cells(x,4)'
          action: value
          args: = title
      - step:
          id: '182'
          object_path: 'objMetroNorth.cells(x,5)'
          action: value
          args: = startDate
      - step:
          id: '183'
          object_path: 'objMetroNorth.cells(x,6)'
          action: value
          args: = dueDate
      - step:
          id: '184'
          object_path: 'objMetroNorth.cells(x,7)'
          action: value
          args: = owner
      - step:
          id: '185'
          object_path: 'objMetroNorth.cells(x,8)'
          action: value
          args: = percentDone
      - step:
          id: '186'
          object_path: 'objMetroNorth.cells(x,9)'
          action: value
          args: = status
      - step:
          id: '187'
          action: Script
          object_path: 'If status = "Completed" Then'
      - step:
          id: '188'
          object_path: 'objMetroNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 43
      - step:
          id: '189'
          action: Script
          object_path: 'ElseIf status = "Overdue" Then'
      - step:
          id: '190'
          object_path: 'objMetroNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 46
      - step:
          id: '191'
          action: Script
          object_path: 'ElseIf status = "Scheduled" Then'
      - step:
          id: '192'
          object_path: 'objMetroNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 45
      - step:
          id: '193'
          action: Script
          object_path: 'ElseIf status = "In Progress" Then'
      - step:
          id: '194'
          object_path: 'objMetroNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 44
      - step:
          id: '195'
          action: Script
          object_path: 'ElseIf status = "Cancelled" Then'
      - step:
          id: '196'
          object_path: 'objMetroNorth.cells(x,9).interior'
          action: ColorIndex
          args: = 48
      - step:
          id: '197'
          action: Script
          object_path: End If
      - step:
          id: '198'
          object_path: 'objMetroNorth.cells(x,10)'
          action: value
          args: = cancellation
      - step:
          id: '199'
          action: Script
          object_path: x = x + 1
      - step:
          id: '200'
          action: Script
          object_path: Next
      - step:
          id: '201'
          action: Script
          object_path: "'SET ACTIVE ROW TO 18 FOR FIELD SERVICES COMBINED WORKPLACE SHEET"
      - step:
          id: '202'
          action: Script
          object_path: x = 18
      - step:
          id: '203'
          action: Script
          object_path: "'EXTRACT ROWS FROM INSPECTIONS SOUTH AND ADD TO COMBINED WORKPLACE"
      - step:
          id: '204'
          action: Script
          object_path: For i = 4 To numberOfInspectionsSouth
      - step:
          id: '205'
          action: Script
          object_path: 'manager = objExtractionMetroSouthSheet.cells(i,17).value'
      - step:
          id: '206'
          action: Script
          object_path: 'workGroup = objExtractionMetroSouthSheet.cells(i,2).value'
      - step:
          id: '207'
          action: Script
          object_path: 'If InStr(workGroup, "OBSOLETE") > 0 Then'
      - step:
          id: '208'
          action: Script
          object_path: 'workGroup = Replace(workGroup, "OBSOLETE ", "")'
      - step:
          id: '209'
          action: Script
          object_path: End If
      - step:
          id: '210'
          action: Script
          object_path: 'inspectionType = objExtractionMetroSouthSheet.cells(i,5).value'
      - step:
          id: '211'
          action: Script
          object_path: 'title = objExtractionMetroSouthSheet.cells(i,4).value'
      - step:
          id: '212'
          action: Script
          object_path: 'startDate = objExtractionMetroSouthSheet.cells(i,6).value'
      - step:
          id: '213'
          action: Script
          object_path: startDate = CStr(startDate)
      - step:
          id: '214'
          action: Script
          object_path: 'start = Split(startDate," ")'
      - step:
          id: '215'
          action: Script
          object_path: startDate = start(0)
      - step:
          id: '216'
          action: Script
          object_path: 'start = Split(startDate, "/")'
      - step:
          id: '217'
          action: Script
          object_path: month1 = start(1)
      - step:
          id: '218'
          action: Script
          object_path: 'monthName1 = monthName(month1, true)'
      - step:
          id: '219'
          action: Script
          object_path: year1 = start(02)
      - step:
          id: '220'
          action: Script
          object_path: If len(year1) = 2  Then
      - step:
          id: '221'
          action: Script
          object_path: 'year1 = "20"&year1'
      - step:
          id: '222'
          action: Script
          object_path: End If
      - step:
          id: '223'
          action: Script
          object_path: 'startDate = start(0)&"/"&monthName1&"/"&year1'
      - step:
          id: '224'
          action: Script
          object_path: 'dueDate = objExtractionMetroSouthSheet.cells(i,7).value'
      - step:
          id: '225'
          action: Script
          object_path: dueDate = CStr(dueDate)
      - step:
          id: '226'
          action: Script
          object_path: 'finish = Split(dueDate," ")'
      - step:
          id: '227'
          action: Script
          object_path: dueDate = finish(0)
      - step:
          id: '228'
          action: Script
          object_path: 'due = Split(dueDate, "/")'
      - step:
          id: '229'
          action: Script
          object_path: month2 = due(1)
      - step:
          id: '230'
          action: Script
          object_path: 'monthName2 = monthName(month2, true)'
      - step:
          id: '231'
          action: Script
          object_path: dueyear = due(02)
      - step:
          id: '232'
          action: Script
          object_path: If len(dueyear) = 2  Then
      - step:
          id: '233'
          action: Script
          object_path: 'dueyear = "20"&dueyear'
      - step:
          id: '234'
          action: Script
          object_path: End If
      - step:
          id: '235'
          action: Script
          object_path: 'dueDate = due(0)&"/"&monthName2&"/"&dueyear'
      - step:
          id: '236'
          action: Script
          object_path: 'owner = objExtractionMetroSouthSheet.cells(i,8).value'
      - step:
          id: '237'
          action: Script
          object_path: 'percentDone = objExtractionMetroSouthSheet.cells(i,12).value'
      - step:
          id: '238'
          action: Script
          object_path: 'status = objExtractionMetroSouthSheet.cells(i,11).value'
      - step:
          id: '239'
          action: Script
          object_path: 'cancellation = objExtractionMetroSouthSheet.cells(i,18).value'
      - step:
          id: '240'
          action: Script
          object_path: "'ADD EXTRACTION TO COMBINED WORKPLACE SHEET"
      - step:
          id: '241'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,1)'
          action: value
          args: = manager
      - step:
          id: '242'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,2)'
          action: value
          args: = workGroup
      - step:
          id: '243'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,3)'
          action: value
          args: = inspectionType
      - step:
          id: '244'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,4)'
          action: value
          args: = title
      - step:
          id: '245'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,5)'
          action: value
          args: = startDate
      - step:
          id: '246'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,6)'
          action: value
          args: = dueDate
      - step:
          id: '247'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,7)'
          action: value
          args: = owner
      - step:
          id: '248'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,8)'
          action: value
          args: = percentDone
      - step:
          id: '249'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9)'
          action: value
          args: = status
      - step:
          id: '250'
          action: Script
          object_path: 'If status = "Completed" Then'
      - step:
          id: '251'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 43
      - step:
          id: '252'
          action: Script
          object_path: 'ElseIf status = "Overdue" Then'
      - step:
          id: '253'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 46
      - step:
          id: '254'
          action: Script
          object_path: 'ElseIf status = "Scheduled" Then'
      - step:
          id: '255'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 45
      - step:
          id: '256'
          action: Script
          object_path: 'ElseIf status = "In Progress" Then'
      - step:
          id: '257'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 44
      - step:
          id: '258'
          action: Script
          object_path: 'ElseIf status = "Cancelled" Then'
      - step:
          id: '259'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 48
      - step:
          id: '260'
          action: Script
          object_path: End If
      - step:
          id: '261'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,10)'
          action: value
          args: = cancellation
      - step:
          id: '262'
          action: Script
          object_path: x = x + 1
      - step:
          id: '263'
          action: Script
          object_path: Next
      - step:
          id: '264'
          action: Script
          object_path: "'EXTRACT ROWS FROM INSPECTIONS NORTH AND ADD TO COMBINED WORKPLACE"
      - step:
          id: '265'
          action: Script
          object_path: For i = 4 To numberOfInspectionsNorth
      - step:
          id: '266'
          action: Script
          object_path: 'manager = objExtractionMetroNorthSheet.cells(i,17).value'
      - step:
          id: '267'
          action: Script
          object_path: 'workGroup = objExtractionMetroNorthSheet.cells(i,2).value'
      - step:
          id: '268'
          action: Script
          object_path: 'If InStr(workGroup, "OBSOLETE") > 0 Then'
      - step:
          id: '269'
          action: Script
          object_path: 'workGroup = Replace(workGroup, "OBSOLETE ", "")'
      - step:
          id: '270'
          action: Script
          object_path: End If
      - step:
          id: '271'
          action: Script
          object_path: 'inspectionType = objExtractionMetroNorthSheet.cells(i,5).value'
      - step:
          id: '272'
          action: Script
          object_path: 'title = objExtractionMetroNorthSheet.cells(i,4).value'
      - step:
          id: '273'
          action: Script
          object_path: 'startDate = objExtractionMetroNorthSheet.cells(i,6).value'
      - step:
          id: '274'
          action: Script
          object_path: startDate = CStr(startDate)
      - step:
          id: '275'
          action: Script
          object_path: 'start = Split(startDate," ")'
      - step:
          id: '276'
          action: Script
          object_path: startDate = start(0)
      - step:
          id: '277'
          action: Script
          object_path: 'start = Split(startDate, "/")'
      - step:
          id: '278'
          action: Script
          object_path: month1 = start(1)
      - step:
          id: '279'
          action: Script
          object_path: 'monthName1 = monthName(month1, true)'
      - step:
          id: '280'
          action: Script
          object_path: year1 = start(02)
      - step:
          id: '281'
          action: Script
          object_path: If len(year1) = 2  Then
      - step:
          id: '282'
          action: Script
          object_path: 'year1 = "20"&year1'
      - step:
          id: '283'
          action: Script
          object_path: End If
      - step:
          id: '284'
          action: Script
          object_path: 'startDate = start(0)&"/"&monthName1&"/"&year1'
      - step:
          id: '285'
          action: Script
          object_path: 'dueDate = objExtractionMetroNorthSheet.cells(i,7).value'
      - step:
          id: '286'
          action: Script
          object_path: dueDate = CStr(dueDate)
      - step:
          id: '287'
          action: Script
          object_path: 'finish = Split(dueDate," ")'
      - step:
          id: '288'
          action: Script
          object_path: dueDate = finish(0)
      - step:
          id: '289'
          action: Script
          object_path: 'due = Split(dueDate, "/")'
      - step:
          id: '290'
          action: Script
          object_path: month2 = due(1)
      - step:
          id: '291'
          action: Script
          object_path: 'monthName2 = monthName(month2, true)'
      - step:
          id: '292'
          action: Script
          object_path: dueyear = due(02)
      - step:
          id: '293'
          action: Script
          object_path: If len(dueyear) = 2  Then
      - step:
          id: '294'
          action: Script
          object_path: 'dueyear = "20"&dueyear'
      - step:
          id: '295'
          action: Script
          object_path: End If
      - step:
          id: '296'
          action: Script
          object_path: 'dueDate = due(0)&"/"&monthName2&"/"&dueyear'
      - step:
          id: '297'
          action: Script
          object_path: 'owner = objExtractionMetroNorthSheet.cells(i,8).value'
      - step:
          id: '298'
          action: Script
          object_path: 'percentDone = objExtractionMetroNorthSheet.cells(i,12).value'
      - step:
          id: '299'
          action: Script
          object_path: 'status = objExtractionMetroNorthSheet.cells(i,11).value'
      - step:
          id: '300'
          action: Script
          object_path: 'cancellation = objExtractionMetroNorthSheet.cells(i,18).value'
      - step:
          id: '301'
          action: Script
          object_path: "'ADD EXTRACTION TO COMBINED WORKPLACE SHEET"
      - step:
          id: '302'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,1)'
          action: value
          args: = manager
      - step:
          id: '303'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,2)'
          action: value
          args: = workGroup
      - step:
          id: '304'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,3)'
          action: value
          args: = inspectionType
      - step:
          id: '305'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,4)'
          action: value
          args: = title
      - step:
          id: '306'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,5)'
          action: value
          args: = startDate
      - step:
          id: '307'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,6)'
          action: value
          args: = dueDate
      - step:
          id: '308'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,7)'
          action: value
          args: = owner
      - step:
          id: '309'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,8)'
          action: value
          args: = percentDone
      - step:
          id: '310'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9)'
          action: value
          args: = status
      - step:
          id: '311'
          action: Script
          object_path: 'If status = "Completed" Then'
      - step:
          id: '312'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 43
      - step:
          id: '313'
          action: Script
          object_path: 'ElseIf status = "Overdue" Then'
      - step:
          id: '314'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 46
      - step:
          id: '315'
          action: Script
          object_path: 'ElseIf status = "Scheduled" Then'
      - step:
          id: '316'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 45
      - step:
          id: '317'
          action: Script
          object_path: 'ElseIf status = "In Progress" Then'
      - step:
          id: '318'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 44
      - step:
          id: '319'
          action: Script
          object_path: 'ElseIf status = "Cancelled" Then'
      - step:
          id: '320'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,9).interior'
          action: ColorIndex
          args: = 48
      - step:
          id: '321'
          action: Script
          object_path: End If
      - step:
          id: '322'
          object_path: 'objFieldServicesCombinedWorkpla.cells(x,10)'
          action: value
          args: = cancellation
      - step:
          id: '323'
          action: Script
          object_path: x = x + 1
      - step:
          id: '324'
          action: Script
          object_path: Next
      - step:
          id: '325'
          action: Script
          object_path: "''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''"
      - step:
          id: '326'
          action: Script
          object_path: "'REFRESH WORKBOOK TO UPDATE PIVOT TABLE"
      - step:
          id: '327'
          object_path: objMetro
          action: RefreshAll
      - step:
          id: '328'
          action: Script
          object_path: "'RENAME FILE"
      - step:
          id: '329'
          action: Script
          object_path: currentDate = Date()
      - step:
          id: '330'
          action: Script
          object_path: currentDate = CStr(currentDate)
      - step:
          id: '331'
          action: Script
          object_path: 'currentDate = Split(currentDate,"/")'
      - step:
          id: '332'
          action: Script
          object_path: 'newDate = currentDate(2)&"-"&currentDate(1)&"-"&currentDate(0)'
      - step:
          id: '333'
          action: Script
          object_path: 'Parameter("new_metro") = newDate&" Metro Field Services Combined Field Observations Report.xlsx"'
      - step:
          id: '334'
          object_path: objMetro
          action: "SaveAs(\"C:\\Users\\svcrpabot\\OneDrive"
          args: "- SA Power Networks\\Enablon Reports\\\"&newDate&\" Metro Field Services Combined Field Observations Report.xlsx\")"
      - step:
          id: '335'
          action: Script
          object_path: "'SAVE AND CLOSE METRO INSPECTIONS REPORT"
      - step:
          id: '336'
          object_path: objExtractionMetroSouth
          action: save
      - step:
          id: '337'
          object_path: objExtractionMetroSouth
          action: close
      - step:
          id: '338'
          object_path: objExtractionMetroNorth
          action: save
      - step:
          id: '339'
          object_path: objExtractionMetroNorth
          action: close
      - step:
          id: '340'
          object_path: objMetro
          action: save
      - step:
          id: '341'
          object_path: objMetro
          action: close
      - step:
          id: '342'
          object_path: objExcel
          action: Quit
      - step:
          id: '343'
          action: Script
          object_path: "'RELEASE OBJECTS"
      - step:
          id: '344'
          action: Script
          object_path: Set objExcel = Nothing
      - step:
          id: '345'
          action: Script
          object_path: Set objExtractionMetroSouth = Nothing
      - step:
          id: '346'
          action: Script
          object_path: Set objExtractionMetroSouthSheet = Nothing
      - step:
          id: '347'
          action: Script
          object_path: Set objExtractionMetroNorth = Nothing
      - step:
          id: '348'
          action: Script
          object_path: Set objExtractionMetroNorthSheet = Nothing
      - step:
          id: '349'
          action: Script
          object_path: Set objMetro = Nothing
      - step:
          id: '350'
          action: Script
          object_path: Set objFieldServicesCombinedWorkpla = Nothing
      - step:
          id: '351'
          action: Script
          object_path: Set objMetroSouth = Nothing
      - step:
          id: '352'
          action: Script
          object_path: Set objMetroNorth = Nothing
  outputs:
    - new_metro:
        robot: true
        value: '${new_metro}'
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
