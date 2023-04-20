namespace: RiverMurrayFloodDisconnections
flow:
  name: CIDOnly
  inputs:
    - cidUser
    - cidPass
    - B2BAction
    - SourceofDEEN
  workflow:
    - Kill_ProcessByName_1:
        robot_group: B603
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetSPList
          - WARNING: GetSPList
          - FAILURE: on_failure
    - GetSPList:
        do:
          RiverMurrayFloodDisconnections.GetSPList: []
        publish:
          - floodManagementSheet
        navigate:
          - SUCCESS: DuplicateCheck
          - WARNING: DuplicateCheck
          - FAILURE: on_failure
    - DuplicateCheck:
        do:
          RiverMurrayFloodDisconnections.DuplicateCheck:
            - floodManagementSheet: '${floodManagementSheet}'
            - b2bAction: '${B2BAction}'
            - sourceOfDeen: '${SourceofDEEN}'
            - username: '${cidUser}'
            - password:
                value: '${cidPass}'
                sensitive: true
        navigate:
          - SUCCESS: Kill_ProcessByName_2
          - WARNING: Kill_ProcessByName_2
          - FAILURE: on_failure
    - CID:
        do:
          RiverMurrayFloodDisconnections.CID:
            - username: '${cidUser}'
            - password:
                value: '${cidPass}'
                sensitive: true
            - b2bAction: '${B2BAction}'
            - floodManagementSheet: '${floodManagementSheet}'
            - sourceOfDeen: '${SourceofDEEN}'
        navigate:
          - SUCCESS: Kill_ProcessByName_3
          - WARNING: Kill_ProcessByName_3
          - FAILURE: on_failure
    - Kill_ProcessByName_3:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - Kill_ProcessByName_2:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: CID
          - WARNING: CID
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName_1:
        x: 100
        'y': 150
      GetSPList:
        x: 400
        'y': 150
      DuplicateCheck:
        x: 700
        'y': 150
      CID:
        x: 1300
        'y': 150
      Kill_ProcessByName_3:
        x: 1600
        'y': 150
        navigate:
          13ce84a5-e2e4-7d7d-55f7-5f9cf04ae312:
            targetId: 2b57c866-1ee5-f372-ee2c-6441c8c39c43
            port: SUCCESS
          96ebcc4b-82d1-8453-1a29-55301448026a:
            targetId: 2b57c866-1ee5-f372-ee2c-6441c8c39c43
            port: WARNING
      Kill_ProcessByName_2:
        x: 1000
        'y': 150
    results:
      SUCCESS:
        2b57c866-1ee5-f372-ee2c-6441c8c39c43:
          x: 1900
          'y': 150
