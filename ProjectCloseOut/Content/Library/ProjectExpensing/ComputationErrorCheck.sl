namespace: ProjectExpensing
operation:
  name: ComputationErrorCheck
  inputs:
  - filePath: C:\Users\SVCRPABOT\OneDrive - SA Power Networks\Project Close Out\
  - supportFile: Project Expensing Support File.xlsm
  - email: jasmin.haas@sapowernetworks.com.au
  sequential_action:
    gav: com.microfocus.seq:ProjectExpensing.ComputationErrorCheck:1.0.0
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
        object_path: '''STEP 3.5: CHECK COMPUTATION TAB FOR ANY FORMULA ERRORS FROM
          MISSING LOOK UP VALUES'
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
        object_path: '''OPEN PROJECT EXPENSING SUPPORT FILE'
    - step:
        id: '6'
        action: Script
        object_path: Set objSupportFile = objExcel.Workbooks.open(Parameter("filePath")&Parameter("supportFile"))
    - step:
        id: '7'
        action: Script
        object_path: '''OPEN COMPUTATION TAB'
    - step:
        id: '8'
        action: Script
        object_path: Set objComputation = objSupportFile.Worksheets("Computation Tab")
    - step:
        id: '9'
        action: Script
        object_path: '''FIND BOTTOM OF THE COMPUTATION TAB'
    - step:
        id: '10'
        action: Script
        object_path: compRow = objComputation.Range("A1048576").End(-4162).Row
    - step:
        id: '11'
        action: Script
        object_path: '''SET ROW NUMBER OF COMPUTATION TAB'
    - step:
        id: '12'
        action: Script
        object_path: numberOfComputation = objComputation.usedrange.Rows.Count
    - step:
        id: '13'
        action: Script
        object_path: missingCostCentres = ""
    - step:
        id: '14'
        action: Script
        object_path: missingLabourRates = ""
    - step:
        id: '15'
        action: Script
        object_path: potentialMissingLabourRates = ""
    - step:
        id: '16'
        action: Script
        object_path: For row = 2 To compRow
    - step:
        id: '17'
        action: Script
        object_path: If VarType(objComputation.cells(row,8).value) = 10 Then
    - step:
        id: '18'
        action: Script
        object_path: If InStr(missingCostCentres,objComputation.cells(row,1).value)
          < 1  Then
    - step:
        id: '19'
        action: Script
        object_path: missingCostCentres = missingCostCentres & objComputation.cells(row,1).value
          & vbNewLine
    - step:
        id: '20'
        action: Script
        object_path: End If
    - step:
        id: '21'
        action: Script
        object_path: If InStr(potentialMissingLabourRates, objComputation.cells(row,9).value)
          < 1 or InStr(potentialMissingLabourRates,objComputation.cells(row,1).value)
          < 1 Then
    - step:
        id: '22'
        action: Script
        object_path: potentialMissingLabourRates = potentialMissingLabourRates & "New
          Cost Centre for "&objComputation.cells(row,1).value&" + _"&objComputation.cells(row,9).value
          & vbNewLine
    - step:
        id: '23'
        action: Script
        object_path: End If
    - step:
        id: '24'
        action: Script
        object_path: ElseIf VarType(objComputation.cells(row,8).value) <> 10 and VarType(objComputation.cells(row,10).value)
          = 10 Then
    - step:
        id: '25'
        action: Script
        object_path: If InStr(missingLabourRates,objComputation.cells(row,17).value)
          < 1 Then
    - step:
        id: '26'
        action: Script
        object_path: missingLabourRates = missingLabourRates & objComputation.cells(row,17).value
          & vbNewLine
    - step:
        id: '27'
        action: Script
        object_path: End If
    - step:
        id: '28'
        action: Script
        object_path: End If
    - step:
        id: '29'
        action: Script
        object_path: Next
    - step:
        id: '30'
        action: Script
        object_path: '''CLOSE SUPPORT FILE'
    - step:
        id: '31'
        object_path: objSupportFile
        action: close
    - step:
        id: '32'
        object_path: objExcel
        action: Quit
    - step:
        id: '33'
        action: Script
        object_path: '''RELEASE OBJECTS'
    - step:
        id: '34'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '35'
        action: Script
        object_path: Set objSupportFile = Nothing
    - step:
        id: '36'
        action: Script
        object_path: Set objComputation = Nothing
    - step:
        id: '37'
        action: Script
        object_path: Set objHoursPivot = Nothing
    - step:
        id: '38'
        action: Script
        object_path: costCentre = ""
    - step:
        id: '39'
        action: Script
        object_path: labourRates = ""
    - step:
        id: '40'
        action: Script
        object_path: potentialLabourRates = ""
    - step:
        id: '41'
        action: Script
        object_path: If missingCostCentres <> "" Then
    - step:
        id: '42'
        action: Script
        object_path: costCentre = "Missing Cost Centres:"&vbNewLine&missingCostCentres
    - step:
        id: '43'
        action: Script
        object_path: End If
    - step:
        id: '44'
        action: Script
        object_path: If missingLabourRates <> "" Then
    - step:
        id: '45'
        action: Script
        object_path: labourRates = "Missing Labour Rates:"&vbNewLine&missingLabourRates
    - step:
        id: '46'
        action: Script
        object_path: End If
    - step:
        id: '47'
        action: Script
        object_path: If potentialMissingLabourRates <> "" Then
    - step:
        id: '48'
        action: Script
        object_path: potentialLabourRates = "Potential Missing Labour Rates:"&vbNewLine&potentialMissingLabourRates
    - step:
        id: '49'
        action: Script
        object_path: End If
    - step:
        id: '50'
        action: Script
        object_path: If costCentre <> "" or labourRates <> "" Then
    - step:
        id: '51'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '52'
        object_path: MyEmail
        action: To
        args: = Parameter("email")
    - step:
        id: '53'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '54'
        object_path: MyEmail
        action: Subject
        args: = "Project Close Out (RPA Automation) - Missing Lookup Items"
    - step:
        id: '55'
        object_path: MyEmail
        action: TextBody
        args: = "Hi team,"&vbNewLine&vbNewLine&"Please be advised that there are missing
          items in the Project Support File lookup tabs affecting the processing of
          the projects:"&vbNewLine&vbNewLine&costCentre&vbNewLine&labourRates&vbNewLine&potentialLabourRates&vbNewLine&"This
          has stopped the automation. Please add the missing items to the lookups
          and ensure all errors have been fixed, then run 'STEP 1 PROJECT EXPENSING
          AND CLOSING - CONTINUE WITH JOURNALS' in RPA SSX."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '56'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '57'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '58'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '59'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '60'
        object_path: MyEmail
        action: Send
    - step:
        id: '61'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '62'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "Missing Cost Centres and/or Labour Rates", "Missing Cost
          Centres and/or Labour Rates"
    - step:
        id: '63'
        action: Script
        object_path: ExitTest
    - step:
        id: '64'
        action: Script
        object_path: End If
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
