namespace: EnervenMeterTesting
operation:
  name: UploadSAPISU_Type5
  inputs:
  - mainFolderLocation: C:\Users\svcrpabot\OneDrive - SA Power Networks\Enerven Meter
      Testing\Type 5\
  sequential_action:
    gav: com.microfocus.seq:EnervenMeterTesting.UploadSAPISU_Type5:1.0.0
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
        object_path: location = Parameter("mainFolderLocation")
    - step:
        id: '2'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '3'
        action: Script
        object_path: '''FIND EACH FOLDER IN LOCATION'
    - step:
        id: '4'
        action: Script
        object_path: For Each Type5Folder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '5'
        action: Script
        object_path: If InStr(Type5Folder.Name, "Meter Test") > 0 Then
    - step:
        id: '6'
        action: Script
        object_path: '''IF SUMMARY SHEET IN FOLDER NAME'
    - step:
        id: '7'
        action: Script
        object_path: If InStr(Type5Folder.Name, "Summary Sheets") > 0 Then
    - step:
        id: '8'
        action: Script
        object_path: folderSplit = Split(Type5Folder.Name, " ")
    - step:
        id: '9'
        action: Script
        object_path: sampleLot = folderSplit(2) & " " & folderSplit(3) & " " & folderSplit(4)
    - step:
        id: '10'
        action: Script
        object_path: Set folder = objFSO.GetFolder(Type5Folder.Path)
    - step:
        id: '11'
        action: Script
        object_path: Set summaryFiles = folder.Files
    - step:
        id: '12'
        action: Script
        object_path: '''GET ALL FILES IN SUMMARY SHEET FOLDER'
    - step:
        id: '13'
        action: Script
        object_path: For Each summary in summaryFiles
    - step:
        id: '14'
        action: Script
        object_path: '''EXTRACT VARIABLES FROM FILE NAME'
    - step:
        id: '15'
        action: Script
        object_path: summarySheet = summary.Name
    - step:
        id: '16'
        action: Script
        object_path: summarySheetSplit = Split(summarySheet, " ")
    - step:
        id: '17'
        action: Script
        object_path: idSplit = Split(summarySheetSplit(6), ".")
    - step:
        id: '18'
        action: Script
        object_path: listID = idSplit(0)
    - step:
        id: '19'
        action: Script
        object_path: If summarySheetSplit(3) = "" Then
    - step:
        id: '20'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '21'
        object_path: MyEmail
        action: To
        args: = "Meteringtestdata@sapowernetworks.com.au"
    - step:
        id: '22'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '23'
        object_path: MyEmail
        action: Subject
        args: = "Enerven Meter Testing - Automation Update (Type 5)"
    - step:
        id: '24'
        object_path: 'MyEmail.TextBody = "Hi,"&vbNewLine&vbNewLine&"A test has been
          submitted with incomplete material serial information."&vbNewLine&vbNewLine&"Summary
          Sheet name: "&summarySheet&vbNewLine&"Folder location: "&Type5Folder'
        action: Name&vbNewLine&vbNewLine&"Please
        args: investigate manually and resubmit the test."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '25'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '26'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '27'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '28'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '29'
        object_path: MyEmail.AddAttachment summary
        action: Path
    - step:
        id: '30'
        action: Script
        object_path: '''ADD SUMMARY SHEET AND ATTACHMENTS TO EMAIL'
    - step:
        id: '31'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '32'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '33'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '34'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '35'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '36'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '37'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '38'
        object_path: MyEmail.AddAttachment attach
        action: Path
    - step:
        id: '39'
        action: Script
        object_path: End If
    - step:
        id: '40'
        action: Script
        object_path: Next
    - step:
        id: '41'
        action: Script
        object_path: End If
    - step:
        id: '42'
        action: Script
        object_path: End If
    - step:
        id: '43'
        action: Script
        object_path: Next
    - step:
        id: '44'
        object_path: MyEmail
        action: Send
    - step:
        id: '45'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '46'
        action: Script
        object_path: '''DELETE SUMMARY SHEET AND ATTACHMENTS'
    - step:
        id: '47'
        object_path: objFSO.DeleteFile(summary
        action: Path)
    - step:
        id: '48'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '49'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '50'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '51'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '52'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '53'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '54'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '55'
        object_path: objFSO.DeleteFile(attach
        action: Path)
    - step:
        id: '56'
        action: Script
        object_path: End If
    - step:
        id: '57'
        action: Script
        object_path: Next
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Script
        object_path: End If
    - step:
        id: '60'
        action: Script
        object_path: Next
    - step:
        id: '61'
        action: Script
        object_path: Else
    - step:
        id: '62'
        action: Script
        object_path: summaryDescription = summarySheetSplit(0) & " " & summarySheetSplit(1)
          & " " & summarySheetSplit(2) & " " & summarySheetSplit(4)
    - step:
        id: '63'
        action: Script
        object_path: materialSerial = Split(summarySheetSplit(3), "-")
    - step:
        id: '64'
        action: Script
        object_path: If Ubound(materialSerial) = 0 Then
    - step:
        id: '65'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '66'
        object_path: MyEmail
        action: To
        args: = "Meteringtestdata@sapowernetworks.com.au"
    - step:
        id: '67'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '68'
        object_path: MyEmail
        action: Subject
        args: = "Enerven Meter Testing - Automation Update (Type 5)"
    - step:
        id: '69'
        object_path: 'MyEmail.TextBody = "Hi,"&vbNewLine&vbNewLine&"A test has been
          submitted with incomplete material serial information."&vbNewLine&vbNewLine&"Summary
          Sheet name: "&summarySheet&vbNewLine&"Folder location: "&Type5Folder'
        action: Name&vbNewLine&vbNewLine&"Please
        args: investigate manually and resubmit the test."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '70'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '71'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '72'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '73'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '74'
        object_path: MyEmail.AddAttachment summary
        action: Path
    - step:
        id: '75'
        action: Script
        object_path: '''ADD SUMMARY SHEET AND ATTACHMENTS TO EMAIL'
    - step:
        id: '76'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '77'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '78'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '79'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '80'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '81'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '82'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '83'
        object_path: MyEmail.AddAttachment attach
        action: Path
    - step:
        id: '84'
        action: Script
        object_path: End If
    - step:
        id: '85'
        action: Script
        object_path: Next
    - step:
        id: '86'
        action: Script
        object_path: End If
    - step:
        id: '87'
        action: Script
        object_path: End If
    - step:
        id: '88'
        action: Script
        object_path: Next
    - step:
        id: '89'
        object_path: MyEmail
        action: Send
    - step:
        id: '90'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '91'
        action: Script
        object_path: '''DELETE SUMMARY SHEET AND ATTACHMENTS'
    - step:
        id: '92'
        object_path: objFSO.DeleteFile(summary
        action: Path)
    - step:
        id: '93'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '94'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '95'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '96'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '97'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '98'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '99'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '100'
        object_path: objFSO.DeleteFile(attach
        action: Path)
    - step:
        id: '101'
        action: Script
        object_path: End If
    - step:
        id: '102'
        action: Script
        object_path: Next
    - step:
        id: '103'
        action: Script
        object_path: End If
    - step:
        id: '104'
        action: Script
        object_path: End If
    - step:
        id: '105'
        action: Script
        object_path: Next
    - step:
        id: '106'
        action: Script
        object_path: Else
    - step:
        id: '107'
        action: Script
        object_path: meterNumber = materialSerial(0)
    - step:
        id: '108'
        action: Script
        object_path: serialNumber = materialSerial(1)
    - step:
        id: '109'
        action: Script
        object_path: '''UPLOAD SUMMARY SHEET'
    - step:
        id: '110'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIQ02"'
    - step:
        id: '111'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '112'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Material")
        action: Set
        args: meterNumber
    - step:
        id: '113'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Serial
          Number")
        action: Set
        args: serialNumber
    - step:
        id: '114'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Serial
          Number")
        action: SetFocus
    - step:
        id: '115'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '116'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").Exist(1)
          = False Then
    - step:
        id: '117'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '118'
        object_path: MyEmail
        action: To
        args: = "Meteringtestdata@sapowernetworks.com.au"
    - step:
        id: '119'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '120'
        object_path: MyEmail
        action: Subject
        args: = "Enerven Meter Testing - Automation Update (Type 5)"
    - step:
        id: '121'
        object_path: 'MyEmail.TextBody = "Hi,"&vbNewLine&vbNewLine&"The material serial
          number "&meterNumber&" "&serialNumber&" cannot be found in SAP."&vbNewLine&vbNewLine&"Summary
          Sheet name: "&summarySheet&vbNewLine&"Folder location: "&Type5Folder'
        action: Name&vbNewLine&vbNewLine&"Please
        args: investigate manually and resubmit the test."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '122'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '123'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '124'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '125'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '126'
        object_path: MyEmail.AddAttachment summary
        action: Path
    - step:
        id: '127'
        action: Script
        object_path: '''ADD SUMMARY SHEET AND ATTACHMENTS TO EMAIL'
    - step:
        id: '128'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '129'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '130'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '131'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '132'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '133'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '134'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '135'
        object_path: MyEmail.AddAttachment attach
        action: Path
    - step:
        id: '136'
        action: Script
        object_path: End If
    - step:
        id: '137'
        action: Script
        object_path: Next
    - step:
        id: '138'
        action: Script
        object_path: End If
    - step:
        id: '139'
        action: Script
        object_path: End If
    - step:
        id: '140'
        action: Script
        object_path: Next
    - step:
        id: '141'
        object_path: MyEmail
        action: Send
    - step:
        id: '142'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '143'
        action: Script
        object_path: '''DELETE SUMMARY SHEET AND ATTACHMENTS'
    - step:
        id: '144'
        object_path: objFSO.DeleteFile(summary
        action: Path)
    - step:
        id: '145'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '146'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '147'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '148'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '149'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '150'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '151'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '152'
        object_path: objFSO.DeleteFile(attach
        action: Path)
    - step:
        id: '153'
        action: Script
        object_path: End If
    - step:
        id: '154'
        action: Script
        object_path: Next
    - step:
        id: '155'
        action: Script
        object_path: End If
    - step:
        id: '156'
        action: Script
        object_path: End If
    - step:
        id: '157'
        action: Script
        object_path: Next
    - step:
        id: '158'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '159'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '160'
        action: Script
        object_path: Else
    - step:
        id: '161'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Documents"'
    - step:
        id: '162'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiToolbar("GridToolbar")
        action: PressButton
        args: '"ICON_CREATE"'
    - step:
        id: '163'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiEdit("Description")
        action: Set
        args: summaryDescription
    - step:
        id: '164'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '165'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("Directory").Set
          Type5Folder
        action: Path
    - step:
        id: '166'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("File
          Name")
        action: Set
        args: summarySheet
    - step:
        id: '167'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '168'
        action: Script
        object_path: '''FIND EACH FOLDER IN LOCATION'
    - step:
        id: '169'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '170'
        action: Script
        object_path: '''IF SAMPLE LOT NUMBER IN FOLDER NAME'
    - step:
        id: '171'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot) > 0 Then
    - step:
        id: '172'
        action: Script
        object_path: '''IF ATTACHMENT IN FOLDER NAME'
    - step:
        id: '173'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '174'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '175'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '176'
        action: Script
        object_path: '''GET ALL ATTACHMENTS'
    - step:
        id: '177'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '178'
        action: Script
        object_path: '''IF SHAREPOINT LIST ID IN ATTACHMENT NAME'
    - step:
        id: '179'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '180'
        action: Script
        object_path: '''UPLOAD ATTACHMENTS'
    - step:
        id: '181'
        action: Script
        object_path: attachmentSplit = Split(attach.Name, "ID "&listID&" ")
    - step:
        id: '182'
        action: Script
        object_path: attachmentName = attachmentSplit(1)
    - step:
        id: '183'
        action: Script
        object_path: attachmentSplit = Split(attachmentName, ".")
    - step:
        id: '184'
        action: Script
        object_path: attachmentName = attachmentSplit(0)
    - step:
        id: '185'
        action: Script
        object_path: If InStr(attachmentName, "resized-") Then
    - step:
        id: '186'
        action: Script
        object_path: attachmentName = Replace(attachmentName, "resized-", "")
    - step:
        id: '187'
        action: Script
        object_path: End If
    - step:
        id: '188'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiToolbar("GridToolbar")
        action: PressButton
        args: '"ICON_CREATE"'
    - step:
        id: '189'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiEdit("Description")
        action: Set
        args: attachmentName
    - step:
        id: '190'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '191'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("Directory").Set
          SampleLotFolder
        action: Path
    - step:
        id: '192'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("File
          Name").Set attach
        action: Name
    - step:
        id: '193'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '194'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Attachment Pop Up").Exist(1)
          Then
    - step:
        id: '195'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Attachment Pop Up").SAPGuiButton("Apply   (Enter)")
        action: Click
    - step:
        id: '196'
        action: Script
        object_path: End If
    - step:
        id: '197'
        action: Script
        object_path: End If
    - step:
        id: '198'
        action: Script
        object_path: Next
    - step:
        id: '199'
        action: Script
        object_path: End If
    - step:
        id: '200'
        action: Script
        object_path: End If
    - step:
        id: '201'
        action: Script
        object_path: Next
    - step:
        id: '202'
        action: Script
        object_path: '''SAVE MATERIAL SERIAL NUMBER CHANGES'
    - step:
        id: '203'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '204'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '205'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '206'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '207'
        object_path: MyEmail
        action: To
        args: = "Meteringtestdata@sapowernetworks.com.au"
    - step:
        id: '208'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '209'
        object_path: MyEmail
        action: Subject
        args: = "Enerven Meter Testing - Automation Update (Type 5)"
    - step:
        id: '210'
        object_path: 'MyEmail.TextBody = "Hi,"&vbNewLine&vbNewLine&"Successfully uploaded
          the test results for "&meterNumber&" "&serialNumber&"."&vbNewLine&vbNewLine&"Summary
          Sheet name: "&summarySheet&vbNewLine&"Folder location: "&Type5Folder'
        action: Name&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
        args: Automation Team"
    - step:
        id: '211'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '212'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '213'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '214'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '215'
        object_path: MyEmail.AddAttachment summary
        action: Path
    - step:
        id: '216'
        action: Script
        object_path: '''ADD SUMMARY SHEET AND ATTACHMENTS TO EMAIL'
    - step:
        id: '217'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '218'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '219'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '220'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '221'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '222'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '223'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '224'
        object_path: MyEmail.AddAttachment attach
        action: Path
    - step:
        id: '225'
        action: Script
        object_path: End If
    - step:
        id: '226'
        action: Script
        object_path: Next
    - step:
        id: '227'
        action: Script
        object_path: End If
    - step:
        id: '228'
        action: Script
        object_path: End If
    - step:
        id: '229'
        action: Script
        object_path: Next
    - step:
        id: '230'
        object_path: MyEmail
        action: Send
    - step:
        id: '231'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '232'
        action: Script
        object_path: '''DELETE SUMMARY SHEET AND ATTACHMENTS'
    - step:
        id: '233'
        object_path: objFSO.DeleteFile(summary
        action: Path)
    - step:
        id: '234'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '235'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '236'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '237'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '238'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '239'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '240'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '241'
        object_path: objFSO.DeleteFile(attach
        action: Path)
    - step:
        id: '242'
        action: Script
        object_path: End If
    - step:
        id: '243'
        action: Script
        object_path: Next
    - step:
        id: '244'
        action: Script
        object_path: End If
    - step:
        id: '245'
        action: Script
        object_path: End If
    - step:
        id: '246'
        action: Script
        object_path: Next
    - step:
        id: '247'
        action: Script
        object_path: End If
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
        object_path: Next
    - step:
        id: '251'
        action: Script
        object_path: End If
    - step:
        id: '252'
        action: Script
        object_path: ElseIf InStr(Type5Folder.Name, "Meter Inspection") > 0 Then
    - step:
        id: '253'
        action: Script
        object_path: '''IF SUMMARY SHEET IN FOLDER NAME'
    - step:
        id: '254'
        action: Script
        object_path: If InStr(Type5Folder.Name, "Summary Sheets") > 0 Then
    - step:
        id: '255'
        action: Script
        object_path: Set folder = objFSO.GetFolder(Type5Folder.Path)
    - step:
        id: '256'
        action: Script
        object_path: Set summaryFiles = folder.Files
    - step:
        id: '257'
        action: Script
        object_path: '''GET ALL FILES IN SUMMARY SHEET FOLDER'
    - step:
        id: '258'
        action: Script
        object_path: For Each summary in summaryFiles
    - step:
        id: '259'
        action: Script
        object_path: '''EXTRACT VARIABLES FROM FILE NAME'
    - step:
        id: '260'
        action: Script
        object_path: summarySheet = summary.Name
    - step:
        id: '261'
        action: Script
        object_path: summarySheetSplit = Split(summarySheet, " ")
    - step:
        id: '262'
        action: Script
        object_path: idSplit = Split(summarySheetSplit(6), ".")
    - step:
        id: '263'
        action: Script
        object_path: listID = idSplit(0)
    - step:
        id: '264'
        action: Script
        object_path: If summarySheetSplit(3) = "" Then
    - step:
        id: '265'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '266'
        object_path: MyEmail
        action: To
        args: = "Meteringtestdata@sapowernetworks.com.au"
    - step:
        id: '267'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '268'
        object_path: MyEmail
        action: Subject
        args: = "Enerven Meter Testing - Automation Update (Type 5)"
    - step:
        id: '269'
        object_path: 'MyEmail.TextBody = "Hi,"&vbNewLine&vbNewLine&"An inspection
          has been submitted with incomplete material serial information."&vbNewLine&vbNewLine&"Summary
          Sheet name: "&summarySheet&vbNewLine&"Folder location: "&Type5Folder'
        action: Name&vbNewLine&vbNewLine&"Please
        args: investigate manually and resubmit the inspection."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '270'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '271'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '272'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '273'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '274'
        object_path: MyEmail.AddAttachment summary
        action: Path
    - step:
        id: '275'
        action: Script
        object_path: '''ADD SUMMARY SHEET AND ATTACHMENTS TO EMAIL'
    - step:
        id: '276'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '277'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '278'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '279'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '280'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '281'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '282'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '283'
        object_path: MyEmail.AddAttachment attach
        action: Path
    - step:
        id: '284'
        action: Script
        object_path: End If
    - step:
        id: '285'
        action: Script
        object_path: Next
    - step:
        id: '286'
        action: Script
        object_path: End If
    - step:
        id: '287'
        action: Script
        object_path: End If
    - step:
        id: '288'
        action: Script
        object_path: Next
    - step:
        id: '289'
        object_path: MyEmail
        action: Send
    - step:
        id: '290'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '291'
        action: Script
        object_path: '''DELETE SUMMARY SHEET AND ATTACHMENTS'
    - step:
        id: '292'
        object_path: objFSO.DeleteFile(summary
        action: Path)
    - step:
        id: '293'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '294'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '295'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '296'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '297'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '298'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '299'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '300'
        object_path: objFSO.DeleteFile(attach
        action: Path)
    - step:
        id: '301'
        action: Script
        object_path: End If
    - step:
        id: '302'
        action: Script
        object_path: Next
    - step:
        id: '303'
        action: Script
        object_path: End If
    - step:
        id: '304'
        action: Script
        object_path: End If
    - step:
        id: '305'
        action: Script
        object_path: Next
    - step:
        id: '306'
        action: Script
        object_path: Else
    - step:
        id: '307'
        action: Script
        object_path: summaryDescription = summarySheetSplit(0) & " " & summarySheetSplit(1)
          & " " & summarySheetSplit(2) & " " & summarySheetSplit(4)
    - step:
        id: '308'
        action: Script
        object_path: materialSerial = Split(summarySheetSplit(3), "-")
    - step:
        id: '309'
        action: Script
        object_path: If Ubound(materialSerial) = 0 Then
    - step:
        id: '310'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '311'
        object_path: MyEmail
        action: To
        args: = "Meteringtestdata@sapowernetworks.com.au"
    - step:
        id: '312'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '313'
        object_path: MyEmail
        action: Subject
        args: = "Enerven Meter Testing - Automation Update (Type 5)"
    - step:
        id: '314'
        object_path: 'MyEmail.TextBody = "Hi,"&vbNewLine&vbNewLine&"An inspection
          has been submitted with incomplete material serial information."&vbNewLine&vbNewLine&"Summary
          Sheet name: "&summarySheet&vbNewLine&"Folder location: "&Type5Folder'
        action: Name&vbNewLine&vbNewLine&"Please
        args: investigate manually and resubmit the inspection."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '315'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '316'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '317'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '318'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '319'
        object_path: MyEmail.AddAttachment summary
        action: Path
    - step:
        id: '320'
        action: Script
        object_path: '''ADD SUMMARY SHEET AND ATTACHMENTS TO EMAIL'
    - step:
        id: '321'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '322'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '323'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '324'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '325'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '326'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '327'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '328'
        object_path: MyEmail.AddAttachment attach
        action: Path
    - step:
        id: '329'
        action: Script
        object_path: End If
    - step:
        id: '330'
        action: Script
        object_path: Next
    - step:
        id: '331'
        action: Script
        object_path: End If
    - step:
        id: '332'
        action: Script
        object_path: End If
    - step:
        id: '333'
        action: Script
        object_path: Next
    - step:
        id: '334'
        object_path: MyEmail
        action: Send
    - step:
        id: '335'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '336'
        action: Script
        object_path: '''DELETE SUMMARY SHEET AND ATTACHMENTS'
    - step:
        id: '337'
        object_path: objFSO.DeleteFile(summary
        action: Path)
    - step:
        id: '338'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '339'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '340'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '341'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '342'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '343'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '344'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '345'
        object_path: objFSO.DeleteFile(attach
        action: Path)
    - step:
        id: '346'
        action: Script
        object_path: End If
    - step:
        id: '347'
        action: Script
        object_path: Next
    - step:
        id: '348'
        action: Script
        object_path: End If
    - step:
        id: '349'
        action: Script
        object_path: End If
    - step:
        id: '350'
        action: Script
        object_path: Next
    - step:
        id: '351'
        action: Script
        object_path: Else
    - step:
        id: '352'
        action: Script
        object_path: meterNumber = materialSerial(0)
    - step:
        id: '353'
        action: Script
        object_path: serialNumber = materialSerial(1)
    - step:
        id: '354'
        action: Script
        object_path: '''UPLOAD SUMMARY SHEET'
    - step:
        id: '355'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nIQ02"'
    - step:
        id: '356'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '357'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Material")
        action: Set
        args: meterNumber
    - step:
        id: '358'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Serial
          Number")
        action: Set
        args: serialNumber
    - step:
        id: '359'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiEdit("Serial
          Number")
        action: SetFocus
    - step:
        id: '360'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '361'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").Exist(1)
          = False Then
    - step:
        id: '362'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '363'
        object_path: MyEmail
        action: To
        args: = "Meteringtestdata@sapowernetworks.com.au"
    - step:
        id: '364'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '365'
        object_path: MyEmail
        action: Subject
        args: = "Enerven Meter Testing - Automation Update (Type 5)"
    - step:
        id: '366'
        object_path: 'MyEmail.TextBody = "Hi,"&vbNewLine&vbNewLine&"The material serial
          number "&meterNumber&" "&serialNumber&" cannot be found in SAP."&vbNewLine&vbNewLine&"Summary
          Sheet name: "&summarySheet&vbNewLine&"Folder location: "&Type5Folder'
        action: Name&vbNewLine&vbNewLine&"Please
        args: investigate manually and resubmit the inspection."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"
    - step:
        id: '367'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '368'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '369'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '370'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '371'
        object_path: MyEmail.AddAttachment summary
        action: Path
    - step:
        id: '372'
        action: Script
        object_path: '''ADD SUMMARY SHEET AND ATTACHMENTS TO EMAIL'
    - step:
        id: '373'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '374'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '375'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '376'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '377'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '378'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '379'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '380'
        object_path: MyEmail.AddAttachment attach
        action: Path
    - step:
        id: '381'
        action: Script
        object_path: End If
    - step:
        id: '382'
        action: Script
        object_path: Next
    - step:
        id: '383'
        action: Script
        object_path: End If
    - step:
        id: '384'
        action: Script
        object_path: End If
    - step:
        id: '385'
        action: Script
        object_path: Next
    - step:
        id: '386'
        object_path: MyEmail
        action: Send
    - step:
        id: '387'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '388'
        action: Script
        object_path: '''DELETE SUMMARY SHEET AND ATTACHMENTS'
    - step:
        id: '389'
        object_path: objFSO.DeleteFile(summary
        action: Path)
    - step:
        id: '390'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '391'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '392'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '393'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '394'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '395'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '396'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '397'
        object_path: objFSO.DeleteFile(attach
        action: Path)
    - step:
        id: '398'
        action: Script
        object_path: End If
    - step:
        id: '399'
        action: Script
        object_path: Next
    - step:
        id: '400'
        action: Script
        object_path: End If
    - step:
        id: '401'
        action: Script
        object_path: End If
    - step:
        id: '402'
        action: Script
        object_path: Next
    - step:
        id: '403'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '404'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '405'
        action: Script
        object_path: Else
    - step:
        id: '406'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiTabStrip("TABSTRIP")
        action: Select
        args: '"Documents"'
    - step:
        id: '407'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiToolbar("GridToolbar")
        action: PressButton
        args: '"ICON_CREATE"'
    - step:
        id: '408'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiEdit("Description")
        action: Set
        args: summaryDescription
    - step:
        id: '409'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '410'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("Directory").Set
          Type5Folder
        action: Path
    - step:
        id: '411'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("File
          Name")
        action: Set
        args: summarySheet
    - step:
        id: '412'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '413'
        action: Script
        object_path: '''FIND EACH FOLDER IN LOCATION'
    - step:
        id: '414'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '415'
        action: Script
        object_path: '''IF SAMPLE LOT NUMBER IN FOLDER NAME'
    - step:
        id: '416'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot) > 0 Then
    - step:
        id: '417'
        action: Script
        object_path: '''IF ATTACHMENT IN FOLDER NAME'
    - step:
        id: '418'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '419'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '420'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '421'
        action: Script
        object_path: '''GET ALL ATTACHMENTS'
    - step:
        id: '422'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '423'
        action: Script
        object_path: '''IF SHAREPOINT LIST ID IN ATTACHMENT NAME'
    - step:
        id: '424'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '425'
        action: Script
        object_path: '''UPLOAD ATTACHMENTS'
    - step:
        id: '426'
        action: Script
        object_path: attachmentSplit = Split(attach.Name, "ID "&listID&" ")
    - step:
        id: '427'
        action: Script
        object_path: attachmentName = attachmentSplit(1)
    - step:
        id: '428'
        action: Script
        object_path: attachmentSplit = Split(attachmentName, ".")
    - step:
        id: '429'
        action: Script
        object_path: attachmentName = attachmentSplit(0)
    - step:
        id: '430'
        action: Script
        object_path: If InStr(attachmentName, "resized-") Then
    - step:
        id: '431'
        action: Script
        object_path: attachmentName = Replace(attachmentName, "resized-", "")
    - step:
        id: '432'
        action: Script
        object_path: End If
    - step:
        id: '433'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiToolbar("GridToolbar")
        action: PressButton
        args: '"ICON_CREATE"'
    - step:
        id: '434'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiEdit("Description")
        action: Set
        args: attachmentName
    - step:
        id: '435'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_3").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '436'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("Directory").Set
          SampleLotFolder
        action: Path
    - step:
        id: '437'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiEdit("File
          Name").Set attach
        action: Name
    - step:
        id: '438'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Open File").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '439'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Attachment Pop Up").Exist(1)
          Then
    - step:
        id: '440'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Attachment Pop Up").SAPGuiButton("Apply   (Enter)")
        action: Click
    - step:
        id: '441'
        action: Script
        object_path: End If
    - step:
        id: '442'
        action: Script
        object_path: End If
    - step:
        id: '443'
        action: Script
        object_path: Next
    - step:
        id: '444'
        action: Script
        object_path: End If
    - step:
        id: '445'
        action: Script
        object_path: End If
    - step:
        id: '446'
        action: Script
        object_path: Next
    - step:
        id: '447'
        action: Script
        object_path: '''SAVE MATERIAL SERIAL NUMBER CHANGES'
    - step:
        id: '448'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial_2").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '449'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '450'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Change Material Serial")
        action: SendKey
        args: ENTER
    - step:
        id: '451'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '452'
        object_path: MyEmail
        action: To
        args: = "Meteringtestdata@sapowernetworks.com.au"
    - step:
        id: '453'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '454'
        object_path: MyEmail
        action: Subject
        args: = "Enerven Meter Testing - Automation Update (Type 5)"
    - step:
        id: '455'
        object_path: 'MyEmail.TextBody = "Hi,"&vbNewLine&vbNewLine&"Successfully uploaded
          the inspection results for "&meterNumber&" "&serialNumber&"."&vbNewLine&vbNewLine&"Summary
          Sheet name: "&summarySheet&vbNewLine&"Folder location: "&Type5Folder'
        action: Name&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
        args: Automation Team"
    - step:
        id: '456'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '457'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '458'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '459'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '460'
        object_path: MyEmail.AddAttachment summary
        action: Path
    - step:
        id: '461'
        action: Script
        object_path: '''ADD SUMMARY SHEET AND ATTACHMENTS TO EMAIL'
    - step:
        id: '462'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '463'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '464'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '465'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '466'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '467'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '468'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '469'
        object_path: MyEmail.AddAttachment attach
        action: Path
    - step:
        id: '470'
        action: Script
        object_path: End If
    - step:
        id: '471'
        action: Script
        object_path: Next
    - step:
        id: '472'
        action: Script
        object_path: End If
    - step:
        id: '473'
        action: Script
        object_path: End If
    - step:
        id: '474'
        action: Script
        object_path: Next
    - step:
        id: '475'
        object_path: MyEmail
        action: Send
    - step:
        id: '476'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '477'
        action: Script
        object_path: '''DELETE SUMMARY SHEET AND ATTACHMENTS'
    - step:
        id: '478'
        object_path: objFSO.DeleteFile(summary
        action: Path)
    - step:
        id: '479'
        action: Script
        object_path: For Each SampleLotFolder In objFSO.GetFolder(location).SubFolders
    - step:
        id: '480'
        action: Script
        object_path: If InStr(SampleLotFolder.Name,sampleLot&" ") > 0 Then
    - step:
        id: '481'
        action: Script
        object_path: If InStr(SampleLotFolder.Name, "Attachments") > 0 Then
    - step:
        id: '482'
        action: Script
        object_path: Set folder = objFSO.GetFolder(SampleLotFolder.Path)
    - step:
        id: '483'
        action: Script
        object_path: Set attachmentFiles = folder.Files
    - step:
        id: '484'
        action: Script
        object_path: For Each attach in attachmentFiles
    - step:
        id: '485'
        action: Script
        object_path: If Instr(attach.Name, "ID "&listID) > 0 Then
    - step:
        id: '486'
        object_path: objFSO.DeleteFile(attach
        action: Path)
    - step:
        id: '487'
        action: Script
        object_path: End If
    - step:
        id: '488'
        action: Script
        object_path: Next
    - step:
        id: '489'
        action: Script
        object_path: End If
    - step:
        id: '490'
        action: Script
        object_path: End If
    - step:
        id: '491'
        action: Script
        object_path: Next
    - step:
        id: '492'
        action: Script
        object_path: End If
    - step:
        id: '493'
        action: Script
        object_path: End If
    - step:
        id: '494'
        action: Script
        object_path: End If
    - step:
        id: '495'
        action: Script
        object_path: Next
    - step:
        id: '496'
        action: Script
        object_path: End If
    - step:
        id: '497'
        action: Script
        object_path: End If
    - step:
        id: '498'
        action: Script
        object_path: Next
    - step:
        id: '499'
        action: Script
        object_path: Set objFSO = Nothing
  outputs:
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: SAPGuiSession
      name: Session
      properties:
      - property:
          value:
            value: ses[0]
            regular_expression: false
          name: name
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: SAPGuiSession
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: hightlight id
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: '12'
            regular_expression: false
          name: guicomponenttype
          hidden: false
          read_only: false
          type: NUMBER
      - property:
          value:
            value: /app/con[0]/ses[0]
            regular_expression: false
          name: compidstr
          hidden: true
          read_only: true
          type: STRING
      basic_identification:
        property_ref:
        - name
        - micclass
        - guicomponenttype
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay: ''
      comments: ''
      visual_relations: ''
      last_update_time: Friday, 2 September 2022 2:06:21 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: SAP Easy Access  -  User
          properties:
          - property:
              value:
                value: SESSION_MANAGER
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '100'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSMTR_NAVIGATION
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[0]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 2 September 2022 2:06:21 PM
          child_objects:
          - object:
              class: SAPGuiOKCode
              name: OKCode
              properties:
              - property:
                  value:
                    value: SAPGuiOKCode
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '35'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/tbar[0]/okcd
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Open File
          properties:
          - property:
              value:
                value: IQ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '200'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSFES
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[1]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 2 September 2022 2:06:21 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: File Name
              properties:
              - property:
                  value:
                    value: DY_FILENAME
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '32'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/ctxtDY_FILENAME
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Directory
              properties:
              - property:
                  value:
                    value: DY_PATH
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '32'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/ctxtDY_PATH
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '40'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[0]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Material Serial_3
          properties:
          - property:
              value:
                value: IQ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '300'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSPO4
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[1]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 2 September 2022 2:06:21 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Description
              properties:
              - property:
                  value:
                    value: SVALD-VALUE
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '31'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/sub:SAPLSPO4:0300/txtSVALD-VALUE[1,21]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Continue   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '40'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[0]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Material Serial_2
          properties:
          - property:
              value:
                value: IQ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '101'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMIEQ0
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[0]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 2 September 2022 2:06:21 PM
          child_objects:
          - object:
              class: SAPGuiToolbar
              name: GridToolbar
              properties:
              - property:
                  value:
                    value: shell
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '204'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: usr/tabsTABSTRIP/tabpT\06/ssubSUB_DATA:SAPLITO0:0109/subSUB_0109A:SAPLITO0:1100/subSUB_1100A:SAPLCV140:0204/subDOC_ALV:SAPLCV140:0206/cntlALV_CUST_DOC/shellcont/shell
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
          - object:
              class: SAPGuiTabStrip
              name: TABSTRIP
              properties:
              - property:
                  value:
                    value: TABSTRIP
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTabStrip
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '90'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/tabsTABSTRIP
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Save   (Ctrl+S)
              properties:
              - property:
                  value:
                    value: btn[11]
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '40'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/tbar[0]/btn[11]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Change Material Serial
          properties:
          - property:
              value:
                value: IQ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '1000'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMIEQ0
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[0]
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '21'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[0]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 2 September 2022 2:06:21 PM
          child_objects:
          - object:
              class: SAPGuiStatusBar
              name: StatusBar
              properties:
              - property:
                  value:
                    value: SAPGuiStatusBar
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '103'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/sbar
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
          - object:
              class: SAPGuiOKCode
              name: OKCode
              properties:
              - property:
                  value:
                    value: SAPGuiOKCode
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '35'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/tbar[0]/okcd
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Serial Number
              properties:
              - property:
                  value:
                    value: RISA0-SERNR
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '32'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/ctxtRISA0-SERNR
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Material
              properties:
              - property:
                  value:
                    value: RISA0-MATNR
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '32'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/ctxtRISA0-MATNR
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Attachment Pop Up
          properties:
          - property:
              value:
                value: IQ02
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '120'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSSY0
                regular_expression: false
              name: program
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: wnd[1]
                regular_expression: false
              name: name
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: SAPGuiWindow
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: hightlight id
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: '22'
                regular_expression: false
              name: guicomponenttype
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: wnd[1]
                regular_expression: false
              name: compidstr
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - transaction
            - screennumber
            - program
            - name
            - micclass
            - guicomponenttype
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Friday, 2 September 2022 2:06:21 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Apply   (Enter)
              properties:
              - property:
                  value:
                    value: btn[0]
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '40'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/tbar[0]/btn[0]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Friday, 2 September 2022 2:06:21 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
