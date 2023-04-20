namespace: RiverMurrayFloodReconnections
flow:
  name: RiverMurrayReconnectionRetailerEmails
  inputs:
    - csvListLocation: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\River Murray Flood Disconnections\\Flood Reconnections Retailer Emails.csv"
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
          - SUCCESS: RetailerEmail
    - RetailerEmail:
        do:
          RiverMurrayFloodReconnections.RetailerEmail:
            - csvlistExtract: '${csvListLocation}'
            - accesstoken: '${accessToken}'
        publish: []
        navigate:
          - SUCCESS: InitiatePA
    - InitiatePA:
        do:
          RiverMurrayFloodReconnections.InitiatePA:
            - csvlistExtract: '${csvListLocation}'
        publish:
          - backup
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
      RetailerEmail:
        x: 400
        'y': 150
      InitiatePA:
        x: 700
        'y': 150
        navigate:
          9f5d17a7-121e-7b3e-fff4-9468096f2f4e:
            targetId: 040e4f46-c515-de2e-8264-839dd9f17970
            port: SUCCESS
    results:
      SUCCESS:
        040e4f46-c515-de2e-8264-839dd9f17970:
          x: 1000
          'y': 150
