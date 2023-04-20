namespace: ITAzureChargeBack
operation:
  name: sendEmail
  inputs:
  - projectManagerEmail: Edward.Rodrigo@sapowernetworks.com.au
  - projectName: informatica
  - projectManager: Edward
  - imageAttachment_forecast: C:\Users\haasj0\OneDrive - SA Power Networks (1)\ITAM
      Azure Cost Management\informatica March 2023 Graph.png
  - se_actualCost: '492.51'
  - sapCode: 80102167-0040
  - se_forecastCost: '702.66'
  - currencyConversion: '1.5'
  - capexFile: C:\Users\haasj0\OneDrive - SA Power Networks (1)\ITAM Azure Cost Management\CAPEX
      Project Azure Expenditure.xlsx
  sequential_action:
    gav: com.microfocus.seq:ITAzureChargeBack.sendEmail:1.2.0
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
        object_path: If Month(Date()) = 1 Then
    - step:
        id: '2'
        action: Script
        object_path: lastMonth = MonthName(12)
    - step:
        id: '3'
        action: Script
        object_path: Else
    - step:
        id: '4'
        action: Script
        object_path: lastMonth = MonthName(Month(Date())-1)
    - step:
        id: '5'
        action: Script
        object_path: End If
    - step:
        id: '6'
        action: Script
        object_path: currentMonth = MonthName(Month(Date()))
    - step:
        id: '7'
        action: Script
        object_path: projectName = Parameter("projectName")
    - step:
        id: '8'
        action: Script
        object_path: projectManager = Parameter("projectManager")
    - step:
        id: '9'
        action: Script
        object_path: UpdatedProjectName = MakeUpperCase(projectName)
    - step:
        id: '10'
        action: Script
        object_path: UpdatedProjectManager = MakeUpperCase(projectManager)
    - step:
        id: '11'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '12'
        object_path: MyEmail
        action: To
        args: = Parameter("projectManagerEmail")
    - step:
        id: '13'
        object_path: MyEmail
        action: Cc
        args: = "DL_ITAssetManagement@sapowernetworks.com.au"
    - step:
        id: '14'
        object_path: MyEmail
        comment: generic email adress from us, do not change
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '15'
        object_path: MyEmail
        action: Subject
        args: = UpdatedProjectName&" "&"Azure Costs for "&lastMonth
    - step:
        id: '16'
        object_path: MyEmail
        action: TextBody
        args: = "Hi "&UpdatedProjectManager&","&vbNewLine&vbNewLine&"Please see the
          detailed breakdown of the consumption of Azure resources for your project
          "&UpdatedProjectName&"."&vbNewLine&vbNewLine&"The actual costs of $"&FormatNumber((Parameter("se_actualCost")*
          Parameter("currencyConversion")),2)&" (AUD) will be journalled against your
          SAP code "&Parameter("sapCode")&" for the month of "&lastMonth&"."&vbNewLine&"Azure
          has predicted forecasts for "&currentMonth&" as $"&FormatNumber((Parameter("se_forecastCost")*Parameter("currencyConversion")),2)&"
          (AUD)."&vbNewLine&vbNewLine&"Please update your cost tracking book with
          this data."&vbNewLine&vbNewLine&"If you need further info, please do not
          hesitate to contact IT Asset Management team."&vbNewLine&vbNewLine&"Thanks"&vbNewLine&"IT
          Asset Management team"
    - step:
        id: '17'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("imageAttachment_forecast")
    - step:
        id: '18'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '19'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '20'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '21'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '22'
        object_path: MyEmail
        action: Send
    - step:
        id: '23'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '24'
        action: Script
        object_path: Set objExcel = CreateObject("Excel.Application")
    - step:
        id: '25'
        object_path: objExcel
        action: visible
        args: = true
    - step:
        id: '26'
        action: Script
        object_path: Set objWorkbook = objExcel.Workbooks.open(Parameter("capexFile"))
    - step:
        id: '27'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("Configuration")
    - step:
        id: '28'
        action: Script
        object_path: rowCount = objSheet.UsedRange.Rows.Count
    - step:
        id: '29'
        action: Script
        object_path: For r = 2 To rowCount
    - step:
        id: '30'
        action: Script
        object_path: proj = objSheet.cells(r,1).value
    - step:
        id: '31'
        action: Script
        object_path: If proj = projectName Then
    - step:
        id: '32'
        object_path: objSheet.cells(r,7)
        action: value
        args: = "Yes"
    - step:
        id: '33'
        action: Script
        object_path: Exit For
    - step:
        id: '34'
        action: Script
        object_path: End If
    - step:
        id: '35'
        action: Script
        object_path: Next
    - step:
        id: '36'
        object_path: objWorkbook
        action: save
    - step:
        id: '37'
        object_path: objWorkbook
        action: Close
    - step:
        id: '38'
        object_path: objExcel
        action: quit
    - step:
        id: '39'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '40'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '41'
        action: Script
        object_path: Set objExcel = Nothing
    - step:
        id: '42'
        action: Script
        object_path: Function MakeUpperCase(inputText)
    - step:
        id: '43'
        action: Script
        object_path: Dim arrWords, x, curWord
    - step:
        id: '44'
        action: Script
        object_path: Dim leftPart, rightPart
    - step:
        id: '45'
        action: Script
        object_path: Exclude = "of,the"
    - step:
        id: '46'
        action: Script
        object_path: arrExclude = Split ( Exclude, "," )
    - step:
        id: '47'
        action: Script
        object_path: arrWords = Split ( inputText, " " )
    - step:
        id: '48'
        action: Script
        object_path: For x=0 To UBound(arrWords)
    - step:
        id: '49'
        action: Script
        object_path: curWord = arrWords(x)
    - step:
        id: '50'
        action: Script
        object_path: If Len(curWord)>0 Then
    - step:
        id: '51'
        action: Script
        object_path: leftPart = UCase(Left(curWord, 1))
    - step:
        id: '52'
        action: Script
        object_path: If Len(curWord)>1 Then
    - step:
        id: '53'
        action: Script
        object_path: rightPart = LCase(Right(curWord, Len(curWord) - 1))
    - step:
        id: '54'
        action: Script
        object_path: For intWord = 0 to UBound(arrExclude)
    - step:
        id: '55'
        action: Script
        object_path: If curWord = arrExclude(intWord) Then
    - step:
        id: '56'
        action: Script
        object_path: leftPart = LCase(leftPart)
    - step:
        id: '57'
        action: Script
        object_path: end if
    - step:
        id: '58'
        action: Script
        object_path: Next
    - step:
        id: '59'
        action: Script
        object_path: Else
    - step:
        id: '60'
        action: Script
        object_path: rightPart = ""
    - step:
        id: '61'
        action: Script
        object_path: End If
    - step:
        id: '62'
        action: Script
        object_path: curWord = leftPart & rightPart
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        action: Script
        object_path: arrWords(x) = curWord
    - step:
        id: '65'
        action: Script
        object_path: Next
    - step:
        id: '66'
        action: Script
        object_path: MakeUpperCase = Join(arrWords, " ")
    - step:
        id: '67'
        action: Script
        object_path: Erase arrWords
    - step:
        id: '68'
        action: Script
        object_path: End Function
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
