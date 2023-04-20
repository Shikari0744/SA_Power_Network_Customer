namespace: FieldServicesAvailabilityRoster
flow:
  name: PrepareWeeklyAvailabilityRoster
  inputs:
    - saveReportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services Weekly Availability Roster/'
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - GetAccessToken_Teams:
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
          - SUCCESS: RunMetroRoster
    - RunMetroRoster:
        do:
          FieldServicesAvailabilityRoster.RunMetroRoster:
            - metroRosterLocation: '${metroRosterLocation}'
            - enervenList: '${enervenListLocation}'
        navigate:
          - FAILURE: RunRegionalRoster
          - SUCCESS: RunRegionalRoster
    - RunRegionalRoster:
        do:
          FieldServicesAvailabilityRoster.RunRegionalRoster:
            - regionalRosterLocation: '${regionalRosterLocation}'
        navigate:
          - FAILURE: SUCCESS
          - SUCCESS: SUCCESS
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      DownloadRostersfromSharepoint:
        x: 700
        'y': 150
      RunMetroRoster:
        x: 1000
        'y': 150
      RunRegionalRoster:
        x: 1300
        'y': 150
        navigate:
          63e607d0-927d-9c42-ce85-40fe4785d3a3:
            targetId: 1b863a3d-85fb-c4a5-003a-584cf561b38e
            port: FAILURE
          41acce49-96e0-b094-2934-07de05f96349:
            targetId: 1b863a3d-85fb-c4a5-003a-584cf561b38e
            port: SUCCESS
    results:
      SUCCESS:
        1b863a3d-85fb-c4a5-003a-584cf561b38e:
          x: 1600
          'y': 150
