namespace: ITAzureChargeBack
flow:
  name: ITAMAzureChargeback
  inputs:
    - location: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/ITAM Azure Cost Management/'
  workflow:
    - AzureChargeBack:
        do:
          ITAzureChargeBack.AzureChargeBack:
            - location: '${location}'
        publish:
          - capex
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - FAILURE: AzureChargeBack_Continue
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '52461'
        navigate:
          - SUCCESS: SUCCESS
    - AzureChargeBack_Continue:
        do:
          ITAzureChargeBack.AzureChargeBack_Continue:
            - location: '${location}'
            - downloadedCapexPath: '${capex}'
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - FAILURE: AzureChargeBack_Continue
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      AzureChargeBack:
        x: 100
        'y': 250
      STATS_IncreaseRunCountInDevOps:
        x: 400
        'y': 125
        navigate:
          b54fe290-5ebf-2719-5498-4dca36b59c3d:
            targetId: d6215a0f-ef7d-9c40-708f-ec824ae92a26
            port: SUCCESS
      AzureChargeBack_Continue:
        x: 400
        'y': 375
    results:
      SUCCESS:
        d6215a0f-ef7d-9c40-708f-ec824ae92a26:
          x: 700
          'y': 250
