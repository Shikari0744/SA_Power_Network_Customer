namespace: EnervenECoC
flow:
  name: EnervenECoC
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: ConfirmECoCs
          - WARNING: ConfirmECoCs
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - ConfirmECoCs:
        do:
          EnervenECoC.ConfirmECoCs:
            - folder: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enerven eCoc\\"
        publish:
          - location
          - completed
          - row
        navigate:
          - SUCCESS: SendEmail
          - WARNING: SendEmail
          - FAILURE: on_failure
    - SendEmail:
        do:
          EnervenECoC.SendEmail:
            - location: '${location}'
        navigate:
          - SUCCESS: DeleteOldFiles
          - WARNING: DeleteOldFiles
          - FAILURE: on_failure
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enerven eCoc\\"
        navigate:
          - SUCCESS: Kill_ProcessByName_1
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51385'
        navigate:
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
      ConfirmECoCs:
        x: 400
        'y': 150
      SendEmail:
        x: 700
        'y': 150
      DeleteOldFiles:
        x: 1000
        'y': 150
      Kill_ProcessByName_1:
        x: 1300
        'y': 150
      STATS_IncreaseRunCountInDevOps:
        x: 1600
        'y': 150
        navigate:
          816cf48b-f51a-5028-b0a4-9812dd96edc2:
            targetId: 7c0719a5-a94a-e0d6-c792-2f0af86135d4
            port: SUCCESS
    results:
      SUCCESS:
        7c0719a5-a94a-e0d6-c792-2f0af86135d4:
          x: 1900
          'y': 150
