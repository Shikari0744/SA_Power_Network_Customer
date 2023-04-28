namespace: ITAzureChargeBack
flow:
  name: ProjectCosts_NoEmail
  inputs:
    - activeProjects
    - sapCode
    - firstName
    - lastName
    - email
    - loopCount
    - currencyConversion
    - fileName
    - costTrackingSheet
  workflow:
    - getCurrrentProject:
        do:
          ITAzureChargeBack.getCurrrentProject:
            - activeProjects: '${activeProjects}'
            - email: '${email}'
            - firstName: '${firstName}'
            - lastName: '${lastName}'
            - sapCode: '${sapCode}'
            - loopCount: '${loopCount}'
        publish:
          - currentProject
          - currentSapCode
          - currentFirstName
          - currentLastName
          - currentEmail
        navigate:
          - SUCCESS: getProjectCosts
    - addCostsToExcel:
        do:
          ITAzureChargeBack.addCostsToExcel:
            - currencyConversion: '${currencyConversion}'
            - estimatedUSD: '${gpc_forecastCost}'
            - actualUSD: '${gpc_actualCost}'
            - currentProject: '${currentProject}'
            - filePath: '${fileName}'
            - trackingRow: '${trackingRow}'
            - trackingSheet: '${costTrackingSheet}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - getProjectCosts:
        do:
          ITAzureChargeBack.getProjectCosts:
            - projectName: '${currentProject}'
            - filelocation: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\ITAM Azure Cost Management\\"
            - trackingSheet: '${costTrackingSheet}'
            - username: "${get_sp('svc-app-costmanageUSER')}"
            - password: "${get_sp('svc-app-costmanagePASS')}"
        publish:
          - gpc_forecastCost
          - gpc_actualCost
          - graph
          - trackingRow
          - errorScreenshot
        navigate:
          - SUCCESS: checkProjectFound
          - WARNING: checkProjectFound
          - FAILURE: on_failure
    - checkProjectFound:
        do:
          ITAzureChargeBack.checkProjectFound:
            - actual: '${gpc_actualCost}'
            - project: '${currentProject}'
            - errorScreenShot: '${errorScreenshot}'
        navigate:
          - SUCCESS: addCostsToExcel
          - WARNING: addCostsToExcel
          - FAILURE: SUCCESS
  outputs:
    - currentFirstName: '${currentFirstName}'
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      getCurrrentProject:
        x: 100
        'y': 250
      addCostsToExcel:
        x: 1000
        'y': 125
        navigate:
          f63b2b8b-3f0c-c344-87f4-fde5da191318:
            targetId: 8a6090dc-d0ee-18ab-1b5e-97b99df9a25a
            port: SUCCESS
          fe161f7d-74b0-f7e1-0c3b-d49b61858e93:
            targetId: 8a6090dc-d0ee-18ab-1b5e-97b99df9a25a
            port: WARNING
      getProjectCosts:
        x: 400
        'y': 250
      checkProjectFound:
        x: 700
        'y': 250
        navigate:
          66750fcf-8668-f6ff-7206-5367cbced56a:
            targetId: 8a6090dc-d0ee-18ab-1b5e-97b99df9a25a
            port: FAILURE
    results:
      SUCCESS:
        8a6090dc-d0ee-18ab-1b5e-97b99df9a25a:
          x: 1000
          'y': 375
