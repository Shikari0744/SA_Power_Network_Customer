namespace: FieldServicesAvailabilityRoster
flow:
  name: RunMetroRoster
  inputs:
    - metroRosterLocation
    - enervenList
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcwklyavailUSER')}"
            - pass:
                value: "${get_sp('svcwklyavailPASS')}"
                sensitive: true
            - environment: PRD
            - system: ERP
        navigate:
          - SUCCESS: MetroRoster
          - WARNING: MetroRoster
          - FAILURE: on_failure
    - MetroRoster:
        do:
          FieldServicesAvailabilityRoster.MetroRoster:
            - metroRoster: '${metroRosterLocation}'
            - employeeList: '${enervenList}'
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - GetAccessToken_Teams_1:
        do:
          GenericActivities.GetAccessToken_Teams:
            - UserName: "${get_sp('svcrpabotAPIuser')}"
            - Password:
                value: "${get_sp('svcrpabotAPIpass')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: on_failure
          - SUCCESS: UploadRostersToSharepoint_Metro
    - UploadRostersToSharepoint_Metro:
        do:
          FieldServicesAvailabilityRoster.UploadRostersToSharepoint:
            - accessToken: '${accessToken}'
            - MetroRosterLocation: '${metroRosterLocation}'
        publish:
          - metroResponse
        navigate:
          - SUCCESS: Send_Email_Attachments_Metro
    - Send_Email_Attachments_Metro:
        do:
          FieldServicesAvailabilityRoster.Send_Email_Attachments_Metro:
            - metro: '${metroRosterLocation}'
            - metroResult: '${metroResponse}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - on_failure:
        - Send_Email_Failure_Metro_1:
            do:
              FieldServicesAvailabilityRoster.Send_Email_Failure_Metro: []
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      OpenSAP:
        x: 400
        'y': 150
      MetroRoster:
        x: 700
        'y': 150
      GetAccessToken_Teams_1:
        x: 1000
        'y': 150
      UploadRostersToSharepoint_Metro:
        x: 1300
        'y': 150
      Send_Email_Attachments_Metro:
        x: 1600
        'y': 150
        navigate:
          8c57d63f-b78d-bdf1-802b-5ebf20c94f36:
            targetId: 2b3e9432-b5f8-4111-865e-352c45688c36
            port: SUCCESS
          3a6b858d-3b7f-2db4-3055-29c2e9ece06f:
            targetId: 2b3e9432-b5f8-4111-865e-352c45688c36
            port: WARNING
    results:
      SUCCESS:
        2b3e9432-b5f8-4111-865e-352c45688c36:
          x: 1900
          'y': 150
