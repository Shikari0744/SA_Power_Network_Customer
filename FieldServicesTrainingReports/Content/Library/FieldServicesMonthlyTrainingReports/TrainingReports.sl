namespace: FieldServicesMonthlyTrainingReports
operation:
  name: TrainingReports
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
  sequential_action:
    gav: com.microfocus.seq:FieldServicesMonthlyTrainingReports.TrainingReports:1.0.0
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
        object_path: '''SET VARIABLES'
    - step:
        id: '2'
        action: Script
        object_path: filename = Parameter("reportName")
    - step:
        id: '3'
        action: Script
        object_path: orgunit = Parameter("orgUnit")
    - step:
        id: '4'
        action: Script
        object_path: neworgunit = Split(orgunit, ", ")
    - step:
        id: '5'
        action: Script
        object_path: firstfilter = Parameter("firstFilter")
    - step:
        id: '6'
        action: Script
        object_path: newfirstfilter = Split(firstfilter, ", ")
    - step:
        id: '7'
        action: Script
        object_path: secondfilter = Parameter("secondFilter")
    - step:
        id: '8'
        action: Script
        object_path: newsecondfilter = Split(secondfilter, ", ")
    - step:
        id: '9'
        action: Script
        object_path: thirdfilter = Parameter("thirdFilter")
    - step:
        id: '10'
        action: Script
        object_path: newthirdfilter = Split(thirdfilter, ", ")
    - step:
        id: '11'
        action: Script
        object_path: secondfiltercomparison = Parameter("secondFilterComparer")
    - step:
        id: '12'
        action: Script
        object_path: firstfiltercomparison = Parameter("firstFilterComparer")
    - step:
        id: '13'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '14'
        action: Script
        object_path: '''OPEN MY LEARNING EXCELS'
    - step:
        id: '15'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '16'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '17'
        action: Script
        object_path: '''OPEN COMPLIANCE CERTIFICATION'
    - step:
        id: '18'
        action: Script
        object_path: '''Set complianceCertW = objExcel.Workbooks.open("C:\Users\haasj0\OneDrive
          - SA Power Networks\Documents\Process Automation\Monthly Training Reports\Field
          Services Compliance Certification Report.xlsx")'
    - step:
        id: '19'
        action: Script
        object_path: Set complianceCertW = objExcel.Workbooks.open("C:\Temp\Field
          Services Compliance Certification Report.xlsx")
    - step:
        id: '20'
        action: Script
        object_path: '''Set complianceCertW = objExcel.Workbooks.open("C:\Users\svcrpabot\OneDrive
          - SA Power Networks\Monthly Training Reports\Field Services Compliance Certification
          Report.xlsx")'
    - step:
        id: '21'
        action: Script
        object_path: Set complianceCertS = complianceCertW.Worksheets("Field Services
          Compliance Certi")
    - step:
        id: '22'
        action: Script
        object_path: certificationCount = complianceCertS.usedrange.Rows.Count
    - step:
        id: '23'
        action: Script
        object_path: '''OPEN COMPLIANCE CURRICULA'
    - step:
        id: '24'
        action: Script
        object_path: '''Set complianceCurrW = objExcel.Workbooks.open("C:\Users\haasj0\OneDrive
          - SA Power Networks\Documents\Process Automation\Monthly Training Reports\Field
          Services Compliance Curricula Report.xlsx")'
    - step:
        id: '25'
        action: Script
        object_path: Set complianceCurrW = objExcel.Workbooks.open("C:\Temp\Field
          Services Compliance Curricula Report.xlsx")
    - step:
        id: '26'
        action: Script
        object_path: '''Set complianceCurrW = objExcel.Workbooks.open("C:\Users\svcrpabot\OneDrive
          - SA Power Networks\Monthly Training Reports\Field Services Compliance Curricula
          Report.xlsx")'
    - step:
        id: '27'
        action: Script
        object_path: Set complianceCurrS = complianceCurrW.Worksheets("Field Services
          Compliance Curri")
    - step:
        id: '28'
        action: Script
        object_path: curriculaCount = complianceCurrS.usedrange.Rows.Count
    - step:
        id: '29'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '30'
        action: Script
        object_path: '''CREATE NEW EXCEL'
    - step:
        id: '31'
        action: Script
        object_path: Set newExcelW = objExcel.Workbooks.Add()
    - step:
        id: '32'
        action: Script
        object_path: '''ADD COMPLIANCE CURRICULA SHEET'
    - step:
        id: '33'
        action: Script
        object_path: Set newCompCurrS = newExcelW.sheets.Add
    - step:
        id: '34'
        object_path: newCompCurrS
        action: name
        args: = "Compliance Curricula"
    - step:
        id: '35'
        action: Script
        object_path: Set newCompCurrS = newExcelW.Worksheets("Compliance Curricula")
    - step:
        id: '36'
        object_path: newCompCurrS.Cells(1,1)
        action: value
        args: = "Person No."
    - step:
        id: '37'
        object_path: newCompCurrS.Cells(1,1).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '38'
        object_path: newCompCurrS.Cells(1,1)
        action: ColumnWidth
        args: = 10
    - step:
        id: '39'
        object_path: newCompCurrS.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '40'
        object_path: newCompCurrS.Cells(1,1).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '41'
        object_path: newCompCurrS.Cells(1,2)
        action: value
        args: = "Full Name"
    - step:
        id: '42'
        object_path: newCompCurrS.Cells(1,2).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '43'
        object_path: newCompCurrS.Cells(1,2)
        action: ColumnWidth
        args: = 20
    - step:
        id: '44'
        object_path: newCompCurrS.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '45'
        object_path: newCompCurrS.Cells(1,2).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '46'
        object_path: newCompCurrS.Cells(1,3)
        action: value
        args: = "Manager"
    - step:
        id: '47'
        object_path: newCompCurrS.Cells(1,3).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '48'
        object_path: newCompCurrS.Cells(1,3)
        action: ColumnWidth
        args: = 20
    - step:
        id: '49'
        object_path: newCompCurrS.Cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '50'
        object_path: newCompCurrS.Cells(1,3).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '51'
        object_path: newCompCurrS.Cells(1,4)
        action: value
        args: = "Student Curriculum Status"
    - step:
        id: '52'
        object_path: newCompCurrS.Cells(1,4).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '53'
        object_path: newCompCurrS.Cells(1,4)
        action: ColumnWidth
        args: = 20
    - step:
        id: '54'
        object_path: newCompCurrS.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '55'
        object_path: newCompCurrS.Cells(1,4).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '56'
        object_path: newCompCurrS.Cells(1,5)
        action: value
        args: = "Student Curriculum Status Acquired On"
    - step:
        id: '57'
        object_path: newCompCurrS.Cells(1,5).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '58'
        object_path: newCompCurrS.Cells(1,5)
        action: ColumnWidth
        args: = 15
    - step:
        id: '59'
        object_path: newCompCurrS.Cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '60'
        object_path: newCompCurrS.Cells(1,5).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '61'
        object_path: newCompCurrS.Cells(1,6)
        action: value
        args: = "Curriculum Name"
    - step:
        id: '62'
        object_path: newCompCurrS.Cells(1,6).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '63'
        object_path: newCompCurrS.Cells(1,6)
        action: ColumnWidth
        args: = 50
    - step:
        id: '64'
        object_path: newCompCurrS.Cells(1,6)
        action: WrapText
        args: = true
    - step:
        id: '65'
        object_path: newCompCurrS.Cells(1,6).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '66'
        object_path: newCompCurrS.Cells(1,7)
        action: value
        args: = "Curricula Learning Item Name"
    - step:
        id: '67'
        object_path: newCompCurrS.Cells(1,7).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '68'
        object_path: newCompCurrS.Cells(1,7)
        action: ColumnWidth
        args: = 50
    - step:
        id: '69'
        object_path: newCompCurrS.Cells(1,7)
        action: WrapText
        args: = true
    - step:
        id: '70'
        object_path: newCompCurrS.Cells(1,7).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '71'
        object_path: newCompCurrS.Cells(1,8)
        action: value
        args: = "Curricula Status"
    - step:
        id: '72'
        object_path: newCompCurrS.Cells(1,8).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '73'
        object_path: newCompCurrS.Cells(1,8)
        action: ColumnWidth
        args: = 20
    - step:
        id: '74'
        object_path: newCompCurrS.Cells(1,8)
        action: WrapText
        args: = true
    - step:
        id: '75'
        object_path: newCompCurrS.Cells(1,8).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '76'
        object_path: newCompCurrS.Cells(1,9)
        action: value
        args: = "Curricula Learning Item Start Date"
    - step:
        id: '77'
        object_path: newCompCurrS.Cells(1,9).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '78'
        object_path: newCompCurrS.Cells(1,9)
        action: ColumnWidth
        args: = 20
    - step:
        id: '79'
        object_path: newCompCurrS.Cells(1,9)
        action: WrapText
        args: = true
    - step:
        id: '80'
        object_path: newCompCurrS.Cells(1,9).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '81'
        object_path: newCompCurrS.Cells(1,10)
        action: value
        args: = "Curricula Learning Item Class ID"
    - step:
        id: '82'
        object_path: newCompCurrS.Cells(1,10).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '83'
        object_path: newCompCurrS.Cells(1,10)
        action: ColumnWidth
        args: = 20
    - step:
        id: '84'
        object_path: newCompCurrS.Cells(1,10)
        action: WrapText
        args: = true
    - step:
        id: '85'
        object_path: newCompCurrS.Cells(1,10).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '86'
        object_path: newCompCurrS.Cells(1,11)
        action: value
        args: = "Explanation"
    - step:
        id: '87'
        object_path: newCompCurrS.Cells(1,11).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '88'
        object_path: newCompCurrS.Cells(1,11)
        action: ColumnWidth
        args: = 50
    - step:
        id: '89'
        object_path: newCompCurrS.Cells(1,11)
        action: WrapText
        args: = true
    - step:
        id: '90'
        object_path: newCompCurrS.Cells(1,11).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '91'
        action: Script
        object_path: '''ADD COMPLIANCE CERTIFICATION SHEET'
    - step:
        id: '92'
        action: Script
        object_path: Set newCompCertS = newExcelW.sheets.Add
    - step:
        id: '93'
        object_path: newCompCertS
        action: name
        args: = "Compliance Certification"
    - step:
        id: '94'
        action: Script
        object_path: Set newCompCertS = newExcelW.Worksheets("Compliance Certification")
    - step:
        id: '95'
        object_path: newCompCertS.Cells(1,1)
        action: value
        args: = "Person No."
    - step:
        id: '96'
        object_path: newCompCertS.Cells(1,1).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '97'
        object_path: newCompCertS.Cells(1,1)
        action: ColumnWidth
        args: = 10
    - step:
        id: '98'
        object_path: newCompCertS.Cells(1,1)
        action: WrapText
        args: = true
    - step:
        id: '99'
        object_path: newCompCertS.Cells(1,1).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '100'
        object_path: newCompCertS.Cells(1,2)
        action: value
        args: = "Full Name"
    - step:
        id: '101'
        object_path: newCompCertS.Cells(1,2).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '102'
        object_path: newCompCertS.Cells(1,2)
        action: ColumnWidth
        args: = 20
    - step:
        id: '103'
        object_path: newCompCertS.Cells(1,2)
        action: WrapText
        args: = true
    - step:
        id: '104'
        object_path: newCompCertS.Cells(1,2).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '105'
        object_path: newCompCertS.Cells(1,3)
        action: value
        args: = "Manager"
    - step:
        id: '106'
        object_path: newCompCertS.Cells(1,3).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '107'
        object_path: newCompCertS.Cells(1,3)
        action: ColumnWidth
        args: = 20
    - step:
        id: '108'
        object_path: newCompCertS.Cells(1,3)
        action: WrapText
        args: = true
    - step:
        id: '109'
        object_path: newCompCertS.Cells(1,3).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '110'
        object_path: newCompCertS.Cells(1,4)
        action: value
        args: = "Certification"
    - step:
        id: '111'
        object_path: newCompCertS.Cells(1,4).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '112'
        object_path: newCompCertS.Cells(1,4)
        action: ColumnWidth
        args: = 50
    - step:
        id: '113'
        object_path: newCompCertS.Cells(1,4)
        action: WrapText
        args: = true
    - step:
        id: '114'
        object_path: newCompCertS.Cells(1,4).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '115'
        object_path: newCompCertS.Cells(1,5)
        action: value
        args: = "Certification Learning Item Title"
    - step:
        id: '116'
        object_path: newCompCertS.Cells(1,5).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '117'
        object_path: newCompCertS.Cells(1,5)
        action: ColumnWidth
        args: = 50
    - step:
        id: '118'
        object_path: newCompCertS.Cells(1,5)
        action: WrapText
        args: = true
    - step:
        id: '119'
        object_path: newCompCertS.Cells(1,5).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '120'
        object_path: newCompCertS.Cells(1,6)
        action: value
        args: = "Expiry Date"
    - step:
        id: '121'
        object_path: newCompCertS.Cells(1,6).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '122'
        object_path: newCompCertS.Cells(1,6)
        action: ColumnWidth
        args: = 15
    - step:
        id: '123'
        object_path: newCompCertS.Cells(1,6)
        action: WrapText
        args: = true
    - step:
        id: '124'
        object_path: newCompCertS.Cells(1,6).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '125'
        object_path: newCompCertS.Cells(1,7)
        action: value
        args: = "Enrolment Date"
    - step:
        id: '126'
        object_path: newCompCertS.Cells(1,7).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '127'
        object_path: newCompCertS.Cells(1,7)
        action: ColumnWidth
        args: = 15
    - step:
        id: '128'
        object_path: newCompCertS.Cells(1,7)
        action: WrapText
        args: = true
    - step:
        id: '129'
        object_path: newCompCertS.Cells(1,7).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '130'
        object_path: newCompCertS.Cells(1,8)
        action: value
        args: = "Explanation"
    - step:
        id: '131'
        object_path: newCompCertS.Cells(1,8).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '132'
        object_path: newCompCertS.Cells(1,8)
        action: ColumnWidth
        args: = 50
    - step:
        id: '133'
        object_path: newCompCertS.Cells(1,8)
        action: WrapText
        args: = true
    - step:
        id: '134'
        object_path: newCompCertS.Cells(1,8).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '135'
        object_path: newCompCertS.Cells(1,9)
        action: value
        args: = "Person  Exemption Status (L&D ONLY to Complete)"
    - step:
        id: '136'
        object_path: newCompCertS.Cells(1,9).Interior
        action: ColorIndex
        args: = 40
    - step:
        id: '137'
        object_path: newCompCertS.Cells(1,9)
        action: ColumnWidth
        args: = 20
    - step:
        id: '138'
        object_path: newCompCertS.Cells(1,9)
        action: WrapText
        args: = true
    - step:
        id: '139'
        object_path: newCompCertS.Cells(1,9).Borders
        action: ColorIndex
        args: = 16
    - step:
        id: '140'
        action: Script
        object_path: '''REMOVE SHEET1'
    - step:
        id: '141'
        action: Script
        object_path: Set objWorksheet = newExcelW.Worksheets("Sheet1")
    - step:
        id: '142'
        object_path: objWorksheet
        action: Delete
    - step:
        id: '143'
        action: Script
        object_path: Set objWorksheet = Nothing
    - step:
        id: '144'
        action: Script
        object_path: '''SAVE AS'
    - step:
        id: '145'
        action: Script
        object_path: todayDate = Date()
    - step:
        id: '146'
        action: Script
        object_path: todayDate = CStr(todayDate)
    - step:
        id: '147'
        action: Script
        object_path: todayDate = Replace(todayDate, "/", "-")
    - step:
        id: '148'
        action: Script
        object_path: '''filelocation = "C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process
          Automation\Monthly Training Reports\"&todayDate&" "&filename&".xlsx"'
    - step:
        id: '149'
        action: Script
        object_path: filelocation = "C:\Temp\"&todayDate&" "&filename&".xlsx"
    - step:
        id: '150'
        action: Script
        object_path: '''filelocation = "C:\Users\svcrpabot\OneDrive - SA Power Networks\Monthly
          Training Reports\"&todayDate&" "&filename&".xlsx"'
    - step:
        id: '151'
        object_path: newExcelW
        action: SaveAs(filelocation)
    - step:
        id: '152'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '153'
        action: Script
        object_path: '''ADD TO COMPLIANCE CERTIFICATION'
    - step:
        id: '154'
        action: Script
        object_path: x = 2
    - step:
        id: '155'
        action: Script
        object_path: For i = 3 To certificationCount
    - step:
        id: '156'
        action: Script
        object_path: managerName = complianceCertS.cells(i,2).value
    - step:
        id: '157'
        action: Script
        object_path: orgName = complianceCertS.cells(i,3).value
    - step:
        id: '158'
        action: Script
        object_path: If InStr(orgName, "-") > 0 Then
    - step:
        id: '159'
        action: Script
        object_path: orgSplit = Split(orgName, " - ")
    - step:
        id: '160'
        action: Script
        object_path: orgName = orgSplit(0)
    - step:
        id: '161'
        action: Script
        object_path: End If
    - step:
        id: '162'
        action: Script
        object_path: orgUnit4 = complianceCertS.cells(i,4).value
    - step:
        id: '163'
        action: Script
        object_path: orgUnit5 = complianceCertS.cells(i,5).value
    - step:
        id: '164'
        action: Script
        object_path: personnelNo = complianceCertS.cells(i,6).value
    - step:
        id: '165'
        action: Script
        object_path: fullName = complianceCertS.cells(i,7).value
    - step:
        id: '166'
        action: Script
        object_path: authorisationDate = complianceCertS.cells(i,9).value
    - step:
        id: '167'
        action: Script
        object_path: certificationDate = complianceCertS.cells(i,10).value
    - step:
        id: '168'
        action: Script
        object_path: licenseName = complianceCertS.cells(i,13).value
    - step:
        id: '169'
        action: Script
        object_path: certificationTitle = complianceCertS.cells(i,16).value
    - step:
        id: '170'
        action: Script
        object_path: location = complianceCertS.cells(i,19).value
    - step:
        id: '171'
        action: Script
        object_path: exemptionStatus = complianceCertS.cells(i,21).value
    - step:
        id: '172'
        action: Script
        object_path: If InStr(orgUnit4, orgunit) > 0 Then
    - step:
        id: '173'
        action: Script
        object_path: If firstfiltercomparison = "manager" Then
    - step:
        id: '174'
        action: Script
        object_path: If InStr(firstfilter, managerName) > 0 or firstfilter = "" or
          firstfilter = "None" Then
    - step:
        id: '175'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '176'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '177'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '178'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '179'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '180'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '181'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '182'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '183'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '184'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '185'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '186'
        action: Script
        object_path: x = x + 1
    - step:
        id: '187'
        action: Script
        object_path: End If
    - step:
        id: '188'
        action: Script
        object_path: End If
    - step:
        id: '189'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '190'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '191'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '192'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '193'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '194'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '195'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '196'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '197'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '198'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '199'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '200'
        action: Script
        object_path: x = x + 1
    - step:
        id: '201'
        action: Script
        object_path: End If
    - step:
        id: '202'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '203'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '204'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '205'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '206'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '207'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '208'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '209'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '210'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '211'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '212'
        action: Script
        object_path: x = x + 1
    - step:
        id: '213'
        action: Script
        object_path: End If
    - step:
        id: '214'
        action: Script
        object_path: End If
    - step:
        id: '215'
        action: Script
        object_path: End If
    - step:
        id: '216'
        action: Script
        object_path: End If
    - step:
        id: '217'
        action: Script
        object_path: ElseIf firstfiltercomparison = "orgUnit" Then
    - step:
        id: '218'
        action: Script
        object_path: If InStr(firstfilter, orgUnit5) > 0 or firstfilter = "" or firstfilter
          = "None" Then
    - step:
        id: '219'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '220'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '221'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '222'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '223'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '224'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '225'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '226'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '227'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '228'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '229'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '230'
        action: Script
        object_path: x = x + 1
    - step:
        id: '231'
        action: Script
        object_path: End If
    - step:
        id: '232'
        action: Script
        object_path: End If
    - step:
        id: '233'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '234'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '235'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '236'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '237'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '238'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '239'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '240'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '241'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '242'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '243'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '244'
        action: Script
        object_path: x = x + 1
    - step:
        id: '245'
        action: Script
        object_path: End If
    - step:
        id: '246'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '247'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '248'
        object_path: newCompCertS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '249'
        object_path: newCompCertS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '250'
        object_path: newCompCertS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '251'
        object_path: newCompCertS.Cells(x,4)
        action: value
        args: = licenseName
    - step:
        id: '252'
        object_path: newCompCertS.Cells(x,5)
        action: value
        args: = certificationTitle
    - step:
        id: '253'
        object_path: newCompCertS.Cells(x,6)
        action: value
        args: = authorisationDate
    - step:
        id: '254'
        object_path: newCompCertS.Cells(x,7)
        action: value
        args: = certificationDate
    - step:
        id: '255'
        object_path: newCompCertS.Cells(x,9)
        action: value
        args: = exemptionStatus
    - step:
        id: '256'
        action: Script
        object_path: x = x + 1
    - step:
        id: '257'
        action: Script
        object_path: End If
    - step:
        id: '258'
        action: Script
        object_path: End If
    - step:
        id: '259'
        action: Script
        object_path: End If
    - step:
        id: '260'
        action: Script
        object_path: End If
    - step:
        id: '261'
        action: Script
        object_path: End If
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
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '265'
        object_path: newExcelW
        action: save
    - step:
        id: '266'
        action: Script
        object_path: '''''ADD TO COMPLIANCE CERTIFICATION'
    - step:
        id: '267'
        action: Script
        object_path: '''x = 2'
    - step:
        id: '268'
        action: Script
        object_path: '''For y = 0 To Ubound(neworgunit)'
    - step:
        id: '269'
        action: Script
        object_path: "'\tFor i = 3 To certificationCount"
    - step:
        id: '270'
        action: Script
        object_path: "'\t\tmanagerName = complianceCertS.cells(i,2).value"
    - step:
        id: '271'
        action: Script
        object_path: "'\t\torgName = complianceCertS.cells(i,3).value"
    - step:
        id: '272'
        action: Script
        object_path: "'\t\torgUnit4 = complianceCertS.cells(i,4).value"
    - step:
        id: '273'
        action: Script
        object_path: "'\t\torgUnit5 = complianceCertS.cells(i,5).value"
    - step:
        id: '274'
        action: Script
        object_path: "'\t\tpersonnelNo = complianceCertS.cells(i,6).value"
    - step:
        id: '275'
        action: Script
        object_path: "'\t\tfullName = complianceCertS.cells(i,7).value"
    - step:
        id: '276'
        action: Script
        object_path: "'\t\tauthorisationDate = complianceCertS.cells(i,9).value"
    - step:
        id: '277'
        action: Script
        object_path: "'\t\tcertificationDate = complianceCertS.cells(i,10).value"
    - step:
        id: '278'
        action: Script
        object_path: "'\t\tlicenseName = complianceCertS.cells(i,13).value"
    - step:
        id: '279'
        action: Script
        object_path: "'\t\tcertificationTitle = complianceCertS.cells(i,16).value"
    - step:
        id: '280'
        action: Script
        object_path: "'\t\tlocation = complianceCertS.cells(i,19).value"
    - step:
        id: '281'
        action: Script
        object_path: "'\t\texemptionStatus = complianceCertS.cells(i,21).value"
    - step:
        id: '282'
        action: Script
        object_path: "'\t\tIf InStr(neworgunit(y), orgUnit4) > 0 Then"
    - step:
        id: '283'
        action: Script
        object_path: "'\t\t\tIf firstfiltercomparison = \"manager\" Then"
    - step:
        id: '284'
        action: Script
        object_path: "'\t\t\t\tIf InStr(newfirstfilter(y), managerName) > 0 or newfirstfilter(y)\
          \ = \"\" or newfirstfilter(y) = \"None\" Then"
    - step:
        id: '285'
        action: Script
        object_path: "'\t\t\t\t\tIf secondfiltercomparison = \"organisationName\"\
          \ Then"
    - step:
        id: '286'
        action: Script
        object_path: "'\t\t\t\t\t\tIf InStr(newsecondfilter(y), orgName) > 0 or newsecondfilter(y)\
          \ = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '287'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf InStr(newthirdfilter(y), fullName) or newthirdfilter(y)\
          \ = \"\" or newthirdfilter(y) = \"None\" Then"
    - step:
        id: '288'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,1).value = personnelNo"
    - step:
        id: '289'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,2).value = fullName"
    - step:
        id: '290'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,3).value = managerName"
    - step:
        id: '291'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,4).value = licenseName"
    - step:
        id: '292'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,5).value = certificationTitle"
    - step:
        id: '293'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,6).value = authorisationDate"
    - step:
        id: '294'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,7).value = certificationDate"
    - step:
        id: '295'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,9).value = exemptionStatus"
    - step:
        id: '296'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '297'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '298'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '299'
        action: Script
        object_path: "'\t\t\t\t\tElseIf secondfiltercomparison = \"location\" Then"
    - step:
        id: '300'
        action: Script
        object_path: "'\t\t\t\t\t\tIf InStr(newsecondfilter(y), \"NOT\") > 0 Then"
    - step:
        id: '301'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf InStr(newsecondfilter(y), location) = 0 or\
          \ newsecondfilter(y) = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '302'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,1).value = personnelNo"
    - step:
        id: '303'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,2).value = fullName"
    - step:
        id: '304'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,3).value = managerName"
    - step:
        id: '305'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,4).value = licenseName"
    - step:
        id: '306'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,5).value = certificationTitle"
    - step:
        id: '307'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,6).value = authorisationDate"
    - step:
        id: '308'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,7).value = certificationDate"
    - step:
        id: '309'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,9).value = exemptionStatus"
    - step:
        id: '310'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '311'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '312'
        action: Script
        object_path: "'\t\t\t\t\t\tElseIf InStr(newsecondfilter(y), \"NOT\") = 0 Then"
    - step:
        id: '313'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf InStr(newsecondfilter(y), location) > 0 or\
          \ newsecondfilter(y) = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '314'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,1).value = personnelNo"
    - step:
        id: '315'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,2).value = fullName"
    - step:
        id: '316'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,3).value = managerName"
    - step:
        id: '317'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,4).value = licenseName"
    - step:
        id: '318'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,5).value = certificationTitle"
    - step:
        id: '319'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,6).value = authorisationDate"
    - step:
        id: '320'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,7).value = certificationDate"
    - step:
        id: '321'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,9).value = exemptionStatus"
    - step:
        id: '322'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '323'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '324'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '325'
        action: Script
        object_path: "'\t\t\t\t\tEnd If"
    - step:
        id: '326'
        action: Script
        object_path: "'\t\t\t\tEnd If"
    - step:
        id: '327'
        action: Script
        object_path: "'\t\t\tElseIf firstfiltercomparison = \"orgUnit\" Then"
    - step:
        id: '328'
        action: Script
        object_path: "'\t\t\t\tIf InStr(newfirstfilter(y), orgUnit5) > 0 or newfirstfilter(y)\
          \ = \"\" or newfirstfilter(y) = \"None\" Then"
    - step:
        id: '329'
        action: Script
        object_path: "'\t\t\t\t\tIf secondfiltercomparison = \"organisationName\"\
          \ Then"
    - step:
        id: '330'
        action: Script
        object_path: "'\t\t\t\t\t\tIf InStr(newsecondfilter(y), orgName) > 0 or newsecondfilter(y)\
          \ = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '331'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf InStr(newthirdfilter(y), fullName) or newthirdfilter(y)\
          \ = \"\" or newthirdfilter(y) = \"None\" Then"
    - step:
        id: '332'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,1).value = personnelNo"
    - step:
        id: '333'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,2).value = fullName"
    - step:
        id: '334'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,3).value = managerName"
    - step:
        id: '335'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,4).value = licenseName"
    - step:
        id: '336'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,5).value = certificationTitle"
    - step:
        id: '337'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,6).value = authorisationDate"
    - step:
        id: '338'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,7).value = certificationDate"
    - step:
        id: '339'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,9).value = exemptionStatus"
    - step:
        id: '340'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '341'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '342'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '343'
        action: Script
        object_path: "'\t\t\t\t\tElseIf secondfiltercomparison = \"location\" Then"
    - step:
        id: '344'
        action: Script
        object_path: "'\t\t\t\t\t\tIf InStr(newsecondfilter(y), \"NOT\") > 0 Then"
    - step:
        id: '345'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf InStr(newsecondfilter(y), location) = 0 or\
          \ newsecondfilter(y) = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '346'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,1).value = personnelNo"
    - step:
        id: '347'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,2).value = fullName"
    - step:
        id: '348'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,3).value = managerName"
    - step:
        id: '349'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,4).value = licenseName"
    - step:
        id: '350'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,5).value = certificationTitle"
    - step:
        id: '351'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,6).value = authorisationDate"
    - step:
        id: '352'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,7).value = certificationDate"
    - step:
        id: '353'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,9).value = exemptionStatus"
    - step:
        id: '354'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '355'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '356'
        action: Script
        object_path: "'\t\t\t\t\t\tElseIf InStr(newsecondfilter(y), \"NOT\") = 0 Then"
    - step:
        id: '357'
        action: Script
        object_path: "'\t\t\t\t\t\t\tIf InStr(newsecondfilter(y), location) > 0 or\
          \ newsecondfilter(y) = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '358'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,1).value = personnelNo"
    - step:
        id: '359'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,2).value = fullName"
    - step:
        id: '360'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,3).value = managerName"
    - step:
        id: '361'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,4).value = licenseName"
    - step:
        id: '362'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,5).value = certificationTitle"
    - step:
        id: '363'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,6).value = authorisationDate"
    - step:
        id: '364'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,7).value = certificationDate"
    - step:
        id: '365'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tnewCompCertS.Cells(x,9).value = exemptionStatus"
    - step:
        id: '366'
        action: Script
        object_path: "'\t\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '367'
        action: Script
        object_path: "'\t\t\t\t\t\t\tEnd If"
    - step:
        id: '368'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '369'
        action: Script
        object_path: "'\t\t\t\t\tEnd If"
    - step:
        id: '370'
        action: Script
        object_path: "'\t\t\t\tEnd If"
    - step:
        id: '371'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '372'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '373'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '374'
        action: Script
        object_path: '''Next'
    - step:
        id: '375'
        args: '"2"'
        object_path: '''Wait 2'
        action: Script
    - step:
        id: '376'
        object_path: '''newExcelW'
        action: save
    - step:
        id: '377'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '378'
        action: Script
        object_path: '''ADD TO COMPLIANCE CERTIFICATION'
    - step:
        id: '379'
        action: Script
        object_path: x = 2
    - step:
        id: '380'
        action: Script
        object_path: For i = 3 To curriculaCount
    - step:
        id: '381'
        action: Script
        object_path: managerName = complianceCurrS.cells(i,2).value
    - step:
        id: '382'
        action: Script
        object_path: orgName = complianceCurrS.cells(i,3).value
    - step:
        id: '383'
        action: Script
        object_path: If InStr(orgName, "-") > 0 Then
    - step:
        id: '384'
        action: Script
        object_path: orgSplit = Split(orgName, " - ")
    - step:
        id: '385'
        action: Script
        object_path: orgName = orgSplit(0)
    - step:
        id: '386'
        action: Script
        object_path: End If
    - step:
        id: '387'
        action: Script
        object_path: orgUnit4 = complianceCurrS.cells(i,4).value
    - step:
        id: '388'
        action: Script
        object_path: orgUnit5 = complianceCurrS.cells(i,5).value
    - step:
        id: '389'
        action: Script
        object_path: personnelNo = complianceCurrS.cells(i,6).value
    - step:
        id: '390'
        action: Script
        object_path: fullName = complianceCurrS.cells(i,7).value
    - step:
        id: '391'
        action: Script
        object_path: studentStatus = complianceCurrS.cells(i,8).value
    - step:
        id: '392'
        action: Script
        object_path: acquiredOn = complianceCurrS.cells(i,9).value
    - step:
        id: '393'
        action: Script
        object_path: curriculumName = complianceCurrS.cells(i,10).value
    - step:
        id: '394'
        action: Script
        object_path: curriculaItemName = complianceCurrS.cells(i,12).value
    - step:
        id: '395'
        action: Script
        object_path: curriculaStatus = complianceCurrS.cells(i,13).value
    - step:
        id: '396'
        action: Script
        object_path: curriculaStart = complianceCurrS.cells(i,14).value
    - step:
        id: '397'
        action: Script
        object_path: curriculaID = complianceCurrS.cells(i,15).value
    - step:
        id: '398'
        action: Script
        object_path: location = complianceCurrS.cells(i,16).value
    - step:
        id: '399'
        action: Script
        object_path: If InStr(orgunit, orgUnit4) > 0 Then
    - step:
        id: '400'
        action: Script
        object_path: If InStr(firstfilter, orgUnit5) > 0 or firstfilter = "" or firstfilter
          = "None" Then
    - step:
        id: '401'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '402'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '403'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
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
        object_path: End If
    - step:
        id: '417'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '418'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '419'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '420'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '421'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '422'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '423'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '424'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '425'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '426'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '427'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '428'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '429'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '430'
        action: Script
        object_path: x = x + 1
    - step:
        id: '431'
        action: Script
        object_path: End If
    - step:
        id: '432'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '433'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '434'
        object_path: newCompCurrS.Cells(x,1)
        action: value
        args: = personnelNo
    - step:
        id: '435'
        object_path: newCompCurrS.Cells(x,2)
        action: value
        args: = fullName
    - step:
        id: '436'
        object_path: newCompCurrS.Cells(x,3)
        action: value
        args: = managerName
    - step:
        id: '437'
        object_path: newCompCurrS.Cells(x,4)
        action: value
        args: = studentStatus
    - step:
        id: '438'
        object_path: newCompCurrS.Cells(x,5)
        action: value
        args: = acquiredOn
    - step:
        id: '439'
        object_path: newCompCurrS.Cells(x,6)
        action: value
        args: = curriculumName
    - step:
        id: '440'
        object_path: newCompCurrS.Cells(x,7)
        action: value
        args: = curriculaItemName
    - step:
        id: '441'
        object_path: newCompCurrS.Cells(x,8)
        action: value
        args: = curriculaStatus
    - step:
        id: '442'
        object_path: newCompCurrS.Cells(x,9)
        action: value
        args: = curriculaStart
    - step:
        id: '443'
        object_path: newCompCurrS.Cells(x,10)
        action: value
        args: = curriculaID
    - step:
        id: '444'
        action: Script
        object_path: x = x + 1
    - step:
        id: '445'
        action: Script
        object_path: End If
    - step:
        id: '446'
        action: Script
        object_path: End If
    - step:
        id: '447'
        action: Script
        object_path: End If
    - step:
        id: '448'
        action: Script
        object_path: End If
    - step:
        id: '449'
        action: Script
        object_path: End If
    - step:
        id: '450'
        action: Script
        object_path: Next
    - step:
        id: '451'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '452'
        action: Script
        object_path: '''''ADD TO COMPLIANCE CERTIFICATION'
    - step:
        id: '453'
        action: Script
        object_path: '''x = 2'
    - step:
        id: '454'
        action: Script
        object_path: '''For y = 0 To Ubound(neworgunit)'
    - step:
        id: '455'
        action: Script
        object_path: "'\tFor i = 3 To curriculaCount"
    - step:
        id: '456'
        action: Script
        object_path: "'\t\tmanagerName = complianceCurrS.cells(i,2).value"
    - step:
        id: '457'
        action: Script
        object_path: "'\t\torgName = complianceCurrS.cells(i,3).value"
    - step:
        id: '458'
        action: Script
        object_path: "'\t\torgUnit4 = complianceCurrS.cells(i,4).value"
    - step:
        id: '459'
        action: Script
        object_path: "'\t\torgUnit5 = complianceCurrS.cells(i,5).value"
    - step:
        id: '460'
        action: Script
        object_path: "'\t\tpersonnelNo = complianceCurrS.cells(i,6).value"
    - step:
        id: '461'
        action: Script
        object_path: "'\t\tfullName = complianceCurrS.cells(i,7).value"
    - step:
        id: '462'
        action: Script
        object_path: "'\t\tstudentStatus = complianceCurrS.cells(i,8).value"
    - step:
        id: '463'
        action: Script
        object_path: "'\t\tacquiredOn = complianceCurrS.cells(i,9).value"
    - step:
        id: '464'
        action: Script
        object_path: "'\t\tcurriculumName = complianceCurrS.cells(i,10).value"
    - step:
        id: '465'
        action: Script
        object_path: "'\t\tcurriculaItemName = complianceCurrS.cells(i,12).value"
    - step:
        id: '466'
        action: Script
        object_path: "'\t\tcurriculaStatus = complianceCurrS.cells(i,13).value"
    - step:
        id: '467'
        action: Script
        object_path: "'\t\tcurriculaStart = complianceCurrS.cells(i,14).value"
    - step:
        id: '468'
        action: Script
        object_path: "'\t\tcurriculaID = complianceCurrS.cells(i,15).value"
    - step:
        id: '469'
        action: Script
        object_path: "'\t\tlocation = complianceCurrS.cells(i,16).value"
    - step:
        id: '470'
        action: Script
        object_path: "'\t\tIf InStr(neworgunit(y), orgUnit4) > 0 Then"
    - step:
        id: '471'
        action: Script
        object_path: "'\t\t\tIf InStr(newfirstfilter(y), orgUnit5) > 0 or newfirstfilter(y)\
          \ = \"\" or newfirstfilter(y) = \"None\" Then"
    - step:
        id: '472'
        action: Script
        object_path: "'\t\t\t\tIf secondfiltercomparison = \"organisationName\" Then"
    - step:
        id: '473'
        action: Script
        object_path: "'\t\t\t\t\tIf InStr(newsecondfilter(y), orgName) > 0 or newsecondfilter(y)\
          \ = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '474'
        action: Script
        object_path: "'\t\t\t\t\t\tIf InStr(newthirdfilter(y), fullName) or newthirdfilter(y)\
          \ = \"\" or newthirdfilter(y) = \"None\" Then"
    - step:
        id: '475'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,1).value = personnelNo"
    - step:
        id: '476'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,2).value = fullName"
    - step:
        id: '477'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,3).value = managerName"
    - step:
        id: '478'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,4).value = studentStatus"
    - step:
        id: '479'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,5).value = acquiredOn"
    - step:
        id: '480'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,6).value = curriculumName"
    - step:
        id: '481'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,7).value = curriculaItemName"
    - step:
        id: '482'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,8).value = curriculaStatus"
    - step:
        id: '483'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,9).value = curriculaStart"
    - step:
        id: '484'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,10).value = curriculaID"
    - step:
        id: '485'
        action: Script
        object_path: "'\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '486'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '487'
        action: Script
        object_path: "'\t\t\t\t\tEnd If"
    - step:
        id: '488'
        action: Script
        object_path: "'\t\t\t\tElseIf secondfiltercomparison = \"location\" Then"
    - step:
        id: '489'
        action: Script
        object_path: "'\t\t\t\t\tIf InStr(newsecondfilter(y), \"NOT\") > 0 Then"
    - step:
        id: '490'
        action: Script
        object_path: "'\t\t\t\t\t\tIf InStr(newsecondfilter(y), location) = 0 or newsecondfilter(y)\
          \ = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '491'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,1).value = personnelNo"
    - step:
        id: '492'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,2).value = fullName"
    - step:
        id: '493'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,3).value = managerName"
    - step:
        id: '494'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,4).value = studentStatus"
    - step:
        id: '495'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,5).value = acquiredOn"
    - step:
        id: '496'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,6).value = curriculumName"
    - step:
        id: '497'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,7).value = curriculaItemName"
    - step:
        id: '498'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,8).value = curriculaStatus"
    - step:
        id: '499'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,9).value = curriculaStart"
    - step:
        id: '500'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,10).value = curriculaID"
    - step:
        id: '501'
        action: Script
        object_path: "'\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '502'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '503'
        action: Script
        object_path: "'\t\t\t\t\tElseIf InStr(newsecondfilter(y), \"NOT\") = 0 Then"
    - step:
        id: '504'
        action: Script
        object_path: "'\t\t\t\t\t\tIf InStr(newsecondfilter(y), location) > 0 or newsecondfilter(y)\
          \ = \"\" or newsecondfilter(y) = \"None\" Then"
    - step:
        id: '505'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,1).value = personnelNo"
    - step:
        id: '506'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,2).value = fullName"
    - step:
        id: '507'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,3).value = managerName"
    - step:
        id: '508'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,4).value = studentStatus"
    - step:
        id: '509'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,5).value = acquiredOn"
    - step:
        id: '510'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,6).value = curriculumName"
    - step:
        id: '511'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,7).value = curriculaItemName"
    - step:
        id: '512'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,8).value = curriculaStatus"
    - step:
        id: '513'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,9).value = curriculaStart"
    - step:
        id: '514'
        action: Script
        object_path: "'\t\t\t\t\t\t\tnewCompCurrS.Cells(x,10).value = curriculaID"
    - step:
        id: '515'
        action: Script
        object_path: "'\t\t\t\t\t\t\tx = x + 1"
    - step:
        id: '516'
        action: Script
        object_path: "'\t\t\t\t\t\tEnd If"
    - step:
        id: '517'
        action: Script
        object_path: "'\t\t\t\t\tEnd If"
    - step:
        id: '518'
        action: Script
        object_path: "'\t\t\t\tEnd If"
    - step:
        id: '519'
        action: Script
        object_path: "'\t\t\tEnd If"
    - step:
        id: '520'
        action: Script
        object_path: "'\t\tEnd If"
    - step:
        id: '521'
        action: Script
        object_path: "'\tNext"
    - step:
        id: '522'
        action: Script
        object_path: '''Next'
    - step:
        id: '523'
        args: '"2"'
        object_path: '''Wait 2'
        action: Script
    - step:
        id: '524'
        action: Script
        object_path: '''*********************************************************************************************************************************************************************'
    - step:
        id: '525'
        object_path: newExcelW
        action: save
    - step:
        id: '526'
        object_path: newExcelW
        action: close
    - step:
        id: '527'
        object_path: objExcel
        action: Quit
    - step:
        id: '528'
        action: Script
        object_path: Set newCompCertS = Nothing
    - step:
        id: '529'
        action: Script
        object_path: Set newCompCurrS = Nothing
    - step:
        id: '530'
        action: Script
        object_path: Set newExcelW = Nothing
    - step:
        id: '531'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '532'
        action: Script
        object_path: orgunit = "Operations Delivery Metropolitan"
    - step:
        id: '533'
        action: Script
        object_path: firstfilter = "Electrical Services"
    - step:
        id: '534'
        action: Script
        object_path: secondfilter = "Electrical Services Regional, Electrical Services
          Metro"
    - step:
        id: '535'
        action: Script
        object_path: thirdfilter = ""
    - step:
        id: '536'
        action: Script
        object_path: firstfiltercomparison = "orgUnit"
    - step:
        id: '537'
        action: Script
        object_path: secondfiltercomparison = "organisationName"
    - step:
        id: '538'
        action: Script
        object_path: For i = 3 To 10
    - step:
        id: '539'
        action: Script
        object_path: orgName = "Electrical Services Regional - 50014537"
        comment: complianceCertS.cells(i,3).value
    - step:
        id: '540'
        action: Script
        object_path: If InStr(orgName, "-") > 0 Then
    - step:
        id: '541'
        action: Script
        object_path: orgSplit = Split(orgName, " - ")
    - step:
        id: '542'
        action: Script
        object_path: orgName = orgSplit(0)
    - step:
        id: '543'
        action: Script
        object_path: End If
    - step:
        id: '544'
        action: Script
        object_path: orgUnit4 = "Operations Delivery Metropolitan"
        comment: complianceCertS.cells(i,4).value
    - step:
        id: '545'
        action: Script
        object_path: orgUnit5 = "Electrical Services"
        comment: complianceCertS.cells(i,5).value
    - step:
        id: '546'
        action: Script
        object_path: If InStr(orgUnit4, orgunit) > 0 Then
    - step:
        id: '547'
        action: Script
        object_path: If firstfiltercomparison = "manager" Then
    - step:
        id: '548'
        action: Script
        object_path: If InStr(firstfilter, managerName) > 0 or firstfilter = "" or
          firstfilter = "None" Then
    - step:
        id: '549'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '550'
        action: Script
        object_path: If InStr(secondfilter, orgName) > 0 or secondfilter = "" or secondfilter
          = "None" Then
    - step:
        id: '551'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '552'
        action: Script
        object_path: x = x + 1
    - step:
        id: '553'
        action: Script
        object_path: End If
    - step:
        id: '554'
        action: Script
        object_path: End If
    - step:
        id: '555'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '556'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '557'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '558'
        action: Script
        object_path: x = x + 1
    - step:
        id: '559'
        action: Script
        object_path: End If
    - step:
        id: '560'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '561'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '562'
        action: Script
        object_path: x = x + 1
    - step:
        id: '563'
        action: Script
        object_path: End If
    - step:
        id: '564'
        action: Script
        object_path: End If
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
        object_path: ElseIf firstfiltercomparison = "orgUnit" Then
    - step:
        id: '568'
        action: Script
        object_path: If InStr(firstfilter, orgUnit5) > 0 or firstfilter = "" or firstfilter
          = "None" Then
    - step:
        id: '569'
        action: Script
        object_path: If secondfiltercomparison = "organisationName" Then
    - step:
        id: '570'
        action: Script
        object_path: If InStr(secondfilter, orgUnit5) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '571'
        action: Script
        object_path: If InStr(thirdfilter, fullName) or thirdfilter = "" or thirdfilter
          = "None" Then
    - step:
        id: '572'
        action: Script
        object_path: x = x + 1
    - step:
        id: '573'
        action: Script
        object_path: End If
    - step:
        id: '574'
        action: Script
        object_path: End If
    - step:
        id: '575'
        action: Script
        object_path: ElseIf secondfiltercomparison = "location" Then
    - step:
        id: '576'
        action: Script
        object_path: If InStr(secondfilter, "NOT") > 0 Then
    - step:
        id: '577'
        action: Script
        object_path: If InStr(secondfilter, location) = 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '578'
        action: Script
        object_path: x = x + 1
    - step:
        id: '579'
        action: Script
        object_path: End If
    - step:
        id: '580'
        action: Script
        object_path: ElseIf InStr(secondfilter, "NOT") = 0 Then
    - step:
        id: '581'
        action: Script
        object_path: If InStr(secondfilter, location) > 0 or secondfilter = "" or
          secondfilter = "None" Then
    - step:
        id: '582'
        action: Script
        object_path: x = x + 1
    - step:
        id: '583'
        action: Script
        object_path: End If
    - step:
        id: '584'
        action: Script
        object_path: End If
    - step:
        id: '585'
        action: Script
        object_path: End If
    - step:
        id: '586'
        action: Script
        object_path: End If
    - step:
        id: '587'
        action: Script
        object_path: End If
    - step:
        id: '588'
        action: Script
        object_path: End If
    - step:
        id: '589'
        action: Script
        object_path: Next
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
