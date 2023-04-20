namespace: ITAzureChargeBack
flow:
  name: ProjectCosts
  inputs:
    - activeProjects
    - sapCode
    - firstName
    - lastName
    - email
    - loopCount
    - currencyConversion
    - fileName
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
        navigate:
          - SUCCESS: journalCostsToSharepoint
          - WARNING: journalCostsToSharepoint
          - FAILURE: on_failure
    - sendEmail:
        do:
          ITAzureChargeBack.sendEmail:
            - projectManagerEmail: jasmin.haas@sapowernetworks.com.au
            - projectName: '${currentProject}'
            - projectManager: '${currentFirstName}'
            - imageAttachment_forecast: '${graph}'
            - se_actualCost: '${gpc_actualCost}'
            - se_forecastCost: '${gpc_forecastCost}'
            - sapCode: '${currentSapCode}'
            - currencyConversion: '${currencyConversion}'
            - capexFile: '${fileName}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - getProjectCosts:
        do:
          ITAzureChargeBack.getProjectCosts:
            - projectName: '${currentProject}'
            - filelocation: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\ITAM Azure Cost Management\\"
        publish:
          - gpc_forecastCost
          - gpc_actualCost
          - graph
          - errorScreenshot
        navigate:
          - SUCCESS: checkProjectFound
          - WARNING: checkProjectFound
          - FAILURE: on_failure
    - journalCostsToSharepoint:
        do:
          ITAzureChargeBack.journalCostsToSharepoint:
            - actualCosts: '${gpc_actualCost}'
            - projectName: '${currentProject}'
            - projectMangerEmail: '${currentEmail}'
            - sapCode: '${currentSapCode}'
            - forecastedCosts: '${gpc_forecastCost}'
            - currencyConversion: '${currencyConversion}'
            - location: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\ITAM Azure Cost Management\\"
        publish:
          - failureScreenshotLocation
        navigate:
          - SUCCESS: sendEmail
          - WARNING: sendEmail
          - FAILURE: noProjectManagerFound
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
    - noProjectManagerFound:
        do:
          ITAzureChargeBack.noProjectManagerFound:
            - projectName: '${currentProject}'
            - pmFirstName: '${currentFirstName}'
            - azureFailImage: '${failureScreenshotLocation}'
            - pmLastName: '${currentLastName}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
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
      sendEmail:
        x: 1560
        'y': 400
        navigate:
          259a1050-0494-7989-2135-21dc9f9b0c09:
            targetId: bef269b8-609c-d455-b7ad-88a215e86726
            port: SUCCESS
          576af863-42f8-695f-b3ec-a7f4fc394fe1:
            targetId: bef269b8-609c-d455-b7ad-88a215e86726
            port: WARNING
      getProjectCosts:
        x: 400
        'y': 240
      journalCostsToSharepoint:
        x: 1280
        'y': 120
      checkProjectFound:
        x: 700
        'y': 250
        navigate:
          1d8dbc64-8a7b-1df6-0bc5-c22e4b5286b7:
            targetId: bef269b8-609c-d455-b7ad-88a215e86726
            port: FAILURE
      noProjectManagerFound:
        x: 1560
        'y': 120
        navigate:
          38ee9722-c0d9-8518-6bee-4a8b617b1db7:
            targetId: bef269b8-609c-d455-b7ad-88a215e86726
            port: SUCCESS
          9e458411-9086-7e53-03e5-2e2fb04d25af:
            targetId: bef269b8-609c-d455-b7ad-88a215e86726
            port: WARNING
    results:
      SUCCESS:
        bef269b8-609c-d455-b7ad-88a215e86726:
          x: 1000
          'y': 375
