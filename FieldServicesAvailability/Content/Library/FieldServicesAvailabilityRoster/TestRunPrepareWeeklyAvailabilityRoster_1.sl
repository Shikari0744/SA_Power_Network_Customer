namespace: FieldServicesAvailabilityRoster
flow:
  name: TestRunPrepareWeeklyAvailabilityRoster_1
  inputs:
    - saveReportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Weekly Availability Roster/'
  workflow:
    - GetAccessToken_Teams:
        worker_group: B603
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
          - SUCCESS: DownloadRostersfromSharepoint
    - DownloadRostersfromSharepoint:
        worker_group: B603
        do:
          FieldServicesAvailabilityRoster.DownloadRostersfromSharepoint:
            - accessToken: '${accessToken}'
            - downloadFolder: '${saveReportsHere}'
        publish:
          - metroResponse
          - metroRosterLocation
          - regionalResponse
          - regionalRosterLocation
          - enervenResponse
          - enervenListLocation
        navigate:
          - SUCCESS: OpenSAP
    - OpenSAP:
        robot_group: B603
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
    - OpenSAP_1:
        robot_group: B603
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
    - MetroRoster:
        robot_group: B603
        do:
          FieldServicesAvailabilityRoster.MetroRoster:
            - metroRoster: '${metroRosterLocation}'
            - employeeList: '${enervenListLocation}'
        navigate:
          - SUCCESS: OpenSAP_1
          - WARNING: OpenSAP_1
          - FAILURE: on_failure
    - RegionalRoster:
        robot_group: B603
        do:
          FieldServicesAvailabilityRoster.RegionalRoster:
            - regionalRoster: '${regionalRosterLocation}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      GetAccessToken_Teams:
        x: 100
        'y': 150
      DownloadRostersfromSharepoint:
        x: 400
        'y': 150
      OpenSAP:
        x: 700
        'y': 150
      OpenSAP_1:
        x: 1300
        'y': 150
      MetroRoster:
        x: 1000
        'y': 150
      RegionalRoster:
        x: 1600
        'y': 150
        navigate:
          3901faef-6431-ac25-bbd7-c885c542d45b:
            targetId: 66ade44a-52c1-e097-1e6e-a1afb5967fc9
            port: SUCCESS
          e1f44bc8-b296-2a0e-4887-375eb87ff222:
            targetId: 66ade44a-52c1-e097-1e6e-a1afb5967fc9
            port: WARNING
    results:
      SUCCESS:
        66ade44a-52c1-e097-1e6e-a1afb5967fc9:
          x: 1900
          'y': 150
