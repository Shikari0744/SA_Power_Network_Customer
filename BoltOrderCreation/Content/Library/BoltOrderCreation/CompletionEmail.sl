namespace: BoltOrderCreation
operation:
  name: CompletionEmail
  inputs:
  - boltOrders: 8033320, 8033300, 8033208, 8033281
  - documentNumbers: 16mm/Document 0005922368 posted,20mm/Document 0005922369 posted,24mm/No
      orders placed for 24mm,30mm/No orders placed for 30mm,
  - materialCharges: 8033320/You have not flagged any items as OK,8033300/You have
      not flagged any items as OK,8033208/You have not flagged any items as OK,8033281/You
      have not flagged any items as OK,
  - materialCredits: 16mm/Material document 4901834910 posted,20mm/Material document
      4901835001 posted,24mm/No orders placed for 24mm,30mm/No orders placed for 30mm,
  - pickingDate: 23.02.2023
  - goodsIssueError: '16mm: NA/20mm: NA/24mm: NA/30mm: NA/'
  - goodsOrderError: '8033320: NA/8033300: NA/8033208: NA/8033281: NA/'
  - loggingtextfile: C:\Users\haasj0\OneDrive - SA Power Networks\Documents\Process
      Automation\Bolt Order Creation\Bolt Orders 11012023 22415 PM.txt
  sequential_action:
    gav: com.microfocus.seq:BoltOrderCreation.CompletionEmail:1.0.0
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
        object_path: '''''all items of the array must have a value even if no error
          i.e. length of goods order error must equal length of bolt orders'
    - step:
        id: '2'
        action: Script
        object_path: boltOrders = Parameter("boltOrders")
    - step:
        id: '3'
        action: Script
        object_path: boltOrders = Replace(boltOrders, " ","")
    - step:
        id: '4'
        action: Script
        object_path: boltOrders = Split(boltOrders, ",")
    - step:
        id: '5'
        action: Script
        object_path: documentNumbers = Parameter("documentNumbers")
    - step:
        id: '6'
        action: Script
        object_path: 'documentNumbers = Replace(documentNumbers, "/", ": ")'
    - step:
        id: '7'
        action: Script
        object_path: documentNumbers = Split(documentNumbers, ",")
    - step:
        id: '8'
        action: Script
        object_path: materialCharges = Parameter("materialCharges")
    - step:
        id: '9'
        action: Script
        object_path: 'materialCharges = Replace(materialCharges, "/", ": ")'
    - step:
        id: '10'
        action: Script
        object_path: materialCharges = Split(materialCharges, ",")
    - step:
        id: '11'
        action: Script
        object_path: materialCredits = Parameter("materialCredits")
    - step:
        id: '12'
        action: Script
        object_path: 'materialCredits = Replace(materialCredits, "/", ": ")'
    - step:
        id: '13'
        action: Script
        object_path: materialCredits = Split(materialCredits, ",")
    - step:
        id: '14'
        action: Script
        object_path: goodsIssueError = Parameter("goodsIssueError")
    - step:
        id: '15'
        action: Script
        object_path: goodsIssueError = Replace(goodsIssueError, " , ", " ")
    - step:
        id: '16'
        action: Script
        object_path: goodsIssueError = Split(goodsIssueError, "/")
    - step:
        id: '17'
        action: Script
        object_path: goodsOrderError = Parameter("goodsOrderError")
    - step:
        id: '18'
        action: Script
        object_path: goodsOrderError = Replace(goodsOrderError, " , ", " ")
    - step:
        id: '19'
        action: Script
        object_path: goodsOrderError = Split(goodsOrderError, "/")
    - step:
        id: '20'
        action: Script
        object_path: pickingDate = Parameter("pickingDate")
    - step:
        id: '21'
        action: Script
        object_path: If UBound(boltOrders) = 0 Then
    - step:
        id: '22'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '23'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 1 Then
    - step:
        id: '24'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '25'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 2 Then
    - step:
        id: '26'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '27'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 3 Then
    - step:
        id: '28'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&boltOrders(3)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&materialCharges(3)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&goodsOrderError(3)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '29'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 4 Then
    - step:
        id: '30'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&boltOrders(3)&vbNewLine&boltOrders(4)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&materialCharges(3)&vbNewLine&materialCharges(4)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&goodsOrderError(3)&vbNewLine&goodsOrderError(4)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '31'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 5 Then
    - step:
        id: '32'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&boltOrders(3)&vbNewLine&boltOrders(4)&vbNewLine&boltOrders(5)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&materialCharges(3)&vbNewLine&materialCharges(4)&vbNewLine&materialCharges(5)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&goodsOrderError(3)&vbNewLine&goodsOrderError(4)&vbNewLine&goodsOrderError(5)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '33'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 6 Then
    - step:
        id: '34'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&boltOrders(3)&vbNewLine&boltOrders(4)&vbNewLine&boltOrders(5)&vbNewLine&boltOrders(6)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&materialCharges(3)&vbNewLine&materialCharges(4)&vbNewLine&materialCharges(5)&vbNewLine&materialCharges(6)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&goodsOrderError(3)&vbNewLine&goodsOrderError(4)&vbNewLine&goodsOrderError(5)&vbNewLine&goodsOrderError(6)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '35'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 7 Then
    - step:
        id: '36'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&boltOrders(3)&vbNewLine&boltOrders(4)&vbNewLine&boltOrders(5)&vbNewLine&boltOrders(6)&vbNewLine&boltOrders(7)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&materialCharges(3)&vbNewLine&materialCharges(4)&vbNewLine&materialCharges(5)&vbNewLine&materialCharges(6)&vbNewLine&materialCharges(7)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&goodsOrderError(3)&vbNewLine&goodsOrderError(4)&vbNewLine&goodsOrderError(5)&vbNewLine&goodsOrderError(6)&vbNewLine&goodsOrderError(7)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '37'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 8 Then
    - step:
        id: '38'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&boltOrders(3)&vbNewLine&boltOrders(4)&vbNewLine&boltOrders(5)&vbNewLine&boltOrders(6)&vbNewLine&boltOrders(7)&vbNewLine&boltOrders(8)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&materialCharges(3)&vbNewLine&materialCharges(4)&vbNewLine&materialCharges(5)&vbNewLine&materialCharges(6)&vbNewLine&materialCharges(7)&vbNewLine&materialCharges(8)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&goodsOrderError(3)&vbNewLine&goodsOrderError(4)&vbNewLine&goodsOrderError(5)&vbNewLine&goodsOrderError(6)&vbNewLine&goodsOrderError(7)&vbNewLine&goodsOrderError(8)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '39'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 9 Then
    - step:
        id: '40'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&boltOrders(3)&vbNewLine&boltOrders(4)&vbNewLine&boltOrders(5)&vbNewLine&boltOrders(6)&vbNewLine&boltOrders(7)&vbNewLine&boltOrders(8)&vbNewLine&boltOrders(9)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&materialCharges(3)&vbNewLine&materialCharges(4)&vbNewLine&materialCharges(5)&vbNewLine&materialCharges(6)&vbNewLine&materialCharges(7)&vbNewLine&materialCharges(8)&vbNewLine&materialCharges(9)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&goodsOrderError(3)&vbNewLine&goodsOrderError(4)&vbNewLine&goodsOrderError(5)&vbNewLine&goodsOrderError(6)&vbNewLine&goodsOrderError(7)&vbNewLine&goodsOrderError(8)&vbNewLine&goodsOrderError(9)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '41'
        action: Script
        object_path: ElseIf UBound(boltOrders) = 10 Then
    - step:
        id: '42'
        action: Script
        object_path: 'body = "Hi,"&vbNewLine&vbNewLine&"Pole yard bolt orders with
          picking date of "&pickingDate&" has completed successfully:"&vbNewLine&vbNewLine&"Production
          Order Numbers: "&vbNewline&boltOrders(0)&vbNewLine&boltOrders(1)&vbNewLine&boltOrders(2)&vbNewLine&boltOrders(3)&vbNewLine&boltOrders(4)&vbNewLine&boltOrders(5)&vbNewLine&boltOrders(6)&vbNewLine&boltOrders(7)&vbNewLine&boltOrders(8)&vbNewLine&boltOrders(9)&vbNewLine&boltOrders(10)&vbNewLine&vbNewLine&"Reservation
          Numbers:"&vbNewLine&documentNumbers(0)&vbNewLine&documentNumbers(1)&vbNewLine&documentNumbers(2)&vbNewLine&documentNumbers(3)&vbNewLine&vbNewLine&"Pole
          Bolt Production Order Number Credits:"&vbNewLine&materialCredits(0)&vbNewLine&materialCredits(1)&vbNewLine&materialCredits(2)&vbNewLine&materialCredits(3)&vbNewLine&vbNewLine&"Production
          Order Number Charges:"&vbNewLine&materialCharges(0)&vbNewLine&materialCharges(1)&vbNewLine&materialCharges(2)&vbNewLine&materialCharges(3)&vbNewLine&materialCharges(4)&vbNewLine&materialCharges(5)&vbNewLine&materialCharges(6)&vbNewLine&materialCharges(7)&vbNewLine&materialCharges(8)&vbNewLine&materialCharges(9)&vbNewLine&materialCharges(10)&vbNewLine&vbNewLine&"Goods
          Issue Errors:"&vbNewLine&goodsIssueError(0)&vbNewLine&goodsIssueError(1)&vbNewLine&goodsIssueError(2)&vbNewLine&goodsIssueError(3)&vbNewLine&vbNewLine&"Goods
          Order Errors:"&vbNewLine&goodsOrderError(0)&vbNewLine&goodsOrderError(1)&vbNewLine&goodsOrderError(2)&vbNewLine&goodsOrderError(3)&vbNewLine&goodsOrderError(4)&vbNewLine&goodsOrderError(5)&vbNewLine&goodsOrderError(6)&vbNewLine&goodsOrderError(7)&vbNewLine&goodsOrderError(8)&vbNewLine&goodsOrderError(9)&vbNewLine&goodsOrderError(10)&vbNewLine&vbNewLine&"Thanks,"&vbNewLine&"IT
          Automation Team"'
    - step:
        id: '43'
        action: Script
        object_path: End If
    - step:
        id: '44'
        action: Script
        object_path: Set MyEmail = CreateObject("CDO.Message")
    - step:
        id: '45'
        object_path: MyEmail
        action: Cc
        args: = "Andreas.Anreitter@sapowernetworks.com.au"
    - step:
        id: '46'
        object_path: MyEmail
        action: To
        args: = "PoleYardBoltOrders@sapowernetworks.com.au"
    - step:
        id: '47'
        object_path: MyEmail
        action: From
        args: = "Process_Automation@sapowernetworks.com.au"
    - step:
        id: '48'
        object_path: MyEmail
        action: Subject
        args: = "Pole Yard Bolt Orders - Automation Update"
    - step:
        id: '49'
        object_path: MyEmail
        action: TextBody
        args: = body
    - step:
        id: '50'
        object_path: MyEmail
        action: AddAttachment
        args: Parameter("loggingtextfile")
    - step:
        id: '51'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/sendusing")=2
    - step:
        id: '52'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserver")="emanager"
    - step:
        id: '53'
        object_path: MyEmail.Configuration.Fields
        action: Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport")=25
    - step:
        id: '54'
        object_path: MyEmail.Configuration.Fields
        action: Update
    - step:
        id: '55'
        object_path: MyEmail
        action: Send
    - step:
        id: '56'
        action: Script
        object_path: Set MyEmail = Nothing
    - step:
        id: '57'
        action: Script
        object_path: Parameter("body") = body
  outputs:
  - body:
      robot: true
      value: ${body}
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
