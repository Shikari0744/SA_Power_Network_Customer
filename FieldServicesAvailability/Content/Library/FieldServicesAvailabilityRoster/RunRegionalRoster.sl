namespace: FieldServicesAvailabilityRoster
flow:
  name: RunRegionalRoster
  inputs:
    - regionalRosterLocation
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
          - SUCCESS: RegionalRoster
          - WARNING: RegionalRoster
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
          - SUCCESS: UploadRostersToSharepoint_Regional
    - RegionalRoster:
        do:
          FieldServicesAvailabilityRoster.RegionalRoster:
            - regionalRoster: '${regionalRosterLocation}'
        navigate:
          - SUCCESS: GetAccessToken_Teams_1
          - WARNING: GetAccessToken_Teams_1
          - FAILURE: on_failure
    - UploadRostersToSharepoint_Regional:
        do:
          FieldServicesAvailabilityRoster.UploadRostersToSharepoint:
            - accessToken: '${accessToken}'
            - RegionalRosterLocation: '${regionalRosterLocation}'
        publish:
          - regionalResponse
        navigate:
          - SUCCESS: Send_Email_Attachments_Regional
    - Send_Email_Attachments_Regional:
        do:
          FieldServicesAvailabilityRoster.Send_Email_Attachments_Regional:
            - regional: '${regionalRosterLocation}'
            - regionalResult: '${regionalResponse}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - on_failure:
        - Send_Email_Failure_Regional_1:
            do:
              FieldServicesAvailabilityRoster.Send_Email_Failure_Regional: []
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
      RegionalRoster:
        x: 700
        'y': 150
      GetAccessToken_Teams_1:
        x: 1000
        'y': 150
      UploadRostersToSharepoint_Regional:
        x: 1300
        'y': 150
      Send_Email_Attachments_Regional:
        x: 1600
        'y': 150
        navigate:
          f5a1ae45-00ce-85b4-8ed2-b52a8480ed50:
            targetId: d146f336-863b-02a8-396e-bfeff3cc7e5e
            port: SUCCESS
          3f89b15a-30c5-e08b-399a-4d319e628af8:
            targetId: d146f336-863b-02a8-396e-bfeff3cc7e5e
            port: WARNING
    results:
      SUCCESS:
        d146f336-863b-02a8-396e-bfeff3cc7e5e:
          x: 1900
          'y': 150
