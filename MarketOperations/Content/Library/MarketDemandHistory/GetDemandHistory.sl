namespace: MarketDemandHistory
operation:
  name: GetDemandHistory
  inputs:
  - location: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process Automation\Market
      Demand History to Retailers\
  sequential_action:
    gav: com.microfocus.seq:MarketDemandHistory.GetDemandHistory:1.0.0
    skills:
    - SAP
    - SAPWebExt
    - Web
    - WPF
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
        object_path: location = Parameter("location")
    - step:
        id: '2'
        action: Script
        object_path: textfile = location&"Market Demand History Emails To Be Sent
          "&Replace(FormatDateTime(now(),2),"/","") &" "& Replace(FormatDateTime(now(),3),":","")&".txt"
    - step:
        id: '3'
        action: Script
        object_path: Parameter("emailLogTextFile") = Replace(textfile,"\","/")
    - step:
        id: '4'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Maximize
    - step:
        id: '5'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nEMMACL"'
    - step:
        id: '6'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '7'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '8'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List")
        action: Highlight
    - step:
        id: '9'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("Clarif.
          Case Category")
        action: Set
        args: '"BI96"'
    - step:
        id: '10'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("Processing
          Status")
        action: Set
        args: '"1"'
    - step:
        id: '11'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("to")
        action: Set
        args: '"1"'
    - step:
        id: '12'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("Maximum
          No. of Hits")
        action: Set
        args: '""'
    - step:
        id: '13'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiEdit("Autom.
          Update Up to Max.")
        action: Set
        args: '""'
    - step:
        id: '14'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '15'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Clarification Case
          List_2").SAPGuiGrid("GridViewCtrl").Exist(1) Then
    - step:
        id: '16'
        action: Script
        object_path: newBpem = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '17'
        action: Script
        object_path: Else
    - step:
        id: '18'
        action: Script
        object_path: newBpem = 0
    - step:
        id: '19'
        action: Script
        object_path: End If
    - step:
        id: '20'
        action: Script
        object_path: If newBpem > 0 Then
    - step:
        id: '21'
        action: Script
        object_path: completedB = 0
    - step:
        id: '22'
        action: Script
        object_path: For b = 1 To newBpem
    - step:
        id: '23'
        action: Script
        object_path: nmi = ""
    - step:
        id: '24'
        action: Script
        object_path: retailer = ""
    - step:
        id: '25'
        action: Script
        object_path: frmp = ""
    - step:
        id: '26'
        action: Script
        object_path: retailerEmail = ""
    - step:
        id: '27'
        action: Script
        object_path: fileName = ""
    - step:
        id: '28'
        action: Script
        object_path: caseID = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").GetCellData(b, "Case")
    - step:
        id: '29'
        action: Script
        object_path: caseCategory = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").GetCellData(b, "Clarif. Case Category")
    - step:
        id: '30'
        action: Script
        object_path: caseStatus = SAPGuiSession("Session").SAPGuiWindow("Clarification
          Case List_2").SAPGuiGrid("GridViewCtrl").GetCellData(b, "Status")
    - step:
        id: '31'
        action: Script
        object_path: nmi = SAPGuiSession("Session").SAPGuiWindow("Clarification Case
          List_2").SAPGuiGrid("GridViewCtrl").GetCellData(b, "NMI")
    - step:
        id: '32'
        action: Script
        object_path: If caseCategory = "BI96" and caseStatus = "New" Then
    - step:
        id: '33'
        action: Script
        object_path: flag = False
    - step:
        id: '34'
        action: Script
        object_path: flagO = false
    - step:
        id: '35'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Clarification Case List_2").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: b, "Case"
    - step:
        id: '36'
        action: Script
        object_path: objects = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '37'
        action: Script
        object_path: For o = 1 To objects
    - step:
        id: '38'
        action: Script
        object_path: shortDesc = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(o,
          "Short Description")
    - step:
        id: '39'
        action: Script
        object_path: If shortDesc = "Utility Installation" Then
    - step:
        id: '40'
        action: Script
        object_path: installation = SAPGuiSession("Session").SAPGuiWindow("Display
          Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(o, "Key")
    - step:
        id: '41'
        action: Script
        object_path: ElseIf shortDesc = "ISU Service Provider" Then
    - step:
        id: '42'
        action: Script
        object_path: frmp = SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl").GetCellData(o,
          "Key")
    - step:
        id: '43'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiGrid("GridViewCtrl")
        action: ClickCell
        args: o, "Key"
    - step:
        id: '44'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Provider").SAPGuiEdit("Business
          Partner")
        action: SetFocus
    - step:
        id: '45'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Provider")
        action: SendKey
        args: F2
    - step:
        id: '46'
        action: Script
        object_path: retailer = SAPGuiSession("Session").SAPGuiWindow("Display Organization:").SAPGuiEdit("Name").GetROProperty("value")
    - step:
        id: '47'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Organization:").SAPGuiButton("Other
          E-Mail Addresses")
        action: Click
    - step:
        id: '48'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Internet mail").SAPGuiTable("SAPLSZA6T_CONTROL6").Exist(3)
          Then
    - step:
        id: '49'
        action: Script
        object_path: emails = SAPGuiSession("Session").SAPGuiWindow("Display Internet
          mail").SAPGuiTable("SAPLSZA6T_CONTROL6").RowCount
    - step:
        id: '50'
        action: Script
        object_path: For e = 1 To emails
    - step:
        id: '51'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Display Internet mail").SAPGuiTable("SAPLSZA6T_CONTROL6").ValidRow(e)
          Then
    - step:
        id: '52'
        action: Script
        object_path: emailNote = SAPGuiSession("Session").SAPGuiWindow("Display Internet
          mail").SAPGuiTable("SAPLSZA6T_CONTROL6").GetCellData(e, "Notes")
    - step:
        id: '53'
        action: Script
        object_path: emailValid = SAPGuiSession("Session").SAPGuiWindow("Display Internet
          mail").SAPGuiTable("SAPLSZA6T_CONTROL6").GetCellData(e, "Valid To")
    - step:
        id: '54'
        action: Script
        object_path: If emailNote = "Demand History email" and emailValid = "31.12.9999"
          Then
    - step:
        id: '55'
        action: Script
        object_path: retailerEmail = SAPGuiSession("Session").SAPGuiWindow("Display
          Internet mail").SAPGuiTable("SAPLSZA6T_CONTROL6").GetCellData(e, "E-Mail
          Address")
    - step:
        id: '56'
        action: Script
        object_path: Exit For
    - step:
        id: '57'
        action: Script
        object_path: End If
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Script
        object_path: Next
    - step:
        id: '60'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Internet mail").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '61'
        action: Script
        object_path: Else
    - step:
        id: '62'
        action: Script
        object_path: retailerEmail = ""
    - step:
        id: '63'
        action: Script
        object_path: End If
    - step:
        id: '64'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Organization:").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '65'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Service Provider").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '66'
        action: Script
        object_path: End If
    - step:
        id: '67'
        action: Script
        object_path: Next
    - step:
        id: '68'
        action: Script
        object_path: If frmp = "" Then
    - step:
        id: '69'
        action: Script
        object_path: Call SendEmailNoFRMP(nmi, caseID)
    - step:
        id: '70'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '71'
        action: Script
        object_path: ElseIf retailerEmail <> "" Then
    - step:
        id: '72'
        action: Script
        object_path: fileName = CreateDemandHistoryExcel(location, nmi, retailer)
    - step:
        id: '73'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/oES32"'
    - step:
        id: '74'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification")
        action: SendKey
        args: ENTER
    - step:
        id: '75'
        action: Script
        object_path: While SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:").SAPGuiEdit("Installation").Exist(3)
          = False
    - step:
        id: '76'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '77'
        action: Script
        object_path: Wend
    - step:
        id: '78'
        action: Wait
        args: '"5"'
        default_args: '"1"'
    - step:
        id: '79'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:").SAPGuiEdit("Installation")
        action: Set
        args: installation
    - step:
        id: '80'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:")
        action: SendKey
        args: ENTER
    - step:
        id: '81'
        action: Script
        object_path: If SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_2").SAPGuiButton("Facts").Exist(1)
          Then
    - step:
        id: '82'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_2").SAPGuiButton("Facts")
        action: Click
    - step:
        id: '83'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiButton("Display
          Mode")
        action: Click
    - step:
        id: '84'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Define Display Mode").SAPGuiRadioButton("All
          installatn facts")
        action: Set
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '5'
    - step:
        id: '85'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Define Display Mode").SAPGuiButton("Transfer   (Enter)")
        action: Click
        snapshot: .\Snapshots\ssf1.png
        highlight_id: '2'
    - step:
        id: '86'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '87'
        action: Script
        object_path: If SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("content:=Billing
          Results ").Exist(1) Then
    - step:
        id: '88'
        action: Script
        object_path: flagO = true
    - step:
        id: '89'
        action: Script
        object_path: Id = SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("content:=Billing
          Results ").GetROProperty("Id")
    - step:
        id: '90'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("Id:="&Id)
        action: Highlight
    - step:
        id: '91'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("Id:="&Id)
        action: SetFocus
    - step:
        id: '92'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("Id:="&Id)
        action: SetCaretPos
        args: '1'
    - step:
        id: '93'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3")
        action: SendKey
        args: F2
    - step:
        id: '94'
        action: Script
        object_path: Operands = "EDH_ANYKVA|EDH_APKKVA"
    - step:
        id: '95'
        action: Script
        object_path: op = Split(Operands,"|")
    - step:
        id: '96'
        action: Script
        object_path: OpNum = len(Operands) - len(replace(Operands, "|", ""))
    - step:
        id: '97'
        action: Script
        object_path: For j = 0 To OpNum
    - step:
        id: '98'
        action: Script
        object_path: operand = op(j)
    - step:
        id: '99'
        action: Script
        object_path: If SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("content:="&operand).Exist(2)
          Then
    - step:
        id: '100'
        action: Script
        object_path: Id2 =SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("content:="&operand).GetROProperty("Id")
    - step:
        id: '101'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("Id:="&Id2)
        action: Highlight
    - step:
        id: '102'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("Id:="&Id2)
        action: SetFocus
    - step:
        id: '103'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiLabel("Id:="&Id2)
        action: SetCaretPos
        args: '1'
    - step:
        id: '104'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3")
        action: SendKey
        args: F2
    - step:
        id: '105'
        action: Script
        object_path: If operand = "EDH_APKKVA" Then
    - step:
        id: '106'
        action: Script
        object_path: dh = "_Peak"
    - step:
        id: '107'
        action: Script
        object_path: Else
    - step:
        id: '108'
        action: Script
        object_path: dh = "_AnyTime"
    - step:
        id: '109'
        action: Script
        object_path: End If
    - step:
        id: '110'
        action: Script
        object_path: dt =  DateAdd("d",-365,Date)
    - step:
        id: '111'
        action: Script
        object_path: values = SAPGuiSession("Session_2").SAPGuiWindow("Display Operand
          Value:").SAPGuiTable("Operand Vals").RowCount
    - step:
        id: '112'
        action: Script
        object_path: If values > 0 Then
    - step:
        id: '113'
        action: Script
        object_path: For i = 1 To values
    - step:
        id: '114'
        action: Script
        object_path: If SAPGuiSession("Session_2").SAPGuiWindow("Display Operand Value:").SAPGuiTable("Operand
          Vals").ValidRow(i) Then
    - step:
        id: '115'
        action: Script
        object_path: dt1 =  SAPGuiSession("Session_2").SAPGuiWindow("Display Operand
          Value:").SAPGuiTable("Operand Vals").GetCellData(i,"Valid to")
    - step:
        id: '116'
        action: Script
        object_path: If CDATE(Replace(dt1,".","/")) > CDATE(dt) Then
    - step:
        id: '117'
        action: Script
        object_path: flag = True
    - step:
        id: '118'
        action: Script
        object_path: VF = SAPGuiSession("Session_2").SAPGuiWindow("Display Operand
          Value:").SAPGuiTable("Operand Vals").GetCellData(i,"Valid From")
    - step:
        id: '119'
        action: Script
        object_path: VT = SAPGuiSession("Session_2").SAPGuiWindow("Display Operand
          Value:").SAPGuiTable("Operand Vals").GetCellData(i,"Valid to")
    - step:
        id: '120'
        action: Script
        object_path: Dmd = SAPGuiSession("Session_2").SAPGuiWindow("Display Operand
          Value:").SAPGuiTable("Operand Vals").GetCellData(i,"Demand")
    - step:
        id: '121'
        action: Script
        object_path: Call WriteDemandtoExcel(VF,VT,Dmd,objWB,dh)
    - step:
        id: '122'
        action: Script
        object_path: End If
    - step:
        id: '123'
        action: Script
        object_path: End If
    - step:
        id: '124'
        action: Script
        object_path: Next
    - step:
        id: '125'
        action: Script
        object_path: End If
    - step:
        id: '126'
        action: Script
        object_path: If SAPGuiSession("Session_2").SAPGuiWindow("Display Operand Value:").SAPGuiButton("Cancel   (F12)").Exist(1)
          Then
    - step:
        id: '127'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Operand Value:").SAPGuiButton("Cancel   (F12)")
        action: Click
    - step:
        id: '128'
        action: Script
        object_path: Else
    - step:
        id: '129'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nES32"'
    - step:
        id: '130'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3")
        action: SendKey
        args: ENTER
    - step:
        id: '131'
        action: Script
        object_path: End If
    - step:
        id: '132'
        action: Script
        object_path: End If
    - step:
        id: '133'
        action: Script
        object_path: Next
    - step:
        id: '134'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '135'
        object_path: SAPGuiSession("Session_2").SAPGuiWindow("Display Installation:_3")
        action: SendKey
        args: ENTER
    - step:
        id: '136'
        action: Script
        object_path: End If
    - step:
        id: '137'
        action: Script
        object_path: End If
    - step:
        id: '138'
        action: Script
        object_path: Call CloseExcel()
    - step:
        id: '139'
        object_path: SAPGuiSession("Session_2")
        action: Close
    - step:
        id: '140'
        action: Wait
        args: '"3"'
        default_args: '"1"'
    - step:
        id: '141'
        action: Script
        object_path: If flag Then
    - step:
        id: '142'
        action: Script
        object_path: Set objFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '143'
        action: Script
        object_path: Set objFile = objFSO.OpenTextFile(textfile, 8, True)
    - step:
        id: '144'
        object_path: objFile
        action: Write
        args: nmi &"|"& retailer &"|"& frmp &"|"& retailerEmail &"|"& Replace(fileName,"\","/")
          &"|"& caseID & vbNewLine
    - step:
        id: '145'
        object_path: objFile
        action: Close
    - step:
        id: '146'
        action: Script
        object_path: Set objFile = Nothing
    - step:
        id: '147'
        action: Script
        object_path: Set objFSO = Nothing
    - step:
        id: '148'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Switch
          between Display/Change")
        action: Click
    - step:
        id: '149'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiComboBox("Status")
        action: Select
        args: '"Completed"'
    - step:
        id: '150'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '151'
        action: Script
        object_path: completedB = completedB + 1
    - step:
        id: '152'
        action: Script
        object_path: ElseIf flagO = False Then
    - step:
        id: '153'
        action: Script
        object_path: Call SendEmailNoOperands(nmi, retailer, frmp, caseID)
    - step:
        id: '154'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '155'
        object_path: fso
        action: DeleteFile(fileName)
    - step:
        id: '156'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '157'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '158'
        action: Script
        object_path: ElseIf flag = False Then
    - step:
        id: '159'
        action: Script
        object_path: Call SendEmailNoHistory(nmi, retailer, frmp, caseID)
    - step:
        id: '160'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '161'
        object_path: fso
        action: DeleteFile(fileName)
    - step:
        id: '162'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '163'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '164'
        action: Script
        object_path: End If
    - step:
        id: '165'
        action: Script
        object_path: Else
    - step:
        id: '166'
        action: Script
        object_path: Call SendEmailNoEmail(nmi, retailer, frmp, caseID)
    - step:
        id: '167'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Display Clarification").SAPGuiButton("Back   (F3)")
        action: Click
    - step:
        id: '168'
        action: Script
        object_path: End If
    - step:
        id: '169'
        action: Script
        object_path: End If
    - step:
        id: '170'
        action: Script
        object_path: Parameter("completedBPEMs") = completedB
    - step:
        id: '171'
        action: Script
        object_path: Next
    - step:
        id: '172'
        action: Script
        object_path: End If
    - step:
        id: '173'
        action: Script
        object_path: If completedB = 0 Then
    - step:
        id: '174'
        action: Script
        object_path: Parameter("completedBPEMs") = ""
    - step:
        id: '175'
        action: Script
        object_path: End If
    - step:
        id: '176'
        action: Script
        object_path: Function CreateDemandHistoryExcel(location, nmi, retailer)
    - step:
        id: '177'
        action: Script
        object_path: fileName = location&"Market Demand History for "&nmi&" ("&retailer&")
          - "&Replace(FormatDateTime(now(),1),",","")&" "&Replace(FormatDateTime(now(),4),":","")&".xlsx"
    - step:
        id: '178'
        action: Script
        object_path: Set newExcel = CreateObject("Excel.Application")
    - step:
        id: '179'
        object_path: newExcel
        action: Visible
        args: = True
    - step:
        id: '180'
        action: Script
        object_path: Set objWorkbook = newExcel.Workbooks.Add
    - step:
        id: '181'
        object_path: objWorkbook
        action: saveas(fileName)
    - step:
        id: '182'
        action: Script
        object_path: Set objSheet = objWorkbook.Sheets.Add
    - step:
        id: '183'
        object_path: objSheet
        action: Name
        args: = "DemandHistory_AnyTime"
    - step:
        id: '184'
        object_path: objSheet.Cells(1,1)
        action: value
        args: = "Valid From"
    - step:
        id: '185'
        object_path: objSheet.Cells(1,1).Font
        action: Bold
        args: = True
    - step:
        id: '186'
        object_path: objSheet.Cells(1,2)
        action: value
        args: = "Valid to"
    - step:
        id: '187'
        object_path: objSheet.Cells(1,2).Font
        action: Bold
        args: = True
    - step:
        id: '188'
        object_path: objSheet.Cells(1,3)
        action: value
        args: = "Demand"
    - step:
        id: '189'
        object_path: objSheet.Cells(1,3).Font
        action: Bold
        args: = True
    - step:
        id: '190'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '191'
        action: Script
        object_path: Set objSheet = newExcel.Sheets.Add
    - step:
        id: '192'
        object_path: objSheet
        action: Name
        args: = "DemandHistory_Peak"
    - step:
        id: '193'
        object_path: objSheet.Cells(1,1)
        action: value
        args: = "Valid From"
    - step:
        id: '194'
        object_path: objSheet.Cells(1,1).Font
        action: Bold
        args: = True
    - step:
        id: '195'
        object_path: objSheet.Cells(1,2)
        action: value
        args: = "Valid to"
    - step:
        id: '196'
        object_path: objSheet.Cells(1,2).Font
        action: Bold
        args: = True
    - step:
        id: '197'
        object_path: objSheet.Cells(1,3)
        action: value
        args: = "Demand"
    - step:
        id: '198'
        object_path: objSheet.Cells(1,3).Font
        action: Bold
        args: = True
    - step:
        id: '199'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '200'
        action: Script
        object_path: Set objSheet = objWorkbook.Worksheets("Sheet1")
    - step:
        id: '201'
        object_path: objSheet
        action: Delete
    - step:
        id: '202'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '203'
        object_path: objWorkbook
        action: Save
    - step:
        id: '204'
        action: Script
        object_path: Set newExcel = Nothing
    - step:
        id: '205'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '206'
        action: Script
        object_path: CreateDemandHistoryExcel = fileName
    - step:
        id: '207'
        action: Script
        object_path: End Function
    - step:
        id: '208'
        action: Script
        object_path: Function WriteDemandtoExcel(ValidFrom,Validto,Demand,objWB,dh)
    - step:
        id: '209'
        action: Script
        object_path: Set existingExcel = GetObject(,"Excel.Application")
    - step:
        id: '210'
        action: Script
        object_path: Set objWorkbook = existingExcel.ActiveWorkbook
    - step:
        id: '211'
        action: Script
        object_path: Set objSheet = objWorkbook.worksheets("DemandHistory"&dh)
    - step:
        id: '212'
        action: Script
        object_path: rows = objSheet.UsedRange.Rows.count
    - step:
        id: '213'
        object_path: objSheet.cells(rows+1,1)
        action: Value=
        args: ValidFrom
    - step:
        id: '214'
        object_path: objSheet.cells(rows+1,2)
        action: Value=
        args: Validto
    - step:
        id: '215'
        object_path: objSheet.cells(rows+1,3)
        action: Value=
        args: Demand
    - step:
        id: '216'
        object_path: objWorkbook
        action: save
    - step:
        id: '217'
        action: Script
        object_path: Set existingExcel = Nothing
    - step:
        id: '218'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '219'
        action: Script
        object_path: Set objSheet = Nothing
    - step:
        id: '220'
        action: Script
        object_path: End Function
    - step:
        id: '221'
        action: Script
        object_path: Function CloseExcel()
    - step:
        id: '222'
        action: Script
        object_path: Set existingExcel = GetObject(,"Excel.Application")
    - step:
        id: '223'
        action: Script
        object_path: Set objWorkbook = existingExcel.ActiveWorkbook
    - step:
        id: '224'
        object_path: objWorkbook
        action: save
    - step:
        id: '225'
        object_path: objWorkbook
        action: close
    - step:
        id: '226'
        object_path: existingExcel
        action: quit
    - step:
        id: '227'
        action: Script
        object_path: Set existingExcel = Nothing
    - step:
        id: '228'
        action: Script
        object_path: Set objWorkbook = Nothing
    - step:
        id: '229'
        action: Script
        object_path: End Function
    - step:
        id: '230'
        action: Script
        object_path: Function SendEmailNoHistory(nmi, retailer, frmp, caseID)
    - step:
        id: '231'
        action: Script
        object_path: Call CloseExcel
    - step:
        id: '232'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '233'
        object_path: MyEmail
        action: To
        args: = "Billing@sapowernetworks.com.au"
    - step:
        id: '234'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '235'
        object_path: MyEmail
        action: Subject
        args: = "Market Demand History - NMI has no market history"
    - step:
        id: '236'
        object_path: MyEmail
        action: TextBody
        args: '= "Hi Billing team,"&vbNewLine&vbNewLine&"The NMI "&nmi&" for "&retailer&"
          ("&frmp&") has no market history in ISU."&vbNewLine&vbNewLine&"Please investigate.
          The BPEM case number is: "&caseID&"."&vbNewLine&vbNewLine&"Thanks"'
    - step:
        id: '237'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '238'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '239'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '240'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '241'
        object_path: MyEmail
        action: Send
    - step:
        id: '242'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '243'
        action: Script
        object_path: End Function
    - step:
        id: '244'
        action: Script
        object_path: Function SendEmailNoEmail(nmi, retailer, frmp, caseID)
    - step:
        id: '245'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '246'
        object_path: MyEmail
        action: To
        args: = "Billing@sapowernetworks.com.au"
    - step:
        id: '247'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '248'
        object_path: MyEmail
        action: Subject
        args: = "Market Demand History - Retailer has no appropriate email address"
    - step:
        id: '249'
        object_path: MyEmail
        action: TextBody
        args: '= "Hi Billing team,"&vbNewLine&vbNewLine&"The retailer "&retailer&"
          ("&frmp&") has no email address in ISU marked for market demand history."&vbNewLine&vbNewLine&"Please
          action. The BPEM case number is: "&caseID&"."&vbNewLine&vbNewLine&"Thanks"'
    - step:
        id: '250'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '251'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '252'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '253'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '254'
        object_path: MyEmail
        action: Send
    - step:
        id: '255'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '256'
        action: Script
        object_path: End Function
    - step:
        id: '257'
        action: Script
        object_path: Function SendEmailNoOperands(nmi, retailer, frmp, caseID)
    - step:
        id: '258'
        action: Script
        object_path: Call CloseExcel
    - step:
        id: '259'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '260'
        object_path: MyEmail
        action: To
        args: = "Billing@sapowernetworks.com.au"
    - step:
        id: '261'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '262'
        object_path: MyEmail
        action: Subject
        args: = "Market Demand History - NMI has no operands"
    - step:
        id: '263'
        object_path: MyEmail
        action: TextBody
        args: '= "Hi Billing team,"&vbNewLine&vbNewLine&"The NMI "&nmi&" for "&retailer&"
          ("&frmp&") has no operands in ISU for history extraction."&vbNewLine&vbNewLine&"Please
          action. The BPEM case number is: "&caseID&"."&vbNewLine&vbNewLine&"Thanks"'
    - step:
        id: '264'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '265'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '266'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '267'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '268'
        object_path: MyEmail
        action: Send
    - step:
        id: '269'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '270'
        action: Script
        object_path: End Function
    - step:
        id: '271'
        action: Script
        object_path: Function SendEmailNoFRMP(nmi, caseID)
    - step:
        id: '272'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '273'
        object_path: MyEmail
        action: To
        args: = "Billing@sapowernetworks.com.au"
    - step:
        id: '274'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '275'
        object_path: MyEmail
        action: Subject
        args: = "Market Demand History - NMI has no service provider"
    - step:
        id: '276'
        object_path: MyEmail
        action: TextBody
        args: '= "Hi Billing team,"&vbNewLine&vbNewLine&"The NMI "&nmi&" has no Service
          Provider listed in ISU."&vbNewLine&vbNewLine&"Please action. The BPEM case
          number is: "&caseID&"."&vbNewLine&vbNewLine&"Thanks"'
    - step:
        id: '277'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '278'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '279'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '280'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '281'
        object_path: MyEmail
        action: Send
    - step:
        id: '282'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '283'
        action: Script
        object_path: End Function
  outputs:
  - completedBPEMs:
      robot: true
      value: ${completedBPEMs}
  - emailLogTextFile:
      robot: true
      value: ${emailLogTextFile}
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
      name: Session_2
      properties:
      - property:
          value:
            value: ses[1]
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
            value: '12'
            regular_expression: false
          name: guicomponenttype
          hidden: false
          read_only: false
          type: NUMBER
      - property:
          value:
            value: /app/con[0]/ses[2]
            regular_expression: false
          name: compidstr
          hidden: true
          read_only: true
          type: STRING
      basic_identification:
        property_ref:
        - micclass
        - guicomponenttype
        ordinal_identifier:
          value: 1
          type: index
      smart_identification: ''
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 27 March 2023 3:47:44 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: 'Display Operand Value:'
          properties:
          - property:
              value:
                value: ES32
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
                value: SAPLE20C
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: Operand Vals
              properties:
              - property:
                  value:
                    value: SAPLE20CDEMAND_TC
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTable
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '80'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/tblSAPLE20CDEMAND_TC
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Cancel   (F12)
              properties:
              - property:
                  value:
                    value: btn[12]
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
                    value: wnd[1]/tbar[0]/btn[12]
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Installation:_3
          properties:
          - property:
              value:
                value: ES32
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Demand - Peak measured
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[23,14]
                    regular_expression: false
                  name: relativeid
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiLabel
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '30'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/lbl[23,14]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: Billing Results
              properties:
              - property:
                  value:
                    value: wnd[0]/usr/lbl[19,5]
                    regular_expression: false
                  name: relativeid
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiLabel
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '30'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/lbl[19,5]
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - relativeid
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Display Mode
              properties:
              - property:
                  value:
                    value: btn[35]
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
                    value: wnd[0]/tbar[1]/btn[35]
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Installation:_2
          properties:
          - property:
              value:
                value: ES32
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '201'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLES30
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Facts
              properties:
              - property:
                  value:
                    value: EANLD-FACTSBUT
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
                    value: wnd[0]/usr/btnEANLD-FACTSBUT
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Installation:'
          properties:
          - property:
              value:
                value: ES32
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '110'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLES30
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Installation
              properties:
              - property:
                  value:
                    value: EANLD-ANLAGE
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
                    value: wnd[0]/usr/ctxtEANLD-ANLAGE
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Define Display Mode
          properties:
          - property:
              value:
                value: ES32
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
                value: SAPLE20B
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
          child_objects:
          - object:
              class: SAPGuiRadioButton
              name: All installatn facts
              properties:
              - property:
                  value:
                    value: All installatn facts
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: RE20B-VIEWALL
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiRadioButton
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '41'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/radRE20B-VIEWALL
                    regular_expression: false
                  name: compidstr
                  hidden: true
                  read_only: true
                  type: STRING
              basic_identification:
                property_ref:
                - text
                - name
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Transfer   (Enter)
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
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
        ordinal_identifier:
          value: 0
          type: index
      smart_identification: ''
      custom_replay: ''
      comments:
        comment:
        - value: ''
          name: miccommentproperty
      visual_relations: ''
      last_update_time: Monday, 27 March 2023 3:47:44 PM
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Service Provider
          properties:
          - property:
              value:
                value: EMMACL
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
                value: SAPLEEDMIDE_SERVPROV_MAINT
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Business Partner
              properties:
              - property:
                  value:
                    value: EEDMIDESERVPROV_DYN_HEADDATA-BPART
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
                    value: wnd[0]/usr/ssubSERVPROV_SUBSCR:SAPLEEDMIDE_SERVPROV_MAINT:0200/tabsSERVPROV_DATA/tabpSERVPROV_FC1/ssubSERVPROV_SCA:SAPLEEDMIDE_SERVPROV_MAINT:0210/ctxtEEDMIDESERVPROV_DYN_HEADDATA-BPART
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back   (F3)
              properties:
              - property:
                  value:
                    value: btn[3]
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
                    value: wnd[0]/tbar[0]/btn[3]
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Display Organization:'
          properties:
          - property:
              value:
                value: BP
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '3000'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLBUS_LOCATOR
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Name
              properties:
              - property:
                  value:
                    value: BUT000-NAME_ORG1
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
                    value: wnd[0]/usr/subSCREEN_3000_RESIZING_AREA:SAPLBUS_LOCATOR:2000/subSCREEN_1010_RIGHT_AREA:SAPLBUPA_DIALOG_JOEL:1000/ssubSCREEN_1000_WORKAREA_AREA:SAPLBUPA_DIALOG_JOEL:1100/ssubSCREEN_1100_MAIN_AREA:SAPLBUPA_DIALOG_JOEL:1101/tabsGS_SCREEN_1100_TABSTRIP/tabpSCREEN_1100_TAB_01/ssubSCREEN_1100_TABSTRIP_AREA:SAPLBUSS:0028/ssubGENSUB:SAPLBUSS:7016/subA02P02:SAPLBUD0:1200/txtBUT000-NAME_ORG1
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Other E-Mail Addresses
              properties:
              - property:
                  value:
                    value: G_ICON_SMTP
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
                    value: COUNTRY_SCREEN:SAPLSZA1:0301
                    regular_expression: false
                  name: containername
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: wnd[0]/usr/subSCREEN_3000_RESIZING_AREA:SAPLBUS_LOCATOR:2000/subSCREEN_1010_RIGHT_AREA:SAPLBUPA_DIALOG_JOEL:1000/ssubSCREEN_1000_WORKAREA_AREA:SAPLBUPA_DIALOG_JOEL:1100/ssubSCREEN_1100_MAIN_AREA:SAPLBUPA_DIALOG_JOEL:1101/tabsGS_SCREEN_1100_TABSTRIP/tabpSCREEN_1100_TAB_01/ssubSCREEN_1100_TABSTRIP_AREA:SAPLBUSS:0028/ssubGENSUB:SAPLBUSS:7016/subA05P01:SAPLBUA0:0400/subADDRESS:SAPLSZA1:0300/subCOUNTRY_SCREEN:SAPLSZA1:0301/btnG_ICON_SMTP
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
                - containername
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back   (F3)
              properties:
              - property:
                  value:
                    value: btn[3]
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
                    value: wnd[0]/tbar[0]/btn[3]
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Internet mail
          properties:
          - property:
              value:
                value: BP
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '600'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSZA6
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: SAPLSZA6T_CONTROL6
              properties:
              - property:
                  value:
                    value: SAPLSZA6T_CONTROL6
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiTable
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '80'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[1]/usr/tblSAPLSZA6T_CONTROL6
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Display Clarification
          properties:
          - property:
              value:
                value: EMMACL
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '105'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLEMMA_CASE_TRANSACTION
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: GridViewCtrl
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
                    value: SAPGuiGrid
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '201'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/tabsTABSTRIP/tabpBUTOBJ/ssubTABSUB:SAPLEMMA_CASE_TRANSACTION:0210/cntlWORKAREA1/shellcont/shell
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiComboBox
              name: Status
              properties:
              - property:
                  value:
                    value: EMMAD_CASEHDR-STATUS
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiComboBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '34'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/cmbEMMAD_CASEHDR-STATUS
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Switch between Display/Change
              properties:
              - property:
                  value:
                    value: btn[13]
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
                    value: wnd[0]/tbar[1]/btn[13]
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Back   (F3)
              properties:
              - property:
                  value:
                    value: btn[3]
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
                    value: wnd[0]/tbar[0]/btn[3]
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Define Selection Options
          properties:
          - property:
              value:
                value: EMMACL
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '651'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLALDB
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
          child_objects: []
      - object:
          class: SAPGuiWindow
          name: Clarification Case List_2
          properties:
          - property:
              value:
                value: EMMACL
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '500'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLSLVC_FULLSCREEN
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiGrid
              name: GridViewCtrl
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
                    value: SAPGuiGrid
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '201'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/cntlGRID1/shellcont/shell
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Clarification Case List
          properties:
          - property:
              value:
                value: EMMACL
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
                value: REMMACASELIST
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
          last_update_time: Monday, 27 March 2023 3:47:44 PM
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
              basic_identification:
                property_ref:
                - micclass
                - guicomponenttype
                ordinal_identifier: ''
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: to
              properties:
              - property:
                  value:
                    value: STATUS-HIGH
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
                    value: wnd[0]/usr/ctxtSTATUS-HIGH
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Processing Status
              properties:
              - property:
                  value:
                    value: STATUS-LOW
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
                    value: wnd[0]/usr/ctxtSTATUS-LOW
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Maximum No. of Hits
              properties:
              - property:
                  value:
                    value: MAXHITS
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
                    value: wnd[0]/usr/txtMAXHITS
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Clarif. Case Category
              properties:
              - property:
                  value:
                    value: CCAT-LOW
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
                    value: wnd[0]/usr/ctxtCCAT-LOW
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Autom. Update Up to Max.
              properties:
              - property:
                  value:
                    value: LSTRFRSH
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
                    value: wnd[0]/usr/txtLSTRFRSH
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Execute   (F8)
              properties:
              - property:
                  value:
                    value: btn[8]
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
                    value: wnd[0]/tbar[1]/btn[8]
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
              last_update_time: Monday, 27 March 2023 3:47:44 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
