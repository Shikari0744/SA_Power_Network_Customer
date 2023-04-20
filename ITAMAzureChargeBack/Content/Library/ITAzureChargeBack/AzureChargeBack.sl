namespace: ITAzureChargeBack
flow:
  name: AzureChargeBack
  inputs:
    - location: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/ITAM Azure Cost Management/'
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
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
          - SUCCESS: downloadExcel
    - getActiveProjects:
        do:
          ITAzureChargeBack.getActiveProjects:
            - filePath: '${filePath}'
        publish:
          - activeProjects
          - sapCode
          - firstName
          - lastName
          - email
          - loopCount
        navigate:
          - SUCCESS: ProjectCosts
    - getExchangeRate:
        do:
          ITAzureChargeBack.getExchangeRate: []
        publish:
          - exchangeRate
        navigate:
          - SUCCESS: loginAzure
          - WARNING: loginAzure
          - FAILURE: on_failure
    - loginAzure:
        do:
          ITAzureChargeBack.loginAzure:
            - username: "${get_sp('svc-app-costmanageUSER')}"
            - password: "${get_sp('svc-app-costmanagePASS')}"
            - filelocation: '${location}'
        publish: []
        navigate:
          - SUCCESS: getActiveProjects
          - WARNING: getActiveProjects
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
          - SUCCESS: uploadFile
    - downloadExcel:
        do:
          ITAzureChargeBack.downloadExcel:
            - accessToken: '${accessToken}'
            - fileLocation: '${location}'
        publish:
          - filePath
        navigate:
          - FAILURE: on_failure
          - SUCCESS: getExchangeRate
    - ProjectCosts:
        loop:
          for: x in loopCount
          do:
            ITAzureChargeBack.ProjectCosts:
              - activeProjects: '${activeProjects}'
              - sapCode: '${sapCode}'
              - firstName: '${firstName}'
              - lastName: '${lastName}'
              - email: '${email}'
              - loopCount: '${x}'
              - currencyConversion: '${exchangeRate}'
              - fileName: '${filePath}'
          break:
            - FAILURE
        navigate:
          - FAILURE: on_failure
          - SUCCESS: GetAccessToken_Teams_1
    - completionEmail:
        do:
          ITAzureChargeBack.completionEmail: []
        navigate:
          - SUCCESS: DeleteOldFiles
          - WARNING: DeleteOldFiles
          - FAILURE: on_failure
    - uploadFile:
        do:
          ITAzureChargeBack.uploadFile:
            - accessToken: '${accessToken}'
            - filePath: '${filePath}'
        publish:
          - successfulResult
          - failureResult
        navigate:
          - FAILURE: on_failure
          - SUCCESS: completionEmail
    - DeleteOldFiles:
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: '${location}'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
  outputs:
    - capex: '${filePath}'
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      completionEmail:
        x: 2800
        'y': 150
      Kill_ProcessByName_1:
        x: 3400
        'y': 150
        navigate:
          5c16cefa-0215-b10c-e8ba-2e36407b7848:
            targetId: 0ff3a08b-9dc1-db41-ed27-cc4bf98afefb
            port: SUCCESS
          3bd45aeb-4d92-2567-91ab-def7c511ad4f:
            targetId: 0ff3a08b-9dc1-db41-ed27-cc4bf98afefb
            port: WARNING
      loginAzure:
        x: 1300
        'y': 150
      GetAccessToken_Teams_1:
        x: 2200
        'y': 150
      ProjectCosts:
        x: 1900
        'y': 150
      downloadExcel:
        x: 700
        'y': 150
      Kill_ProcessByName:
        x: 100
        'y': 150
      getActiveProjects:
        x: 1600
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      getExchangeRate:
        x: 1000
        'y': 150
      DeleteOldFiles:
        x: 3100
        'y': 150
      uploadFile:
        x: 2500
        'y': 150
    results:
      SUCCESS:
        0ff3a08b-9dc1-db41-ed27-cc4bf98afefb:
          x: 3700
          'y': 150
