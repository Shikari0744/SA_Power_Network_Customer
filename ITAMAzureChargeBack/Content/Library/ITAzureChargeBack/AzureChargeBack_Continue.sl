namespace: ITAzureChargeBack
flow:
  name: AzureChargeBack_Continue
  inputs:
    - location: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/ITAM Azure Cost Management/'
    - downloadedCapexPath:
        default: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/ITAM Azure Cost Management/CAPEX Project Azure Expenditure.xlsx'
        required: false
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: getActiveProjects
          - WARNING: getActiveProjects
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - getActiveProjects:
        do:
          ITAzureChargeBack.getActiveProjects:
            - filePath: '${downloadedCapexPath}'
        publish:
          - activeProjects
          - sapCode
          - firstName
          - lastName
          - email
          - loopCount
        navigate:
          - SUCCESS: getExchangeRate
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
          - SUCCESS: ProjectCosts
          - WARNING: ProjectCosts
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
              - fileName: '${downloadedCapexPath}'
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
            - filePath: '${downloadedCapexPath}'
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
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      completionEmail:
        x: 2200
        'y': 150
      Kill_ProcessByName_1:
        x: 2800
        'y': 150
        navigate:
          83125a53-3f5f-0783-a92e-586db93e822b:
            targetId: df0c0377-cd32-a053-0c3b-3968f8d67727
            port: SUCCESS
          e05fff3e-87f5-4e38-24d6-48e65dbb19f7:
            targetId: df0c0377-cd32-a053-0c3b-3968f8d67727
            port: WARNING
      loginAzure:
        x: 1000
        'y': 150
      GetAccessToken_Teams_1:
        x: 1600
        'y': 150
      ProjectCosts:
        x: 1300
        'y': 150
      Kill_ProcessByName:
        x: 100
        'y': 150
      getActiveProjects:
        x: 400
        'y': 150
      getExchangeRate:
        x: 700
        'y': 150
      DeleteOldFiles:
        x: 2500
        'y': 150
      uploadFile:
        x: 1900
        'y': 150
    results:
      SUCCESS:
        df0c0377-cd32-a053-0c3b-3968f8d67727:
          x: 3100
          'y': 150
