namespace: ITAzureChargeBack
operation:
  name: getExchangeRate
  sequential_action:
    gav: 'com.microfocus.seq:ITAzureChargeBack.getExchangeRate:1.0.0'
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
          object_path: 'Set mySendKeys = CreateObject("WScript.Shell")'
      - step:
          id: '2'
          action: Script
          object_path: 'URL = "https://www.xe.com/currencyconverter/convert/?Amount=1&From=USD&To=AUD"'
      - step:
          id: '3'
          object_path: mySendKeys
          action: Run
          args: '"msedge -url "&URL'
      - step:
          id: '4'
          action: Script
          object_path: Set mySendKeys = NOTHING
      - step:
          id: '5'
          action: Script
          object_path: 'rate = Browser("1 USD to AUD - US Dollars").Page("1 USD to AUD - US Dollars").WebElement("Exchange Rate").GetROProperty("innertext")'
      - step:
          id: '6'
          action: Script
          object_path: 'exchangeRate = Replace(rate, " Australian Dollars","")'
      - step:
          id: '7'
          action: Script
          object_path: exchangeRate = CDbl(exchangeRate)
      - step:
          id: '8'
          action: Script
          object_path: 'exchangeRate = Round(exchangeRate, 2)'
      - step:
          id: '9'
          action: Script
          object_path: 'Parameter("exchangeRate") = exchangeRate'
      - step:
          id: '10'
          object_path: SystemUtil
          action: CloseProcessByName
          args: '"msedge.exe"'
  outputs:
    - exchangeRate:
        robot: true
        value: '${exchangeRate}'
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
        name: usd to aus exchange rate.
        properties:
          - property:
              value:
                value: usd to aus exchange rate. - Google Search
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'https://www.google.com/search?q=usd+to+aus+exchange+rate.'
                regular_expression: false
              name: openurl
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: usd to aus exchange rate. - Google Search
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
                value: usd to aus exchange rate. - Google Search
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
                value: '2'
                regular_expression: false
              name: browserindex
              hidden: true
              read_only: true
              type: I2
        basic_identification:
          property_ref:
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
        comments: ''
        visual_relations: ''
        last_update_time: 'Friday, 8 July 2022 8:54:53 AM'
        child_objects:
          - object:
              class: Page
              name: usd to aus exchange rate.
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
                      value: 'https://www.google.com/search'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://www.google.com/search?q=usd+to+aus+exchange+rate.'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: usd to aus exchange rate. - Google Search
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
                      value: '20053'
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
              last_update_time: 'Friday, 8 July 2022 8:54:53 AM'
              child_objects:
                - object:
                    class: WebElement
                    name: Exchange Rate
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
                            value: '.*'
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
                            value: ''
                            regular_expression: false
                          name: html id
                          hidden: true
                          read_only: true
                          type: STRING
                      - property:
                          value:
                            value: dDoNo ikb4Bb gsrt
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
                            value: '//DIV[@id="knowledge-currency__updatable-data-column"]/DIV[1]/DIV[2]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations: ''
                    last_update_time: 'Friday, 8 July 2022 8:54:53 AM'
                    child_objects: []
          - object:
              class: Page
              name: 1 USD to AUD - US Dollars
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
                      value: 'https://www.xe.com/currencyconverter/convert/'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://www.xe.com/currencyconverter/convert/?Amount=1&From=USD&To=AUD'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 1 USD to AUD - US Dollars to Australian Dollars Exchange Rate
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
                      value: '30053'
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
              last_update_time: 'Friday, 8 July 2022 8:54:53 AM'
              child_objects:
                - object:
                    class: WebElement
                    name: Exchange Rate
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
                            value: '.*'
                            regular_expression: true
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: P
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
                            value: result__BigRate-sc-1bsijpp-1 iGrAod
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
                            value: '//DIV[2]/DIV[1]/MAIN[1]/FORM[1]/DIV[2]/DIV[1]/P[2]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations: ''
                    last_update_time: 'Friday, 8 July 2022 8:54:53 AM'
                    child_objects: []
    - object:
        class: Browser
        name: 1 USD to AUD - US Dollars
        properties:
          - property:
              value:
                value: 1 USD to AUD - US Dollars to Australian Dollars Exchange Rate
                regular_expression: false
              name: title
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 'https://www.xe.com/currencyconverter/convert/?Amount=1&From=USD&To=AUD'
                regular_expression: false
              name: openurl
              hidden: true
              read_only: true
              type: STRING
          - property:
              value:
                value: 1 USD to AUD - US Dollars to Australian Dollars Exchange Rate
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
                value: 1 USD to AUD - US Dollars to Australian Dollars Exchange Rate
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
        last_update_time: 'Friday, 8 July 2022 8:54:53 AM'
        child_objects:
          - object:
              class: Page
              name: 1 USD to AUD - US Dollars
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
                      value: 'https://www.xe.com/currencyconverter/convert/'
                      regular_expression: false
                    name: url without form data
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 'https://www.xe.com/currencyconverter/convert/?Amount=1&From=USD&To=AUD'
                      regular_expression: false
                    name: url
                    hidden: true
                    read_only: true
                    type: STRING
                - property:
                    value:
                      value: 1 USD to AUD - US Dollars to Australian Dollars Exchange Rate
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
                      value: '10052'
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
              last_update_time: 'Friday, 8 July 2022 8:54:53 AM'
              child_objects:
                - object:
                    class: WebElement
                    name: Exchange Rate
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
                            value: '.*'
                            regular_expression: true
                          name: innertext
                          hidden: false
                          read_only: false
                          type: STRING
                      - property:
                          value:
                            value: P
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
                            value: result__BigRate-sc-1bsijpp-1 iGrAod
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
                            value: '//DIV[2]/DIV[1]/MAIN[1]/FORM[1]/DIV[2]/DIV[1]/P[2]'
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
                    comments:
                      comment:
                        - value: ''
                          name: miccommentproperty
                    visual_relations: ''
                    last_update_time: 'Friday, 8 July 2022 8:54:53 AM'
                    child_objects: []
  check_points_and_outputs: []
  parameters: []
