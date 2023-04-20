namespace: HREmployeeFileSubmission
operation:
  name: TriggerMyHRRequest
  inputs:
  - environment: dev
  - customeremail: jasmin.haas@sapowernetworks.com.au
  - summary: 0320293_Gallina_Adrian_SecondmentExtension_504272_03.02.2024
  - typeofchange: Secondment
  - detail: 0320293_Gallina_Adrian_SecondmentExtension_504272_03.02.2024 combined
      AbodeSign and PageUp forms
  - attachment: C:\Users\haasj0\OneDrive - SA Power Networks (1)\HR Employee File
      Submission\0320293_Gallina_Adrian_SecondmentExtension_504272_03.02.2024  Combined.pdf
  - subject: 0320293_Gallina_Adrian_SecondmentExtension_504272_03.02.2024
  sequential_action:
    gav: com.microfocus.seq:HREmployeeFileSubmission.TriggerMyHRRequest:1.0.0
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
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '2'
        action: Script
        object_path: If Parameter("environment") = UCase("PROD") Then
    - step:
        id: '3'
        action: Script
        object_path: toEmail = "platform1@sapowernetworks.com.au"
    - step:
        id: '4'
        action: Script
        object_path: Else
    - step:
        id: '5'
        action: Script
        object_path: toEmail = "platform1dev@sapowernetworks.com.au,jasmin.haas@sapowernetworks.com.au"
    - step:
        id: '6'
        action: Script
        object_path: End If
    - step:
        id: '7'
        object_path: MyEmail
        action: To
        args: = toEmail
    - step:
        id: '8'
        object_path: MyEmail
        action: From
        args: = "RPAtoSNow@sapowernetworks.com.au"
    - step:
        id: '9'
        object_path: MyEmail
        action: Subject
        args: '= "RPA HR Employee File Payroll Submission: " & Parameter("subject")'
    - step:
        id: '10'
        object_path: MyEmail
        action: TextBody
        args: '= "CUSTOMER: " & Parameter("customeremail") & " CUSTEND" &vbNewLine&vbNewLine&
          "SUMMARY: " & Parameter("summary") & " SUMMEND" &vbNewLine&vbNewLine& "TYPE
          OF CHANGE: " & Parameter("typeofchange") & " TYPEEND" &vbNewLine&vbNewLine&
          "DETAIL: " & Parameter("detail") & " DETAEND"'
    - step:
        id: '11'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("attachment")
    - step:
        id: '12'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '13'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '14'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '15'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '16'
        object_path: MyEmail
        action: Send
    - step:
        id: '17'
        action: Script
        object_path: Set MyEmail = Nothing
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
