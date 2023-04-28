namespace: EnablonReports
flow:
  name: EnablonReporting
  inputs:
    - reportsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Enablon Reports/'
  workflow:
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
          - SUCCESS: DownloadFromEmail
    - DownloadFromEmail:
        do:
          EnablonReports.DownloadFromEmail:
            - accessToken: '${accessToken}'
            - reportsFolder: '${reportsHere}'
        publish:
          - electricalWorkplace
          - metroNorthWorkplace
          - metroSouthWorkplace
          - opsPlanningWorkplace
          - metroOpsWorkplace
          - electricalField
          - metroNorthField
          - metroSouthField
          - opsPlanningField
          - metroOpsField
          - opsRegionalWorkplace
          - opsRegionalField
        navigate:
          - SUCCESS: FieldObservations_Py
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: '${reportsHere}'
            - numberOfDays: '6'
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
    - FieldObservations_Py:
        do:
          EnablonReports.FieldObservations_Py:
            - electrical: '${electricalField}'
            - metroNorth: '${metroNorthField}'
            - metroSouth: '${metroSouthField}'
            - opsPlanning: '${opsPlanningField}'
            - metroOps: '${metroOpsField}'
            - opsRegional: '${opsRegionalField}'
            - reportLocation: '${reportsHere}'
        navigate:
          - SUCCESS: WorkplaceInspections_Py
          - CUSTOM: WorkplaceInspections_Py
    - WorkplaceInspections_Py:
        do:
          EnablonReports.WorkplaceInspections_Py:
            - electrical: '${electricalWorkplace}'
            - metroNorth: '${metroNorthWorkplace}'
            - metroSouth: '${metroSouthWorkplace}'
            - opsPlanning: '${opsPlanningWorkplace}'
            - metroOps: '${metroOpsWorkplace}'
            - opsRegional: '${opsRegionalWorkplace}'
            - reportLocation: '${reportsHere}'
        navigate:
          - SUCCESS: DeleteOldFiles
          - CUSTOM: DeleteOldFiles
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '62355'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetAccessToken_HTTP:
        x: 100
        'y': 150
      DownloadFromEmail:
        x: 400
        'y': 150
      DeleteOldFiles:
        x: 1300
        'y': 150
      FieldObservations_Py:
        x: 700
        'y': 150
      WorkplaceInspections_Py:
        x: 1000
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 1600
        'y': 150
        navigate:
          b75cb351-b6f1-dab3-2a4b-befb72c81309:
            targetId: bf5139bb-c66b-b872-b29c-961eb3da4b8e
            port: SUCCESS
    results:
      SUCCESS:
        bf5139bb-c66b-b872-b29c-961eb3da4b8e:
          x: 1900
          'y': 150
