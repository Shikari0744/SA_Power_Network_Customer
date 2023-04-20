namespace: MSATS_CTC_Compliance
operation:
  name: CTC_Compliance
  inputs:
    - msats_user
    - new_excel
    - msats_pass
    - site_url
  sequential_action:
    gav: 'com.microfocus.seq:MSATS_CTC_Compliance.CTC_Compliance:1.0.0'
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
          object_path: "'OPEN EXCEL"
      - step:
          id: '2'
          object_path: SystemUtil
          action: CloseProcessByName
          args: '"msedge.exe"'
      - step:
          id: '3'
          action: Script
          object_path: 'Set objExcel = CreateObject("Excel.Application")'
      - step:
          id: '4'
          object_path: objExcel
          action: visible
          args: = true
      - step:
          id: '5'
          action: Script
          object_path: "Set objWorkbook = objExcel.Workbooks.open(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\CTC_Compliance\\\"&Parameter(\"new_excel\"))"
      - step:
          id: '6'
          action: Script
          object_path: "'Set objWorkbookOld = objExcel.Workbooks.open(\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\CTC_Compliance\\Previous Run.xlsx\")"
      - step:
          id: '7'
          action: Script
          object_path: Set objSheet = objWorkbook.Worksheets(1)
      - step:
          id: '8'
          action: Script
          object_path: "'Set objSheetOld = objWorkbookOld.Worksheets(1)"
      - step:
          id: '9'
          action: Script
          object_path: row = objSheet.usedrange.Rows.Count
      - step:
          id: '10'
          action: Script
          object_path: "'rowOld = objSheetOld.usedrange.Rows.Count"
      - step:
          id: '11'
          action: Script
          object_path: "''GET LAST TRANSACTION ID"
      - step:
          id: '12'
          action: Script
          object_path: "'transactionIDOld = objSheetOld.cells(rowOld,11).value"
      - step:
          id: '13'
          object_path: "'objWorkbookOld"
          action: save
      - step:
          id: '14'
          object_path: "'objWorkbookOld"
          action: close
      - step:
          id: '15'
          action: Script
          object_path: "'transactOld = Split(transactionIDOld,\"_\")"
      - step:
          id: '16'
          action: Script
          object_path: "'startTrans = transactOld(5)"
      - step:
          id: '17'
          action: Script
          object_path: "'startTrans = Cint(startTrans) + 1"
      - step:
          id: '18'
          action: Script
          object_path: "'CREATE TRANSACTION IDs"
      - step:
          id: '19'
          action: Script
          object_path: "'check with Michael if transaction ID should continue on from previous submission or start from 1 again"
      - step:
          id: '20'
          action: Script
          object_path: "'y = startTrans"
      - step:
          id: '21'
          action: Script
          object_path: y = 1
      - step:
          id: '22'
          action: Script
          object_path: For x = 2 To row
      - step:
          id: '23'
          action: Script
          object_path: 's = Right("00000" & y, 5)'
      - step:
          id: '24'
          action: Script
          object_path: 'transactionID = "SPN_MI_BOT_CTC_UPDATE_" & s'
      - step:
          id: '25'
          object_path: 'objSheet.cells(x,11)'
          action: value
          args: = transactionID
      - step:
          id: '26'
          action: Script
          object_path: y = y + 1
      - step:
          id: '27'
          action: Script
          object_path: Next
      - step:
          id: '28'
          action: Script
          object_path: "'OPEN MSATS"
      - step:
          id: '29'
          action: Script
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '30'
          action: Script
          object_path: 'URL = Parameter("site_url")'
      - step:
          id: '31'
          object_path: mySendKeys
          action: Run
          args: '"msedge -url "&URL'
      - step:
          id: '32'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '33'
          action: Wait
          args: '"3"'
          default_args: '"1"'
      - step:
          id: '34'
          object_path: 'Browser("Login").Page("Login").WebEdit("userID")'
          action: Set
          args: 'Parameter("msats_user")'
      - step:
          id: '35'
          object_path: 'Browser("Login").Page("Login").WebEdit("password")'
          action: Set
          args: 'Parameter("msats_pass")'
      - step:
          id: '36'
          object_path: 'Browser("Login").Page("Login").Image("Login")'
          action: Click
      - step:
          id: '37'
          object_path: 'Browser("Login").Page("MSATS").Frame("toc").WebElement("Transactions")'
          action: Click
      - step:
          id: '38'
          object_path: 'Browser("Login").Page("MSATS").Frame("toc").Link("Change Requests")'
          action: Click
      - step:
          id: '39'
          action: Script
          object_path: "'ACTION NMIs"
      - step:
          id: '40'
          action: Script
          object_path: For x = 2 To row
      - step:
          id: '41'
          action: Script
          object_path: 'crid = objSheet.cells(x,12).value'
      - step:
          id: '42'
          action: Script
          object_path: 'If crid = "" Then'
      - step:
          id: '43'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL").Link("New")'
          action: Click
      - step:
          id: '44'
          action: Script
          object_path: 'nmi = objSheet.cells(x,1).value'
      - step:
          id: '45'
          action: Script
          object_path: 'checksum = objSheet.cells(x,2).value'
      - step:
          id: '46'
          action: Script
          object_path: 'classcode = objSheet.cells(x,5).value'
      - step:
          id: '47'
          action: Script
          object_path: 'ctc = objSheet.cells(x,6).value'
      - step:
          id: '48'
          action: Script
          object_path: 'proposedDate = objSheet.cells(x,10).value'
      - step:
          id: '49'
          action: Script
          object_path: 'transID = objSheet.cells(x,11).value'
      - step:
          id: '50'
          action: Script
          object_path: proposedMonth = Month(proposedDate)
      - step:
          id: '51'
          action: Script
          object_path: 'proposedMonth = MonthName(proposedMonth, True)'
      - step:
          id: '52'
          action: Script
          object_path: 'proposedDate = Split(proposedDate, "/")'
      - step:
          id: '53'
          action: Script
          object_path: 'formattedProposedDate = proposedDate(0)&"-"&proposedMonth&"-"&proposedDate(2)'
      - step:
          id: '54'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_2").WebList("CRCode")'
          action: Select
          args: '"5051 - Change NMI Details - Retrospective"'
      - step:
          id: '55'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_2").WebEdit("NMIID")'
          action: Set
          args: nmi
      - step:
          id: '56'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_2").WebEdit("proposedStartDate")'
          action: Set
          args: formattedProposedDate
      - step:
          id: '57'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_2").WebEdit("participantTransactionID")'
          action: Set
          args: transID
      - step:
          id: '58'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_2").WebEdit("checksum")'
          action: Set
          args: checksum
      - step:
          id: '59'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_2").WebButton("Next")'
          action: Click
      - step:
          id: '60'
          action: Script
          object_path: 'If Browser("Login").Page("MSATS").Frame("DETAIL_2").Link("NMI Standing Data").Exist(3) Then'
      - step:
          id: '61'
          action: Script
          object_path: "'\t\t\tcheckSubmission = Browser(\"Login\").Page(\"MSATS\").Frame(\"DETAIL_2\").WebElement(\"NMI and Checksum do not\").GetROProperty(\"outertext\")"
      - step:
          id: '62'
          action: Script
          object_path: "'\t\tElse"
      - step:
          id: '63'
          action: Script
          object_path: "'\t\t\tcheckSubmission = \"\""
      - step:
          id: '64'
          action: Script
          object_path: "'\t\tEnd If"
      - step:
          id: '65'
          action: Script
          object_path: "'\t\tIf InStr(checkSubmission,\"NMI and Checksum do not match\") = 0 Then"
      - step:
          id: '66'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_2").Link("NMI Standing Data")'
          action: Click
      - step:
          id: '67'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_2").Link("New")'
          action: Click
      - step:
          id: '68'
          action: Script
          object_path: 'While Browser("Login").Page("MSATS").Frame("DETAIL_3").WebButton("Save").Exist(3) = false'
      - step:
          id: '69'
          action: Wait
          args: '"1"'
          default_args: '"1"'
      - step:
          id: '70'
          action: Script
          object_path: Wend
      - step:
          id: '71'
          action: Script
          object_path: 'If ctc = "LOW" Then'
      - step:
          id: '72'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_3").WebList("CND_02")'
          action: Select
          args: '"LOW - Low"'
      - step:
          id: '73'
          action: Script
          object_path: 'ElseIf ctc = "HIGH" Then'
      - step:
          id: '74'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_3").WebList("CND_02")'
          action: Select
          args: '"HIGH - High"'
      - step:
          id: '75'
          action: Script
          object_path: End If
      - step:
          id: '76'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_3").WebButton("Save")'
          action: Click
      - step:
          id: '77'
          object_path: 'Browser("Login").Page("MSATS").Frame("DETAIL_3").WebButton("Submit")'
          action: Click
      - step:
          id: '78'
          object_path: 'Browser("Login")'
          action: HandleDialog
          args: micOK
      - step:
          id: '79'
          action: Script
          object_path: "If Browser(\"Login\").Page(\"MSATS\").Frame(\"DETAIL_4\").Link(\"Return to 'Change Request\").Exist(3) Then"
      - step:
          id: '80'
          action: Script
          object_path: "getCrid = Browser(\"Login\").Page(\"MSATS\").Frame(\"DETAIL_4\").WebTable(\"Return to 'Change Request\").GetROProperty(\"innertext\")"
      - step:
          id: '81'
          action: Script
          object_path: "'\t\t\t\tscreenShotFileLocaiton = \"C:\\Temp\\CTC Compliance\\\"&nmi&\".png\""
      - step:
          id: '82'
          action: Script
          object_path: "'\t\t\t\tDesktop.CaptureBitmap screenShotFileLocaiton,true"
      - step:
          id: '83'
          action: Script
          object_path: "'\t\t\t\twait 0,50"
      - step:
          id: '84'
          action: Script
          object_path: "'\t\t\t\tgetCrid = Split(getCrid, \"Change Request ID: \")"
      - step:
          id: '85'
          action: Script
          object_path: "'\t\t\t\tsplitGetCrid = getCrid(1)"
      - step:
          id: '86'
          action: Script
          object_path: "'\t\t\t\tcrid = Trim(splitGetCrid)"
      - step:
          id: '87'
          object_path: 'objSheet.cells(x,12)'
          action: value
          args: = getCrid
      - step:
          id: '88'
          object_path: "Browser(\"Login\").Page(\"MSATS\").Frame(\"DETAIL_4\").Link(\"Return to 'Change Request\")"
          action: Click
      - step:
          id: '89'
          action: Script
          object_path: Else
      - step:
          id: '90'
          action: Script
          object_path: 'failure = Browser("Login").Page("MSATS").Frame("DETAIL_4").WebElement("Date is not within the").GetROProperty("outertext")'
      - step:
          id: '91'
          object_path: 'objSheet.cells(x,12)'
          action: value
          args: = failure
      - step:
          id: '92'
          object_path: 'Browser("Login").Page("MSATS").Frame("toc").Link("Change Requests")'
          action: Click
      - step:
          id: '93'
          action: Script
          object_path: End If
      - step:
          id: '94'
          action: Script
          object_path: Else
      - step:
          id: '95'
          action: Script
          object_path: 'failure = Browser("Login").Page("MSATS").Frame("DETAIL_2").WebElement("NMI and Checksum do not").GetROProperty("outertext")'
      - step:
          id: '96'
          object_path: 'objSheet.cells(x,12)'
          action: value
          args: = failure
      - step:
          id: '97'
          object_path: 'Browser("Login").Page("MSATS").Frame("toc").Link("Change Requests")'
          action: Click
      - step:
          id: '98'
          action: Script
          object_path: End If
      - step:
          id: '99'
          action: Script
          object_path: End If
      - step:
          id: '100'
          action: Script
          object_path: Next
      - step:
          id: '101'
          object_path: SystemUtil
          action: CloseProcessByName
          args: '"msedge.exe"'
      - step:
          id: '102'
          object_path: "'objWorkbook"
          action: SaveCopyAs
          args: "\"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\CTC_Compliance\\Previous Run.xlsx\""
      - step:
          id: '103'
          object_path: objWorkbook
          action: Save
      - step:
          id: '104'
          object_path: objWorkbook
          action: close
      - step:
          id: '105'
          object_path: objExcel
          action: Quit
      - step:
          id: '106'
          action: Script
          object_path: "'RELEASE OBJECTS"
      - step:
          id: '107'
          action: Script
          object_path: Set objExcel = Nothing
      - step:
          id: '108'
          action: Script
          object_path: Set objWorkbook = Nothing
      - step:
          id: '109'
          action: Script
          object_path: Set objSheet = Nothing
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        class: Browser
        name: Login
        properties:
          - property:
              value:
                value: Login
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'https://msats.preprod.nemnet.net.au/msats/index.jsp'
                regular_expression: false
              name: openurl
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: Login
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
                value: Login
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
        comments: ''
        visual_relations: ''
        last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
        child_objects:
          - object:
              class: Page
              name: MSATS
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
                      value: 'https://msats.preprod.nemnet.net.au/msats/default.jsp'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://msats.preprod.nemnet.net.au/msats/default.jsp'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: MSATS
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
                      value: '10199'
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
              last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
              child_objects:
                - object:
                    class: Frame
                    name: toc
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
                            value: 'https://msats.preprod.nemnet.net.au/msats/MSATSTOC.jsp'
                            regular_expression: false
                          name: url without form data
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'https://msats.preprod.nemnet.net.au/msats/MSATSTOC.jsp'
                            regular_expression: false
                          name: url
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: MSATS Table of contents
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
                            value: toc
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Frame
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: index
                          hidden: true
                          read_only: true
                          type: STRING
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
                        - name
                        - micclass
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                      optional_filter:
                        property_ref:
                          - name
                          - title
                          - url
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                    child_objects:
                      - object:
                          class: WebElement
                          name: Transactions
                          properties:
                            - property:
                                value:
                                  value: '160'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '149'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '0'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: Transactions
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
                                  value: '22'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: menu
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
                                  value: '252'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '0'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '//DIV[8]'
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: Link
                          name: Change Requests
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
                                  value: '//DIV[9]/A[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '93'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '175'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '16'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: Change Requests
                                  regular_expression: false
                                name: text
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: Change Requests
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
                                  value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMISearch.jsp'
                                  regular_expression: false
                                name: href
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '13'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: ''
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
                                  value: '278'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '16'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                          basic_identification:
                            property_ref:
                              - micclass
                              - _xpath
                              - text
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
                          comments: ''
                          visual_relations: ''
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                - object:
                    class: Frame
                    name: DETAIL_4
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
                            value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIMain.jsp'
                            regular_expression: false
                          name: url without form data
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIMain.jsp'
                            regular_expression: false
                          name: url
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: MSATS
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
                            value: DETAIL
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Frame
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: index
                          hidden: true
                          read_only: true
                          type: STRING
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
                        - name
                        - micclass
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                      optional_filter:
                        property_ref:
                          - name
                          - title
                          - url
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                    child_objects:
                      - object:
                          class: WebTable
                          name: "Return to 'Change Request"
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
                                  value: '//TABLE[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: TABLE
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
                                  value: '1'
                                  regular_expression: false
                                name: border
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
                                - border
                            algorithm: Mercury.TolerantPriority
                            active: true
                          custom_replay: ''
                          comments: ''
                          visual_relations: ''
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: WebElement
                          name: Date is not within the
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
                                  value: 'Date is not within the allowed number of days. Please try again or contact the AEMO Support Hub with a screenshot of the data input screen and the error message. jsPortalCall = "false"; jsSetDocDomainTo = "preprod.nemnet.net.au"; jsCurrentDomain = ""; i=-2; if (jsPortalCall=="true") { jsCurrentDomain=document.domain; i=jsCurrentDomain.indexOf(jsSetDocDomainTo); if (i > -1) { //The current doaim must contain domain to set if((i+jsSetDocDomainTo.length)==jsCurrentDomain.length) { //The current doaim must end with domain to set; i.e. current domain must be sub doamin of the domain to be set document.domain=jsSetDocDomainTo; } } }'
                                  regular_expression: false
                                name: innertext
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: BODY
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
                                  value: ''
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
                                  value: //BODY
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: Link
                          name: "Return to 'Change Request"
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
                                  value: '//TABLE[1]/TBODY[1]/TR[1]/TD[1]/A[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '243'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '104'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '918'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: 'Return to "Change Request - Search" screen.'
                                  regular_expression: false
                                name: text
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: 'Return to "Change Request - Search" screen.'
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
                                  value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMISearch.jsp'
                                  regular_expression: false
                                name: href
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '13'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: ''
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
                                  value: '207'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '918'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                          basic_identification:
                            property_ref:
                              - micclass
                              - _xpath
                              - text
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
                          comments: ''
                          visual_relations: ''
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                - object:
                    class: Frame
                    name: DETAIL_3
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
                            value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIStandingDataNew.jsp'
                            regular_expression: false
                          name: url without form data
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIStandingDataNew.jsp?action=new&CRCode=5051&eIDICR=BBYymXIgi7c%3D'
                            regular_expression: false
                          name: url
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: MSATS
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
                            value: DETAIL
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Frame
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: index
                          hidden: true
                          read_only: true
                          type: STRING
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
                        - name
                        - micclass
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                      optional_filter:
                        property_ref:
                          - name
                          - title
                          - url
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                    child_objects:
                      - object:
                          class: WebList
                          name: CND_02
                          properties:
                            - property:
                                value:
                                  value: WebList
                                  regular_expression: false
                                name: micclass
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '//TR[3]/TD[1]/TABLE[2]/TBODY[1]/TR[19]/TD[2]/SELECT[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '159'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1'
                                  regular_expression: false
                                name: visible items
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '657'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '321'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: CND_02
                                  regular_expression: false
                                name: name
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: '5'
                                  regular_expression: false
                                name: items count
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: SELECT
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
                                  value: '17'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: ''
                                  regular_expression: false
                                name: first item
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
                                  value: ''
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
                                  value: '760'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '321'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                          basic_identification:
                            property_ref:
                              - micclass
                              - _xpath
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
                                - html id
                                - class
                                - default value
                                - items count
                                - visible items
                                - visible
                                - acc_name
                                - first item
                            algorithm: Mercury.TolerantPriority
                            active: true
                          custom_replay: ''
                          comments: ''
                          visual_relations: ''
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: WebButton
                          name: Submit
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
                                  value: '//TR[3]/TD[1]/TABLE[3]/TBODY[1]/TR[1]/TD[1]/INPUT[2]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '95'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '334'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '272'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: Submit
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
                                  value: Submit
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
                                  value: ''
                                  regular_expression: false
                                name: html id
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '19'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: ''
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
                                  value: '437'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '272'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
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
                                  value: '//TR[3]/TD[1]/TABLE[3]/TBODY[1]/TR[1]/TD[1]/INPUT[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '42'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '695'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '172'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: Save
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
                                  value: Save
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
                                  value: ''
                                  regular_expression: false
                                name: html id
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '19'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: ''
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
                                  value: '798'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '172'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                - object:
                    class: Frame
                    name: DETAIL_2
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
                            value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMINew.jsp'
                            regular_expression: false
                          name: url without form data
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMINew.jsp?action=new'
                            regular_expression: false
                          name: url
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: MSATS
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
                            value: DETAIL
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Frame
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: index
                          hidden: true
                          read_only: true
                          type: STRING
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
                        - name
                        - micclass
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                      optional_filter:
                        property_ref:
                          - name
                          - title
                          - url
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                    child_objects:
                      - object:
                          class: WebList
                          name: CRCode
                          properties:
                            - property:
                                value:
                                  value: WebList
                                  regular_expression: false
                                name: micclass
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '//TABLE[1]/TBODY[1]/TR[1]/TD[2]/SELECT[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '349'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1'
                                  regular_expression: false
                                name: visible items
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '74'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '645'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: CRCode
                                  regular_expression: false
                                name: name
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: '76'
                                  regular_expression: false
                                name: items count
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: SELECT
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
                                  value: '17'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: ''
                                  regular_expression: false
                                name: first item
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
                                  value: ''
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
                                  value: '177'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '645'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                          basic_identification:
                            property_ref:
                              - micclass
                              - _xpath
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
                                - html id
                                - class
                                - default value
                                - items count
                                - visible items
                                - visible
                                - acc_name
                                - first item
                            algorithm: Mercury.TolerantPriority
                            active: true
                          custom_replay: ''
                          comments: ''
                          visual_relations: ''
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: WebElement
                          name: NMI and Checksum do not
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
                                  value: 'NMI and Checksum do not match Please try again or contact the AEMO Support Hub with a screenshot of the data input screen and the error message. jsPortalCall = "false"; jsSetDocDomainTo = "preprod.nemnet.net.au"; jsCurrentDomain = ""; i=-2; if (jsPortalCall=="true") { jsCurrentDomain=document.domain; i=jsCurrentDomain.indexOf(jsSetDocDomainTo); if (i > -1) { //The current doaim must contain domain to set if((i+jsSetDocDomainTo.length)==jsCurrentDomain.length) { //The current doaim must end with domain to set; i.e. current domain must be sub doamin of the domain to be set document.domain=jsSetDocDomainTo; } } }'
                                  regular_expression: false
                                name: innertext
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: BODY
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
                                  value: ''
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
                                  value: //BODY
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: WebEdit
                          name: proposedStartDate
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
                                  value: '//TABLE[1]/TBODY[1]/TR[4]/TD[2]/INPUT[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '94'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '147'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '494'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: ''
                                  regular_expression: false
                                name: placeholder
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: proposedStartDate
                                  regular_expression: false
                                name: name
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: '11'
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
                                  value: ''
                                  regular_expression: false
                                name: html id
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '19'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '250'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '494'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: WebEdit
                          name: participantTransactionID
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
                                  value: '//TABLE[1]/TBODY[1]/TR[2]/TD[4]/INPUT[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '251'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '97'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1317'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: ''
                                  regular_expression: false
                                name: placeholder
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: participantTransactionID
                                  regular_expression: false
                                name: name
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: '36'
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
                                  value: ''
                                  regular_expression: false
                                name: html id
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '19'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '200'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1317'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: WebEdit
                          name: NMIID
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
                                  value: '//FORM[2]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[3]/TD[2]/INPUT[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '119'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '122'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '494'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: ''
                                  regular_expression: false
                                name: placeholder
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: NMIID
                                  regular_expression: false
                                name: name
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: '10'
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
                                  value: ''
                                  regular_expression: false
                                name: html id
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '19'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '225'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '494'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: WebEdit
                          name: checksum
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
                                  value: '//FORM[2]/TABLE[1]/TBODY[1]/TR[2]/TD[1]/TABLE[1]/TBODY[1]/TR[3]/TD[4]/INPUT[1]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '30'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '122'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1317'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: ''
                                  regular_expression: false
                                name: placeholder
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: checksum
                                  regular_expression: false
                                name: name
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: '1'
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
                                  value: ''
                                  regular_expression: false
                                name: html id
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '19'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '225'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1317'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: WebButton
                          name: Next
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
                                  value: '//INPUT[@id="next"]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '40'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '237'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1867'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: Next
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
                                  value: Next
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
                                  value: next
                                  regular_expression: false
                                name: html id
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '19'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: ''
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
                                  value: '340'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1867'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: Link
                          name: NMI Standing Data
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
                                  value: '//TR/TD/A[normalize-space()="NMI Standing Data"]'
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
                                  value: NMI Standing Data
                                  regular_expression: false
                                name: text
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: NMI Standing Data
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
                                  value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMINew.jsp#standing'
                                  regular_expression: false
                                name: href
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: ''
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
                          comments: ''
                          visual_relations: ''
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                      - object:
                          class: Link
                          name: New
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
                                  value: '//TR/TD/TABLE/TBODY/TR/TH/A[normalize-space()="New"]'
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
                                  value: New
                                  regular_expression: false
                                name: text
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: New
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
                                  value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMIStandingDataNew.jsp?action=new&CRCode=5051&eIDICR=BBYymXIgi7c%3D'
                                  regular_expression: false
                                name: href
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: ''
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
                          comments: ''
                          visual_relations: ''
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
                - object:
                    class: Frame
                    name: DETAIL
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
                            value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMISearch.jsp'
                            regular_expression: false
                          name: url without form data
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMISearch.jsp'
                            regular_expression: false
                          name: url
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: MSATS
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
                            value: DETAIL
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: Frame
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: index
                          hidden: true
                          read_only: true
                          type: STRING
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
                        - name
                        - micclass
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                      optional_filter:
                        property_ref:
                          - name
                          - title
                          - url
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                    child_objects:
                      - object:
                          class: Link
                          name: New
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
                                  value: '//TR/TD/TABLE/TBODY/TR/TH/A[normalize-space()="New"]'
                                  regular_expression: false
                                name: _xpath
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '27'
                                  regular_expression: false
                                name: width
                                hidden: true
                                read_only: true
                                type: NUMBER
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
                                  value: '72'
                                  regular_expression: false
                                name: view_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1406'
                                  regular_expression: false
                                name: view_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: New
                                  regular_expression: false
                                name: text
                                hidden: false
                                read_only: false
                                type: STRING
                            - property:
                                value:
                                  value: New
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
                                  value: 'https://msats.preprod.nemnet.net.au/msats/FW410_CRNMINew.jsp?action=new'
                                  regular_expression: false
                                name: href
                                hidden: true
                                read_only: true
                                type: STRING
                            - property:
                                value:
                                  value: '13'
                                  regular_expression: false
                                name: height
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: ''
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
                                  value: '175'
                                  regular_expression: false
                                name: abs_y
                                hidden: true
                                read_only: true
                                type: NUMBER
                            - property:
                                value:
                                  value: '1406'
                                  regular_expression: false
                                name: abs_x
                                hidden: true
                                read_only: true
                                type: NUMBER
                          basic_identification:
                            property_ref:
                              - micclass
                              - _xpath
                              - text
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
                          comments: ''
                          visual_relations: ''
                          last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                          child_objects: []
          - object:
              class: Page
              name: Login
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
                      value: 'https://msats.preprod.nemnet.net.au/msats/index.jsp'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://msats.preprod.nemnet.net.au/msats/index.jsp'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: Login
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
                      value: '10199'
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
              last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
              child_objects:
                - object:
                    class: WebEdit
                    name: userID
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
                            value: '//TR[normalize-space()="UserID (*):"]/TD[2]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '150'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '146'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '871'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: ''
                            regular_expression: false
                          name: placeholder
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: userID
                            regular_expression: false
                          name: name
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '15'
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
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '19'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '249'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '871'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                    last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                    child_objects: []
                - object:
                    class: WebEdit
                    name: password
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
                            value: '//TR[normalize-space()="Password (*):"]/TD[2]/INPUT[1]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '150'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '177'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '871'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '0'
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
                            value: password
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
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '19'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '280'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '871'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                    last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                    child_objects: []
                - object:
                    class: Image
                    name: Login
                    properties:
                      - property:
                          value:
                            value: Image
                            regular_expression: false
                          name: micclass
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '//INPUT[@id="image"]'
                            regular_expression: false
                          name: _xpath
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '74'
                            regular_expression: false
                          name: width
                          hidden: true
                          read_only: true
                          type: NUMBER
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
                            value: '208'
                            regular_expression: false
                          name: view_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '871'
                            regular_expression: false
                          name: view_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: Image
                            regular_expression: false
                          name: name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Image Button
                            regular_expression: false
                          name: image type
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
                            value: image
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: '16'
                            regular_expression: false
                          name: height
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: button_login.gif
                            regular_expression: false
                          name: file name
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: ''
                            regular_expression: false
                          name: class
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: Login
                            regular_expression: false
                          name: alt
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: '311'
                            regular_expression: false
                          name: abs_y
                          hidden: true
                          read_only: true
                          type: NUMBER
                      - property:
                          value:
                            value: '871'
                            regular_expression: false
                          name: abs_x
                          hidden: true
                          read_only: true
                          type: NUMBER
                    basic_identification:
                      property_ref:
                        - micclass
                        - _xpath
                        - image type
                        - html tag
                        - alt
                      ordinal_identifier: ''
                    smart_identification:
                      base_filter:
                        property_ref:
                          - micclass
                          - html tag
                      optional_filter:
                        property_ref:
                          - alt
                          - image type
                          - html id
                          - name
                          - file name
                          - class
                          - visible
                      algorithm: Mercury.TolerantPriority
                      active: true
                    custom_replay: ''
                    comments: ''
                    visual_relations: ''
                    last_update_time: 'Friday, 7 January 2022 9:43:53 AM'
                    child_objects: []
  check_points_and_outputs: []
  parameters: []
