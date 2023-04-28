namespace: BoltOrderCreation
operation:
  name: BoltOrder
  inputs:
  - productionOrderNumbers: '8033440'
  - location: C:\Users\haasj0\OneDrive - SA Power Networks (1)\Bolt Order Creation
  sequential_action:
    gav: com.microfocus.seq:BoltOrderCreation.BoltOrder:1.0.0
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
        object_path: '''CREATE TEXT FILE'
    - step:
        id: '2'
        action: Script
        object_path: Set fso = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '3'
        action: Script
        object_path: timestamp = Replace(FormatDateTime(now(),2),"/","") &" "& Replace(FormatDateTime(now(),3),":","")
    - step:
        id: '4'
        action: Script
        object_path: textfile = Parameter("location")&"Bolt Orders "&timestamp&".txt"
    - step:
        id: '5'
        action: Script
        object_path: Parameter("log") = textfile
    - step:
        id: '6'
        action: Script
        object_path: Set f = fso.CreateTextFile(textfile, true)
    - step:
        id: '7'
        object_path: f
        action: WriteLine(Parameter("productionOrderNumbers"))
    - step:
        id: '8'
        object_path: f
        action: Close
    - step:
        id: '9'
        action: Script
        object_path: Set f = nothing
    - step:
        id: '10'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '11'
        action: Script
        object_path: '''SETTING UP ARRAYS AND DICTIONARIEs'
    - step:
        id: '12'
        action: Script
        object_path: orders0 = Replace(Parameter("productionOrderNumbers"), " ", "")
    - step:
        id: '13'
        action: Script
        object_path: orders = Split(orders0, ",")
    - step:
        id: '14'
        action: Script
        object_path: boltCategory = Array("16mm", "20mm", "24mm", "30mm")
    - step:
        id: '15'
        action: Script
        object_path: Set M16 = CreateObject("Scripting.Dictionary")
    - step:
        id: '16'
        action: Script
        object_path: Set M20 = CreateObject("Scripting.Dictionary")
    - step:
        id: '17'
        action: Script
        object_path: Set M24 = CreateObject("Scripting.Dictionary")
    - step:
        id: '18'
        action: Script
        object_path: Set M30 = CreateObject("Scripting.Dictionary")
    - step:
        id: '19'
        action: Script
        object_path: 'Set DocumentNumber = CreateObject("Scripting.Dictionary") '
        comment: Reservation Numbers
    - step:
        id: '20'
        action: Script
        object_path: 'Set MaterialNumberCredit = CreateObject("Scripting.Dictionary") '
        comment: Production order number credits
    - step:
        id: '21'
        action: Script
        object_path: 'Set MaterialNumberCharge = CreateObject("Scripting.Dictionary") '
        comment: Production order number charges
    - step:
        id: '22'
        action: Script
        object_path: documentNumbers = ""
    - step:
        id: '23'
        action: Script
        object_path: materialNumberCharges = ""
    - step:
        id: '24'
        action: Script
        object_path: materialNumberCredits = ""
    - step:
        id: '25'
        action: Script
        object_path: errorMessagesGoodsOrder = ""
    - step:
        id: '26'
        action: Script
        object_path: errorMessagesGoodsIssue = ""
    - step:
        id: '27'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '28'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: Activate
    - step:
        id: '29'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMB25"'
    - step:
        id: '30'
        object_path: SAPGuiSession("Session").SAPGuiWindow("SAP Easy Access  -  User")
        action: SendKey
        args: ENTER
    - step:
        id: '31'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory_2").SAPGuiCheckBox("Open
          Reservations")
        action: Set
        args: '"ON"'
    - step:
        id: '32'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory_2").SAPGuiCheckBox("Cancellable
          Reservations")
        action: Set
        args: '"ON"'
    - step:
        id: '33'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory_2").SAPGuiCheckBox("Goods
          Movement Not Possible")
        action: Set
        args: '"ON"'
    - step:
        id: '34'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory_2").SAPGuiCheckBox("Issues")
        action: Set
        args: '"ON"'
    - step:
        id: '35'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory_2").SAPGuiCheckBox("Receipts")
        action: Set
        args: '"ON"'
    - step:
        id: '36'
        action: Script
        object_path: '''ENTER ALL ORIGINAL PRODUCTION ORDER NUMBERS'
    - step:
        id: '37'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory_2").SAPGuiButton("Multiple
          selection")
        action: Click
    - step:
        id: '38'
        action: Script
        object_path: lenOrders = UBound(orders) + 1
    - step:
        id: '39'
        action: Script
        object_path: For x = 1 To lenOrders
    - step:
        id: '40'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiTable("SAPLALDBSINGLE")
        action: SetCellData
        args: x,"Single value",orders(x - 1)
    - step:
        id: '41'
        action: Script
        object_path: Next
    - step:
        id: '42'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Multiple Selection for").SAPGuiButton("Copy   (F8)")
        action: Click
    - step:
        id: '43'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory_2").SAPGuiButton("Execute   (F8)")
        action: Click
    - step:
        id: '44'
        action: Script
        object_path: '''COMBINE THE ORDERS AND ADD INTO CATEGORY DICTIONARIES'
    - step:
        id: '45'
        action: Script
        object_path: reservationRow = SAPGuiSession("Session").SAPGuiWindow("Reservation
          List Inventory").SAPGuiGrid("GridViewCtrl").RowCount
    - step:
        id: '46'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '47'
        object_path: f
        action: WriteLine()
    - step:
        id: '48'
        object_path: f
        action: WriteLine("Combining
        args: orders into categories")
    - step:
        id: '49'
        object_path: f
        action: Close
    - step:
        id: '50'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '51'
        action: Script
        object_path: For row = 1 To reservationRow
    - step:
        id: '52'
        action: Script
        object_path: material = SAPGuiSession("Session").SAPGuiWindow("Reservation
          List Inventory").SAPGuiGrid("GridViewCtrl").GetCellData(row, "Material")
    - step:
        id: '53'
        action: Script
        object_path: matDesc = SAPGuiSession("Session").SAPGuiWindow("Reservation
          List Inventory").SAPGuiGrid("GridViewCtrl").GetCellData(row, "Material Description")
    - step:
        id: '54'
        action: Script
        object_path: quantity = SAPGuiSession("Session").SAPGuiWindow("Reservation
          List Inventory").SAPGuiGrid("GridViewCtrl").GetCellData(row, "Requirement
          Quantity")
    - step:
        id: '55'
        action: Script
        object_path: If InStr(matDesc,"M16") Then
    - step:
        id: '56'
        action: Script
        object_path: If M16.Exists(material) = false Then
    - step:
        id: '57'
        object_path: M16
        action: Add
        args: material, quantity
    - step:
        id: '58'
        action: Script
        object_path: Else
    - step:
        id: '59'
        action: Script
        object_path: existingQuant = M16.Item(material)
    - step:
        id: '60'
        action: Script
        object_path: newQuant = Int(existingQuant) + Int(quantity)
    - step:
        id: '61'
        object_path: M16
        action: Item(material)
        args: = newQuant
    - step:
        id: '62'
        action: Script
        object_path: End If
    - step:
        id: '63'
        action: Script
        object_path: ElseIf InStr(matDesc,"M20") Then
    - step:
        id: '64'
        action: Script
        object_path: If M20.Exists(material) = false Then
    - step:
        id: '65'
        object_path: M20
        action: Add
        args: material, quantity
    - step:
        id: '66'
        action: Script
        object_path: Else
    - step:
        id: '67'
        action: Script
        object_path: existingQuant = M20.Item(material)
    - step:
        id: '68'
        action: Script
        object_path: newQuant = Int(existingQuant) + Int(quantity)
    - step:
        id: '69'
        object_path: M20
        action: Item(material)
        args: = newQuant
    - step:
        id: '70'
        action: Script
        object_path: End If
    - step:
        id: '71'
        action: Script
        object_path: ElseIf InStr(matDesc,"M24") Then
    - step:
        id: '72'
        action: Script
        object_path: If M24.Exists(material) = false Then
    - step:
        id: '73'
        object_path: M24
        action: Add
        args: material, quantity
    - step:
        id: '74'
        action: Script
        object_path: Else
    - step:
        id: '75'
        action: Script
        object_path: existingQuant = M24.Item(material)
    - step:
        id: '76'
        action: Script
        object_path: newQuant = Int(existingQuant) + Int(quantity)
    - step:
        id: '77'
        object_path: M24
        action: Item(material)
        args: = newQuant
    - step:
        id: '78'
        action: Script
        object_path: End If
    - step:
        id: '79'
        action: Script
        object_path: ElseIf InStr(matDesc,"M30") Then
    - step:
        id: '80'
        action: Script
        object_path: If M30.Exists(material) = false Then
    - step:
        id: '81'
        object_path: M30
        action: Add
        args: material, quantity
    - step:
        id: '82'
        action: Script
        object_path: Else
    - step:
        id: '83'
        action: Script
        object_path: existingQuant = M30.Item(material)
    - step:
        id: '84'
        action: Script
        object_path: newQuant = Int(existingQuant) + Int(quantity)
    - step:
        id: '85'
        object_path: M30
        action: Item(material)
        args: = newQuant
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
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '90'
        action: Script
        object_path: M16items = M16.Items
    - step:
        id: '91'
        action: Script
        object_path: M16keys = M16.Keys
    - step:
        id: '92'
        action: Script
        object_path: temp = ""
    - step:
        id: '93'
        action: Script
        object_path: For q = 0 To M16.Count - 1
    - step:
        id: '94'
        action: Script
        object_path: 'temp = temp & M16keys(q) &": "& M16items(q) &", "'
    - step:
        id: '95'
        action: Script
        object_path: Next
    - step:
        id: '96'
        action: Script
        object_path: If temp = "" Then
    - step:
        id: '97'
        action: Script
        object_path: temp = "No items in this category"
    - step:
        id: '98'
        action: Script
        object_path: End If
    - step:
        id: '99'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '100'
        object_path: f
        action: WriteLine("M16
        args: items")
    - step:
        id: '101'
        object_path: f
        action: WriteLine(temp)
    - step:
        id: '102'
        object_path: f
        action: Close
    - step:
        id: '103'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '104'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '105'
        action: Script
        object_path: M20items = M20.Items
    - step:
        id: '106'
        action: Script
        object_path: M20keys = M20.Keys
    - step:
        id: '107'
        action: Script
        object_path: temp = ""
    - step:
        id: '108'
        action: Script
        object_path: For q = 0 To M20.Count - 1
    - step:
        id: '109'
        action: Script
        object_path: 'temp = temp & M20keys(q) &": "& M20items(q) &", "'
    - step:
        id: '110'
        action: Script
        object_path: Next
    - step:
        id: '111'
        action: Script
        object_path: If temp = "" Then
    - step:
        id: '112'
        action: Script
        object_path: temp = "No items in this category"
    - step:
        id: '113'
        action: Script
        object_path: End If
    - step:
        id: '114'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '115'
        object_path: f
        action: WriteLine("M20
        args: items")
    - step:
        id: '116'
        object_path: f
        action: WriteLine(temp)
    - step:
        id: '117'
        object_path: f
        action: Close
    - step:
        id: '118'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '119'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '120'
        action: Script
        object_path: M24items = M24.Items
    - step:
        id: '121'
        action: Script
        object_path: M24keys = M24.Keys
    - step:
        id: '122'
        action: Script
        object_path: temp = ""
    - step:
        id: '123'
        action: Script
        object_path: For q = 0 To M24.Count - 1
    - step:
        id: '124'
        action: Script
        object_path: 'temp = temp & M24keys(q) &": "& M24items(q) &", "'
    - step:
        id: '125'
        action: Script
        object_path: Next
    - step:
        id: '126'
        action: Script
        object_path: If temp = "" Then
    - step:
        id: '127'
        action: Script
        object_path: temp = "No items in this category"
    - step:
        id: '128'
        action: Script
        object_path: End If
    - step:
        id: '129'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '130'
        object_path: f
        action: WriteLine("M24
        args: items")
    - step:
        id: '131'
        object_path: f
        action: WriteLine(temp)
    - step:
        id: '132'
        object_path: f
        action: Close
    - step:
        id: '133'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '134'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '135'
        action: Script
        object_path: M30items = M30.Items
    - step:
        id: '136'
        action: Script
        object_path: M30keys = M30.Keys
    - step:
        id: '137'
        action: Script
        object_path: temp = ""
    - step:
        id: '138'
        action: Script
        object_path: For q = 0 To M30.Count - 1
    - step:
        id: '139'
        action: Script
        object_path: 'temp = temp & M30keys(q) &": "& M30items(q) &", "'
    - step:
        id: '140'
        action: Script
        object_path: Next
    - step:
        id: '141'
        action: Script
        object_path: If temp = "" Then
    - step:
        id: '142'
        action: Script
        object_path: temp = "No items in this category"
    - step:
        id: '143'
        action: Script
        object_path: End If
    - step:
        id: '144'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '145'
        object_path: f
        action: WriteLine("M30
        args: items")
    - step:
        id: '146'
        object_path: f
        action: WriteLine(temp)
    - step:
        id: '147'
        object_path: f
        action: Close
    - step:
        id: '148'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '149'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '150'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMB21"'
    - step:
        id: '151'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Reservation List Inventory")
        action: SendKey
        args: ENTER
    - step:
        id: '152'
        action: Script
        object_path: orderDate = Date + 8 - Weekday(Date, vbThursday)
    - step:
        id: '153'
        action: Script
        object_path: orderDate = Replace(orderDate, "/", ".")
    - step:
        id: '154'
        action: Script
        object_path: Parameter("pickingDate") = orderDate
    - step:
        id: '155'
        action: Script
        object_path: currentMonth = UCase(MonthName(Month(Date()), true))
    - step:
        id: '156'
        action: Script
        object_path: currentYear = Year(Date()) - 2000
    - step:
        id: '157'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '158'
        object_path: f
        action: WriteLine()
    - step:
        id: '159'
        object_path: f
        action: WriteLine("Creating
        args: the orders for each category")
    - step:
        id: '160'
        object_path: f
        action: WriteLine(orderDate)
    - step:
        id: '161'
        object_path: f
        action: Close
    - step:
        id: '162'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '163'
        action: Script
        object_path: '''CREATE THE ORDER FOR EACH CATEGORY'
    - step:
        id: '164'
        action: Script
        object_path: For Each category in boltCategory
    - step:
        id: '165'
        action: Script
        object_path: goodRecipDate = "Bolts "& currentMonth &" "&currentYear
    - step:
        id: '166'
        action: Script
        object_path: orderDescription = "Bolt Order "& category &" "& currentMonth
          &" "&currentYear
    - step:
        id: '167'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiEdit("Base
          date")'
        action: Set
        args: orderDate
    - step:
        id: '168'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiEdit("Movement
          type")'
        action: Set
        args: '"261"'
    - step:
        id: '169'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiEdit("Plant")'
        action: Set
        args: '"0001"'
    - step:
        id: '170'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiButton("Enter")'
        action: Click
    - step:
        id: '171'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("Goods
          recipient")'
        action: Set
        args: goodRecipDate
    - step:
        id: '172'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("Order")'
        action: Set
        args: '"7041601"'
    - step:
        id: '173'
        action: Script
        object_path: r = 0
    - step:
        id: '174'
        action: Script
        object_path: found = -1
    - step:
        id: '175'
        action: Script
        object_path: 'materialID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Material").GetROProperty("id")'
    - step:
        id: '176'
        action: Script
        object_path: materialID = Split(materialID1, "[0,")
    - step:
        id: '177'
        action: Script
        object_path: 'quantityID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Quantity in").GetROProperty("id")'
    - step:
        id: '178'
        action: Script
        object_path: quantityID = Split(quantityID1, "[0,")
    - step:
        id: '179'
        action: Script
        object_path: For check = 0 To 50
    - step:
        id: '180'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          New").SAPGuiEdit("name:=RESB-MATNR","type:=GuiCTextField","id:="&materialID(0)&"["&check&","&materialID(1)).Exist
          = false Then'
    - step:
        id: '181'
        action: Script
        object_path: Exit for
    - step:
        id: '182'
        action: Script
        object_path: Else
    - step:
        id: '183'
        action: Script
        object_path: found = found + 1
    - step:
        id: '184'
        action: Script
        object_path: End If
    - step:
        id: '185'
        action: Script
        object_path: Next
    - step:
        id: '186'
        action: Script
        object_path: If category = "16mm" Then
    - step:
        id: '187'
        action: Script
        object_path: If M16.Count <> 0 Then
    - step:
        id: '188'
        action: Script
        object_path: loopCount = M16.Count / found
    - step:
        id: '189'
        action: Script
        object_path: loopCount = -int(-loopCount/1)*1
    - step:
        id: '190'
        action: Script
        object_path: 'materialID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Material").GetROProperty("id")'
    - step:
        id: '191'
        action: Script
        object_path: materialID = Split(materialID1, "[0,")
    - step:
        id: '192'
        action: Script
        object_path: 'quantityID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Quantity in").GetROProperty("id")'
    - step:
        id: '193'
        action: Script
        object_path: quantityID = Split(quantityID1, "[0,")
    - step:
        id: '194'
        action: Script
        object_path: M16items = M16.Items
    - step:
        id: '195'
        action: Script
        object_path: M16keys = M16.Keys
    - step:
        id: '196'
        action: Script
        object_path: l = 0
    - step:
        id: '197'
        action: Script
        object_path: For loopC = 1 To loopCount
    - step:
        id: '198'
        action: Script
        object_path: r = 0
    - step:
        id: '199'
        action: Script
        object_path: For i = 0 to found
    - step:
        id: '200'
        action: Script
        object_path: If l < M16.Count Then
    - step:
        id: '201'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("name:=RESB-MATNR","type:=GuiCTextField","id:="&materialID(0)&"["&r&","&materialID(1))'
        action: Set
        args: M16keys(l)
    - step:
        id: '202'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("name:=RESB-ERFMG","type:=GuiTextField","id:="&quantityID(0)&"["&r&","&quantityID(1))'
        action: Set
        args: M16items(l)
    - step:
        id: '203'
        action: Script
        object_path: r = r + 1
    - step:
        id: '204'
        action: Script
        object_path: l = l + 1
    - step:
        id: '205'
        action: Script
        object_path: Else
    - step:
        id: '206'
        action: Script
        object_path: Exit For
    - step:
        id: '207'
        action: Script
        object_path: End If
    - step:
        id: '208'
        action: Script
        object_path: Next
    - step:
        id: '209'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New")'
        action: SendKey
        args: ENTER
    - step:
        id: '210'
        action: Script
        object_path: '''IF THERE IS NOT ENOUGH STOCK LEFT IN WAREHOUSE, ENTER TO GET
          PAST WARNING'
    - step:
        id: '211'
        action: Script
        object_path: For w = 0 To M16.Count
    - step:
        id: '212'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          New_2").Exist(1) Then'
    - step:
        id: '213'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New_2")'
        action: SendKey
        args: ENTER
    - step:
        id: '214'
        action: Script
        object_path: End If
    - step:
        id: '215'
        action: Script
        object_path: Next
    - step:
        id: '216'
        action: Script
        object_path: If loopC < loopCount Then
    - step:
        id: '217'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiButton("New
          Items   (F7)")'
        action: Click
    - step:
        id: '218'
        action: Script
        object_path: End If
    - step:
        id: '219'
        action: Script
        object_path: Next
    - step:
        id: '220'
        action: Script
        object_path: '''POST THE ORDER'
    - step:
        id: '221'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiButton("Post   (Ctrl+S)")'
        action: Click
    - step:
        id: '222'
        action: Script
        object_path: 'docNumber = SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          Initial").SAPGuiStatusBar("StatusBar").GetROProperty("text")'
    - step:
        id: '223'
        action: Script
        object_path: If DocumentNumber.Exists("16mm") = false Then
    - step:
        id: '224'
        object_path: DocumentNumber
        action: Add
        args: '"16mm", docNumber'
    - step:
        id: '225'
        object_path: MaterialNumberCredit
        action: Add
        args: '"16mm", docNumber'
    - step:
        id: '226'
        action: Script
        object_path: End If
    - step:
        id: '227'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nZM01"'
    - step:
        id: '228'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '229'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order").SAPGuiButton("Truck
          Hit")
        action: Click
    - step:
        id: '230'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Truck hit address").SAPGuiButton("Address")
        action: Click
    - step:
        id: '231'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '232'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Depot
          (Closest)")
        action: Set
        args: '"POL"'
    - step:
        id: '233'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Proj.Name
          / Desc")
        action: Set
        args: orderDescription
    - step:
        id: '234'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Street")
        action: Set
        args: '"Pole Yard"'
    - step:
        id: '235'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Contact
          person")
        action: Set
        args: '"Brian Docking"'
    - step:
        id: '236'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Telephone
          no.")
        action: Set
        args: '"0427 350 457"'
    - step:
        id: '237'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '238'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMB21"'
    - step:
        id: '239'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order")
        action: SendKey
        args: ENTER
    - step:
        id: '240'
        action: Script
        object_path: Else
    - step:
        id: '241'
        action: Script
        object_path: docNumber = ""
    - step:
        id: '242'
        action: Script
        object_path: If DocumentNumber.Exists("16mm") = false Then
    - step:
        id: '243'
        object_path: DocumentNumber
        action: Add
        args: '"16mm", docNumber'
    - step:
        id: '244'
        object_path: MaterialNumberCredit
        action: Add
        args: '"16mm", docNumber'
    - step:
        id: '245'
        action: Script
        object_path: End If
    - step:
        id: '246'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nMB21"'
    - step:
        id: '247'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New")'
        action: SendKey
        args: ENTER
    - step:
        id: '248'
        action: Script
        object_path: End If
    - step:
        id: '249'
        action: Script
        object_path: If docNumber <> "" Then
    - step:
        id: '250'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '251'
        object_path: f
        action: WriteLine("M16
        args: order")
    - step:
        id: '252'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '253'
        object_path: f
        action: Close
    - step:
        id: '254'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '255'
        action: Script
        object_path: End If
    - step:
        id: '256'
        action: Script
        object_path: ElseIf category = "20mm" Then
    - step:
        id: '257'
        action: Script
        object_path: If M20.Count <> 0 Then
    - step:
        id: '258'
        action: Script
        object_path: loopCount = M20.Count / found
    - step:
        id: '259'
        action: Script
        object_path: loopCount = -int(-loopCount/1)*1
    - step:
        id: '260'
        action: Script
        object_path: 'materialID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Material").GetROProperty("id")'
    - step:
        id: '261'
        action: Script
        object_path: materialID = Split(materialID1, "[0,")
    - step:
        id: '262'
        action: Script
        object_path: 'quantityID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Quantity in").GetROProperty("id")'
    - step:
        id: '263'
        action: Script
        object_path: quantityID = Split(quantityID1, "[0,")
    - step:
        id: '264'
        action: Script
        object_path: M20items = M20.Items
    - step:
        id: '265'
        action: Script
        object_path: M20keys = M20.Keys
    - step:
        id: '266'
        action: Script
        object_path: l = 0
    - step:
        id: '267'
        action: Script
        object_path: For loopC = 1 To loopCount
    - step:
        id: '268'
        action: Script
        object_path: r = 0
    - step:
        id: '269'
        action: Script
        object_path: For i = 0 to found
    - step:
        id: '270'
        action: Script
        object_path: If l < M20.Count Then
    - step:
        id: '271'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("name:=RESB-MATNR","type:=GuiCTextField","id:="&materialID(0)&"["&r&","&materialID(1))'
        action: Set
        args: M20keys(l)
    - step:
        id: '272'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("name:=RESB-ERFMG","type:=GuiTextField","id:="&quantityID(0)&"["&r&","&quantityID(1))'
        action: Set
        args: M20items(l)
    - step:
        id: '273'
        action: Script
        object_path: r = r + 1
    - step:
        id: '274'
        action: Script
        object_path: l = l + 1
    - step:
        id: '275'
        action: Script
        object_path: Else
    - step:
        id: '276'
        action: Script
        object_path: Exit For
    - step:
        id: '277'
        action: Script
        object_path: End If
    - step:
        id: '278'
        action: Script
        object_path: Next
    - step:
        id: '279'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New")'
        action: SendKey
        args: ENTER
    - step:
        id: '280'
        action: Script
        object_path: '''IF THERE IS NOT ENOUGH STOCK LEFT IN WAREHOUSE, ENTER TO GET
          PAST WARNING'
    - step:
        id: '281'
        action: Script
        object_path: For w = 0 To M20.Count
    - step:
        id: '282'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          New_2").Exist(1) Then'
    - step:
        id: '283'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New_2")'
        action: SendKey
        args: ENTER
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
        object_path: If loopC < loopCount Then
    - step:
        id: '287'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiButton("New
          Items   (F7)")'
        action: Click
    - step:
        id: '288'
        action: Script
        object_path: End If
    - step:
        id: '289'
        action: Script
        object_path: Next
    - step:
        id: '290'
        action: Script
        object_path: '''POST THE ORDER'
    - step:
        id: '291'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiButton("Post   (Ctrl+S)")'
        action: Click
    - step:
        id: '292'
        action: Script
        object_path: 'docNumber = SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          Initial").SAPGuiStatusBar("StatusBar").GetROProperty("text")'
    - step:
        id: '293'
        action: Script
        object_path: If DocumentNumber.Exists("20mm") = false Then
    - step:
        id: '294'
        object_path: DocumentNumber
        action: Add
        args: '"20mm", docNumber'
    - step:
        id: '295'
        object_path: MaterialNumberCredit
        action: Add
        args: '"20mm", docNumber'
    - step:
        id: '296'
        action: Script
        object_path: End If
    - step:
        id: '297'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nZM01"'
    - step:
        id: '298'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '299'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order").SAPGuiButton("Truck
          Hit")
        action: Click
    - step:
        id: '300'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Truck hit address").SAPGuiButton("Address")
        action: Click
    - step:
        id: '301'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '302'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Depot
          (Closest)")
        action: Set
        args: '"POL"'
    - step:
        id: '303'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Proj.Name
          / Desc")
        action: Set
        args: orderDescription
    - step:
        id: '304'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Street")
        action: Set
        args: '"Pole Yard"'
    - step:
        id: '305'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Contact
          person")
        action: Set
        args: '"Brian Docking"'
    - step:
        id: '306'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Telephone
          no.")
        action: Set
        args: '"0427 350 457"'
    - step:
        id: '307'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '308'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMB21"'
    - step:
        id: '309'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order")
        action: SendKey
        args: ENTER
    - step:
        id: '310'
        action: Script
        object_path: Else
    - step:
        id: '311'
        action: Script
        object_path: docNumber = ""
    - step:
        id: '312'
        action: Script
        object_path: If DocumentNumber.Exists("20mm") = false Then
    - step:
        id: '313'
        object_path: DocumentNumber
        action: Add
        args: '"20mm", docNumber'
    - step:
        id: '314'
        object_path: MaterialNumberCredit
        action: Add
        args: '"20mm", docNumber'
    - step:
        id: '315'
        action: Script
        object_path: End If
    - step:
        id: '316'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nMB21"'
    - step:
        id: '317'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New")'
        action: SendKey
        args: ENTER
    - step:
        id: '318'
        action: Script
        object_path: End If
    - step:
        id: '319'
        action: Script
        object_path: If docNumber <> "" Then
    - step:
        id: '320'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '321'
        object_path: f
        action: WriteLine("M20
        args: order")
    - step:
        id: '322'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '323'
        object_path: f
        action: Close
    - step:
        id: '324'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '325'
        action: Script
        object_path: End If
    - step:
        id: '326'
        action: Script
        object_path: ElseIf category = "24mm" Then
    - step:
        id: '327'
        action: Script
        object_path: If M24.Count <> 0 Then
    - step:
        id: '328'
        action: Script
        object_path: loopCount = M24.Count / found
    - step:
        id: '329'
        action: Script
        object_path: loopCount = -int(-loopCount/1)*1
    - step:
        id: '330'
        action: Script
        object_path: 'materialID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Material").GetROProperty("id")'
    - step:
        id: '331'
        action: Script
        object_path: materialID = Split(materialID1, "[0,")
    - step:
        id: '332'
        action: Script
        object_path: 'quantityID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Quantity in").GetROProperty("id")'
    - step:
        id: '333'
        action: Script
        object_path: quantityID = Split(quantityID1, "[0,")
    - step:
        id: '334'
        action: Script
        object_path: M24items = M24.Items
    - step:
        id: '335'
        action: Script
        object_path: M24keys = M24.Keys
    - step:
        id: '336'
        action: Script
        object_path: l = 0
    - step:
        id: '337'
        action: Script
        object_path: For loopC = 1 To loopCount
    - step:
        id: '338'
        action: Script
        object_path: r = 0
    - step:
        id: '339'
        action: Script
        object_path: For i = 0 to found
    - step:
        id: '340'
        action: Script
        object_path: If l < M24.Count Then
    - step:
        id: '341'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("name:=RESB-MATNR","type:=GuiCTextField","id:="&materialID(0)&"["&r&","&materialID(1))'
        action: Set
        args: M24keys(l)
    - step:
        id: '342'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("name:=RESB-ERFMG","type:=GuiTextField","id:="&quantityID(0)&"["&r&","&quantityID(1))'
        action: Set
        args: M24items(l)
    - step:
        id: '343'
        action: Script
        object_path: r = r + 1
    - step:
        id: '344'
        action: Script
        object_path: l = l + 1
    - step:
        id: '345'
        action: Script
        object_path: Else
    - step:
        id: '346'
        action: Script
        object_path: Exit For
    - step:
        id: '347'
        action: Script
        object_path: End If
    - step:
        id: '348'
        action: Script
        object_path: Next
    - step:
        id: '349'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New")'
        action: SendKey
        args: ENTER
    - step:
        id: '350'
        action: Script
        object_path: '''IF THERE IS NOT ENOUGH STOCK LEFT IN WAREHOUSE, ENTER TO GET
          PAST WARNING'
    - step:
        id: '351'
        action: Script
        object_path: For w = 0 To M24.Count
    - step:
        id: '352'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          New_2").Exist(1) Then'
    - step:
        id: '353'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New_2")'
        action: SendKey
        args: ENTER
    - step:
        id: '354'
        action: Script
        object_path: End If
    - step:
        id: '355'
        action: Script
        object_path: Next
    - step:
        id: '356'
        action: Script
        object_path: If loopC < loopCount Then
    - step:
        id: '357'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiButton("New
          Items   (F7)")'
        action: Click
    - step:
        id: '358'
        action: Script
        object_path: End If
    - step:
        id: '359'
        action: Script
        object_path: Next
    - step:
        id: '360'
        action: Script
        object_path: '''POST THE ORDER'
    - step:
        id: '361'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiButton("Post   (Ctrl+S)")'
        action: Click
    - step:
        id: '362'
        action: Script
        object_path: 'docNumber = SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          Initial").SAPGuiStatusBar("StatusBar").GetROProperty("text")'
    - step:
        id: '363'
        action: Script
        object_path: If DocumentNumber.Exists("24mm") = false Then
    - step:
        id: '364'
        object_path: DocumentNumber
        action: Add
        args: '"24mm", docNumber'
    - step:
        id: '365'
        object_path: MaterialNumberCredit
        action: Add
        args: '"24mm", docNumber'
    - step:
        id: '366'
        action: Script
        object_path: End If
    - step:
        id: '367'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nZM01"'
    - step:
        id: '368'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '369'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order").SAPGuiButton("Truck
          Hit")
        action: Click
    - step:
        id: '370'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Truck hit address").SAPGuiButton("Address")
        action: Click
    - step:
        id: '371'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '372'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Depot
          (Closest)")
        action: Set
        args: '"POL"'
    - step:
        id: '373'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Proj.Name
          / Desc")
        action: Set
        args: orderDescription
    - step:
        id: '374'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Street")
        action: Set
        args: '"Pole Yard"'
    - step:
        id: '375'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Contact
          person")
        action: Set
        args: '"Brian Docking"'
    - step:
        id: '376'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Telephone
          no.")
        action: Set
        args: '"0427 350 457"'
    - step:
        id: '377'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '378'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMB21"'
    - step:
        id: '379'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order")
        action: SendKey
        args: ENTER
    - step:
        id: '380'
        action: Script
        object_path: Else
    - step:
        id: '381'
        action: Script
        object_path: docNumber = ""
    - step:
        id: '382'
        action: Script
        object_path: If DocumentNumber.Exists("24mm") = false Then
    - step:
        id: '383'
        object_path: DocumentNumber
        action: Add
        args: '"24mm", docNumber'
    - step:
        id: '384'
        object_path: MaterialNumberCredit
        action: Add
        args: '"24mm", docNumber'
    - step:
        id: '385'
        action: Script
        object_path: End If
    - step:
        id: '386'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nMB21"'
    - step:
        id: '387'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New")'
        action: SendKey
        args: ENTER
    - step:
        id: '388'
        action: Script
        object_path: End If
    - step:
        id: '389'
        action: Script
        object_path: If docNumber <> "" Then
    - step:
        id: '390'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '391'
        object_path: f
        action: WriteLine("M24
        args: order")
    - step:
        id: '392'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '393'
        object_path: f
        action: Close
    - step:
        id: '394'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '395'
        action: Script
        object_path: End If
    - step:
        id: '396'
        action: Script
        object_path: ElseIf category = "30mm" Then
    - step:
        id: '397'
        action: Script
        object_path: If M30.Count <> 0 Then
    - step:
        id: '398'
        action: Script
        object_path: loopCount = M30.Count / found
    - step:
        id: '399'
        action: Script
        object_path: loopCount = -int(-loopCount/1)*1
    - step:
        id: '400'
        action: Script
        object_path: 'materialID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Material").GetROProperty("id")'
    - step:
        id: '401'
        action: Script
        object_path: materialID = Split(materialID1, "[0,")
    - step:
        id: '402'
        action: Script
        object_path: 'quantityID1 = SAPGuiSession("Session").SAPGuiWindow("Create
          Reservation: New").SAPGuiEdit("Quantity in").GetROProperty("id")'
    - step:
        id: '403'
        action: Script
        object_path: quantityID = Split(quantityID1, "[0,")
    - step:
        id: '404'
        action: Script
        object_path: M30items = M30.Items
    - step:
        id: '405'
        action: Script
        object_path: M30keys = M30.Keys
    - step:
        id: '406'
        action: Script
        object_path: l = 0
    - step:
        id: '407'
        action: Script
        object_path: For loopC = 1 To loopCount
    - step:
        id: '408'
        action: Script
        object_path: r = 0
    - step:
        id: '409'
        action: Script
        object_path: For i = 0 to found
    - step:
        id: '410'
        action: Script
        object_path: If l < M30.Count Then
    - step:
        id: '411'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("name:=RESB-MATNR","type:=GuiCTextField","id:="&materialID(0)&"["&r&","&materialID(1))'
        action: Set
        args: M30keys(l)
    - step:
        id: '412'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiEdit("name:=RESB-ERFMG","type:=GuiTextField","id:="&quantityID(0)&"["&r&","&quantityID(1))'
        action: Set
        args: M30items(l)
    - step:
        id: '413'
        action: Script
        object_path: r = r + 1
    - step:
        id: '414'
        action: Script
        object_path: l = l + 1
    - step:
        id: '415'
        action: Script
        object_path: Else
    - step:
        id: '416'
        action: Script
        object_path: Exit For
    - step:
        id: '417'
        action: Script
        object_path: End If
    - step:
        id: '418'
        action: Script
        object_path: Next
    - step:
        id: '419'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New")'
        action: SendKey
        args: ENTER
    - step:
        id: '420'
        action: Script
        object_path: '''IF THERE IS NOT ENOUGH STOCK LEFT IN WAREHOUSE, ENTER TO GET
          PAST WARNING'
    - step:
        id: '421'
        action: Script
        object_path: For w = 0 To M30.Count
    - step:
        id: '422'
        action: Script
        object_path: 'If SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          New_2").Exist(1) Then'
    - step:
        id: '423'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New_2")'
        action: SendKey
        args: ENTER
    - step:
        id: '424'
        action: Script
        object_path: End If
    - step:
        id: '425'
        action: Script
        object_path: Next
    - step:
        id: '426'
        action: Script
        object_path: If loopC < loopCount Then
    - step:
        id: '427'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiButton("New
          Items   (F7)")'
        action: Click
    - step:
        id: '428'
        action: Script
        object_path: End If
    - step:
        id: '429'
        action: Script
        object_path: Next
    - step:
        id: '430'
        action: Script
        object_path: '''POST THE ORDER'
    - step:
        id: '431'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiButton("Post   (Ctrl+S)")'
        action: Click
    - step:
        id: '432'
        action: Script
        object_path: 'docNumber = SAPGuiSession("Session").SAPGuiWindow("Create Reservation:
          Initial").SAPGuiStatusBar("StatusBar").GetROProperty("text")'
    - step:
        id: '433'
        action: Script
        object_path: If DocumentNumber.Exists("30mm") = false Then
    - step:
        id: '434'
        object_path: DocumentNumber
        action: Add
        args: '"30mm", docNumber'
    - step:
        id: '435'
        object_path: MaterialNumberCredit
        action: Add
        args: '"30mm", docNumber'
    - step:
        id: '436'
        action: Script
        object_path: End If
    - step:
        id: '437'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nZM01"'
    - step:
        id: '438'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '439'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order").SAPGuiButton("Truck
          Hit")
        action: Click
    - step:
        id: '440'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Truck hit address").SAPGuiButton("Address")
        action: Click
    - step:
        id: '441'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '442'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Depot
          (Closest)")
        action: Set
        args: '"POL"'
    - step:
        id: '443'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Proj.Name
          / Desc")
        action: Set
        args: orderDescription
    - step:
        id: '444'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Street")
        action: Set
        args: '"Pole Yard"'
    - step:
        id: '445'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Contact
          person")
        action: Set
        args: '"Brian Docking"'
    - step:
        id: '446'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiEdit("Telephone
          no.")
        action: Set
        args: '"0427 350 457"'
    - step:
        id: '447'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address details").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '448'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMB21"'
    - step:
        id: '449'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Delivery address for order")
        action: SendKey
        args: ENTER
    - step:
        id: '450'
        action: Script
        object_path: Else
    - step:
        id: '451'
        action: Script
        object_path: docNumber = ""
    - step:
        id: '452'
        action: Script
        object_path: If DocumentNumber.Exists("30mm") = false Then
    - step:
        id: '453'
        object_path: DocumentNumber
        action: Add
        args: '"30mm", docNumber'
    - step:
        id: '454'
        object_path: MaterialNumberCredit
        action: Add
        args: '"30mm", docNumber'
    - step:
        id: '455'
        action: Script
        object_path: End If
    - step:
        id: '456'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nMB21"'
    - step:
        id: '457'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: New")'
        action: SendKey
        args: ENTER
    - step:
        id: '458'
        action: Script
        object_path: End If
    - step:
        id: '459'
        action: Script
        object_path: If docNumber <> "" Then
    - step:
        id: '460'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '461'
        object_path: f
        action: WriteLine("M30
        args: order")
    - step:
        id: '462'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '463'
        object_path: f
        action: Close
    - step:
        id: '464'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '465'
        action: Script
        object_path: End If
    - step:
        id: '466'
        action: Script
        object_path: End If
    - step:
        id: '467'
        action: Script
        object_path: Next
    - step:
        id: '468'
        action: Script
        object_path: For Each document in DocumentNumber.Keys
    - step:
        id: '469'
        action: Script
        object_path: key = document
    - step:
        id: '470'
        action: Script
        object_path: item = DocumentNumber(document)
    - step:
        id: '471'
        action: Script
        object_path: doc = key &"/"& item &","
    - step:
        id: '472'
        action: Script
        object_path: documentNumbers = documentNumbers & doc
    - step:
        id: '473'
        action: Script
        object_path: Next
    - step:
        id: '474'
        action: Script
        object_path: Parameter("documentNumbers") = documentNumbers
    - step:
        id: '475'
        action: Script
        object_path: '''OPEN ORIGINAL PRODUCTION ORDER NUMBERS'
    - step:
        id: '476'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial").SAPGuiOKCode("OKCode")'
        action: Set
        args: '"/nCO02"'
    - step:
        id: '477'
        object_path: 'SAPGuiSession("Session").SAPGuiWindow("Create Reservation: Initial")'
        action: SendKey
        args: ENTER
    - step:
        id: '478'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '479'
        object_path: f
        action: WriteLine()
    - step:
        id: '480'
        object_path: f
        action: WriteLine("Updating
        args: storage location to 1590")
    - step:
        id: '481'
        object_path: f
        action: Close
    - step:
        id: '482'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '483'
        action: Script
        object_path: For Each order in orders
    - step:
        id: '484'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Production Order Change:").SAPGuiEdit("Order")
        action: Set
        args: order
    - step:
        id: '485'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Production Order Change:").SAPGuiButton("Component
          Overview   (F6)")
        action: Click
    - step:
        id: '486'
        action: Script
        object_path: row = SAPGuiSession("Session").SAPGuiWindow("Production Order
          Change:_2").SAPGuiTable("Component Overview").RowCount
    - step:
        id: '487'
        action: Script
        object_path: '''CHANGE STORAGE LOCATION TO POLE YARD PICK LOCATION / CHARGE
          MATERIAL'
    - step:
        id: '488'
        action: Script
        object_path: For i = 1 To row
    - step:
        id: '489'
        action: Script
        object_path: storageLocation = SAPGuiSession("Session").SAPGuiWindow("Production
          Order Change:_2").SAPGuiTable("Component Overview").GetCellData(i, "Stor.
          Loc.")
    - step:
        id: '490'
        action: Script
        object_path: component = SAPGuiSession("Session").SAPGuiWindow("Production
          Order Change:_2").SAPGuiTable("Component Overview").GetCellData(i, "Component")
    - step:
        id: '491'
        action: Script
        object_path: If storageLocation = "" Then
    - step:
        id: '492'
        action: Script
        object_path: Exit For
    - step:
        id: '493'
        action: Script
        object_path: ElseIf storageLocation = "1000" and (InStr(component,"BW") >
          0 or InStr(component,"BP") > 0) Then
    - step:
        id: '494'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Production Order Change:_2").SAPGuiTable("Component
          Overview")
        action: SetCellData
        args: i,"Stor. Loc.","1590"
    - step:
        id: '495'
        action: Script
        object_path: End If
    - step:
        id: '496'
        action: Script
        object_path: Next
    - step:
        id: '497'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Production Order Change:_2").SAPGuiButton("Save   (Ctrl+S)")
        action: Click
    - step:
        id: '498'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Cost Calculation").Exist(3)
          Then
    - step:
        id: '499'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Cost Calculation").SAPGuiButton("Yes")
        action: Click
    - step:
        id: '500'
        action: Script
        object_path: End If
    - step:
        id: '501'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '502'
        object_path: f
        action: WriteLine(order
        args: '& " storage location updated to 1590")'
    - step:
        id: '503'
        object_path: f
        action: Close
    - step:
        id: '504'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '505'
        action: Script
        object_path: Next
    - step:
        id: '506'
        action: Script
        object_path: '''TRANSFER THE MATERIAL / CREDIT IT BACK FROM THE BOLT ORDER
          NUMBER'
    - step:
        id: '507'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Production Order Change:").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMIGO"'
    - step:
        id: '508'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Production Order Change:")
        action: SendKey
        args: ENTER
    - step:
        id: '509'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '510'
        object_path: f
        action: WriteLine()
    - step:
        id: '511'
        object_path: f
        action: WriteLine("Transfering
        args: the material - goods issue")
    - step:
        id: '512'
        object_path: f
        action: Close
    - step:
        id: '513'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '514'
        action: Script
        object_path: For Each category in boltCategory
    - step:
        id: '515'
        action: Script
        object_path: currentMonth = UCase(MonthName(Month(Date()), true))
    - step:
        id: '516'
        action: Script
        object_path: currentYear = Year(Date()) - 2000
    - step:
        id: '517'
        action: Script
        object_path: orderDescription = "Bolt Order "& category &" "& currentMonth
          &" "&currentYear
    - step:
        id: '518'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiComboBox("GODYNPRO-ACTION")
        action: Select
        args: '"Goods Issue"'
    - step:
        id: '519'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Express Information").Exist(1)
          Then
    - step:
        id: '520'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '521'
        action: Script
        object_path: End If
    - step:
        id: '522'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Close
          Detail Data").Exist(1) Then
    - step:
        id: '523'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Close
          Detail Data")
        action: Click
    - step:
        id: '524'
        action: Script
        object_path: End If
    - step:
        id: '525'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiComboBox("SAPGuiComboBox")
        action: Select
        args: '"Other"'
    - step:
        id: '526'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiEdit("Doc.Header
          Text")
        action: Set
        args: orderDescription
    - step:
        id: '527'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiEdit("RE
          for order")
        action: Set
        args: '"262"'
    - step:
        id: '528'
        action: Script
        object_path: o = 1
    - step:
        id: '529'
        action: Script
        object_path: errors = ""
    - step:
        id: '530'
        action: Script
        object_path: rowCount = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM").RowCount
    - step:
        id: '531'
        action: Script
        object_path: If category = "16mm" Then
    - step:
        id: '532'
        action: Script
        object_path: If M16.Count <> 0 Then
    - step:
        id: '533'
        action: Script
        object_path: loopCount = M16.Count / rowCount
    - step:
        id: '534'
        action: Script
        object_path: loopCount = -int(-loopCount/1)*1
    - step:
        id: '535'
        action: Script
        object_path: M16items = M16.Items
    - step:
        id: '536'
        action: Script
        object_path: M16keys = M16.Keys
    - step:
        id: '537'
        action: Script
        object_path: l = 1
    - step:
        id: '538'
        action: Script
        object_path: For loopC = 1 To loopCount
    - step:
        id: '539'
        action: Script
        object_path: For i = 1 to rowCount - 1
    - step:
        id: '540'
        action: Script
        object_path: If l < M16.Count Then
    - step:
        id: '541'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Mat. Short Text",M16keys(l)
    - step:
        id: '542'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Qty in UnE",M16items(l)
    - step:
        id: '543'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"SLoc","1590"
    - step:
        id: '544'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Order","7041601"
    - step:
        id: '545'
        action: Script
        object_path: o = o + 1
    - step:
        id: '546'
        action: Script
        object_path: l = l + 1
    - step:
        id: '547'
        action: Script
        object_path: Else
    - step:
        id: '548'
        action: Script
        object_path: Exit For
    - step:
        id: '549'
        action: Script
        object_path: End If
    - step:
        id: '550'
        action: Script
        object_path: Next
    - step:
        id: '551'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '552'
        action: Script
        object_path: If loopC < loopCount Then
    - step:
        id: '553'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Next
          Page   (Page down)")
        action: Click
    - step:
        id: '554'
        action: Script
        object_path: End If
    - step:
        id: '555'
        action: Script
        object_path: Next
    - step:
        id: '556'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '557'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiStatusBar("StatusBar").Exist
          = false Then
    - step:
        id: '558'
        action: Script
        object_path: items = Array()
    - step:
        id: '559'
        action: Script
        object_path: descs = Array()
    - step:
        id: '560'
        object_path: Desktop
        action: CaptureBitmap
        args: Parameter("location")&"\Error Pop Up "&category&" "&timestamp&".png",true
    - step:
        id: '561'
        action: Script
        object_path: For z = 3 To M16.Count + 3
    - step:
        id: '562'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").Exist
          Then
    - step:
        id: '563'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]")
        action: SetFocus
    - step:
        id: '564'
        action: Script
        object_path: itemNo = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").GetROProperty("content")
    - step:
        id: '565'
        action: Script
        object_path: desc = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[10,"&z&"\]").GetROProperty("content")
    - step:
        id: '566'
        action: Script
        object_path: 'desc1 = Split(desc," : ")'
    - step:
        id: '567'
        action: Script
        object_path: ReDim Preserve items(UBound(items) + 1)
    - step:
        id: '568'
        action: Script
        object_path: items(UBound(items)) = trim(itemNo)
    - step:
        id: '569'
        action: Script
        object_path: ReDim Preserve descs(UBound(descs) + 1)
    - step:
        id: '570'
        action: Script
        object_path: descs(UBound(descs)) = trim(desc1(1))
    - step:
        id: '571'
        action: Script
        object_path: Else
    - step:
        id: '572'
        action: Script
        object_path: Exit For
    - step:
        id: '573'
        action: Script
        object_path: End If
    - step:
        id: '574'
        action: Script
        object_path: Next
    - step:
        id: '575'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '576'
        action: Script
        object_path: For Each desc in descs
    - step:
        id: '577'
        action: Script
        object_path: errors = errors & desc
    - step:
        id: '578'
        action: Script
        object_path: Next
    - step:
        id: '579'
        action: Script
        object_path: For Each item in items
    - step:
        id: '580'
        action: Script
        object_path: x = CInt(item)
    - step:
        id: '581'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: x, "OK", "OFF"
    - step:
        id: '582'
        action: Script
        object_path: Next
    - step:
        id: '583'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '584'
        action: Script
        object_path: End If
    - step:
        id: '585'
        action: Script
        object_path: docNumber = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiStatusBar("StatusBar").GetROProperty("text")
    - step:
        id: '586'
        action: Script
        object_path: If MaterialNumberCredit.Exists("16mm") Then
    - step:
        id: '587'
        object_path: MaterialNumberCredit
        action: Remove("16mm")
    - step:
        id: '588'
        object_path: MaterialNumberCredit
        action: Add
        args: '"16mm", docNumber'
    - step:
        id: '589'
        action: Script
        object_path: Else
    - step:
        id: '590'
        object_path: MaterialNumberCredit
        action: Add
        args: '"16mm", docNumber'
    - step:
        id: '591'
        action: Script
        object_path: End If
    - step:
        id: '592'
        action: Script
        object_path: Else
    - step:
        id: '593'
        action: Script
        object_path: docNumber = ""
    - step:
        id: '594'
        action: Script
        object_path: If MaterialNumberCredit.Exists("16mm") Then
    - step:
        id: '595'
        object_path: MaterialNumberCredit
        action: Remove("16mm")
    - step:
        id: '596'
        object_path: MaterialNumberCredit
        action: Add
        args: '"16mm", docNumber'
    - step:
        id: '597'
        action: Script
        object_path: Else
    - step:
        id: '598'
        object_path: MaterialNumberCredit
        action: Add
        args: '"16mm", docNumber'
    - step:
        id: '599'
        action: Script
        object_path: End If
    - step:
        id: '600'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMIGO"'
    - step:
        id: '601'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '602'
        action: Script
        object_path: End If
    - step:
        id: '603'
        action: Script
        object_path: If docNumber <> "" Then
    - step:
        id: '604'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '605'
        object_path: f
        action: WriteLine("M16
        args: transfer number")
    - step:
        id: '606'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '607'
        action: Script
        object_path: If errors <> "" Then
    - step:
        id: '608'
        object_path: f
        action: 'WriteLine("Errors:'
        args: '"&errors)'
    - step:
        id: '609'
        action: Script
        object_path: End If
    - step:
        id: '610'
        object_path: f
        action: Close
    - step:
        id: '611'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '612'
        action: Script
        object_path: End If
    - step:
        id: '613'
        action: Script
        object_path: ElseIf category = "20mm" Then
    - step:
        id: '614'
        action: Script
        object_path: If M20.Count <> 0 Then
    - step:
        id: '615'
        action: Script
        object_path: loopCount = M20.Count / rowCount
    - step:
        id: '616'
        action: Script
        object_path: loopCount = -int(-loopCount/1)*1
    - step:
        id: '617'
        action: Script
        object_path: M20items = M20.Items
    - step:
        id: '618'
        action: Script
        object_path: M20keys = M20.Keys
    - step:
        id: '619'
        action: Script
        object_path: l = 1
    - step:
        id: '620'
        action: Script
        object_path: For loopC = 1 To loopCount
    - step:
        id: '621'
        action: Script
        object_path: For i = 1 to rowCount - 1
    - step:
        id: '622'
        action: Script
        object_path: If l < M20.Count Then
    - step:
        id: '623'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Mat. Short Text",M20keys(l)
    - step:
        id: '624'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Qty in UnE",M20items(l)
    - step:
        id: '625'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"SLoc","1590"
    - step:
        id: '626'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Order","7041601"
    - step:
        id: '627'
        action: Script
        object_path: o = o + 1
    - step:
        id: '628'
        action: Script
        object_path: l = l + 1
    - step:
        id: '629'
        action: Script
        object_path: Else
    - step:
        id: '630'
        action: Script
        object_path: Exit For
    - step:
        id: '631'
        action: Script
        object_path: End If
    - step:
        id: '632'
        action: Script
        object_path: Next
    - step:
        id: '633'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '634'
        action: Script
        object_path: If loopC < loopCount Then
    - step:
        id: '635'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Next
          Page   (Page down)")
        action: Click
    - step:
        id: '636'
        action: Script
        object_path: End If
    - step:
        id: '637'
        action: Script
        object_path: Next
    - step:
        id: '638'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '639'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiStatusBar("StatusBar").Exist
          = false Then
    - step:
        id: '640'
        action: Script
        object_path: items = Array()
    - step:
        id: '641'
        action: Script
        object_path: descs = Array()
    - step:
        id: '642'
        object_path: Desktop
        action: CaptureBitmap
        args: Parameter("location")&"\Error Pop Up "&category&" "&timestamp&".png",true
    - step:
        id: '643'
        action: Script
        object_path: For z = 3 To M20.Count + 3
    - step:
        id: '644'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").Exist
          Then
    - step:
        id: '645'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]")
        action: SetFocus
    - step:
        id: '646'
        action: Script
        object_path: itemNo = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").GetROProperty("content")
    - step:
        id: '647'
        action: Script
        object_path: desc = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[10,"&z&"\]").GetROProperty("content")
    - step:
        id: '648'
        action: Script
        object_path: 'desc1 = Split(desc," : ")'
    - step:
        id: '649'
        action: Script
        object_path: ReDim Preserve items(UBound(items) + 1)
    - step:
        id: '650'
        action: Script
        object_path: items(UBound(items)) = trim(itemNo)
    - step:
        id: '651'
        action: Script
        object_path: ReDim Preserve descs(UBound(descs) + 1)
    - step:
        id: '652'
        action: Script
        object_path: descs(UBound(descs)) = trim(desc1(1))
    - step:
        id: '653'
        action: Script
        object_path: Else
    - step:
        id: '654'
        action: Script
        object_path: Exit For
    - step:
        id: '655'
        action: Script
        object_path: End If
    - step:
        id: '656'
        action: Script
        object_path: Next
    - step:
        id: '657'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '658'
        action: Script
        object_path: For Each desc in descs
    - step:
        id: '659'
        action: Script
        object_path: errors = errors & desc & ", "
    - step:
        id: '660'
        action: Script
        object_path: Next
    - step:
        id: '661'
        action: Script
        object_path: For Each item in items
    - step:
        id: '662'
        action: Script
        object_path: x = CInt(item)
    - step:
        id: '663'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: x, "OK", "OFF"
    - step:
        id: '664'
        action: Script
        object_path: Next
    - step:
        id: '665'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '666'
        action: Script
        object_path: End If
    - step:
        id: '667'
        action: Script
        object_path: docNumber = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiStatusBar("StatusBar").GetROProperty("text")
    - step:
        id: '668'
        action: Script
        object_path: If MaterialNumberCredit.Exists("20mm") Then
    - step:
        id: '669'
        object_path: MaterialNumberCredit
        action: Remove("20mm")
    - step:
        id: '670'
        object_path: MaterialNumberCredit
        action: Add
        args: '"20mm", docNumber'
    - step:
        id: '671'
        action: Script
        object_path: Else
    - step:
        id: '672'
        object_path: MaterialNumberCredit
        action: Add
        args: '"20mm", docNumber'
    - step:
        id: '673'
        action: Script
        object_path: End If
    - step:
        id: '674'
        action: Script
        object_path: Else
    - step:
        id: '675'
        action: Script
        object_path: docNumber = ""
    - step:
        id: '676'
        action: Script
        object_path: If MaterialNumberCredit.Exists("20mm") Then
    - step:
        id: '677'
        object_path: MaterialNumberCredit
        action: Remove("20mm")
    - step:
        id: '678'
        object_path: MaterialNumberCredit
        action: Add
        args: '"20mm", docNumber'
    - step:
        id: '679'
        action: Script
        object_path: Else
    - step:
        id: '680'
        object_path: MaterialNumberCredit
        action: Add
        args: '"20mm", docNumber'
    - step:
        id: '681'
        action: Script
        object_path: End If
    - step:
        id: '682'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMIGO"'
    - step:
        id: '683'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '684'
        action: Script
        object_path: End If
    - step:
        id: '685'
        action: Script
        object_path: If docNumber <> "" Then
    - step:
        id: '686'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '687'
        object_path: f
        action: WriteLine("M20
        args: transfer number")
    - step:
        id: '688'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '689'
        action: Script
        object_path: If errors <> "" Then
    - step:
        id: '690'
        object_path: f
        action: 'WriteLine("Errors:'
        args: '"&errors)'
    - step:
        id: '691'
        action: Script
        object_path: End If
    - step:
        id: '692'
        object_path: f
        action: Close
    - step:
        id: '693'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '694'
        action: Script
        object_path: End If
    - step:
        id: '695'
        action: Script
        object_path: ElseIf category = "24mm" Then
    - step:
        id: '696'
        action: Script
        object_path: If M24.Count <> 0 Then
    - step:
        id: '697'
        action: Script
        object_path: loopCount = M24.Count / rowCount
    - step:
        id: '698'
        action: Script
        object_path: loopCount = -int(-loopCount/1)*1
    - step:
        id: '699'
        action: Script
        object_path: M24items = M24.Items
    - step:
        id: '700'
        action: Script
        object_path: M24keys = M24.Keys
    - step:
        id: '701'
        action: Script
        object_path: l = 1
    - step:
        id: '702'
        action: Script
        object_path: For loopC = 1 To loopCount
    - step:
        id: '703'
        action: Script
        object_path: For i = 1 to rowCount - 1
    - step:
        id: '704'
        action: Script
        object_path: If l < M24.Count Then
    - step:
        id: '705'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Mat. Short Text",M24keys(l)
    - step:
        id: '706'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Qty in UnE",M24items(l)
    - step:
        id: '707'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"SLoc","1590"
    - step:
        id: '708'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Order","7041601"
    - step:
        id: '709'
        action: Script
        object_path: o = o + 1
    - step:
        id: '710'
        action: Script
        object_path: l = l + 1
    - step:
        id: '711'
        action: Script
        object_path: Else
    - step:
        id: '712'
        action: Script
        object_path: Exit For
    - step:
        id: '713'
        action: Script
        object_path: End If
    - step:
        id: '714'
        action: Script
        object_path: Next
    - step:
        id: '715'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '716'
        action: Script
        object_path: If loopC < loopCount Then
    - step:
        id: '717'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Next
          Page   (Page down)")
        action: Click
    - step:
        id: '718'
        action: Script
        object_path: End If
    - step:
        id: '719'
        action: Script
        object_path: Next
    - step:
        id: '720'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '721'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiStatusBar("StatusBar").Exist
          = false Then
    - step:
        id: '722'
        action: Script
        object_path: items = Array()
    - step:
        id: '723'
        action: Script
        object_path: descs = Array()
    - step:
        id: '724'
        object_path: Desktop
        action: CaptureBitmap
        args: Parameter("location")&"\Error Pop Up "&category&" "&timestamp&".png",true
    - step:
        id: '725'
        action: Script
        object_path: For z = 3 To M24.Count + 3
    - step:
        id: '726'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").Exist
          Then
    - step:
        id: '727'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]")
        action: SetFocus
    - step:
        id: '728'
        action: Script
        object_path: itemNo = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").GetROProperty("content")
    - step:
        id: '729'
        action: Script
        object_path: desc = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[10,"&z&"\]").GetROProperty("content")
    - step:
        id: '730'
        action: Script
        object_path: 'desc1 = Split(desc," : ")'
    - step:
        id: '731'
        action: Script
        object_path: ReDim Preserve items(UBound(items) + 1)
    - step:
        id: '732'
        action: Script
        object_path: items(UBound(items)) = trim(itemNo)
    - step:
        id: '733'
        action: Script
        object_path: ReDim Preserve descs(UBound(descs) + 1)
    - step:
        id: '734'
        action: Script
        object_path: descs(UBound(descs)) = trim(desc1(1))
    - step:
        id: '735'
        action: Script
        object_path: Else
    - step:
        id: '736'
        action: Script
        object_path: Exit For
    - step:
        id: '737'
        action: Script
        object_path: End If
    - step:
        id: '738'
        action: Script
        object_path: Next
    - step:
        id: '739'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '740'
        action: Script
        object_path: For Each desc in descs
    - step:
        id: '741'
        action: Script
        object_path: errors = errors & desc & ", "
    - step:
        id: '742'
        action: Script
        object_path: Next
    - step:
        id: '743'
        action: Script
        object_path: For Each item in items
    - step:
        id: '744'
        action: Script
        object_path: x = CInt(item)
    - step:
        id: '745'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: x, "OK", "OFF"
    - step:
        id: '746'
        action: Script
        object_path: Next
    - step:
        id: '747'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '748'
        action: Script
        object_path: End If
    - step:
        id: '749'
        action: Script
        object_path: docNumber = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiStatusBar("StatusBar").GetROProperty("text")
    - step:
        id: '750'
        action: Script
        object_path: If MaterialNumberCredit.Exists("24mm") Then
    - step:
        id: '751'
        object_path: MaterialNumberCredit
        action: Remove("24mm")
    - step:
        id: '752'
        object_path: MaterialNumberCredit
        action: Add
        args: '"24mm", docNumber'
    - step:
        id: '753'
        action: Script
        object_path: Else
    - step:
        id: '754'
        object_path: MaterialNumberCredit
        action: Add
        args: '"24mm", docNumber'
    - step:
        id: '755'
        action: Script
        object_path: End If
    - step:
        id: '756'
        action: Script
        object_path: Else
    - step:
        id: '757'
        action: Script
        object_path: docNumber = ""
    - step:
        id: '758'
        action: Script
        object_path: If MaterialNumberCredit.Exists("24mm") Then
    - step:
        id: '759'
        object_path: MaterialNumberCredit
        action: Remove("24mm")
    - step:
        id: '760'
        object_path: MaterialNumberCredit
        action: Add
        args: '"24mm", docNumber'
    - step:
        id: '761'
        action: Script
        object_path: Else
    - step:
        id: '762'
        object_path: MaterialNumberCredit
        action: Add
        args: '"24mm", docNumber'
    - step:
        id: '763'
        action: Script
        object_path: End If
    - step:
        id: '764'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMIGO"'
    - step:
        id: '765'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '766'
        action: Script
        object_path: End If
    - step:
        id: '767'
        action: Script
        object_path: If docNumber <> "" Then
    - step:
        id: '768'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '769'
        object_path: f
        action: WriteLine("M24
        args: transfer number")
    - step:
        id: '770'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '771'
        action: Script
        object_path: If errors <> "" Then
    - step:
        id: '772'
        object_path: f
        action: 'WriteLine("Errors:'
        args: '"&errors)'
    - step:
        id: '773'
        action: Script
        object_path: End If
    - step:
        id: '774'
        object_path: f
        action: Close
    - step:
        id: '775'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '776'
        action: Script
        object_path: End If
    - step:
        id: '777'
        action: Script
        object_path: ElseIf category = "30mm" Then
    - step:
        id: '778'
        action: Script
        object_path: If M30.Count <> 0 Then
    - step:
        id: '779'
        action: Script
        object_path: loopCount = M30.Count / rowCount
    - step:
        id: '780'
        action: Script
        object_path: loopCount = -int(-loopCount/1)*1
    - step:
        id: '781'
        action: Script
        object_path: M30items = M30.Items
    - step:
        id: '782'
        action: Script
        object_path: M30keys = M30.Keys
    - step:
        id: '783'
        action: Script
        object_path: l = 1
    - step:
        id: '784'
        action: Script
        object_path: For loopC = 1 To loopCount
    - step:
        id: '785'
        action: Script
        object_path: For i = 1 to rowCount - 1
    - step:
        id: '786'
        action: Script
        object_path: If l < M30.Count Then
    - step:
        id: '787'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Mat. Short Text",M30keys(l)
    - step:
        id: '788'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Qty in UnE",M30items(l)
    - step:
        id: '789'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"SLoc","1590"
    - step:
        id: '790'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: o,"Order","7041601"
    - step:
        id: '791'
        action: Script
        object_path: o = o + 1
    - step:
        id: '792'
        action: Script
        object_path: l = l + 1
    - step:
        id: '793'
        action: Script
        object_path: Else
    - step:
        id: '794'
        action: Script
        object_path: Exit For
    - step:
        id: '795'
        action: Script
        object_path: End If
    - step:
        id: '796'
        action: Script
        object_path: Next
    - step:
        id: '797'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '798'
        action: Script
        object_path: If loopC < loopCount Then
    - step:
        id: '799'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Next
          Page   (Page down)")
        action: Click
    - step:
        id: '800'
        action: Script
        object_path: End If
    - step:
        id: '801'
        action: Script
        object_path: Next
    - step:
        id: '802'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '803'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiStatusBar("StatusBar").Exist
          = false Then
    - step:
        id: '804'
        action: Script
        object_path: items = Array()
    - step:
        id: '805'
        action: Script
        object_path: descs = Array()
    - step:
        id: '806'
        object_path: Desktop
        action: CaptureBitmap
        args: Parameter("location")&"\Error Pop Up "&category&" "&timestamp&".png",true
    - step:
        id: '807'
        action: Script
        object_path: For z = 3 To M30.Count + 3
    - step:
        id: '808'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").Exist
          Then
    - step:
        id: '809'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]")
        action: SetFocus
    - step:
        id: '810'
        action: Script
        object_path: itemNo = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").GetROProperty("content")
    - step:
        id: '811'
        action: Script
        object_path: desc = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[10,"&z&"\]").GetROProperty("content")
    - step:
        id: '812'
        action: Script
        object_path: 'desc1 = Split(desc," : ")'
    - step:
        id: '813'
        action: Script
        object_path: ReDim Preserve items(UBound(items) + 1)
    - step:
        id: '814'
        action: Script
        object_path: items(UBound(items)) = trim(itemNo)
    - step:
        id: '815'
        action: Script
        object_path: ReDim Preserve descs(UBound(descs) + 1)
    - step:
        id: '816'
        action: Script
        object_path: descs(UBound(descs)) = trim(desc1(1))
    - step:
        id: '817'
        action: Script
        object_path: Else
    - step:
        id: '818'
        action: Script
        object_path: Exit For
    - step:
        id: '819'
        action: Script
        object_path: End If
    - step:
        id: '820'
        action: Script
        object_path: Next
    - step:
        id: '821'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '822'
        action: Script
        object_path: For Each desc in descs
    - step:
        id: '823'
        action: Script
        object_path: errors = errors & desc & ", "
    - step:
        id: '824'
        action: Script
        object_path: Next
    - step:
        id: '825'
        action: Script
        object_path: For Each item in items
    - step:
        id: '826'
        action: Script
        object_path: x = CInt(item)
    - step:
        id: '827'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: x, "OK", "OFF"
    - step:
        id: '828'
        action: Script
        object_path: Next
    - step:
        id: '829'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '830'
        action: Script
        object_path: End If
    - step:
        id: '831'
        action: Script
        object_path: docNumber = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiStatusBar("StatusBar").GetROProperty("text")
    - step:
        id: '832'
        action: Script
        object_path: If MaterialNumberCredit.Exists("30mm") Then
    - step:
        id: '833'
        object_path: MaterialNumberCredit
        action: Remove("30mm")
    - step:
        id: '834'
        object_path: MaterialNumberCredit
        action: Add
        args: '"30mm", docNumber'
    - step:
        id: '835'
        action: Script
        object_path: Else
    - step:
        id: '836'
        object_path: MaterialNumberCredit
        action: Add
        args: '"30mm", docNumber'
    - step:
        id: '837'
        action: Script
        object_path: End If
    - step:
        id: '838'
        action: Script
        object_path: Else
    - step:
        id: '839'
        action: Script
        object_path: docNumber = ""
    - step:
        id: '840'
        action: Script
        object_path: If MaterialNumberCredit.Exists("30mm") Then
    - step:
        id: '841'
        object_path: MaterialNumberCredit
        action: Remove("30mm")
    - step:
        id: '842'
        object_path: MaterialNumberCredit
        action: Add
        args: '"30mm", docNumber'
    - step:
        id: '843'
        action: Script
        object_path: Else
    - step:
        id: '844'
        object_path: MaterialNumberCredit
        action: Add
        args: '"30mm", docNumber'
    - step:
        id: '845'
        action: Script
        object_path: End If
    - step:
        id: '846'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMIGO"'
    - step:
        id: '847'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '848'
        action: Script
        object_path: End If
    - step:
        id: '849'
        action: Script
        object_path: If docNumber <> "" Then
    - step:
        id: '850'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '851'
        object_path: f
        action: WriteLine("M30
        args: transfer number")
    - step:
        id: '852'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '853'
        action: Script
        object_path: If errors <> "" Then
    - step:
        id: '854'
        object_path: f
        action: 'WriteLine("Errors:'
        args: '"&errors)'
    - step:
        id: '855'
        action: Script
        object_path: End If
    - step:
        id: '856'
        object_path: f
        action: Close
    - step:
        id: '857'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '858'
        action: Script
        object_path: End If
    - step:
        id: '859'
        action: Script
        object_path: End If
    - step:
        id: '860'
        action: Script
        object_path: If errors = "" Then
    - step:
        id: '861'
        action: Script
        object_path: errors = "NA"
    - step:
        id: '862'
        action: Script
        object_path: End If
    - step:
        id: '863'
        action: Script
        object_path: 'errorMessagesGoodsIssue = errorMessagesGoodsIssue & category
          & ": " & errors & "/"'
    - step:
        id: '864'
        action: Script
        object_path: Next
    - step:
        id: '865'
        action: Script
        object_path: Parameter("errorMessagesGoodsIssue") = errorMessagesGoodsIssue
    - step:
        id: '866'
        action: Script
        object_path: For Each document in MaterialNumberCredit.Keys
    - step:
        id: '867'
        action: Script
        object_path: key = document
    - step:
        id: '868'
        action: Script
        object_path: item = MaterialNumberCredit(document)
    - step:
        id: '869'
        action: Script
        object_path: doc = key &"/"& item &","
    - step:
        id: '870'
        action: Script
        object_path: materialNumberCredits = materialNumberCredits & doc
    - step:
        id: '871'
        action: Script
        object_path: Next
    - step:
        id: '872'
        action: Script
        object_path: Parameter("materialNumberCredits") = materialNumberCredits
    - step:
        id: '873'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '874'
        object_path: f
        action: WriteLine()
    - step:
        id: '875'
        object_path: f
        action: WriteLine("Transfering
        args: the material - order")
    - step:
        id: '876'
        object_path: f
        action: Close
    - step:
        id: '877'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '878'
        action: Script
        object_path: For Each order in orders
    - step:
        id: '879'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiComboBox("SAPGuiComboBox")
        action: Select
        args: '"Order"'
    - step:
        id: '880'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiEdit("GODYNPRO-ORDER_NUMBER")
        action: Set
        args: order
    - step:
        id: '881'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '882'
        action: Script
        object_path: warning = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiStatusBar("StatusBar").GetROProperty("text")
    - step:
        id: '883'
        action: Script
        object_path: errors = ""
    - step:
        id: '884'
        action: Script
        object_path: If warning = "" Then
    - step:
        id: '885'
        action: Script
        object_path: row = SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM").RowCount
    - step:
        id: '886'
        action: Script
        object_path: For z = 1 To row
    - step:
        id: '887'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM").ValidRow(z)
          Then
    - step:
        id: '888'
        action: Script
        object_path: storageLoc = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM").GetCellData(z, "SLoc")
    - step:
        id: '889'
        action: Script
        object_path: material = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM").GetCellData(z, "Material")
    - step:
        id: '890'
        action: Script
        object_path: If (InStr(material,"BW") > 0 or InStr(material,"BP") > 0) Then
    - step:
        id: '891'
        action: Script
        object_path: ''''''' Bug within S4: Storage Locations are being updated however
          in this transaction they are showing as "DO NOT USE"'
    - step:
        id: '892'
        action: Script
        object_path: '''If storageLoc = "P’Yard Stk Pick" and (InStr(material,"BW")
          > 0 or InStr(material,"BP") > 0) Then'
    - step:
        id: '893'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: z, "OK", "ON"
    - step:
        id: '894'
        action: Script
        object_path: End If
    - step:
        id: '895'
        action: Script
        object_path: Else
    - step:
        id: '896'
        action: Script
        object_path: Exit For
    - step:
        id: '897'
        action: Script
        object_path: End If
    - step:
        id: '898'
        action: Script
        object_path: Next
    - step:
        id: '899'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '900'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiStatusBar("StatusBar").Exist
          = false Then
    - step:
        id: '901'
        action: Script
        object_path: items = Array()
    - step:
        id: '902'
        action: Script
        object_path: descs = Array()
    - step:
        id: '903'
        object_path: Desktop
        action: CaptureBitmap
        args: Parameter("location")&"\Error Pop Up "&order&" "&timestamp&".png",true
    - step:
        id: '904'
        action: Wait
        args: '"1"'
        default_args: '"1"'
    - step:
        id: '905'
        action: Script
        object_path: For z = 3 To UBound(orders) + 4
    - step:
        id: '906'
        action: Script
        object_path: If SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").Exist
          Then
    - step:
        id: '907'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]")
        action: SetFocus
    - step:
        id: '908'
        action: Script
        object_path: itemNo = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[5,"&z&"\]").GetROProperty("content")
    - step:
        id: '909'
        action: Script
        object_path: desc = SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiLabel("id:=/app/con\[0\]/ses\[0\]/wnd\[1\]/usr/lbl\[10,"&z&"\]").GetROProperty("content")
    - step:
        id: '910'
        action: Script
        object_path: 'desc1 = Split(desc," : ")'
    - step:
        id: '911'
        action: Script
        object_path: ReDim Preserve items(UBound(items) + 1)
    - step:
        id: '912'
        action: Script
        object_path: items(UBound(items)) = trim(itemNo)
    - step:
        id: '913'
        action: Script
        object_path: ReDim Preserve descs(UBound(descs) + 1)
    - step:
        id: '914'
        action: Script
        object_path: descs(UBound(descs)) = trim(desc1(1))
    - step:
        id: '915'
        action: Script
        object_path: Else
    - step:
        id: '916'
        action: Script
        object_path: Exit For
    - step:
        id: '917'
        action: Script
        object_path: End If
    - step:
        id: '918'
        action: Script
        object_path: Next
    - step:
        id: '919'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Express Information").SAPGuiButton("Continue   (Enter)")
        action: Click
    - step:
        id: '920'
        action: Script
        object_path: For Each desc in descs
    - step:
        id: '921'
        action: Script
        object_path: errors = errors & desc & ", "
    - step:
        id: '922'
        action: Script
        object_path: Next
    - step:
        id: '923'
        action: Script
        object_path: For Each item in items
    - step:
        id: '924'
        action: Script
        object_path: x = CInt(item)
    - step:
        id: '925'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiTable("SAPLMIGOTV_GOITEM")
        action: SetCellData
        args: x, "OK", "OFF"
    - step:
        id: '926'
        action: Script
        object_path: Next
    - step:
        id: '927'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiButton("Post")
        action: Click
    - step:
        id: '928'
        action: Script
        object_path: End If
    - step:
        id: '929'
        action: Script
        object_path: docNumber = SAPGuiSession("Session").SAPGuiWindow("Goods Issue
          Reservation").SAPGuiStatusBar("StatusBar").GetROProperty("text")
    - step:
        id: '930'
        action: Script
        object_path: If MaterialNumberCharge.Exists(order) = false Then
    - step:
        id: '931'
        object_path: MaterialNumberCharge
        action: Add
        args: order, docNumber
    - step:
        id: '932'
        action: Script
        object_path: End If
    - step:
        id: '933'
        action: Script
        object_path: Else
    - step:
        id: '934'
        action: Script
        object_path: If MaterialNumberCharge.Exists(order) = false Then
    - step:
        id: '935'
        object_path: MaterialNumberCharge
        action: Add
        args: order, warning
    - step:
        id: '936'
        action: Script
        object_path: End If
    - step:
        id: '937'
        action: Script
        object_path: End If
    - step:
        id: '938'
        action: Script
        object_path: Set f = fso.openTextFile(textfile,8)
    - step:
        id: '939'
        object_path: f
        action: WriteLine(order&"
        args: transfer number")
    - step:
        id: '940'
        object_path: f
        action: WriteLine(docNumber)
    - step:
        id: '941'
        action: Script
        object_path: If errors <> "" Then
    - step:
        id: '942'
        object_path: f
        action: 'WriteLine("Errors:'
        args: '"&errors)'
    - step:
        id: '943'
        action: Script
        object_path: End If
    - step:
        id: '944'
        object_path: f
        action: Close
    - step:
        id: '945'
        action: Script
        object_path: Set f = Nothing
    - step:
        id: '946'
        action: Script
        object_path: If errors = "" Then
    - step:
        id: '947'
        action: Script
        object_path: errors = "NA"
    - step:
        id: '948'
        action: Script
        object_path: End If
    - step:
        id: '949'
        action: Script
        object_path: 'errorMessagesGoodsOrder = errorMessagesGoodsOrder & order &
          ": " & errors & "/"'
    - step:
        id: '950'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/nMIGO"'
    - step:
        id: '951'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '952'
        action: Script
        object_path: Next
    - step:
        id: '953'
        action: Script
        object_path: For Each document in MaterialNumberCharge.Keys
    - step:
        id: '954'
        action: Script
        object_path: key = document
    - step:
        id: '955'
        action: Script
        object_path: item = MaterialNumberCharge(document)
    - step:
        id: '956'
        action: Script
        object_path: doc = key &"/"& item &","
    - step:
        id: '957'
        action: Script
        object_path: materialNumberCharges = materialNumberCharges & doc
    - step:
        id: '958'
        action: Script
        object_path: Next
    - step:
        id: '959'
        action: Script
        object_path: Parameter("materialNumberCharges") = materialNumberCharges
    - step:
        id: '960'
        action: Script
        object_path: Parameter("errorMessagesGoodsOrder") = errorMessagesGoodsOrder
    - step:
        id: '961'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation").SAPGuiOKCode("OKCode")
        action: Set
        args: '"/n"'
    - step:
        id: '962'
        object_path: SAPGuiSession("Session").SAPGuiWindow("Goods Issue Reservation")
        action: SendKey
        args: ENTER
    - step:
        id: '963'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
    - step:
        id: '964'
        action: Script
        object_path: Set fso = Nothing
    - step:
        id: '965'
        action: Script
        object_path: Set M16 = Nothing
    - step:
        id: '966'
        action: Script
        object_path: Set M20 = Nothing
    - step:
        id: '967'
        action: Script
        object_path: Set M24 = Nothing
    - step:
        id: '968'
        action: Script
        object_path: Set M30 = Nothing
    - step:
        id: '969'
        action: Script
        object_path: Set DocumentNumber = Nothing
    - step:
        id: '970'
        action: Script
        object_path: Set MaterialNumberCredit = Nothing
    - step:
        id: '971'
        action: Script
        object_path: Set MaterialNumberCharge = Nothing
    - step:
        id: '972'
        action: Script
        object_path: ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
  outputs:
  - materialNumberCharges:
      robot: true
      value: ${materialNumberCharges}
  - materialNumberCredits:
      robot: true
      value: ${materialNumberCredits}
  - documentNumbers:
      robot: true
      value: ${documentNumbers}
  - pickingDate:
      robot: true
      value: ${pickingDate}
  - errorMessagesGoodsOrder:
      robot: true
      value: ${errorMessagesGoodsOrder}
  - errorMessagesGoodsIssue:
      robot: true
      value: ${errorMessagesGoodsIssue}
  - log:
      robot: true
      value: ${log}
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
      name: Window
      properties:
      - property:
          value:
            value: TaskListThumbnailWnd
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
        - regexpwndclass
        - is owned window
        - is child window
        ordinal_identifier: ''
      smart_identification: ''
      custom_replay:
        behavior:
          value: TaskListThumbnailWnd
          name: simclass
          type: STRING
      comments: ''
      visual_relations: ''
      last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
      last_update_time: Tuesday, 4 April 2023 2:59:01 PM
      child_objects:
      - object:
          class: SAPGuiWindow
          name: Truck hit address
          properties:
          - property:
              value:
                value: ZM01
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
                value: ZAPMLWM0
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: Address
              properties:
              - property:
                  value:
                    value: btn[5]
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
                    value: wnd[0]/tbar[1]/btn[5]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
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
          custom_replay:
            behavior: ''
          comments: ''
          visual_relations:
            visual_relation: []
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Reservation List Inventory_2
          properties:
          - property:
              value:
                value: MB25
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
                value: RM07RESLH
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
          - object:
              class: SAPGuiCheckBox
              name: Receipts
              properties:
              - property:
                  value:
                    value: Receipts
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: P_RECEIP
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '42'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/chkP_RECEIP
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Open Reservations
              properties:
              - property:
                  value:
                    value: Open Reservations
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: P_OPEN
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '42'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/chkP_OPEN
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Issues
              properties:
              - property:
                  value:
                    value: Issues
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: P_ISSUES
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '42'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/chkP_ISSUES
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Goods Movement Not Possible
              properties:
              - property:
                  value:
                    value: Goods Movement Not Possible
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: P_CLOSED
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '42'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/chkP_CLOSED
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiCheckBox
              name: Cancellable Reservations
              properties:
              - property:
                  value:
                    value: Cancellable Reservations
                    regular_expression: false
                  name: text
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: P_CANCEL
                    regular_expression: false
                  name: name
                  hidden: false
                  read_only: false
                  type: STRING
              - property:
                  value:
                    value: SAPGuiCheckBox
                    regular_expression: false
                  name: micclass
                  hidden: true
                  read_only: true
                  type: STRING
              - property:
                  value:
                    value: '42'
                    regular_expression: false
                  name: guicomponenttype
                  hidden: false
                  read_only: false
                  type: NUMBER
              - property:
                  value:
                    value: wnd[0]/usr/chkP_CANCEL
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Multiple selection
              properties:
              - property:
                  value:
                    value: '%_AUFNR_%_APP_%-VALU_PUSH'
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
                    value: wnd[0]/usr/btn%_AUFNR_%_APP_%-VALU_PUSH
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Reservation List Inventory
          properties:
          - property:
              value:
                value: MB25
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Production Order Change:_2
          properties:
          - property:
              value:
                value: CO02
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
                value: SAPLCOMK
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: Component Overview
              properties:
              - property:
                  value:
                    value: SAPLCOMKTCTRL_0120
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
                    value: wnd[0]/usr/tblSAPLCOMKTCTRL_0120
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Production Order Change:'
          properties:
          - property:
              value:
                value: CO02
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
                value: SAPLCOKO1
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Order
              properties:
              - property:
                  value:
                    value: CAUFVD-AUFNR
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
                    value: wnd[0]/usr/ctxtCAUFVD-AUFNR
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Component Overview   (F6)
              properties:
              - property:
                  value:
                    value: btn[6]
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
                    value: wnd[0]/tbar[1]/btn[6]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Multiple Selection for
          properties:
          - property:
              value:
                value: MB25
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: SAPLALDBSINGLE
              properties:
              - property:
                  value:
                    value: SAPLALDBSINGLE
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
                    value: wnd[1]/usr/tabsTAB_STRIP/tabpSIVA/ssubSCREEN_HEADER:SAPLALDB:3010/tblSAPLALDBSINGLE
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Copy   (F8)
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
                    value: wnd[1]/tbar[0]/btn[8]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Information
          properties:
          - property:
              value:
                value: ZM01
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '10'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMSDYP
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Goods Issue Reservation
          properties:
          - property:
              value:
                value: MIGO
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '1'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPLMIGO
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
          - object:
              class: SAPGuiTable
              name: SAPLMIGOTV_GOITEM
              properties:
              - property:
                  value:
                    value: SAPLMIGOTV_GOITEM
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
                    value: wnd[0]/usr/ssubSUB_MAIN_CARRIER:SAPLMIGO:0002/subSUB_ITEMLIST:SAPLMIGO:0200/tblSAPLMIGOTV_GOITEM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: RE for order
              properties:
              - property:
                  value:
                    value: GODEFAULT_TV-BWART
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
                    value: wnd[0]/usr/ssubSUB_MAIN_CARRIER:SAPLMIGO:0002/subSUB_FIRSTLINE:SAPLMIGO:0010/ctxtGODEFAULT_TV-BWART
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: GODYNPRO-ORDER_NUMBER
              properties:
              - property:
                  value:
                    value: GODYNPRO-ORDER_NUMBER
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
                    value: wnd[0]/usr/ssubSUB_MAIN_CARRIER:SAPLMIGO:0002/subSUB_FIRSTLINE:SAPLMIGO:0010/subSUB_FIRSTLINE_REFDOC:SAPLMIGO:2070/ctxtGODYNPRO-ORDER_NUMBER
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Doc.Header Text
              properties:
              - property:
                  value:
                    value: GOHEAD-BKTXT
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
                    value: wnd[0]/usr/ssubSUB_MAIN_CARRIER:SAPLMIGO:0003/subSUB_HEADER:SAPLMIGO:0101/subSUB_HEADER:SAPLMIGO:0100/tabsTS_GOHEAD/tabpOK_GOHEAD_GENERAL/ssubSUB_TS_GOHEAD_GENERAL:SAPLMIGO:0112/txtGOHEAD-BKTXT
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiComboBox
              name: SAPGuiComboBox
              properties:
              - property:
                  value:
                    value: GODYNPRO-REFDOC
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
                    value: wnd[0]/usr/ssubSUB_MAIN_CARRIER:SAPLMIGO:0002/subSUB_FIRSTLINE:SAPLMIGO:0010/cmbGODYNPRO-REFDOC
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiComboBox
              name: GODYNPRO-ACTION
              properties:
              - property:
                  value:
                    value: GODYNPRO-ACTION
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
                    value: wnd[0]/usr/ssubSUB_MAIN_CARRIER:SAPLMIGO:0002/subSUB_FIRSTLINE:SAPLMIGO:0010/cmbGODYNPRO-ACTION
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Post
              properties:
              - property:
                  value:
                    value: btn[23]
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
                    value: wnd[0]/tbar[1]/btn[23]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Next Page   (Page down)
              properties:
              - property:
                  value:
                    value: btn[82]
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
                    value: wnd[0]/tbar[0]/btn[82]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Close Detail Data
              properties:
              - property:
                  value:
                    value: BUTTON_ITEMDETAIL
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
                    value: wnd[0]/usr/ssubSUB_MAIN_CARRIER:SAPLMIGO:0003/subSUB_ITEMDETAIL:SAPLMIGO:0301/btnBUTTON_ITEMDETAIL
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Express Information
          properties:
          - property:
              value:
                value: MIGO
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
          - object:
              class: SAPGuiLabel
              name: Deficit of SL Unrestricted-use
              properties:
              - property:
                  value:
                    value: wnd[1]/usr/lbl[10,3]
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
                    value: wnd[1]/usr/lbl[10,3]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiLabel
              name: '19'
              properties:
              - property:
                  value:
                    value: wnd[1]/usr/lbl[5,3]
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
                    value: wnd[1]/usr/lbl[5,3]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: '1'
              properties:
              - property:
                  value:
                    value: btn[17]
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
                    value: wnd[1]/tbar[0]/btn[17]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Delivery address for order
          properties:
          - property:
              value:
                value: ZM01
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
                value: ZAPMLWM0
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Truck Hit
              properties:
              - property:
                  value:
                    value: btn[6]
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
                    value: wnd[0]/tbar[1]/btn[6]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Delivery address details
          properties:
          - property:
              value:
                value: ZM01
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
                value: ZAPMLWM0
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
          - object:
              class: SAPGuiEdit
              name: Telephone no.
              properties:
              - property:
                  value:
                    value: ZZM01A-TELF1
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
                    value: wnd[0]/usr/txtZZM01A-TELF1
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Street
              properties:
              - property:
                  value:
                    value: ZZM01A-STRAS
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
                    value: wnd[0]/usr/txtZZM01A-STRAS
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Proj.Name / Desc
              properties:
              - property:
                  value:
                    value: ZZM01A-NAME1
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
                    value: wnd[0]/usr/txtZZM01A-NAME1
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Depot (Closest)
              properties:
              - property:
                  value:
                    value: ZZM01A-LGORT
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
                    value: wnd[0]/usr/ctxtZZM01A-LGORT
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Contact person
              properties:
              - property:
                  value:
                    value: ZZM01A-NAME2
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
                    value: wnd[0]/usr/txtZZM01A-NAME2
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Create Reservation: New_2'
          properties:
          - property:
              value:
                value: MB21
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '510'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMM07R
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Create Reservation: New'
          properties:
          - property:
              value:
                value: MB21
                regular_expression: false
              name: transaction
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '521'
                regular_expression: false
              name: screennumber
              hidden: false
              read_only: false
              type: NUMBER
          - property:
              value:
                value: SAPMM07R
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Quantity in_4
              properties:
              - property:
                  value:
                    value: RESB-ERFMG
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
                    value: wnd[0]/usr/sub:SAPMM07R:0521/txtRESB-ERFMG[3,26]
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
                  value: 20
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Quantity in_3
              properties:
              - property:
                  value:
                    value: RESB-ERFMG
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
                    value: wnd[0]/usr/sub:SAPMM07R:0521/txtRESB-ERFMG[2,26]
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
                  value: 12
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Quantity in_2
              properties:
              - property:
                  value:
                    value: RESB-ERFMG
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
                    value: wnd[0]/usr/sub:SAPMM07R:0521/txtRESB-ERFMG[1,26]
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
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Quantity in
              properties:
              - property:
                  value:
                    value: RESB-ERFMG
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
                    value: wnd[0]/usr/sub:SAPMM07R:0521/txtRESB-ERFMG[0,26]
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
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Order
              properties:
              - property:
                  value:
                    value: COBL-AUFNR
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
                    value: wnd[0]/usr/subBLOCK:SAPLKACB:1007/ctxtCOBL-AUFNR
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Material_4
              properties:
              - property:
                  value:
                    value: RESB-MATNR
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
                    value: wnd[0]/usr/sub:SAPMM07R:0521/ctxtRESB-MATNR[3,7]
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
                  value: 20
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Material_3
              properties:
              - property:
                  value:
                    value: RESB-MATNR
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
                    value: wnd[0]/usr/sub:SAPMM07R:0521/ctxtRESB-MATNR[2,7]
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
                  value: 12
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Material_2
              properties:
              - property:
                  value:
                    value: RESB-MATNR
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
                    value: wnd[0]/usr/sub:SAPMM07R:0521/ctxtRESB-MATNR[1,7]
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
                  value: 1
                  type: index
              smart_identification: ''
              custom_replay: ''
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Material
              properties:
              - property:
                  value:
                    value: RESB-MATNR
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
                    value: wnd[0]/usr/sub:SAPMM07R:0521/ctxtRESB-MATNR[0,7]
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
              comments: ''
              visual_relations: ''
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Goods recipient
              properties:
              - property:
                  value:
                    value: RKPF-WEMPF
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
                    value: wnd[0]/usr/txtRKPF-WEMPF
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Post   (Ctrl+S)
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: New Items   (F7)
              properties:
              - property:
                  value:
                    value: btn[7]
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
                    value: wnd[0]/tbar[1]/btn[7]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: 'Create Reservation: Initial'
          properties:
          - property:
              value:
                value: MB21
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
                value: SAPMM07R
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Plant
              properties:
              - property:
                  value:
                    value: RM07M-WERKS
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
                    value: wnd[0]/usr/ctxtRM07M-WERKS
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Movement type
              properties:
              - property:
                  value:
                    value: RM07M-BWART
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
                    value: wnd[0]/usr/ctxtRM07M-BWART
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiEdit
              name: Base date
              properties:
              - property:
                  value:
                    value: RM07M-RSDAT
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
                    value: wnd[0]/usr/ctxtRM07M-RSDAT
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
          - object:
              class: SAPGuiButton
              name: Enter
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
                    value: wnd[0]/tbar[0]/btn[0]
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
      - object:
          class: SAPGuiWindow
          name: Cost Calculation
          properties:
          - property:
              value:
                value: CO02
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
                value: SAPLSPO1
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
          last_update_time: Tuesday, 4 April 2023 2:59:01 PM
          child_objects:
          - object:
              class: SAPGuiButton
              name: 'Yes'
              properties:
              - property:
                  value:
                    value: SPOP-OPTION1
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
                    value: wnd[1]/usr/btnSPOP-OPTION1
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
              last_update_time: Tuesday, 4 April 2023 2:59:01 PM
              child_objects: []
  check_points_and_outputs: []
  parameters: []
