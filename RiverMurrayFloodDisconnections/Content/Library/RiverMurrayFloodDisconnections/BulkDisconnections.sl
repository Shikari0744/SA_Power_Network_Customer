namespace: RiverMurrayFloodDisconnections
flow:
  name: BulkDisconnections
  inputs:
    - username
    - password:
        sensitive: true
    - B2BAction
    - SourceOfDEEN
    - cidCheck:
        required: true
    - flowType
  workflow:
    - CIDCheck:
        do:
          RiverMurrayFloodDisconnections.CIDCheck:
            - cidCheck: '${cidCheck}'
        navigate:
          - CID: CIDOnly
          - NORMAL: Kill_ProcessByName
          - SUCCESS: CIDOnly
    - Kill_ProcessByName:
        robot_group: B603
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: BulkEmail
          - WARNING: BulkEmail
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: '${username}'
            - pass:
                value: '${password}'
                sensitive: true
            - environment: PRD
            - system: ISU
        navigate:
          - SUCCESS: GetSPList
          - WARNING: GetSPList
          - FAILURE: on_failure
    - SO:
        do:
          RiverMurrayFloodDisconnections.SO:
            - floodManagementSheet: '${floodManagementSheet}'
            - b2bAction: '${B2BAction}'
            - sourceOfDeen: '${SourceOfDEEN}'
        navigate:
          - SUCCESS: DD
          - WARNING: DD
          - FAILURE: on_failure
    - DD:
        do:
          RiverMurrayFloodDisconnections.DD:
            - floodManagementSheet: '${floodManagementSheet}'
            - b2bAction: '${B2BAction}'
            - sourceOfDeen: '${SourceOfDEEN}'
        navigate:
          - SUCCESS: D
          - WARNING: D
          - FAILURE: on_failure
    - D:
        do:
          RiverMurrayFloodDisconnections.D:
            - floodManagementSheet: '${floodManagementSheet}'
            - b2bAction: '${B2BAction}'
            - sourceOfDeen: '${SourceOfDEEN}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
    - GetSPList:
        do:
          RiverMurrayFloodDisconnections.GetSPList: []
        publish:
          - floodManagementSheet
        navigate:
          - SUCCESS: ISU
          - WARNING: ISU
          - FAILURE: on_failure
    - RetailerEmail:
        do:
          RiverMurrayFloodDisconnections.RetailerEmail:
            - accessToken: '${accessToken}'
            - retailerEmailLog: '${retailerSheet}'
        navigate:
          - SUCCESS: B2BEmail_BillReversals
    - GetAccessToken_HTTP:
        do:
          GenericActivities.GetAccessToken_HTTP:
            - username: "${get_sp('svcrpabotAPIuser')}"
            - password:
                value: "${get_sp('svcrpabotAPIpass')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: on_failure
          - SUCCESS: RetailerEmail
    - BulkEmail:
        do:
          RiverMurrayFloodDisconnections.BulkEmail:
            - b2bAction: '${B2BAction}'
            - floodManagementSheet: '${floodManagementSheet}'
            - sourceOfDeen: '${SourceOfDEEN}'
        publish:
          - retailerSheet
        navigate:
          - SUCCESS: GetAccessToken_HTTP
          - WARNING: GetAccessToken_HTTP
          - FAILURE: on_failure
    - LNSPEmail:
        do:
          RiverMurrayFloodDisconnections.LNSPEmail:
            - b2bAction: '${B2BAction}'
            - sourceOfDEEN: '${SourceOfDEEN}'
            - floodManagementSheet: '${floodManagementSheet}'
        publish:
          - emailsSent
        navigate:
          - SUCCESS: C4CNotes
          - WARNING: C4CNotes
          - FAILURE: on_failure
    - InitiatePAUpload:
        do:
          RiverMurrayFloodDisconnections.InitiatePAUpload:
            - floodManagementSheet: '${floodManagementSheet}'
            - flowType: '${flowType}'
        navigate:
          - SUCCESS: SUCCESS
    - ISU:
        do:
          RiverMurrayFloodDisconnections.ISU:
            - floodManagementSheet: '${floodManagementSheet}'
            - b2bAction: '${B2BAction}'
            - sourceOfDeen: '${SourceOfDEEN}'
        publish:
          - toBeActioned
        navigate:
          - SUCCESS: SO
          - WARNING: SUCCESS_2
          - FAILURE: on_failure
    - B2BEmail_BillReversals:
        do:
          RiverMurrayFloodDisconnections.B2BEmail:
            - b2bAction: '${B2BAction}'
            - floodManagementSheet: '${floodManagementSheet}'
            - sourceOfDeen: '${SourceOfDEEN}'
        publish:
          - emailsSent
        navigate:
          - SUCCESS: B2BEmail_SO
          - WARNING: B2BEmail_SO
          - FAILURE: on_failure
    - B2BEmail_SO:
        do:
          RiverMurrayFloodDisconnections.B2BEmail_SO:
            - b2bAction: '${B2BAction}'
            - floodManagementSheet: '${floodManagementSheet}'
            - sourceOfDeen: '${SourceOfDEEN}'
        publish:
          - emailsSent
        navigate:
          - SUCCESS: LNSPEmail
          - WARNING: LNSPEmail
          - FAILURE: on_failure
    - C4CNotes:
        do:
          RiverMurrayFloodDisconnections.C4CNotes:
            - floodManagementSheet: '${floodManagementSheet}'
        publish:
          - c4csheet
        navigate:
          - SUCCESS: Kill_ProcessByName_2
          - WARNING: Kill_ProcessByName_2
          - FAILURE: on_failure
    - Kill_ProcessByName_2:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: InitiatePAUpload
          - WARNING: InitiatePAUpload
          - FAILURE: on_failure
    - CIDOnly:
        do:
          RiverMurrayFloodDisconnections.CIDOnly:
            - cidUser: '${username}'
            - cidPass: '${password}'
            - B2BAction: '${B2BAction}'
            - SourceofDEEN: '${SourceOfDEEN}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: SUCCESS_1
  results:
    - FAILURE
    - SUCCESS
    - SUCCESS_2
    - SUCCESS_1
extensions:
  graph:
    steps:
      DD:
        x: 1900
        'y': 250
      Kill_ProcessByName_1:
        x: 2500
        'y': 250
      Kill_ProcessByName_2:
        x: 4900
        'y': 250
      D:
        x: 2200
        'y': 250
      GetAccessToken_HTTP:
        x: 3100
        'y': 250
      B2BEmail_BillReversals:
        x: 3700
        'y': 250
      CIDOnly:
        x: 400
        'y': 375
        navigate:
          ffdbbe55-84c3-bf7b-0cae-f6b4f826ad34:
            targetId: 4638e542-edd8-6fd7-a691-43e3d3714991
            port: SUCCESS
      BulkEmail:
        x: 2800
        'y': 250
      CIDCheck:
        x: 100
        'y': 250
      ISU:
        x: 1300
        'y': 250
        navigate:
          1cd81c58-104b-b72c-757e-2f1462435e48:
            targetId: 630d341b-8ce8-8030-0f66-8c583575f765
            port: WARNING
      InitiatePAUpload:
        x: 5200
        'y': 250
        navigate:
          0019bd46-3ee7-8cff-7940-23b2459a758b:
            targetId: 2e4b041d-4119-d1e8-f49c-b72d44d35383
            port: SUCCESS
      RetailerEmail:
        x: 3400
        'y': 250
      C4CNotes:
        x: 4600
        'y': 250
      Kill_ProcessByName:
        x: 400
        'y': 125
      B2BEmail_SO:
        x: 4000
        'y': 250
      GetSPList:
        x: 1000
        'y': 250
      OpenSAP:
        x: 700
        'y': 125
      SO:
        x: 1600
        'y': 125
      LNSPEmail:
        x: 4300
        'y': 250
    results:
      SUCCESS:
        2e4b041d-4119-d1e8-f49c-b72d44d35383:
          x: 5500
          'y': 250
      SUCCESS_2:
        630d341b-8ce8-8030-0f66-8c583575f765:
          x: 1600
          'y': 375
      SUCCESS_1:
        4638e542-edd8-6fd7-a691-43e3d3714991:
          x: 700
          'y': 375
