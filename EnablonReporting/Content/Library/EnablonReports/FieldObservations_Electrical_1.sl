namespace: EnablonReports
operation:
  name: FieldObservations_Electrical_1
  inputs:
  - attachment_electrical
  sequential_action:
    gav: com.microfocus.seq:EnablonReports.FieldObservations_Electrical_1:1.0.0
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
        object_path: '''ELECTRICAL FIELD OBSERVATIONS ENABLON UPDATES'
    - step:
        id: '2'
        action: Script
        object_path: '''CREATE EXCEL OBJECT'
    - step:
        id: '3'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '4'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '5'
        action: Script
        object_path: '''OPEN EXTRACTED METRO ELECTRICAL REPORT'
    - step:
        id: '6'
        action: Script
        object_path: Set objExtractionMetroElectrical = objExcel.Workbooks.open("C:\Users\svcrpabot\OneDrive
          - SA Power Networks\Enablon Reports\"&Parameter("attachment_electrical"))
    - step:
        id: '7'
        action: Script
        object_path: '''OPEN EXTRACTED METRO ELECTRICAL SHEET'
    - step:
        id: '8'
        action: Script
        object_path: Set objExtractionMetroElectricalSheet = objExtractionMetroElectrical.Worksheets("Electrical
          Services Field Obser")
    - step:
        id: '9'
        action: Script
        object_path: '''OPEN METRO INSPECTIONS REPORT'
    - step:
        id: '10'
        action: Script
        object_path: Set objMetro = objExcel.Workbooks.open("C:\Users\svcrpabot\OneDrive
          - SA Power Networks\Enablon Reports\Electrical Field Services Combined Field
          Observations Report.xlsx")
    - step:
        id: '11'
        action: Script
        object_path: '''OPEN FIELD SERVICES COMBINED WORKPLACE SHEET'
    - step:
        id: '12'
        action: Script
        object_path: Set objFieldServicesCombinedWorkpla = objMetro.Worksheets("Field
          Services Combined Workpla")
    - step:
        id: '13'
        action: Script
        object_path: '''OPEN METRO ELECTRICAL SHEET'
    - step:
        id: '14'
        action: Script
        object_path: Set objMetroElectrical = objMetro.Worksheets("Metro Electrical")
    - step:
        id: '15'
        action: Script
        object_path: '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''CLEAR
          TABLES'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '16'
        action: Script
        object_path: '''GET ROW COUNT OF INSPECTIONS ELECTRICAL'
    - step:
        id: '17'
        action: Script
        object_path: numberOfInspectionsElectrical = objExtractionMetroElectricalSheet.usedrange.Rows.Count
    - step:
        id: '18'
        action: Script
        object_path: '''GET ROW COUNT OF FIELD SERVICES COMBINED WORKPLACE SHEET'
    - step:
        id: '19'
        action: Script
        object_path: numberOfCombinedWorkplace = objFieldServicesCombinedWorkpla.usedrange.Rows.Count
    - step:
        id: '20'
        action: Script
        object_path: '''GET ROW COUNT OF METRO ELECTRICAL SHEET'
    - step:
        id: '21'
        action: Script
        object_path: numberOfMetroElectrical = objMetroElectrical.usedrange.Rows.Count
    - step:
        id: '22'
        action: Script
        object_path: '''CLEAR CURRENT FIELD SERVICES COMBINBED WORKPLACE SHEET'
    - step:
        id: '23'
        action: Script
        object_path: For o = 18 To numberOfCombinedWorkplace
    - step:
        id: '24'
        object_path: objFieldServicesCombinedWorkpla.cells(o,1)
        action: clearcontents
    - step:
        id: '25'
        object_path: objFieldServicesCombinedWorkpla.cells(o,2)
        action: clearcontents
    - step:
        id: '26'
        object_path: objFieldServicesCombinedWorkpla.cells(o,3)
        action: clearcontents
    - step:
        id: '27'
        object_path: objFieldServicesCombinedWorkpla.cells(o,4)
        action: clearcontents
    - step:
        id: '28'
        object_path: objFieldServicesCombinedWorkpla.cells(o,5)
        action: clearcontents
    - step:
        id: '29'
        object_path: objFieldServicesCombinedWorkpla.cells(o,6)
        action: clearcontents
    - step:
        id: '30'
        object_path: objFieldServicesCombinedWorkpla.cells(o,7)
        action: clearcontents
    - step:
        id: '31'
        object_path: objFieldServicesCombinedWorkpla.cells(o,8)
        action: clearcontents
    - step:
        id: '32'
        object_path: objFieldServicesCombinedWorkpla.cells(o,9)
        action: clearcontents
    - step:
        id: '33'
        object_path: objFieldServicesCombinedWorkpla.cells(o,9).interior
        action: ColorIndex
        args: = xlNone
    - step:
        id: '34'
        object_path: objFieldServicesCombinedWorkpla.cells(o,10)
        action: clearcontents
    - step:
        id: '35'
        action: Script
        object_path: Next
    - step:
        id: '36'
        action: Script
        object_path: '''CLEAR CURRENT METRO ELECTRICAL SHEET'
    - step:
        id: '37'
        action: Script
        object_path: For o = 2 To numberOfMetroElectrical
    - step:
        id: '38'
        object_path: objMetroElectrical.cells(o,1)
        action: clearcontents
    - step:
        id: '39'
        object_path: objMetroElectrical.cells(o,2)
        action: clearcontents
    - step:
        id: '40'
        object_path: objMetroElectrical.cells(o,3)
        action: clearcontents
    - step:
        id: '41'
        object_path: objMetroElectrical.cells(o,4)
        action: clearcontents
    - step:
        id: '42'
        object_path: objMetroElectrical.cells(o,5)
        action: clearcontents
    - step:
        id: '43'
        object_path: objMetroElectrical.cells(o,6)
        action: clearcontents
    - step:
        id: '44'
        object_path: objMetroElectrical.cells(o,7)
        action: clearcontents
    - step:
        id: '45'
        object_path: objMetroElectrical.cells(o,8)
        action: clearcontents
    - step:
        id: '46'
        object_path: objMetroElectrical.cells(o,9)
        action: clearcontents
    - step:
        id: '47'
        object_path: objMetroElectrical.cells(o,9).interior
        action: ColorIndex
        args: = xlNone
    - step:
        id: '48'
        object_path: objMetroElectrical.cells(o,10)
        action: clearcontents
    - step:
        id: '49'
        action: Script
        object_path: Next
    - step:
        id: '50'
        action: Script
        object_path: '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''EXTRACT
          DATA'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '51'
        action: Script
        object_path: '''SET ACTIVE ROW TO 18 FOR METRO ELECTRICAL SHEET'
    - step:
        id: '52'
        action: Script
        object_path: x = 2
    - step:
        id: '53'
        action: Script
        object_path: '''EXTRACT ROWS FROM INSPECTIONS ELECTRICAL AND ADD TO DEPOT
          LOCATION'
    - step:
        id: '54'
        action: Script
        object_path: For i = 4 To numberOfInspectionsElectrical
    - step:
        id: '55'
        action: Script
        object_path: manager = objExtractionMetroElectricalSheet.cells(i,17).value
    - step:
        id: '56'
        action: Script
        object_path: workGroup = objExtractionMetroElectricalSheet.cells(i,2).value
    - step:
        id: '57'
        action: Script
        object_path: If InStr(workGroup, "OBSOLETE") > 0 Then
    - step:
        id: '58'
        action: Script
        object_path: workGroup = Replace(workGroup, "OBSOLETE ", "")
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: inspectionType = objExtractionMetroElectricalSheet.cells(i,5).value
    - step:
        id: '61'
        action: Script
        object_path: title = objExtractionMetroElectricalSheet.cells(i,4).value
    - step:
        id: '62'
        action: Script
        object_path: startDate = objExtractionMetroElectricalSheet.cells(i,6).value
    - step:
        id: '63'
        action: Script
        object_path: startDate = CStr(startDate)
    - step:
        id: '64'
        action: Script
        object_path: start = Split(startDate," ")
    - step:
        id: '65'
        action: Script
        object_path: startDate = start(0)
    - step:
        id: '66'
        action: Script
        object_path: start = Split(startDate, "/")
    - step:
        id: '67'
        action: Script
        object_path: month1 = start(1)
    - step:
        id: '68'
        action: Script
        object_path: monthName1 = monthName(month1, true)
    - step:
        id: '69'
        action: Script
        object_path: year1 = start(02)
    - step:
        id: '70'
        action: Script
        object_path: If len(year1) = 2  Then
    - step:
        id: '71'
        action: Script
        object_path: year1 = "20"&year1
    - step:
        id: '72'
        action: Script
        object_path: End If
    - step:
        id: '73'
        action: Script
        object_path: startDate = start(0)&"/"&monthName1&"/"&year1
    - step:
        id: '74'
        action: Script
        object_path: dueDate = objExtractionMetroElectricalSheet.cells(i,7).value
    - step:
        id: '75'
        action: Script
        object_path: dueDate = CStr(dueDate)
    - step:
        id: '76'
        action: Script
        object_path: finish = Split(dueDate," ")
    - step:
        id: '77'
        action: Script
        object_path: dueDate = finish(0)
    - step:
        id: '78'
        action: Script
        object_path: due = Split(dueDate, "/")
    - step:
        id: '79'
        action: Script
        object_path: month2 = due(1)
    - step:
        id: '80'
        action: Script
        object_path: monthName2 = monthName(month2, true)
    - step:
        id: '81'
        action: Script
        object_path: dueyear = due(02)
    - step:
        id: '82'
        action: Script
        object_path: If len(dueyear) = 2  Then
    - step:
        id: '83'
        action: Script
        object_path: dueyear = "20"&dueyear
    - step:
        id: '84'
        action: Script
        object_path: End If
    - step:
        id: '85'
        action: Script
        object_path: dueDate = due(0)&"/"&monthName2&"/"&dueyear
    - step:
        id: '86'
        action: Script
        object_path: owner = objExtractionMetroElectricalSheet.cells(i,8).value
    - step:
        id: '87'
        action: Script
        object_path: percentDone = objExtractionMetroElectricalSheet.cells(i,12).value
    - step:
        id: '88'
        action: Script
        object_path: status = objExtractionMetroElectricalSheet.cells(i,11).value
    - step:
        id: '89'
        action: Script
        object_path: cancellation = objExtractionMetroElectricalSheet.cells(i,18).value
    - step:
        id: '90'
        action: Script
        object_path: '''ADD EXTRACTION TO COMBINED WORKPLACE SHEET'
    - step:
        id: '91'
        object_path: objMetroElectrical.cells(x,1)
        action: value
        args: = manager
    - step:
        id: '92'
        object_path: objMetroElectrical.cells(x,2)
        action: value
        args: = workGroup
    - step:
        id: '93'
        object_path: objMetroElectrical.cells(x,3)
        action: value
        args: = inspectionType
    - step:
        id: '94'
        object_path: objMetroElectrical.cells(x,4)
        action: value
        args: = title
    - step:
        id: '95'
        object_path: objMetroElectrical.cells(x,5)
        action: value
        args: = startDate
    - step:
        id: '96'
        object_path: objMetroElectrical.cells(x,6)
        action: value
        args: = dueDate
    - step:
        id: '97'
        object_path: objMetroElectrical.cells(x,7)
        action: value
        args: = owner
    - step:
        id: '98'
        object_path: objMetroElectrical.cells(x,8)
        action: value
        args: = percentDone
    - step:
        id: '99'
        object_path: objMetroElectrical.cells(x,9)
        action: value
        args: = status
    - step:
        id: '100'
        action: Script
        object_path: If status = "Completed" Then
    - step:
        id: '101'
        object_path: objMetroElectrical.cells(x,9).interior
        action: ColorIndex
        args: = 43
    - step:
        id: '102'
        action: Script
        object_path: ElseIf status = "Overdue" Then
    - step:
        id: '103'
        object_path: objMetroElectrical.cells(x,9).interior
        action: ColorIndex
        args: = 46
    - step:
        id: '104'
        action: Script
        object_path: ElseIf status = "Scheduled" Then
    - step:
        id: '105'
        object_path: objMetroElectrical.cells(x,9).interior
        action: ColorIndex
        args: = 45
    - step:
        id: '106'
        action: Script
        object_path: ElseIf status = "In Progress" Then
    - step:
        id: '107'
        object_path: objMetroElectrical.cells(x,9).interior
        action: ColorIndex
        args: = 44
    - step:
        id: '108'
        action: Script
        object_path: ElseIf status = "Cancelled" Then
    - step:
        id: '109'
        object_path: objMetroElectrical.cells(x,9).interior
        action: ColorIndex
        args: = 48
    - step:
        id: '110'
        action: Script
        object_path: End If
    - step:
        id: '111'
        object_path: objMetroElectrical.cells(x,10)
        action: value
        args: = cancellation
    - step:
        id: '112'
        action: Script
        object_path: x = x + 1
    - step:
        id: '113'
        action: Script
        object_path: Next
    - step:
        id: '114'
        action: Script
        object_path: x = 18
    - step:
        id: '115'
        action: Script
        object_path: '''EXTRACT ROWS FROM INSPECTIONS ELECTRICAL AND ADD TO COMBINED
          WORKPLACE'
    - step:
        id: '116'
        action: Script
        object_path: For i = 4 To numberOfInspectionsElectrical
    - step:
        id: '117'
        action: Script
        object_path: manager = objExtractionMetroElectricalSheet.cells(i,17).value
    - step:
        id: '118'
        action: Script
        object_path: workGroup = objExtractionMetroElectricalSheet.cells(i,2).value
    - step:
        id: '119'
        action: Script
        object_path: If InStr(workGroup, "OBSOLETE") > 0 Then
    - step:
        id: '120'
        action: Script
        object_path: workGroup = Replace(workGroup, "OBSOLETE ", "")
    - step:
        id: '121'
        action: Script
        object_path: End If
    - step:
        id: '122'
        action: Script
        object_path: inspectionType = objExtractionMetroElectricalSheet.cells(i,5).value
    - step:
        id: '123'
        action: Script
        object_path: title = objExtractionMetroElectricalSheet.cells(i,4).value
    - step:
        id: '124'
        action: Script
        object_path: startDate = objExtractionMetroElectricalSheet.cells(i,6).value
    - step:
        id: '125'
        action: Script
        object_path: startDate = CStr(startDate)
    - step:
        id: '126'
        action: Script
        object_path: start = Split(startDate," ")
    - step:
        id: '127'
        action: Script
        object_path: startDate = start(0)
    - step:
        id: '128'
        action: Script
        object_path: start = Split(startDate, "/")
    - step:
        id: '129'
        action: Script
        object_path: month1 = start(1)
    - step:
        id: '130'
        action: Script
        object_path: monthName1 = monthName(month1, true)
    - step:
        id: '131'
        action: Script
        object_path: year1 = start(02)
    - step:
        id: '132'
        action: Script
        object_path: If len(year1) = 2  Then
    - step:
        id: '133'
        action: Script
        object_path: year1 = "20"&year1
    - step:
        id: '134'
        action: Script
        object_path: End If
    - step:
        id: '135'
        action: Script
        object_path: startDate = start(0)&"/"&monthName1&"/"&year1
    - step:
        id: '136'
        action: Script
        object_path: dueDate = objExtractionMetroElectricalSheet.cells(i,7).value
    - step:
        id: '137'
        action: Script
        object_path: dueDate = CStr(dueDate)
    - step:
        id: '138'
        action: Script
        object_path: finish = Split(dueDate," ")
    - step:
        id: '139'
        action: Script
        object_path: dueDate = finish(0)
    - step:
        id: '140'
        action: Script
        object_path: due = Split(dueDate, "/")
    - step:
        id: '141'
        action: Script
        object_path: month2 = due(1)
    - step:
        id: '142'
        action: Script
        object_path: monthName2 = monthName(month2, true)
    - step:
        id: '143'
        action: Script
        object_path: dueyear = due(02)
    - step:
        id: '144'
        action: Script
        object_path: If len(dueyear) = 2  Then
    - step:
        id: '145'
        action: Script
        object_path: dueyear = "20"&dueyear
    - step:
        id: '146'
        action: Script
        object_path: End If
    - step:
        id: '147'
        action: Script
        object_path: dueDate = due(0)&"/"&monthName2&"/"&dueyear
    - step:
        id: '148'
        action: Script
        object_path: owner = objExtractionMetroElectricalSheet.cells(i,8).value
    - step:
        id: '149'
        action: Script
        object_path: percentDone = objExtractionMetroElectricalSheet.cells(i,12).value
    - step:
        id: '150'
        action: Script
        object_path: status = objExtractionMetroElectricalSheet.cells(i,11).value
    - step:
        id: '151'
        action: Script
        object_path: cancellation = objExtractionMetroElectricalSheet.cells(i,18).value
    - step:
        id: '152'
        action: Script
        object_path: '''ADD EXTRACTION TO COMBINED WORKPLACE SHEET'
    - step:
        id: '153'
        object_path: objFieldServicesCombinedWorkpla.cells(x,1)
        action: value
        args: = manager
    - step:
        id: '154'
        object_path: objFieldServicesCombinedWorkpla.cells(x,2)
        action: value
        args: = workGroup
    - step:
        id: '155'
        object_path: objFieldServicesCombinedWorkpla.cells(x,3)
        action: value
        args: = inspectionType
    - step:
        id: '156'
        object_path: objFieldServicesCombinedWorkpla.cells(x,4)
        action: value
        args: = title
    - step:
        id: '157'
        object_path: objFieldServicesCombinedWorkpla.cells(x,5)
        action: value
        args: = startDate
    - step:
        id: '158'
        object_path: objFieldServicesCombinedWorkpla.cells(x,6)
        action: value
        args: = dueDate
    - step:
        id: '159'
        object_path: objFieldServicesCombinedWorkpla.cells(x,7)
        action: value
        args: = owner
    - step:
        id: '160'
        object_path: objFieldServicesCombinedWorkpla.cells(x,8)
        action: value
        args: = percentDone
    - step:
        id: '161'
        object_path: objFieldServicesCombinedWorkpla.cells(x,9)
        action: value
        args: = status
    - step:
        id: '162'
        action: Script
        object_path: If status = "Completed" Then
    - step:
        id: '163'
        object_path: objFieldServicesCombinedWorkpla.cells(x,9).interior
        action: ColorIndex
        args: = 43
    - step:
        id: '164'
        action: Script
        object_path: ElseIf status = "Overdue" Then
    - step:
        id: '165'
        object_path: objFieldServicesCombinedWorkpla.cells(x,9).interior
        action: ColorIndex
        args: = 46
    - step:
        id: '166'
        action: Script
        object_path: ElseIf status = "Scheduled" Then
    - step:
        id: '167'
        object_path: objFieldServicesCombinedWorkpla.cells(x,9).interior
        action: ColorIndex
        args: = 45
    - step:
        id: '168'
        action: Script
        object_path: ElseIf status = "In Progress" Then
    - step:
        id: '169'
        object_path: objFieldServicesCombinedWorkpla.cells(x,9).interior
        action: ColorIndex
        args: = 44
    - step:
        id: '170'
        action: Script
        object_path: ElseIf status = "Cancelled" Then
    - step:
        id: '171'
        object_path: objFieldServicesCombinedWorkpla.cells(x,9).interior
        action: ColorIndex
        args: = 48
    - step:
        id: '172'
        action: Script
        object_path: End If
    - step:
        id: '173'
        object_path: objFieldServicesCombinedWorkpla.cells(x,10)
        action: value
        args: = cancellation
    - step:
        id: '174'
        action: Script
        object_path: x = x + 1
    - step:
        id: '175'
        action: Script
        object_path: Next
    - step:
        id: '176'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '177'
        action: Script
        object_path: '''REFRESH WORKBOOK TO UPDATE PIVOT TABLE'
    - step:
        id: '178'
        object_path: objMetro
        action: RefreshAll
    - step:
        id: '179'
        action: Script
        object_path: '''RENAME FILE'
    - step:
        id: '180'
        action: Script
        object_path: currentDate = Date()
    - step:
        id: '181'
        action: Script
        object_path: currentDate = CStr(currentDate)
    - step:
        id: '182'
        action: Script
        object_path: currentDate = Split(currentDate,"/")
    - step:
        id: '183'
        action: Script
        object_path: newDate = currentDate(2)&"-"&currentDate(1)&"-"&currentDate(0)
    - step:
        id: '184'
        action: Script
        object_path: Parameter("new_electrical") = newDate&" Electrical Field Services
          Combined Field Observations Report.xlsx"
    - step:
        id: '185'
        object_path: objMetro
        action: SaveAs("C:\Users\svcrpabot\OneDrive
        args: '- SA Power Networks\Enablon Reports\"&newDate&" Electrical Field Services
          Combined Field Observations Report.xlsx")'
    - step:
        id: '186'
        action: Script
        object_path: '''SAVE AND CLOSE METRO INSPECTIONS REPORT'
    - step:
        id: '187'
        object_path: objExtractionMetroElectrical
        action: save
    - step:
        id: '188'
        object_path: objExtractionMetroElectrical
        action: close
    - step:
        id: '189'
        object_path: objMetro
        action: save
    - step:
        id: '190'
        object_path: objMetro
        action: close
    - step:
        id: '191'
        object_path: objExcel
        action: Quit
    - step:
        id: '192'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '193'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '194'
        action: Script
        object_path: Set objExtractionMetroElectrical = Nothing
    - step:
        id: '195'
        action: Script
        object_path: Set objExtractionMetroElectricalSheet = Nothing
    - step:
        id: '196'
        action: Script
        object_path: Set objMetro = Nothing
    - step:
        id: '197'
        action: Script
        object_path: Set objFieldServicesCombinedWorkpla = Nothing
    - step:
        id: '198'
        action: Script
        object_path: Set objMetroElectrical = Nothing
  outputs:
  - new_electrical:
      robot: true
      value: ${new_electrical}
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
