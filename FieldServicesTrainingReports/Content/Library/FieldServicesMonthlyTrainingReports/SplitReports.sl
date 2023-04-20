namespace: FieldServicesMonthlyTrainingReports
operation:
  name: SplitReports
  inputs:
  - reportName
  - orgUnit
  - firstFilter:
      required: false
  - secondFilter:
      required: false
  - thirdFilter:
      required: false
  - secondFilterComparer:
      required: false
  - firstFilterComparer:
      required: false
  - report
  - ssCertlocation
  - ssCurrlocation
  - fsCertlocation
  - fsCurrlocation
  sequential_action:
    gav: com.microfocus.seq:FieldServicesMonthlyTrainingReports.SplitReports:1.0.0
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
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '2'
        action: Script
        object_path: '''SET VARIABLES'
    - step:
        id: '3'
        action: Script
        object_path: filename = Parameter("reportName")
    - step:
        id: '4'
        action: Script
        object_path: orgunit = Parameter("orgUnit")
    - step:
        id: '5'
        action: Script
        object_path: firstfilter = Parameter("firstFilter")
    - step:
        id: '6'
        action: Script
        object_path: secondfilter = Parameter("secondFilter")
    - step:
        id: '7'
        action: Script
        object_path: thirdfilter = Parameter("thirdFilter")
    - step:
        id: '8'
        action: Script
        object_path: secondfiltercomparison = Parameter("secondFilterComparer")
    - step:
        id: '9'
        action: Script
        object_path: firstfiltercomparison = Parameter("firstFilterComparer")
    - step:
        id: '10'
        action: Script
        object_path: report = Parameter("report")
    - step:
        id: '11'
        action: Script
        object_path: ssCertlocation = Parameter("ssCertlocation")
    - step:
        id: '12'
        action: Script
        object_path: ssCurrlocation = Parameter("ssCurrlocation")
    - step:
        id: '13'
        action: Script
        object_path: fsCertlocation = Parameter("fsCertlocation")
    - step:
        id: '14'
        action: Script
        object_path: fsCurrlocation = Parameter("fsCurrlocation")
    - step:
        id: '15'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '16'
        action: Script
        object_path: '''OPEN MY LEARNING EXCELS'
    - step:
        id: '17'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '18'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '19'
        action: Script
        object_path: '''OPEN FLEET & PROPERTY AND SHARED SERVICES REPORT'
    - step:
        id: '20'
        action: Script
        object_path: If InStr(report, "out") > 0 Then
    - step:
        id: '21'
        action: Script
        object_path: '''OPEN SS COMPLIANCE CERTIFICATION'
    - step:
        id: '22'
        action: Script
        object_path: Set ssCertWorkbook = objExcel.Workbooks.open(ssCertlocation)
    - step:
        id: '23'
        action: Script
        object_path: Set ssCertSheet = ssCertWorkbook.Worksheets("Shared Services
          Compliance Cert")
    - step:
        id: '24'
        action: Script
        object_path: ssCertCount = ssCertSheet.usedrange.Rows.Count
    - step:
        id: '25'
        action: Script
        object_path: '''OPEN SS COMPLIANCE CURRICULA'
    - step:
        id: '26'
        action: Script
        object_path: Set ssCurrWorkbook = objExcel.Workbooks.open(ssCurrlocation)
    - step:
        id: '27'
        action: Script
        object_path: Set ssCurrSheet = ssCurrWorkbook.Worksheets("Shared Services
          Compliance Curr")
    - step:
        id: '28'
        action: Script
        object_path: ssCurrCount = ssCurrSheet.usedrange.Rows.Count
    - step:
        id: '29'
        action: Script
        object_path: End If
    - step:
        id: '30'
        action: Script
        object_path: '''OPEN FIELD SERVICES REPORT'
    - step:
        id: '31'
        action: Script
        object_path: If InStr(report, "fs") > 0 Then
    - step:
        id: '32'
        action: Script
        object_path: '''OPEN FS COMPLIANCE CERTIFICATION'
    - step:
        id: '33'
        action: Script
        object_path: Set fsCertWorkbook = objExcel.Workbooks.open(fsCertlocation)
    - step:
        id: '34'
        action: Script
        object_path: Set fsCertSheet = fsCertWorkbook.Worksheets("Field Services Compliance
          Certi")
    - step:
        id: '35'
        action: Script
        object_path: fsCertCount = fsCertSheet.usedrange.Rows.Count
    - step:
        id: '36'
        action: Script
        object_path: '''OPEN FS COMPLIANCE CURRICULA'
    - step:
        id: '37'
        action: Script
        object_path: Set fsCurrWorkbook = objExcel.Workbooks.open(fsCurrlocation)
    - step:
        id: '38'
        action: Script
        object_path: Set fsCurrSheet = fsCurrWorkbook.Worksheets("Field Services Compliance
          Curri")
    - step:
        id: '39'
        action: Script
        object_path: fsCurrCount = fsCurrSheet.usedrange.Rows.Count
    - step:
        id: '40'
        action: Script
        object_path: End If
    - step:
        id: '41'
        action: Script
        object_path: '''OPEN NEW EXCEL'
    - step:
        id: '42'
        action: Script
        object_path: todayDate = Date()
    - step:
        id: '43'
        action: Script
        object_path: todayDate = CStr(todayDate)
    - step:
        id: '44'
        action: Script
        object_path: todayDate = Replace(todayDate, "/", "-")
    - step:
        id: '45'
        action: Script
        object_path: newfilename = todayDate&" "&filename&".xlsx"
    - step:
        id: '46'
        action: Script
        object_path: '''filelocation = "C:\Users\svcrpabot\OneDrive - SA Power Networks\Monthly
          Training Reports\"&newfilename'
    - step:
        id: '47'
        action: Script
        object_path: filelocation = "C:\Temp\"&newfilename
    - step:
        id: '48'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '49'
        action: Script
        object_path: '''If file does not exist, create a new excel'
    - step:
        id: '50'
        action: Script
        object_path: If fso.FileExists(filelocation) = False Then
    - step:
        id: '51'
        action: Script
        object_path: CreateNewExcel(fileLocation)
    - step:
        id: '52'
        action: Script
        object_path: End If
    - step:
        id: '53'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '54'
        action: Script
        object_path: Set newExcelW = objExcel.Workbooks.open(fileLocation)
    - step:
        id: '55'
        action: Script
        object_path: Set newCompCurrS = newExcelW.Worksheets("Compliance Curricula")
    - step:
        id: '56'
        action: Script
        object_path: Set newCompCertS = newExcelW.Worksheets("Compliance Certification")
    - step:
        id: '57'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '58'
        action: Script
        object_path: '''ADD TO COMPLIANCE CERTIFICATION - FIELD SERVICES'
    - step:
        id: '59'
        action: Script
        object_path: certificationCount = newCompCertS.usedrange.Rows.Count
    - step:
        id: '60'
        action: Script
        object_path: x = certificationCount + 1
    - step:
        id: '61'
        action: Script
        object_path: If InStr(report, "fs") > 0 Then
    - step:
        id: '62'
        action: Script
        object_path: For i = 3 To fsCertCount
    - step:
        id: '63'
        action: Script
        object_path: managerName = fsCertSheet.cells(i,2).value
    - step:
        id: '64'
        action: Script
        object_path: orgName = fsCertSheet.cells(i,3).value
    - step:
        id: '65'
        action: Script
        object_path: orgUnit4 = fsCertSheet.cells(i,4).value
    - step:
        id: '66'
        action: Script
        object_path: orgUnit5 = fsCertSheet.cells(i,5).value
    - step:
        id: '67'
        action: Script
        object_path: personnelNo = fsCertSheet.cells(i,6).value
    - step:
        id: '68'
        action: Script
        object_path: fullName = fsCertSheet.cells(i,7).value
    - step:
        id: '69'
        action: Script
        object_path: authorisationDate = fsCertSheet.cells(i,9).value
    - step:
        id: '70'
        action: Script
        object_path: certificationDate = fsCertSheet.cells(i,10).value
    - step:
        id: '71'
        action: Script
        object_path: licenseName = fsCertSheet.cells(i,13).value
    - step:
        id: '72'
        action: Script
        object_path: certificationTitle = fsCertSheet.cells(i,16).value
    - step:
        id: '73'
        action: Script
        object_path: location = fsCertSheet.cells(i,19).value
    - step:
        id: '74'
        action: Script
        object_path: exemptionStatus = fsCertSheet.cells(i,21).value
    - step:
        id: '75'
        action: Script
        object_path: If InStr(orgunit, orgUnit4) > 0 Then
    - step:
        id: '76'
        action: Script
        object_path: If firstfiltercomparison = "manager" Then
    - step:
        id: '77'
        action: Script
        object_path: If InStr(firstfilter, managerName) > 0 or firstfilter = "" or
          firstfilter = "None" Then
    - step:
        id: '78'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '79'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '80'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '81'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '82'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '83'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '84'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '85'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '86'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '87'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '88'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '89'
        action: Script
        object_path: x = x + 1
    - step:
        id: '90'
        action: Script
        object_path: End If
    - step:
        id: '91'
        action: Script
        object_path: End If
    - step:
        id: '92'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '93'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '94'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '95'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '96'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '97'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '98'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '99'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '100'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '101'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '102'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '103'
        action: Script
        object_path: x = x + 1
    - step:
        id: '104'
        action: Script
        object_path: End If
    - step:
        id: '105'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '106'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '107'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '108'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '109'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '110'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '111'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '112'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '113'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '114'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '115'
        action: Script
        object_path: x = x + 1
    - step:
        id: '116'
        action: Script
        object_path: End If
    - step:
        id: '117'
        action: Script
        object_path: End If
    - step:
        id: '118'
        action: Script
        object_path: ElseIf secondfiltercomparison = "" Then
    - step:
        id: '119'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '120'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '121'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '122'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '123'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '124'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '125'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '126'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '127'
        action: Script
        object_path: x = x + 1
    - step:
        id: '128'
        action: Script
        object_path: End If
    - step:
        id: '129'
        action: Script
        object_path: End If
    - step:
        id: '130'
        action: Script
        object_path: ElseIf firstfiltercomparison = "orgUnit" Then
    - step:
        id: '131'
        action: Script
        object_path: If InStr(firstfilter, orgUnit5) > 0 or firstfilter = "" or firstfilter
          = "None" Then
    - step:
        id: '132'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '133'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '134'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '135'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '136'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '137'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '138'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '139'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '140'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '141'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '142'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '143'
        action: Script
        object_path: x = x + 1
    - step:
        id: '144'
        action: Script
        object_path: End If
    - step:
        id: '145'
        action: Script
        object_path: End If
    - step:
        id: '146'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '147'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '148'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '149'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '150'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '151'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '152'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '153'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '154'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '155'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '156'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '157'
        action: Script
        object_path: x = x + 1
    - step:
        id: '158'
        action: Script
        object_path: End If
    - step:
        id: '159'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '160'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '161'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '162'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '163'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '164'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '165'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '166'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '167'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '168'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '169'
        action: Script
        object_path: x = x + 1
    - step:
        id: '170'
        action: Script
        object_path: End If
    - step:
        id: '171'
        action: Script
        object_path: End If
    - step:
        id: '172'
        action: Script
        object_path: End If
    - step:
        id: '173'
        action: Script
        object_path: End If
    - step:
        id: '174'
        action: Script
        object_path: End If
    - step:
        id: '175'
        action: Script
        object_path: End If
    - step:
        id: '176'
        action: Script
        object_path: Next
    - step:
        id: '177'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '178'
        object_path: newExcelW
        action: save
    - step:
        id: '179'
        action: Script
        object_path: End If
    - step:
        id: '180'
        action: Script
        object_path: '''ADD TO COMPLIANCE CERTIFICATION - SHARED SERVICES'
    - step:
        id: '181'
        action: Script
        object_path: If InStr(report, "out") > 0 Then
    - step:
        id: '182'
        action: Script
        object_path: For i = 3 To ssCertCount
    - step:
        id: '183'
        action: Script
        object_path: managerName = ssCertSheet.cells(i,2).value
    - step:
        id: '184'
        action: Script
        object_path: orgName = ssCertSheet.cells(i,3).value
    - step:
        id: '185'
        action: Script
        object_path: orgUnit4 = ssCertSheet.cells(i,4).value
    - step:
        id: '186'
        action: Script
        object_path: orgUnit5 = ssCertSheet.cells(i,5).value
    - step:
        id: '187'
        action: Script
        object_path: personnelNo = ssCertSheet.cells(i,6).value
    - step:
        id: '188'
        action: Script
        object_path: fullName = ssCertSheet.cells(i,7).value
    - step:
        id: '189'
        action: Script
        object_path: authorisationDate = ssCertSheet.cells(i,9).value
    - step:
        id: '190'
        action: Script
        object_path: certificationDate = ssCertSheet.cells(i,10).value
    - step:
        id: '191'
        action: Script
        object_path: licenseName = ssCertSheet.cells(i,13).value
    - step:
        id: '192'
        action: Script
        object_path: certificationTitle = ssCertSheet.cells(i,16).value
    - step:
        id: '193'
        action: Script
        object_path: location = ssCertSheet.cells(i,19).value
    - step:
        id: '194'
        action: Script
        object_path: exemptionStatus = ssCertSheet.cells(i,21).value
    - step:
        id: '195'
        action: Script
        object_path: If InStr(orgunit, orgUnit4) > 0 Then
    - step:
        id: '196'
        action: Script
        object_path: If firstfiltercomparison = "manager" Then
    - step:
        id: '197'
        action: Script
        object_path: If InStr(firstfilter, managerName) > 0 or firstfilter = "" or
          firstfilter = "None" Then
    - step:
        id: '198'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '199'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '200'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '201'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '202'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '203'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '204'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '205'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '206'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '207'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '208'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '209'
        action: Script
        object_path: x = x + 1
    - step:
        id: '210'
        action: Script
        object_path: End If
    - step:
        id: '211'
        action: Script
        object_path: End If
    - step:
        id: '212'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '213'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '214'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '215'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '216'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '217'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '218'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '219'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '220'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '221'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '222'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '223'
        action: Script
        object_path: x = x + 1
    - step:
        id: '224'
        action: Script
        object_path: End If
    - step:
        id: '225'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '226'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '227'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '228'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '229'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '230'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '231'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '232'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '233'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '234'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '235'
        action: Script
        object_path: x = x + 1
    - step:
        id: '236'
        action: Script
        object_path: End If
    - step:
        id: '237'
        action: Script
        object_path: End If
    - step:
        id: '238'
        action: Script
        object_path: ElseIf secondfiltercomparison = "" Then
    - step:
        id: '239'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '240'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '241'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '242'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '243'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '244'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '245'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '246'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '247'
        action: Script
        object_path: x = x + 1
    - step:
        id: '248'
        action: Script
        object_path: End If
    - step:
        id: '249'
        action: Script
        object_path: End If
    - step:
        id: '250'
        action: Script
        object_path: ElseIf firstfiltercomparison = "orgUnit" Then
    - step:
        id: '251'
        action: Script
        object_path: If InStr(firstfilter, orgUnit5) > 0 or firstfilter = "" or firstfilter
          = "None" Then
    - step:
        id: '252'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '253'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '254'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '255'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '256'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '257'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '258'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '259'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '260'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '261'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '262'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '263'
        action: Script
        object_path: x = x + 1
    - step:
        id: '264'
        action: Script
        object_path: End If
    - step:
        id: '265'
        action: Script
        object_path: End If
    - step:
        id: '266'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '267'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '268'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '269'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '270'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '271'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '272'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '273'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '274'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '275'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '276'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '277'
        action: Script
        object_path: x = x + 1
    - step:
        id: '278'
        action: Script
        object_path: End If
    - step:
        id: '279'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '280'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '281'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '282'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '283'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '284'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '285'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '286'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '287'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '288'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '289'
        action: Script
        object_path: x = x + 1
    - step:
        id: '290'
        action: Script
        object_path: End If
    - step:
        id: '291'
        action: Script
        object_path: End If
    - step:
        id: '292'
        action: Script
        object_path: End If
    - step:
        id: '293'
        action: Script
        object_path: End If
    - step:
        id: '294'
        action: Script
        object_path: End If
    - step:
        id: '295'
        action: Script
        object_path: End If
    - step:
        id: '296'
        action: Script
        object_path: Next
    - step:
        id: '297'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '298'
        object_path: newExcelW
        action: save
    - step:
        id: '299'
        action: Script
        object_path: End If
    - step:
        id: '300'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '301'
        action: Script
        object_path: '''ADD TO COMPLIANCE CURRICULA - FIELD SERVICES'
    - step:
        id: '302'
        action: Script
        object_path: curriculaCount = newCompCurrS.usedrange.Rows.Count
    - step:
        id: '303'
        action: Script
        object_path: x = curriculaCount + 1
    - step:
        id: '304'
        action: Script
        object_path: If InStr(report, "fs") > 0 Then
    - step:
        id: '305'
        action: Script
        object_path: For i = 3 To fsCurrCount
    - step:
        id: '306'
        action: Script
        object_path: managerName = fsCurrSheet.cells(i,2).value
    - step:
        id: '307'
        action: Script
        object_path: orgName = fsCurrSheet.cells(i,3).value
    - step:
        id: '308'
        action: Script
        object_path: orgUnit4 = fsCurrSheet.cells(i,4).value
    - step:
        id: '309'
        action: Script
        object_path: orgUnit5 = fsCurrSheet.cells(i,5).value
    - step:
        id: '310'
        action: Script
        object_path: personnelNo = fsCurrSheet.cells(i,6).value
    - step:
        id: '311'
        action: Script
        object_path: fullName = fsCurrSheet.cells(i,7).value
    - step:
        id: '312'
        action: Script
        object_path: studentStatus = fsCurrSheet.cells(i,8).value
    - step:
        id: '313'
        action: Script
        object_path: acquiredOn = fsCurrSheet.cells(i,9).value
    - step:
        id: '314'
        action: Script
        object_path: curriculumName = fsCurrSheet.cells(i,10).value
    - step:
        id: '315'
        action: Script
        object_path: curriculaItemName = fsCurrSheet.cells(i,12).value
    - step:
        id: '316'
        action: Script
        object_path: curriculaStatus = fsCurrSheet.cells(i,13).value
    - step:
        id: '317'
        action: Script
        object_path: curriculaStart = fsCurrSheet.cells(i,14).value
    - step:
        id: '318'
        action: Script
        object_path: curriculaID = fsCurrSheet.cells(i,15).value
    - step:
        id: '319'
        action: Script
        object_path: location = fsCurrSheet.cells(i,16).value
    - step:
        id: '320'
        action: Script
        object_path: If InStr(orgunit, orgUnit4) > 0 Then
    - step:
        id: '321'
        action: Script
        object_path: If firstfiltercomparison = "manager" Then
    - step:
        id: '322'
        action: Script
        object_path: If InStr(firstfilter, managerName) > 0 or firstfilter = "" or
          firstfilter = "None" Then
    - step:
        id: '323'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '324'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '325'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '326'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '327'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '328'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '329'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '330'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '331'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '332'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '333'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '334'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '335'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '336'
        action: Script
        object_path: x = x + 1
    - step:
        id: '337'
        action: Script
        object_path: End If
    - step:
        id: '338'
        action: Script
        object_path: End If
    - step:
        id: '339'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '340'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '341'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '342'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '343'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '344'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '345'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '346'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '347'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '348'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '349'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '350'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '351'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '352'
        action: Script
        object_path: x = x + 1
    - step:
        id: '353'
        action: Script
        object_path: End If
    - step:
        id: '354'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '355'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '356'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '357'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '358'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '359'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '360'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '361'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '362'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '363'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '364'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '365'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '366'
        action: Script
        object_path: x = x + 1
    - step:
        id: '367'
        action: Script
        object_path: End If
    - step:
        id: '368'
        action: Script
        object_path: End If
    - step:
        id: '369'
        action: Script
        object_path: ElseIf secondfiltercomparison = "" Then
    - step:
        id: '370'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '371'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '372'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '373'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '374'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '375'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '376'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '377'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '378'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '379'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '380'
        action: Script
        object_path: x = x + 1
    - step:
        id: '381'
        action: Script
        object_path: End If
    - step:
        id: '382'
        action: Script
        object_path: End If
    - step:
        id: '383'
        action: Script
        object_path: ElseIf firstfiltercomparison = "orgUnit" Then
    - step:
        id: '384'
        action: Script
        object_path: If InStr(firstfilter, orgUnit5) > 0 or firstfilter = "" or firstfilter
          = "None" Then
    - step:
        id: '385'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '386'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '387'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '388'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '389'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '390'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '391'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '392'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '393'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '394'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '395'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '396'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '397'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '398'
        action: Script
        object_path: x = x + 1
    - step:
        id: '399'
        action: Script
        object_path: End If
    - step:
        id: '400'
        action: Script
        object_path: End If
    - step:
        id: '401'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '402'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '403'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '404'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '405'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '406'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '407'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '408'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '409'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '410'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '411'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '412'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '413'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '414'
        action: Script
        object_path: x = x + 1
    - step:
        id: '415'
        action: Script
        object_path: End If
    - step:
        id: '416'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '417'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '418'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '419'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '420'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '421'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '422'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '423'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '424'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '425'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '426'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '427'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '428'
        action: Script
        object_path: x = x + 1
    - step:
        id: '429'
        action: Script
        object_path: End If
    - step:
        id: '430'
        action: Script
        object_path: End If
    - step:
        id: '431'
        action: Script
        object_path: End If
    - step:
        id: '432'
        action: Script
        object_path: End If
    - step:
        id: '433'
        action: Script
        object_path: End If
    - step:
        id: '434'
        action: Script
        object_path: End If
    - step:
        id: '435'
        action: Script
        object_path: Next
    - step:
        id: '436'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '437'
        object_path: newExcelW
        action: save
    - step:
        id: '438'
        action: Script
        object_path: End If
    - step:
        id: '439'
        action: Script
        object_path: '''ADD TO COMPLIANCE CURRICULA - SHARED SERVICES'
    - step:
        id: '440'
        action: Script
        object_path: If InStr(report, "out") > 0 Then
    - step:
        id: '441'
        action: Script
        object_path: For i = 3 To ssCurrCount
    - step:
        id: '442'
        action: Script
        object_path: managerName = ssCurrSheet.cells(i,2).value
    - step:
        id: '443'
        action: Script
        object_path: orgName = ssCurrSheet.cells(i,3).value
    - step:
        id: '444'
        action: Script
        object_path: orgUnit4 = ssCurrSheet.cells(i,4).value
    - step:
        id: '445'
        action: Script
        object_path: orgUnit5 = ssCurrSheet.cells(i,5).value
    - step:
        id: '446'
        action: Script
        object_path: personnelNo = ssCurrSheet.cells(i,6).value
    - step:
        id: '447'
        action: Script
        object_path: fullName = ssCurrSheet.cells(i,7).value
    - step:
        id: '448'
        action: Script
        object_path: studentStatus = ssCurrSheet.cells(i,8).value
    - step:
        id: '449'
        action: Script
        object_path: acquiredOn = ssCurrSheet.cells(i,9).value
    - step:
        id: '450'
        action: Script
        object_path: curriculumName = ssCurrSheet.cells(i,10).value
    - step:
        id: '451'
        action: Script
        object_path: curriculaItemName = ssCurrSheet.cells(i,12).value
    - step:
        id: '452'
        action: Script
        object_path: curriculaStatus = ssCurrSheet.cells(i,13).value
    - step:
        id: '453'
        action: Script
        object_path: curriculaStart = ssCurrSheet.cells(i,14).value
    - step:
        id: '454'
        action: Script
        object_path: curriculaID = ssCurrSheet.cells(i,15).value
    - step:
        id: '455'
        action: Script
        object_path: location = ssCurrSheet.cells(i,16).value
    - step:
        id: '456'
        action: Script
        object_path: If InStr(orgunit, orgUnit4) > 0 Then
    - step:
        id: '457'
        action: Script
        object_path: If firstfiltercomparison = "manager" Then
    - step:
        id: '458'
        action: Script
        object_path: If InStr(firstfilter, managerName) > 0 or firstfilter = "" or
          firstfilter = "None" Then
    - step:
        id: '459'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '460'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '461'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '462'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '463'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '464'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '465'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '466'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '467'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '468'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '469'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '470'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '471'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '472'
        action: Script
        object_path: x = x + 1
    - step:
        id: '473'
        action: Script
        object_path: End If
    - step:
        id: '474'
        action: Script
        object_path: End If
    - step:
        id: '475'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '476'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '477'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '478'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '479'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '480'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '481'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '482'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '483'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '484'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '485'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '486'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '487'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '488'
        action: Script
        object_path: x = x + 1
    - step:
        id: '489'
        action: Script
        object_path: End If
    - step:
        id: '490'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '491'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '492'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '493'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '494'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '495'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '496'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '497'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '498'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '499'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '500'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '501'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '502'
        action: Script
        object_path: x = x + 1
    - step:
        id: '503'
        action: Script
        object_path: End If
    - step:
        id: '504'
        action: Script
        object_path: End If
    - step:
        id: '505'
        action: Script
        object_path: ElseIf secondfiltercomparison = "" Then
    - step:
        id: '506'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '507'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '508'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '509'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '510'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '511'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '512'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '513'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '514'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '515'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '516'
        action: Script
        object_path: x = x + 1
    - step:
        id: '517'
        action: Script
        object_path: End If
    - step:
        id: '518'
        action: Script
        object_path: End If
    - step:
        id: '519'
        action: Script
        object_path: ElseIf firstfiltercomparison = "orgUnit" Then
    - step:
        id: '520'
        action: Script
        object_path: If InStr(firstfilter, orgUnit5) > 0 or firstfilter = "" or firstfilter
          = "None" Then
    - step:
        id: '521'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '522'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '523'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '524'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '525'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '526'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '527'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '528'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '529'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '530'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '531'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '532'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '533'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '534'
        action: Script
        object_path: x = x + 1
    - step:
        id: '535'
        action: Script
        object_path: End If
    - step:
        id: '536'
        action: Script
        object_path: End If
    - step:
        id: '537'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '538'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '539'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '540'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '541'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '542'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '543'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '544'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '545'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '546'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '547'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '548'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '549'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '550'
        action: Script
        object_path: x = x + 1
    - step:
        id: '551'
        action: Script
        object_path: End If
    - step:
        id: '552'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '553'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '554'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '555'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '556'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '557'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '558'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '559'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '560'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '561'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '562'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '563'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '564'
        action: Script
        object_path: x = x + 1
    - step:
        id: '565'
        action: Script
        object_path: End If
    - step:
        id: '566'
        action: Script
        object_path: End If
    - step:
        id: '567'
        action: Script
        object_path: End If
    - step:
        id: '568'
        action: Script
        object_path: End If
    - step:
        id: '569'
        action: Script
        object_path: End If
    - step:
        id: '570'
        action: Script
        object_path: End If
    - step:
        id: '571'
        action: Script
        object_path: Next
    - step:
        id: '572'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '573'
        object_path: newExcelW
        action: save
    - step:
        id: '574'
        action: Script
        object_path: End If
    - step:
        id: '575'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '576'
        object_path: newExcelW
        action: save
    - step:
        id: '577'
        object_path: newExcelW
        action: close
    - step:
        id: '578'
        action: Script
        object_path: Parameter("splitreportname") = newfilename
    - step:
        id: '579'
        action: Script
        object_path: Parameter("splitreportlocation") = filelocation
    - step:
        id: '580'
        action: Script
        object_path: If InStr(report, "out") > 0 Then
    - step:
        id: '581'
        object_path: ssCertWorkbook
        action: save
    - step:
        id: '582'
        object_path: ssCurrWorkbook
        action: save
    - step:
        id: '583'
        object_path: ssCertWorkbook
        action: close
    - step:
        id: '584'
        object_path: ssCurrWorkbook
        action: close
    - step:
        id: '585'
        action: Script
        object_path: End If
    - step:
        id: '586'
        action: Script
        object_path: If InStr(report, "fs") > 0 Then
    - step:
        id: '587'
        object_path: fsCertWorkbook
        action: save
    - step:
        id: '588'
        object_path: fsCurrWorkbook
        action: save
    - step:
        id: '589'
        object_path: fsCertWorkbook
        action: close
    - step:
        id: '590'
        object_path: fsCurrWorkbook
        action: close
    - step:
        id: '591'
        action: Script
        object_path: End If
    - step:
        id: '592'
        object_path: objExcel
        action: Quit
    - step:
        id: '593'
        action: Script
        object_path: If InStr(report, "out") > 0 Then
    - step:
        id: '594'
        action: Script
        object_path: Set ssCertWorkbook = Nothing
    - step:
        id: '595'
        action: Script
        object_path: Set ssCertSheet = Nothing
    - step:
        id: '596'
        action: Script
        object_path: Set ssCurrWorkbook = Nothing
    - step:
        id: '597'
        action: Script
        object_path: "Set ssCurrSheet\t = Nothing"
    - step:
        id: '598'
        action: Script
        object_path: End If
    - step:
        id: '599'
        action: Script
        object_path: If InStr(report, "fs") > 0 Then
    - step:
        id: '600'
        action: Script
        object_path: Set fsCertWorkbook = Nothing
    - step:
        id: '601'
        action: Script
        object_path: Set fsCertSheet = Nothing
    - step:
        id: '602'
        action: Script
        object_path: Set fsCurrWorkbook = Nothing
    - step:
        id: '603'
        action: Script
        object_path: "Set fsCurrSheet\t = Nothing"
    - step:
        id: '604'
        action: Script
        object_path: End If
    - step:
        id: '605'
        action: Script
        object_path: Set newCompCertS = Nothing
    - step:
        id: '606'
        action: Script
        object_path: Set newCompCurrS = Nothing
    - step:
        id: '607'
        action: Script
        object_path: Set newExcelW = Nothing
    - step:
        id: '608'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '609'
        action: Script
        object_path: Function CreateNewExcel(fileLocation)
    - step:
        id: '610'
        action: Script
        object_path: Set newExcelW = objExcel.Workbooks.Add()
    - step:
        id: '611'
        action: Script
        object_path: '''ADD COMPLIANCE CURRICULA SHEET'
    - step:
        id: '612'
        action: Script
        object_path: Set newCompCurrS = newExcelW.sheets.Add
    - step:
        id: '613'
        object_path: newCompCurrS
        action: name
        args: = "Compliance Curricula"
    - step:
        id: '614'
        action: Script
        object_path: Set newCompCurrS = newExcelW.Worksheets("Compliance Curricula")
    - step:
        id: '615'
        object_path: newCompCurrS.Cells(1,1)
        action: value
        args: = "Person No."
    - step:
        id: '616'
        object_path: newCompCurrS.Cells(1,1).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '617'
        object_path: newCompCurrS.Cells(1,1)
        action: ColumnWidth
        args: = 10
    - step:
        id: '618'
        object_path: newCompCurrS.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '619'
        object_path: newCompCurrS.Cells(1,1).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '620'
        object_path: newCompCurrS.Cells(1,2)
        action: value
        args: = "Full Name"
    - step:
        id: '621'
        object_path: newCompCurrS.Cells(1,2).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '622'
        object_path: newCompCurrS.Cells(1,2)
        action: ColumnWidth
        args: = 20
    - step:
        id: '623'
        object_path: newCompCurrS.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '624'
        object_path: newCompCurrS.Cells(1,2).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '625'
        object_path: newCompCurrS.Cells(1,3)
        action: value
        args: = "Manager"
    - step:
        id: '626'
        object_path: newCompCurrS.Cells(1,3).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '627'
        object_path: newCompCurrS.Cells(1,3)
        action: ColumnWidth
        args: = 20
    - step:
        id: '628'
        object_path: newCompCurrS.Cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '629'
        object_path: newCompCurrS.Cells(1,3).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '630'
        object_path: newCompCurrS.Cells(1,4)
        action: value
        args: = "Student Curriculum Status"
    - step:
        id: '631'
        object_path: newCompCurrS.Cells(1,4).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '632'
        object_path: newCompCurrS.Cells(1,4)
        action: ColumnWidth
        args: = 20
    - step:
        id: '633'
        object_path: newCompCurrS.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '634'
        object_path: newCompCurrS.Cells(1,4).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '635'
        object_path: newCompCurrS.Cells(1,5)
        action: value
        args: = "Student Curriculum Status Acquired On"
    - step:
        id: '636'
        object_path: newCompCurrS.Cells(1,5).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '637'
        object_path: newCompCurrS.Cells(1,5)
        action: ColumnWidth
        args: = 15
    - step:
        id: '638'
        object_path: newCompCurrS.Cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '639'
        object_path: newCompCurrS.Cells(1,5).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '640'
        object_path: newCompCurrS.Cells(1,6)
        action: value
        args: = "Curriculum Name"
    - step:
        id: '641'
        object_path: newCompCurrS.Cells(1,6).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '642'
        object_path: newCompCurrS.Cells(1,6)
        action: ColumnWidth
        args: = 50
    - step:
        id: '643'
        object_path: newCompCurrS.Cells(1,6)
        action: WrapText
        args: = true
    - step:
        id: '644'
        object_path: newCompCurrS.Cells(1,6).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '645'
        object_path: newCompCurrS.Cells(1,7)
        action: value
        args: = "Curricula Learning Item Name"
    - step:
        id: '646'
        object_path: newCompCurrS.Cells(1,7).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '647'
        object_path: newCompCurrS.Cells(1,7)
        action: ColumnWidth
        args: = 50
    - step:
        id: '648'
        object_path: newCompCurrS.Cells(1,7)
        action: WrapText
        args: = true
    - step:
        id: '649'
        object_path: newCompCurrS.Cells(1,7).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '650'
        object_path: newCompCurrS.Cells(1,8)
        action: value
        args: = "Curricula Status"
    - step:
        id: '651'
        object_path: newCompCurrS.Cells(1,8).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '652'
        object_path: newCompCurrS.Cells(1,8)
        action: ColumnWidth
        args: = 20
    - step:
        id: '653'
        object_path: newCompCurrS.Cells(1,8)
        action: WrapText
        args: = true
    - step:
        id: '654'
        object_path: newCompCurrS.Cells(1,8).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '655'
        object_path: newCompCurrS.Cells(1,9)
        action: value
        args: = "Curricula Learning Item Start Date"
    - step:
        id: '656'
        object_path: newCompCurrS.Cells(1,9).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '657'
        object_path: newCompCurrS.Cells(1,9)
        action: ColumnWidth
        args: = 20
    - step:
        id: '658'
        object_path: newCompCurrS.Cells(1,9)
        action: WrapText
        args: = true
    - step:
        id: '659'
        object_path: newCompCurrS.Cells(1,9).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '660'
        object_path: newCompCurrS.Cells(1,10)
        action: value
        args: = "Curricula Learning Item Class ID"
    - step:
        id: '661'
        object_path: newCompCurrS.Cells(1,10).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '662'
        object_path: newCompCurrS.Cells(1,10)
        action: ColumnWidth
        args: = 20
    - step:
        id: '663'
        object_path: newCompCurrS.Cells(1,10)
        action: WrapText
        args: = true
    - step:
        id: '664'
        object_path: newCompCurrS.Cells(1,10).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '665'
        object_path: newCompCurrS.Cells(1,11)
        action: value
        args: = "Explanation"
    - step:
        id: '666'
        object_path: newCompCurrS.Cells(1,11).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '667'
        object_path: newCompCurrS.Cells(1,11)
        action: ColumnWidth
        args: = 50
    - step:
        id: '668'
        object_path: newCompCurrS.Cells(1,11)
        action: WrapText
        args: = true
    - step:
        id: '669'
        object_path: newCompCurrS.Cells(1,11).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '670'
        action: Script
        object_path: '''ADD COMPLIANCE CERTIFICATION SHEET'
    - step:
        id: '671'
        action: Script
        object_path: Set newCompCertS = newExcelW.sheets.Add
    - step:
        id: '672'
        object_path: newCompCertS
        action: name
        args: = "Compliance Certification"
    - step:
        id: '673'
        action: Script
        object_path: Set newCompCertS = newExcelW.Worksheets("Compliance Certification")
    - step:
        id: '674'
        object_path: newCompCertS.Cells(1,1)
        action: value
        args: = "Person No."
    - step:
        id: '675'
        object_path: newCompCertS.Cells(1,1).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '676'
        object_path: newCompCertS.Cells(1,1)
        action: ColumnWidth
        args: = 10
    - step:
        id: '677'
        object_path: newCompCertS.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '678'
        object_path: newCompCertS.Cells(1,1).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '679'
        object_path: newCompCertS.Cells(1,2)
        action: value
        args: = "Full Name"
    - step:
        id: '680'
        object_path: newCompCertS.Cells(1,2).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '681'
        object_path: newCompCertS.Cells(1,2)
        action: ColumnWidth
        args: = 20
    - step:
        id: '682'
        object_path: newCompCertS.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '683'
        object_path: newCompCertS.Cells(1,2).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '684'
        object_path: newCompCertS.Cells(1,3)
        action: value
        args: = "Manager"
    - step:
        id: '685'
        object_path: newCompCertS.Cells(1,3).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '686'
        object_path: newCompCertS.Cells(1,3)
        action: ColumnWidth
        args: = 20
    - step:
        id: '687'
        object_path: newCompCertS.Cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '688'
        object_path: newCompCertS.Cells(1,3).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '689'
        object_path: newCompCertS.Cells(1,4)
        action: value
        args: = "Certification"
    - step:
        id: '690'
        object_path: newCompCertS.Cells(1,4).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '691'
        object_path: newCompCertS.Cells(1,4)
        action: ColumnWidth
        args: = 50
    - step:
        id: '692'
        object_path: newCompCertS.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '693'
        object_path: newCompCertS.Cells(1,4).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '694'
        object_path: newCompCertS.Cells(1,5)
        action: value
        args: = "Certification Learning Item Title"
    - step:
        id: '695'
        object_path: newCompCertS.Cells(1,5).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '696'
        object_path: newCompCertS.Cells(1,5)
        action: ColumnWidth
        args: = 50
    - step:
        id: '697'
        object_path: newCompCertS.Cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '698'
        object_path: newCompCertS.Cells(1,5).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '699'
        object_path: newCompCertS.Cells(1,6)
        action: value
        args: = "Expiry Date"
    - step:
        id: '700'
        object_path: newCompCertS.Cells(1,6).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '701'
        object_path: newCompCertS.Cells(1,6)
        action: ColumnWidth
        args: = 15
    - step:
        id: '702'
        object_path: newCompCertS.Cells(1,6)
        action: WrapText
        args: = true
    - step:
        id: '703'
        object_path: newCompCertS.Cells(1,6).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '704'
        object_path: newCompCertS.Cells(1,7)
        action: value
        args: = "Enrolment Date"
    - step:
        id: '705'
        object_path: newCompCertS.Cells(1,7).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '706'
        object_path: newCompCertS.Cells(1,7)
        action: ColumnWidth
        args: = 15
    - step:
        id: '707'
        object_path: newCompCertS.Cells(1,7)
        action: WrapText
        args: = true
    - step:
        id: '708'
        object_path: newCompCertS.Cells(1,7).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '709'
        object_path: newCompCertS.Cells(1,8)
        action: value
        args: = "Explanation"
    - step:
        id: '710'
        object_path: newCompCertS.Cells(1,8).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '711'
        object_path: newCompCertS.Cells(1,8)
        action: ColumnWidth
        args: = 50
    - step:
        id: '712'
        object_path: newCompCertS.Cells(1,8)
        action: WrapText
        args: = true
    - step:
        id: '713'
        object_path: newCompCertS.Cells(1,8).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '714'
        object_path: newCompCertS.Cells(1,9)
        action: value
        args: = "Person  Exemption Status (L&D ONLY to Complete)"
    - step:
        id: '715'
        object_path: newCompCertS.Cells(1,9).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '716'
        object_path: newCompCertS.Cells(1,9)
        action: ColumnWidth
        args: = 20
    - step:
        id: '717'
        object_path: newCompCertS.Cells(1,9)
        action: WrapText
        args: = true
    - step:
        id: '718'
        object_path: newCompCertS.Cells(1,9).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '719'
        action: Script
        object_path: '''REMOVE SHEET1'
    - step:
        id: '720'
        action: Script
        object_path: Set objWorksheet = newExcelW.Worksheets("Sheet1")
    - step:
        id: '721'
        object_path: objWorksheet
        action: Delete
    - step:
        id: '722'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '723'
        action: Script
        object_path: '''SAVE AS'
    - step:
        id: '724'
        object_path: newExcelW
        action: SaveAs(filelocation)
    - step:
        id: '725'
        object_path: newExcelW
        action: Close
    - step:
        id: '726'
        action: Script
        object_path: End Function
  outputs:
  - splitreportname:
      robot: true
      value: ${splitreportname}
  - splitreportlocation:
      robot: true
      value: ${splitreportlocation}
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
