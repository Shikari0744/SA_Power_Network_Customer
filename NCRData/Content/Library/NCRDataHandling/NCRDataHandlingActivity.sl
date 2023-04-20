namespace: NCRDataHandling
operation:
  name: NCRDataHandlingActivity
  inputs:
  - sap_user: SVCNCRDATA
  - sap_pass: paces-biu8UD
  sequential_action:
    gav: com.microfocus.seq:NCRDataHandling.NCRDataHandlingActivity:1.0.0
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
        address: https://prvqas612.utilities.etsa.net.au/p6/action/login
        browser: IE64
        close_on_exit: true
    steps:
    - step:
        id: '1'
        action: Script
        object_path: '''GET NCR DATA FROM SHAREPOINT LIST 20/3/23 2.0'
    - step:
        id: '2'
        action: Script
        object_path: '''IF ''NCR NUMBER'' COLUMN IS BLANK, ADD TO NCR REGISTER'
    - step:
        id: '3'
        action: Script
        object_path: '''UPDATE ''NCR NUMBER'' COLUMN WITH NCR NUMBER FROM REGISTER'
    - step:
        id: '4'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '5'
        action: Script
        object_path: URL = "https://saperp.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-client=410&sap-language=EN#"
    - step:
        id: '6'
        action: Script
        object_path: '''URL = "https://saperpqas.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-client=410&sap-language=EN#"'
    - step:
        id: '7'
        object_path: mySendKeys
        action: Run
        args: '"chrome -url "&URL'
    - step:
        id: '8'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '9'
        object_path: Browser("1 SAP Logon").Page("Logon").SAPEdit("User")
        action: Set
        args: Parameter("sap_user")
    - step:
        id: '10'
        object_path: Browser("1 SAP Logon").Page("Logon").SAPEdit("Password")
        action: Set
        args: Parameter("sap_pass")
    - step:
        id: '11'
        object_path: Browser("1 SAP Logon").Page("Logon").SAPButton("Log On")
        action: Click
    - step:
        id: '12'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '13'
        action: Script
        object_path: If Browser("1 Change Password").Page("Change Password").WebElement("m1-txt").Exist(2)
          Then
    - step:
        id: '14'
        action: Script
        object_path: errorMess = Browser("1 Change Password").Page("Change Password").WebElement("m1-txt").GetROProperty("innertext")
    - step:
        id: '15'
        action: Script
        object_path: If errorMess = "The password has expired and must be changed"
          Then
    - step:
        id: '16'
        object_path: Reporter
        action: ReportEvent
        args: micWarning, "SAP Account password expired", "SAP Account password expired"
    - step:
        id: '17'
        action: Script
        object_path: ExitTest
    - step:
        id: '18'
        action: Script
        object_path: End If
    - step:
        id: '19'
        action: Script
        object_path: End If
    - step:
        id: '20'
        action: Script
        object_path: If Browser("1 System Messages").Page("System Messages").SAPButton("Continue
          Emphasized").Exist(3) Then
    - step:
        id: '21'
        object_path: Browser("1 System Messages").Page("System Messages").SAPButton("Continue
          Emphasized")
        action: Click
    - step:
        id: '22'
        action: Script
        object_path: End If
    - step:
        id: '23'
        action: Script
        object_path: URL = "https://sapowernetworks.sharepoint.com/sites/SubmitanNCR/Lists/NCRs/AllItems.aspx?"
    - step:
        id: '24'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&URL'
    - step:
        id: '25'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '26'
        object_path: Browser("2 NCR List")
        action: Highlight
    - step:
        id: '27'
        action: Script
        object_path: loadCheck = ""
    - step:
        id: '28'
        action: Script
        object_path: While loadCheck = ""
    - step:
        id: '29'
        action: Wait
        args: '"10"'
        default_args: '"1"'
    - step:
        id: '30'
        action: Script
        object_path: loadCheck = Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebTable("List
          of folders, files").GetCellData(2,10)
    - step:
        id: '31'
        action: Script
        object_path: Wend
    - step:
        id: '32'
        action: Script
        object_path: ncrListRow = Browser("2 NCR List").Page("Submit NCR - NCRs -
          All").WebTable("List of folders, files").RowCount
    - step:
        id: '33'
        action: Script
        object_path: Parameter("ncrListRow") = ncrListRow
    - step:
        id: '34'
        action: Script
        object_path: completedNCR = 0
    - step:
        id: '35'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebButton("NCR
          number")
        action: Click
        snapshot: .\Snapshots\ssf19.html
        highlight_id: '10000000'
    - step:
        id: '36'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '37'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebMenu("A
          to Z Z to A Filter by")
        action: Select
        args: '"A to Z"'
        snapshot: .\Snapshots\ssf20.html
        highlight_id: '10000000'
    - step:
        id: '38'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '39'
        action: Script
        object_path: For i = 2 To ncrListRow
    - step:
        id: '40'
        action: Script
        object_path: '''GET NCR NUMBER'
    - step:
        id: '41'
        action: Script
        object_path: NCRnumber = Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebTable("List
          of folders, files").GetCellData(i,14)
    - step:
        id: '42'
        action: Script
        object_path: '''IF NCR NUMBER IS BLANK, EXTRACT ROW DETAILS'
    - step:
        id: '43'
        action: Script
        object_path: If NCRnumber = "" Then
    - step:
        id: '44'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '45'
        action: Script
        object_path: fieldContact = Browser("2 NCR List").Page("Submit NCR - NCRs
          - All").WebTable("List of folders, files").GetCellData(i,3)
    - step:
        id: '46'
        action: Script
        object_path: NCRdescription = Browser("2 NCR List").Page("Submit NCR - NCRs
          - All").WebTable("List of folders, files").GetCellData(i,4)
    - step:
        id: '47'
        action: Script
        object_path: quantity = Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebTable("List
          of folders, files").GetCellData(i,5)
    - step:
        id: '48'
        action: Script
        object_path: If InStr(quantity,",") Then
    - step:
        id: '49'
        action: Script
        object_path: quantity = Replace(quantity,",","")
    - step:
        id: '50'
        action: Script
        object_path: End If
    - step:
        id: '51'
        action: Script
        object_path: If InStr(quantity,"'") Then
    - step:
        id: '52'
        action: Script
        object_path: quantity = Replace(quantity,"'","")
    - step:
        id: '53'
        action: Script
        object_path: End If
    - step:
        id: '54'
        action: Script
        object_path: traceData = Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebTable("List
          of folders, files").GetCellData(i,6)
    - step:
        id: '55'
        action: Script
        object_path: location = Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebTable("List
          of folders, files").GetCellData(i,7)
    - step:
        id: '56'
        action: Script
        object_path: If location = "" Then
    - step:
        id: '57'
        action: Script
        object_path: location = "Angle Park - Warehouse"
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Script
        object_path: reportedBy = Browser("2 NCR List").Page("Submit NCR - NCRs -
          All").WebTable("List of folders, files").GetCellData(i,11)
    - step:
        id: '60'
        action: Script
        object_path: id = Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebTable("List
          of folders, files").GetCellData(i,15)
    - step:
        id: '61'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebTable("List
          of folders, files").ChildItem(i,2,"WebElement",0)
        action: DoubleClick
    - step:
        id: '62'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '63'
        action: Script
        object_path: itemNumber = Browser("2 NCR List").Page("Submit NCR - NCRs -
          All").WebButton("Item / Stock number").GetROProperty("innertext")
    - step:
        id: '64'
        action: Script
        object_path: attachments = Browser("2 NCR List").Page("Submit NCR - NCRs -
          All").WebButton("NCRattachments").GetROProperty("acc_name")
    - step:
        id: '65'
        action: Script
        object_path: attachments = Replace(attachments,"Attachments, ","")
    - step:
        id: '66'
        action: Script
        object_path: attachments = Replace(attachments,", press enter to edit.","")
    - step:
        id: '67'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebButton("Close")
        action: Click
    - step:
        id: '68'
        action: Script
        object_path: '''DOWNLOAD ATTACHMENTS'
    - step:
        id: '69'
        action: Script
        object_path: undownloadableAttachments = ""
    - step:
        id: '70'
        action: Script
        object_path: If attachments <> "" Then
    - step:
        id: '71'
        action: Script
        object_path: Set objRegEx = CreateObject("VBScript.RegExp")
    - step:
        id: '72'
        object_path: objRegEx
        action: Global
        args: = True
    - step:
        id: '73'
        object_path: objRegEx
        action: Pattern
        args: = "\.[\w]+, "
    - step:
        id: '74'
        action: Script
        object_path: Set temp = objRegEx.Execute(attachments)
    - step:
        id: '75'
        action: Script
        object_path: For each match in temp
    - step:
        id: '76'
        action: Script
        object_path: temp2 = replace(match.value, ", ", "|")
    - step:
        id: '77'
        action: Script
        object_path: If InStr(attachments,match.value) Then
    - step:
        id: '78'
        action: Script
        object_path: attachments = replace(attachments, match.value, temp2)
    - step:
        id: '79'
        action: Script
        object_path: End If
    - step:
        id: '80'
        action: Script
        object_path: Next
    - step:
        id: '81'
        action: Script
        object_path: Set objRegEx = Nothing
    - step:
        id: '82'
        action: Script
        object_path: Set objRegEx = CreateObject("VBScript.RegExp")
    - step:
        id: '83'
        object_path: objRegEx
        action: Global
        args: = True
    - step:
        id: '84'
        object_path: objRegEx
        action: Pattern
        args: = "\.[\w]+,"
    - step:
        id: '85'
        action: Script
        object_path: Set temp = objRegEx.Execute(attachments)
    - step:
        id: '86'
        action: Script
        object_path: For each match in temp
    - step:
        id: '87'
        action: Script
        object_path: temp2 = replace(match.value, ",", "|")
    - step:
        id: '88'
        action: Script
        object_path: If InStr(attachments,match.value) Then
    - step:
        id: '89'
        action: Script
        object_path: attachments = replace(attachments, match.value, temp2)
    - step:
        id: '90'
        action: Script
        object_path: End If
    - step:
        id: '91'
        action: Script
        object_path: Next
    - step:
        id: '92'
        action: Script
        object_path: Set objRegEx = Nothing
    - step:
        id: '93'
        action: Script
        object_path: Set mySendKeys = CreateObject("WScript.Shell")
    - step:
        id: '94'
        action: Script
        object_path: att = Split(attachments,"|")
    - step:
        id: '95'
        action: Script
        object_path: attachmentURL = "https://sapowernetworks.sharepoint.com/sites/SubmitanNCR/Lists/NCRs/DispForm.aspx?ID="&id
    - step:
        id: '96'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&attachmentURL'
    - step:
        id: '97'
        action: Script
        object_path: For each attachment1 in att
    - step:
        id: '98'
        action: Script
        object_path: If InStr(attachment1, ".msg") Then
    - step:
        id: '99'
        action: Script
        object_path: undownloadableAttachments = undownloadableAttachments & attachment1
          & ","
    - step:
        id: '100'
        action: Script
        object_path: Else
    - step:
        id: '101'
        action: Script
        object_path: attachment = Replace(attachment1,".","\.")
    - step:
        id: '102'
        action: Script
        object_path: attachment = Trim(attachment)
    - step:
        id: '103'
        action: Script
        object_path: attachment = Replace(attachment,"(","\(")
    - step:
        id: '104'
        action: Script
        object_path: attachment = Replace(attachment,")","\)")
    - step:
        id: '105'
        action: Script
        object_path: attachURL = Browser("3 NCR Info").Page("NCRs Info").Link("innertext:="&attachment).GetROProperty("href")
    - step:
        id: '106'
        action: Script
        object_path: attachURL = Replace(attachURL," ","%20")
    - step:
        id: '107'
        action: Script
        object_path: attachURL = Replace(attachURL,"?web=1","")
    - step:
        id: '108'
        action: Script
        object_path: downloadURL = "https://sapowernetworks.sharepoint.com/sites/SubmitanNCR/_layouts/download.aspx?SourceURL="&attachURL
    - step:
        id: '109'
        object_path: mySendKeys
        action: Run
        args: '"msedge -url "&downloadURL'
    - step:
        id: '110'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '111'
        action: Script
        object_path: If Browser("creationtime:=3").Exist(3) Then
    - step:
        id: '112'
        object_path: Browser("creationtime:=3")
        action: close
    - step:
        id: '113'
        action: Script
        object_path: End If
    - step:
        id: '114'
        action: Script
        object_path: "'\t\t\t\t\tIf Browser(\"creationtime:=4\").Exist(3) Then"
    - step:
        id: '115'
        action: Script
        object_path: "'\t\t\t\t\t\tBrowser(\"creationtime:=4\").close"
    - step:
        id: '116'
        action: Script
        object_path: "'\t\t\t\t\tEnd If"
    - step:
        id: '117'
        action: Script
        object_path: Call closeAttachments
    - step:
        id: '118'
        action: Script
        object_path: End If
    - step:
        id: '119'
        action: Script
        object_path: Next
    - step:
        id: '120'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '121'
        object_path: Browser("3 NCR Info")
        action: Close
    - step:
        id: '122'
        action: Script
        object_path: Set mySendKeys = Nothing
    - step:
        id: '123'
        action: Script
        object_path: End If
    - step:
        id: '124'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '125'
        action: Script
        object_path: '''ADD TO NCR REGISTER'
    - step:
        id: '126'
        object_path: Browser("1 Non Conformance Register")
        action: Highlight
    - step:
        id: '127'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPButton("New
          Entry")
        action: Click
    - step:
        id: '128'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPList("Type")
        action: Select
        args: '"NCR Materials"'
    - step:
        id: '129'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPList("NCR
          Category")
        action: Select
        args: '"Quality"'
    - step:
        id: '130'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPList("Location")
        action: Select
        args: location
    - step:
        id: '131'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPList("Functional
          Area")
        action: Select
        args: '"Field Services (FS)"'
    - step:
        id: '132'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPEdit("Quantity
          Affected")
        action: Set
        args: quantity
    - step:
        id: '133'
        action: Script
        object_path: If InStr(itemNumber," ") < 1 Then
    - step:
        id: '134'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPEdit("Material
          Number")
        action: Set
        args: itemNumber
    - step:
        id: '135'
        action: Script
        object_path: End If
    - step:
        id: '136'
        action: Script
        object_path: 'desc = "Item/Stock Number: " & itemNumber &vbNewLine&"Trace
          Data: " & traceData &vbNewLine&"Description: " & NCRdescription &vbNewLine&"Reported
          By: " & reportedBy &vbNewLine&"Field Contact: " & fieldContact &vbNewLine&"NC:
          " & id'
    - step:
        id: '137'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").WebEdit("Description")
        action: Set
        args: desc
    - step:
        id: '138'
        action: Script
        object_path: If attachments <> "" Then
    - step:
        id: '139'
        action: Script
        object_path: For each attachment1 in att
    - step:
        id: '140'
        action: Script
        object_path: If InStr(attachment1, ".msg") Then
    - step:
        id: '141'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '142'
        action: Script
        object_path: Else
    - step:
        id: '143'
        action: Script
        object_path: attachment1 = Trim(attachment1)
    - step:
        id: '144'
        action: Script
        object_path: attachment1 = Replace(attachment1,"(","{(}")
    - step:
        id: '145'
        action: Script
        object_path: attachment1 = Replace(attachment1,")","{)}")
    - step:
        id: '146'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").WebFile("Select
          Attachment")
        action: Set
        args: '"C:\Automation Downloads\"&attachment1'
    - step:
        id: '147'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '148'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPButton("Upload
          Attachment")
        action: Click
    - step:
        id: '149'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '150'
        action: Script
        object_path: "'\t\t\t\t\tSet mySendKeys = CreateObject(\"WScript.Shell\")"
    - step:
        id: '151'
        action: Script
        object_path: "'\t\t\t\t\tWhile Window(\"Google Chrome\").Dialog(\"Open\").WinEdit(\"\
          File name:\").Exist = False"
    - step:
        id: '152'
        action: Script
        object_path: "'\t\t\t\t\t\tBrowser(\"1 Non Conformance Register\").Page(\"\
          Non Conformance Register\").WebFile(\"Attachment Link\").Highlight"
    - step:
        id: '153'
        action: Script
        object_path: "'\t\t\t\t\t\tBrowser(\"1 Non Conformance Register\").Page(\"\
          Non Conformance Register\").WebFile(\"Attachment Link\").Click"
    - step:
        id: '154'
        action: Script
        object_path: "'\t\t\t\t\tWend"
    - step:
        id: '155'
        action: Script
        object_path: "'\t\t\t\t\t'mySendKeys.SendKeys \"{ENTER}\""
    - step:
        id: '156'
        action: Script
        object_path: "'\t\t\t\t\tSetting.WebPackage(\"ReplayType\") = 2"
    - step:
        id: '157'
        action: Script
        object_path: "'\t\t\t\t\tWait 1"
    - step:
        id: '158'
        action: Script
        object_path: "'\t\t\t\t\tWindow(\"Google Chrome\").Dialog(\"Open\").WinEdit(\"\
          File name:\").Set \"C:\\Automation Downloads\\\"&attachment1"
    - step:
        id: '159'
        action: Script
        object_path: "'\t\t\t\t\tWait 1"
    - step:
        id: '160'
        action: Script
        object_path: "'\t\t\t\t\tSetting.WebPackage(\"ReplayType\") = 1"
    - step:
        id: '161'
        action: Script
        object_path: "'\t\t\t\t\tmySendKeys.SendKeys \"{ENTER}\""
    - step:
        id: '162'
        action: Script
        object_path: "'\t\t\t\t\tWait 3"
    - step:
        id: '163'
        action: Script
        object_path: "'\t\t\t\t\tBrowser(\"1 Non Conformance Register\").Page(\"Non\
          \ Conformance Register\").SAPButton(\"Upload Attachment\").Click"
    - step:
        id: '164'
        action: Script
        object_path: "'\t\t\t\t\tSet mySendKeys = Nothing"
    - step:
        id: '165'
        action: Script
        object_path: End If
    - step:
        id: '166'
        action: Script
        object_path: Next
    - step:
        id: '167'
        action: Script
        object_path: End If
    - step:
        id: '168'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '169'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPButton("Save")
        action: Click
    - step:
        id: '170'
        action: Script
        object_path: completedNCR = completedNCR + 1
    - step:
        id: '171'
        action: Script
        object_path: Parameter("completedNCR") = completedNCR
    - step:
        id: '172'
        action: Script
        object_path: '''EXTRACT NCR NUMBER'
    - step:
        id: '173'
        action: Script
        object_path: NCRnumber = Browser("1 Non Conformance Register").Page("Non Conformance
          Register").WebElement("NCR Number").GetROProperty("innertext")
    - step:
        id: '174'
        action: Script
        object_path: NCRnumber = Replace(NCRnumber, "Non Conformance details saved
          - NCR No. is ", "")
    - step:
        id: '175'
        action: Script
        object_path: Parameter("lastNCR") = NCRnumber
    - step:
        id: '176'
        action: Script
        object_path: Parameter("lastID") = id
    - step:
        id: '177'
        action: Script
        object_path: If undownloadableAttachments <> "" Then
    - step:
        id: '178'
        action: Script
        object_path: Call attachmentCantDownload(id, undownloadableAttachments, NCRnumber)
    - step:
        id: '179'
        action: Script
        object_path: End If
    - step:
        id: '180'
        object_path: Browser("1 Non Conformance Register").Page("Non Conformance Register").SAPButton("Back
          to Search")
        action: Click
    - step:
        id: '181'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '182'
        action: Script
        object_path: '''UPDATE NCR NUMBER COLUMN IN SHAREPOINT LIST'
    - step:
        id: '183'
        object_path: Browser("2 NCR List")
        action: Highlight
    - step:
        id: '184'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '185'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebTable("List
          of folders, files").ChildItem(i,2,"WebElement",0)
        action: DoubleClick
    - step:
        id: '186'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '187'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebButton("Edit")
        action: Click
    - step:
        id: '188'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebEdit("NCR
          number field")
        action: Set
        args: NCRnumber
    - step:
        id: '189'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '190'
        action: Script
        object_path: If Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebButton("Save").Exist(3)
          Then
    - step:
        id: '191'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebButton("Save")
        action: Click
    - step:
        id: '192'
        action: Script
        object_path: End If
    - step:
        id: '193'
        action: Script
        object_path: If Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebButton("Close").Exist(2)
          Then
    - step:
        id: '194'
        object_path: Browser("2 NCR List").Page("Submit NCR - NCRs - All").WebButton("Close")
        action: Click
    - step:
        id: '195'
        action: Script
        object_path: End If
    - step:
        id: '196'
        action: Script
        object_path: '''DELETE ATTACHMENTS'
    - step:
        id: '197'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '198'
        action: Script
        object_path: If attachments <> "" Then
    - step:
        id: '199'
        action: Script
        object_path: For each attachment1 in att
    - step:
        id: '200'
        action: Script
        object_path: attachment1 = Trim(attachment1)
    - step:
        id: '201'
        action: Script
        object_path: If fso.FileExists("C:\Automation Downloads\"&attachment1) Then
    - step:
        id: '202'
        action: Script
        object_path: On error resume next
    - step:
        id: '203'
        object_path: fso
        action: DeleteFile("C:\Automation
        args: Downloads\"&attachment1)
    - step:
        id: '204'
        action: Script
        object_path: On error goto 0
    - step:
        id: '205'
        action: Script
        object_path: End If
    - step:
        id: '206'
        action: Script
        object_path: Next
    - step:
        id: '207'
        action: Script
        object_path: End If
    - step:
        id: '208'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '209'
        action: Script
        object_path: End If
    - step:
        id: '210'
        action: Script
        object_path: Next
    - step:
        id: '211'
        action: Script
        object_path: Parameter("completedNCR") = completedNCR
    - step:
        id: '212'
        action: Script
        object_path: Function attachmentCantDownload(id,attachment,ncr)
    - step:
        id: '213'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '214'
        object_path: MyEmail
        action: To
        args: = "Chris.Nunez@sapowernetworks.com.au"
    - step:
        id: '215'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '216'
        object_path: MyEmail
        action: Subject
        args: = "NCR Data Automation Update"
    - step:
        id: '217'
        object_path: MyEmail
        action: TextBody
        args: = "Hi Chris,"&vbNewLine&vbNewLine&"There is an NCR (ID "&id&") that
          has attachment(s) that cannot be downloaded from SharePoint."&vbNewLine&vbNewLine&"The
          attachment name is "&attachment&". Please download manually and upload to
          NCR "&ncr&"."&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT Automation Team"
    - step:
        id: '218'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '219'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '220'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '221'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '222'
        object_path: MyEmail
        action: Send
    - step:
        id: '223'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '224'
        action: Script
        object_path: End Function
    - step:
        id: '225'
        action: Script
        object_path: Function closeAttachments
    - step:
        id: '226'
        object_path: SystemUtil
        action: CloseProcessByName("excel.exe")
    - step:
        id: '227'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '228'
        object_path: SystemUtil
        action: CloseProcessByName("winword.exe")
    - step:
        id: '229'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '230'
        object_path: SystemUtil
        action: CloseProcessByName("i_view64.exe")
    - step:
        id: '231'
        action: Wait
        args: '"2"'
        default_args: '"1"'
    - step:
        id: '232'
        action: Script
        object_path: End Function
  outputs:
  - ncrListRow:
      robot: true
      value: ${ncrListRow}
  - completedNCR:
      robot: true
      value: ${completedNCR}
  - lastNCR:
      robot: true
      value: ${lastNCR}
  - lastID:
      robot: true
      value: ${lastID}
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects:
  - object:
      class: Window
      name: Google Chrome
      properties:
      - property:
          value:
            value: Non Conformance Register - Google Chrome
            regular_expression: false
          name: text
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Google Chrome
            regular_expression: false
          name: regexpwndtitle
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: Chrome_WidgetWin_1
            regular_expression: false
          name: regexpwndclass
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is owned window
          hidden: false
          read_only: false
          type: BOOL
      - property:
          value:
            value: '0'
            regular_expression: false
          name: is child window
          hidden: false
          read_only: false
          type: BOOL
      basic_identification:
        property_ref:
        - text
        - regexpwndtitle
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: Chrome_WidgetWin_1
          name: simclass
          type: STRING
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 12:20:23 PM
      child_objects:
      - object:
          class: Dialog
          name: Open
          properties:
          - property:
              value:
                value: Open
                regular_expression: false
              name: text
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '#32770'
                regular_expression: false
              name: nativeclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '-1'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
          basic_identification:
            property_ref:
            - text
            - nativeclass
            - is owned window
            - is child window
            ordinal_identifier: ''
          smart_identification: ''
          custom_replay:
            behavior:
              value: '#32770'
              name: simclass
              type: STRING
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 12:20:23 PM
          child_objects:
          - object:
              class: WinEdit
              name: 'File name:'
              properties:
              - property:
                  value:
                    value: Edit
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 'File &name:'
                    regular_expression: false
                  name: attached text
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - nativeclass
                - attached text
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Edit
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WinButton
              name: Open
              properties:
              - property:
                  value:
                    value: '&Open'
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Button
                    regular_expression: false
                  name: nativeclass
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - nativeclass
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay:
                behavior:
                  value: Button
                  name: simclass
                  type: STRING
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
  - object:
      class: Browser
      name: 3 NCR Info
      properties:
      - property:
          value:
            value: NCRs - RE2290
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks\.sharepoint\.com/sites/SubmitanNCR/Lists/NCRs/DispForm\.aspx\?ID=\d+
            regular_expression: true
          name: openurl
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: ''
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '2'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: NCRs - RE2290
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '6'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - openurl
        - micclass
        ordinal_identifier:
          value: 2
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 12:20:23 PM
      child_objects:
      - object:
          class: Page
          name: NCRs Info
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/SubmitanNCR/Lists/NCRs/DispForm.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks\.sharepoint\.com/sites/SubmitanNCR/Lists/NCRs/DispForm\.aspx\?ID=\d+
                regular_expression: true
              name: url
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: NCRs - RE2290
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '60040'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - url
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments:
            comment:
            - value: ''
              name: miccommentproperty
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 12:20:23 PM
          child_objects:
          - object:
              class: WebButton
              name: Attachments
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[11]/DIV[@role="button"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: image-7f21393b-e356-48a3-a9a9-d0d3424472f7.jpgimage-a5283687-98bb-4f8a-a142-308cf1794211.jpg
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: .
                    regular_expression: true
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ReactFieldEditor-core--display
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Attachments, image-7f21393b-e356-48a3-a9a9-d0d3424472f7.jpg,
                      image-a5283687-98bb-4f8a-a142-308cf1794211.jpg, press enter
                      to edit.
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: Link
              name: Single Attachment
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[11]/DIV[@role="button"][1]/DIV[1]/DIV[1]/DIV[1]/A[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: image-7f21393b-e356-48a3-a9a9-d0d3424472f7.jpg
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: image-7f21393b-e356-48a3-a9a9-d0d3424472f7.jpg
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: image-7f21393b-e356-48a3-a9a9-d0d3424472f7.jpg
                    regular_expression: false
                  name: innerhtml
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: A
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://sapowernetworks.sharepoint.com/sites/SubmitanNCR/Lists/NCRs/Attachments/354/image-7f21393b-e356-48a3-a9a9-d0d3424472f7.jpg?web=1
                    regular_expression: false
                  name: href
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-Link urlField_56c88ace root-83
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - innertext
                - innerhtml
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
  - object:
      class: Browser
      name: 2 NCR List
      properties:
      - property:
          value:
            value: Submit NCR - NCRs - All Items
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://sapowernetworks.sharepoint.com/sites/SubmitanNCR/Lists/NCRs/AllItems.aspx?e=3%3A32b71e288cd841f5b13422c0b99ffe89&at=9
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: ''
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '1'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Submit NCR - NCRs - All Items
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '1'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 1
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 12:20:23 PM
      child_objects:
      - object:
          class: Page
          name: Submit NCR - NCRs - All
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/SubmitanNCR/Lists/NCRs/AllItems.aspx
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://sapowernetworks.sharepoint.com/sites/SubmitanNCR/Lists/NCRs/AllItems.aspx?e=3%3A32b71e288cd841f5b13422c0b99ffe89&at=9
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Submit NCR - NCRs - All Items
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '10035'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 12:20:23 PM
          child_objects:
          - object:
              class: WebTable
              name: List of folders, files
              properties:
              - property:
                  value:
                    value: WebTable
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="grid"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebMenu
              name: A to Z Z to A Filter by
              properties:
              - property:
                  value:
                    value: WebMenu
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[3]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="menu"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: menu
                    regular_expression: false
                  name: role
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: A to Z
                    regular_expression: false
                  name: first item
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-ContextualMenu-container container-181
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - role
                - html tag
                - html id
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - name
                  - class
                  - first item
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebElement
              name: WebElement
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-DetailsRow-cell cell-185 cellUnpadded-142
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="appRoot"]/DIV[1]/DIV[2]/DIV[3]/DIV[1]/DIV[2]/DIV[2]/DIV[2]/DIV[2]/DIV[1]/DIV[@role="main"][1]/DIV[1]/DIV[1]/DIV[1]/DIV[1]/DIV[3]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="grid"][1]/DIV[@role="presentation"][2]/DIV[@role="presentation"][1]/DIV[1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/DIV[@role="presentation"][1]/DIV[1]/DIV[@role="row"][1]/DIV[@role="presentation"][1]/DIV[@role="gridcell"][13]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - acc_name
                - _xpath
                ordinal_identifier:
                  value: 2
                  type: index
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebEdit
              name: NCR number field
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[normalize-space()="NCR number"]/SPAN[1]/DIV[1]/DIV[1]/DIV[1]/INPUT[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: Enter value here
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '524288'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: TextField888
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '003716'
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-TextField-field field-390
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: NCR number, empty, field editor.
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebButton
              name: Save
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/BUTTON[@role="menuitem" and normalize-space()="Save"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-Button ms-Button--commandBar ms-CommandBarItem-link
                      root-118
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebButton
              name: NCRattachments
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Add or remove attachments
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Add or remove attachments
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ReactFieldEditor-core--display
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Attachments,.*
                    regular_expression: true
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - type
                - html tag
                - acc_name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay:
                behavior: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations:
                visual_relation: []
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebButton
              name: NCR number
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="main"]/DIV/DIV/DIV/DIV/DIV/DIV/DIV/DIV/DIV[@role="grid"]/DIV[@role="presentation"]/DIV[@role="row"]/DIV[@role="columnheader"]/DIV/SPAN[@role="button"
                      and normalize-space()="NCR number"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: NCR number
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: NCR number
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: header3-NCR_x0020_number
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-DetailsHeader-cellTitle cellTitle-136
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: NCR number
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebButton
              name: Item / Stock number
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="button" and normalize-space()="Wilson
                      500 KVA TC"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Wilson 500 KVA TC
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ReactFieldEditor-core--display
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Item / Stock number Required Field, .*
                    regular_expression: true
                  name: acc_name
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                - acc_name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebButton
              name: Edit
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/BUTTON[@role="menuitem" and normalize-space()="Edit"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: Edit
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: button
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Edit
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ms-Button ms-Button--commandBar ms-CommandBarItem-link
                      root-118
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebButton
              name: Close
              properties:
              - property:
                  value:
                    value: WebButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[@id="appRoot"]/DIV[3]/DIV[@role="presentation"][1]/DIV[4]/DIV[1]/DIV[1]/DIV[@role="dialog"][1]/BUTTON[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: submit
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: BUTTON
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: od-Panel-button od-Panel-button--close
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Close
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - value
                  - class
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: Link
              name: Single Attachment
              properties:
              - property:
                  value:
                    value: Link
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV/DIV[@role="button"]/DIV/DIV/DIV/A[normalize-space()="20211102_122248.jpg"]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: .*
                    regular_expression: true
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: 20211102_122248.jpg
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: A
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: https://sapowernetworks\.sharepoint\.com/sites/SubmitanNCR/Lists/NCRs/Attachments/355/.*
                    regular_expression: true
                  name: href
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ms-Link urlField_56c88ace root-200
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - text
                - html tag
                - href
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - text
                  - html id
                  - class
                  - name
                  - href
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
  - object:
      class: Browser
      name: 1 System Messages
      properties:
      - property:
          value:
            value: System Messages
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://saperp.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-client=410&sap-language=EN#
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Logon
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '2'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: System Messages
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '10'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 0
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 12:20:23 PM
      child_objects:
      - object:
          class: Page
          name: System Messages
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://saperp.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://saperp.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-system-login=X&sap-system-login-cookie=X&sap-contextid=SID:ANON:saperapprdm73_PRD_45:bOzqDpwFk7JsFFlDf28y2rmgRzKKqPs_Y0FELJrE-ATT
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: System Messages
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '100046'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 12:20:23 PM
          child_objects:
          - object:
              class: SAPButton
              name: Continue Emphasized
              properties:
              - property:
                  value:
                    value: SAPButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Continue Emphasized
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: disabled
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: lsButton lsButton--base urInlineMetricTop urNoUserSelect
                      urBtnRadius lsButton--active lsButton--focusable lsButton--up
                      lsButton--design-emphasized
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - class
                  - disabled
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
  - object:
      class: Browser
      name: 1 SAP Logon
      properties:
      - property:
          value:
            value: Logon
            regular_expression: false
          name: title
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: https://saperpqas.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-client=410&sap-language=EN#
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Logon
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '2'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Logon
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '10'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - title
        - micclass
        ordinal_identifier:
          value: 0
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 12:20:23 PM
      child_objects:
      - object:
          class: Page
          name: Logon
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://saperpqas.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://saperpqas.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-client=410&sap-language=EN#
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Logon
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '100046'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 12:20:23 PM
          child_objects:
          - object:
              class: SAPEdit
              name: User
              properties:
              - property:
                  value:
                    value: SAPEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: User
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: readonly
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: sap-user
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '12'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - type
                - sap attached text
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - max length
                  - readonly
                  - name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPEdit
              name: Password
              properties:
              - property:
                  value:
                    value: SAPEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: password
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Password
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: readonly
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: sap-password
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '40'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - type
                - sap attached text
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - max length
                  - readonly
                  - name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPButton
              name: Log On
              properties:
              - property:
                  value:
                    value: SAPButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Log On
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: disabled
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: lsButton lsButton--base urInlineMetricTop urNoUserSelect
                      urBtnRadius lsButton--active lsButton--focusable lsButton--up
                      lsButton--design-emphasized lsButton--default
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - class
                  - disabled
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
  - object:
      class: Browser
      name: 1 Non Conformance Register
      properties:
      - property:
          value:
            value: Non Conformance Register
            regular_expression: false
          name: title
          hidden: false
          read_only: false
          type: STRING
      - property:
          value:
            value: https://saperpqas.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-client=410&sap-language=EN#
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Non Conformance Register
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '2'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Non Conformance Register
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '11'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - title
        - micclass
        ordinal_identifier:
          value: 0
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 12:20:23 PM
      child_objects:
      - object:
          class: Page
          name: Non Conformance Register
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://saperpqas.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://saperpqas.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-client=410&sap-language=EN#
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Non Conformance Register
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '110046'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 12:20:23 PM
          child_objects:
          - object:
              class: WebFile
              name: Select Attachment
              properties:
              - property:
                  value:
                    value: WebFile
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR/TD/TABLE[@role="group"]/TBODY/TR/TD/DIV/TABLE[@role="presentation"]/TBODY/TR/TD/DIV[@role="presentation"]/DIV/TABLE[@role="presentation"]/TBODY/TR[normalize-space()="Upload
                      Attachment"]/TD[1]/FORM[1]/INPUT[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: file
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '<input ct="FU" lsdata="{&quot;7&quot;:&quot;ONSUBMIT&quot;}"
                      lsevents="{&quot;Change&quot;:[{&quot;ResponseData&quot;:&quot;delta&quot;,&quot;EnqueueCardinality&quot;:&quot;single&quot;},{}]}"
                      id="WD026D" type="file" tabindex="0" ti="0" size="0" name="WD026D"
                      class="lsFileupload__input urBorderBox urUpld" style="background-image:
                      none;">'
                    regular_expression: false
                  name: outerhtml
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WD026D
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WD026D
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: lsFileupload__input urBorderBox urUpld lsEdFieldFocus
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - outerhtml
                - html tag
                - class
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - class
                  - default value
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebFile
              name: Attachment Link
              properties:
              - property:
                  value:
                    value: WebFile
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR/TD/TABLE[@role="group"]/TBODY/TR/TD/DIV/TABLE[@role="presentation"]/TBODY/TR/TD/DIV[@role="presentation"]/DIV/TABLE[@role="presentation"]/TBODY/TR[normalize-space()="Upload
                      Attachment"]/TD[1]/FORM[1]/INPUT[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: file
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WD026F
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WD026F
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: lsFileupload__input urBorderBox urUpld
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - html tag
                - class
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - type
                  - html id
                  - class
                  - visible
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebElement
              name: NCR Number
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Non Conformance details saved - NCR No\. is [+0-9]{6}
                    regular_expression: true
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: DIV
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WD02A8-text
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: lsMSGText urTxtColor
                    regular_expression: false
                  name: class
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR[3]/TD[1]/DIV[1]/DIV[1]/DIV[1]/DIV[@role="presentation"][1]/DIV[1]/TABLE[@role="presentation"][1]/TBODY[1]/TR[1]/TD[1]/DIV[1]/DIV[@role="region"][1]/DIV[@role="list"][1]/DIV[@role="listitem"][2]/DIV[2]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - class
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments:
                comment:
                - value: ''
                  name: miccommentproperty
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: WebEdit
              name: Description
              properties:
              - property:
                  value:
                    value: WebEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //TR/TD/TABLE[@role="group"]/TBODY/TR/TD/DIV/TABLE[@role="presentation"]/TBODY/TR[normalize-space()="Description"]/TD[2]/DIV[1]/TEXTAREA[1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: textarea
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '5'
                    regular_expression: false
                  name: rows
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: placeholder
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: WD0264
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: TEXTAREA
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: WD0264
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: lsTextEdit lsTextEdit--overflow-auto
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Description
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - _xpath
                - type
                - name
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - type
                  - html tag
                optional_filter:
                  property_ref:
                  - name
                  - html id
                  - max length
                  - default value
                  - class
                  - rows
                  - placeholder
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay:
                behavior: ''
              comments: ''
              visual_relations:
                visual_relation: []
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPList
              name: Type
              properties:
              - property:
                  value:
                    value: SAPList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Type
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: all items
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - sap attached text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - items count
                  - default value
                  - all items
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPList
              name: NCR Category
              properties:
              - property:
                  value:
                    value: SAPList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: NCR Category
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: all items
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - sap attached text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - items count
                  - default value
                  - all items
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPList
              name: Location
              properties:
              - property:
                  value:
                    value: SAPList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Location
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: all items
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - sap attached text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - items count
                  - default value
                  - all items
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPList
              name: Functional Area
              properties:
              - property:
                  value:
                    value: SAPList
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Functional Area
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: items count
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: INPUT
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: default value
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: all items
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - sap attached text
                - html tag
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - items count
                  - default value
                  - all items
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPEdit
              name: Quantity Affected
              properties:
              - property:
                  value:
                    value: SAPEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Quantity Affected
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: readonly
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: WD025D
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '4'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - type
                - sap attached text
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - max length
                  - readonly
                  - name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPEdit
              name: Material Number
              properties:
              - property:
                  value:
                    value: SAPEdit
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: text
                    regular_expression: false
                  name: type
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: Material Number
                    regular_expression: false
                  name: sap attached text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: readonly
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: WD0250
                    regular_expression: false
                  name: name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '40'
                    regular_expression: false
                  name: max length
                  hidden: true
                  read_only: true
                  type: NUMBER
              basic_identification:
                property_ref:
                - micclass
                - type
                - sap attached text
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - max length
                  - readonly
                  - name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPButton
              name: Upload Attachment
              properties:
              - property:
                  value:
                    value: SAPButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Upload Attachment
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: disabled
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: lsButton lsButton--base urInlineMetricTop urNoUserSelect
                      urBtnRadius lsButton--active lsButton--focusable lsButton--up
                      lsButton--design-standard
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - class
                  - disabled
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPButton
              name: Save
              properties:
              - property:
                  value:
                    value: SAPButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Save
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: disabled
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: lsButton lsButton--base urInlineMetricTop urNoUserSelect
                      urBtnRadius lsButton--active lsButton--focusable lsButton--up
                      lsButton--design-standard
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - class
                  - disabled
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPButton
              name: New Entry
              properties:
              - property:
                  value:
                    value: SAPButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: New Entry
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: disabled
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: lsButton lsButton--base urInlineMetricTop urNoUserSelect
                      urBtnRadius lsButton--useintoolbar lsButton--toolbar-image lsButton--active
                      lsButton--focusable lsButton--up lsButton--design-standard
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - class
                  - disabled
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
          - object:
              class: SAPButton
              name: Back to Search
              properties:
              - property:
                  value:
                    value: SAPButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: Back to Search
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: '0'
                    regular_expression: false
                  name: disabled
                  hidden: true
                  read_only: true
                  type: NUMBER
              - property:
                  value:
                    value: lsButton lsButton--base urInlineMetricTop urNoUserSelect
                      urBtnRadius lsButton--active lsButton--focusable lsButton--up
                      lsButton--design-previous
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - name
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                optional_filter:
                  property_ref:
                  - class
                  - disabled
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
  - object:
      class: Browser
      name: 1 Change Password
      properties:
      - property:
          value:
            value: Change Password
            regular_expression: false
          name: title
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: https://saperp.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled&sap-client=410&sap-language=EN#
            regular_expression: false
          name: openurl
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Logon
            regular_expression: false
          name: opentitle
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '0'
            regular_expression: false
          name: openedbytestingtool
          hidden: true
          read_only: true
          type: BOOL
      - property:
          value:
            value: '2'
            regular_expression: false
          name: number of tabs
          hidden: true
          read_only: true
          type: NUMBER
      - property:
          value:
            value: Change Password
            regular_expression: false
          name: name
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: Browser
            regular_expression: false
          name: micclass
          hidden: true
          read_only: true
          type: STRING
      - property:
          value:
            value: '10'
            regular_expression: false
          name: browserindex
          hidden: true
          read_only: true
          type: I2
      basic_identification:
        property_ref:
        - micclass
        ordinal_identifier:
          value: 0
          type: creationtime
      smart_identification:
        base_filter:
          property_ref:
          - micclass
        optional_filter:
          property_ref:
          - name
          - title
          - openurl
          - opentitle
          - openedbytestingtool
          - number of tabs
        algorithm: Mercury.TolerantPriority
        active: true
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 3 April 2023 12:20:23 PM
      child_objects:
      - object:
          class: Page
          name: Change Password
          properties:
          - property:
              value:
                value: ''
                regular_expression: false
              name: user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: user input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://saperp.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr
                regular_expression: false
              name: url without form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: https://saperp.sapowernetworks.com.au/sap/bc/webdynpro/etsa/ncr?saml2=disabled
                regular_expression: false
              name: url
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Change Password
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in post data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: non user-input in get data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Page
                regular_expression: false
              name: micclass
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: '100046'
                regular_expression: false
              name: index
              hidden: true
              read_only: true
              type: NUMBER
          - property:
              value:
                value: ''
                regular_expression: false
              name: form data
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: document size
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: ''
                regular_expression: false
              name: all data in get method
              hidden: true
              read_only: true
              type: STRING
          basic_identification:
            property_ref:
            - micclass
            ordinal_identifier: ''
          smart_identification:
            base_filter:
              property_ref:
              - micclass
            optional_filter:
              property_ref:
              - title
              - url
            algorithm: Mercury.TolerantPriority
            active: true
          custom_replay: ''
          comments: ''
          visual_relations: ''
          last_update_time: Monday, 3 April 2023 12:20:23 PM
          child_objects:
          - object:
              class: WebElement
              name: m1-txt
              properties:
              - property:
                  value:
                    value: '-1'
                    regular_expression: false
                  name: visible
                  hidden: true
                  read_only: true
                  type: BOOL
              - property:
                  value:
                    value: WebElement
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: The password has expired and must be changed
                    regular_expression: false
                  name: innertext
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SPAN
                    regular_expression: false
                  name: html tag
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: m1-txt
                    regular_expression: false
                  name: html id
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: lsMessageBar__text
                    regular_expression: false
                  name: class
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: ''
                    regular_expression: false
                  name: acc_name
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: //DIV[1]/DIV[1]/TABLE[@role="presentation"][1]/TBODY[1]/TR[1]/TD[1]/DIV[@role="note"][1]/SPAN[@role="presentation"][1]
                    regular_expression: false
                  name: _xpath
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - micclass
                - innertext
                - html tag
                - _xpath
                ordinal_identifier: ''
              smart_identification:
                base_filter:
                  property_ref:
                  - micclass
                  - html tag
                optional_filter:
                  property_ref:
                  - html id
                  - class
                  - innertext
                  - visible
                  - acc_name
                algorithm: Mercury.TolerantPriority
                active: true
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 3 April 2023 12:20:23 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
