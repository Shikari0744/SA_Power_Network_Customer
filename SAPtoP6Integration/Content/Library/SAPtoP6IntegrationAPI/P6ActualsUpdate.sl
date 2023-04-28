namespace: SAPtoP6IntegrationAPI
flow:
  name: P6ActualsUpdate
  inputs:
    - ProjectIDs
    - robot: B603
  workflow:
    - Kill_ProcessByName:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: ActualsP6Extraction
          - WARNING: ActualsP6Extraction
          - FAILURE: on_failure
    - ActualsP6Extraction:
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.ActualsP6Extraction:
            - P6ServiceAccountUsername:
                value: "${get_sp('svc-app-primaveraUSER')}"
                sensitive: true
            - P6ServiceAccountPassword:
                value: "${get_sp('svc-app-primaveraPASS')}"
                sensitive: true
            - Environment: PRD
            - ProjectInput: '${ProjectIDs}'
        publish:
          - ActivitiesFileName
          - ResourcesFileName
          - ActivitiesFilePath
          - ProjectsFileName
          - ResourcesFilePath
          - ProjectsFilePath
        navigate:
          - SUCCESS: ValidationCheck
    - ActualsSAPExtraction:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.ActualsSAPExtraction:
            - actualsActivities: '${ActivitiesFileName}'
            - actualsResources: '${ResourcesFileName}'
            - filePath: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/SAP to P6 Integration/'
            - sapuser: "${get_sp('svcprimaintUSER')}"
            - sappass: "${get_sp('svcprimaintPASS')}"
        navigate:
          - SUCCESS: ActualsP6Update
          - WARNING: ActualsP6Update
          - FAILURE: on_failure
    - OpenSAP:
        worker_group: '${robot}'
        robot_group: '${robot}'
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcprimaintUSER')}"
            - pass:
                value: "${get_sp('svcprimaintPASS')}"
                sensitive: true
            - environment: PRD
        navigate:
          - SUCCESS: ActualsSAPExtraction
          - WARNING: ActualsSAPExtraction
          - FAILURE: on_failure
    - ActualsP6Update:
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.ActualsP6Update:
            - P6ServiceAccountUsername:
                value: "${get_sp('svc-app-primaveraUSER')}"
                sensitive: true
            - P6ServiceAccountPassword:
                value: "${get_sp('svc-app-primaveraPASS')}"
                sensitive: true
            - ActualsActivitiesFileName: '${ActivitiesFileName}'
            - ActualsResourcesFileName: '${ResourcesFileName}'
            - Environment: PRD
        publish:
          - ActualsUpdatedFileName
          - UpdatedActivitiesFilePath
        navigate:
          - SUCCESS: AddProjectandOrderNumber
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - DeleteOldFiles:
        worker_group: '${robot}'
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/SAP to P6 Integration/'
        navigate:
          - SUCCESS: Kill_ProcessByName_1
    - ValidationCheck:
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.ValidationCheck:
            - validationFile: '${ProjectsFilePath}'
            - userInput: '${ProjectIDs}'
        navigate:
          - FAILURE: NoProjectsEmail
          - SUCCESS: OpenSAP
    - NoProjectsEmail:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.NoProjectsEmail: []
        navigate:
          - SUCCESS: CUSTOM
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - CompletionEmail:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.CompletionEmail:
            - activitiesFile: '${ActivitiesFilePath}'
            - resourcesFile: '${ResourcesFilePath}'
            - activitiesUpdatedFile: '${UpdatedActivitiesFilePath}'
        navigate:
          - SUCCESS: DeleteOldFiles
          - WARNING: DeleteOldFiles
          - FAILURE: on_failure
    - STATS_IncreaseRunCountInDevOps:
        do:
          GenericActivities.STATS_IncreaseRunCountInDevOps:
            - EpicWorkItemID: '51005'
        navigate:
          - SUCCESS: SUCCESS
    - AddProjectandOrderNumber:
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.AddProjectandOrderNumber:
            - FilePath: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/SAP to P6 Integration/'
            - ActualsActivitiesFileName: '${ActivitiesFileName}'
            - ActualsResourcesFileNameUpdated: '${ActualsUpdatedFileName}'
        navigate:
          - SUCCESS: CompletionEmail
  results:
    - SUCCESS
    - FAILURE
    - CUSTOM
extensions:
  graph:
    steps:
      CompletionEmail:
        x: 2200
        'y': 250
      NoProjectsEmail:
        x: 1000
        'y': 125
        navigate:
          780be052-da0e-f12c-ec5e-50e7892c6cf4:
            targetId: e43590a8-8206-224d-5634-b0c6ec4b70c3
            port: SUCCESS
          129291a8-c4eb-7d99-83d5-cf7ed840235e:
            targetId: e43590a8-8206-224d-5634-b0c6ec4b70c3
            port: WARNING
      Kill_ProcessByName_1:
        x: 2800
        'y': 250
      ActualsSAPExtraction:
        x: 1300
        'y': 375
      STATS_IncreaseRunCountInDevOps:
        x: 3100
        'y': 250
        navigate:
          4995b0bf-f149-06f6-c149-80cc215a826d:
            targetId: e0042a54-f492-2f5f-71cc-64ce0f4e90a3
            port: SUCCESS
      ValidationCheck:
        x: 700
        'y': 250
      Kill_ProcessByName:
        x: 100
        'y': 250
      ActualsP6Extraction:
        x: 400
        'y': 250
      ActualsP6Update:
        x: 1600
        'y': 250
      OpenSAP:
        x: 1000
        'y': 375
      AddProjectandOrderNumber:
        x: 1900
        'y': 250
      DeleteOldFiles:
        x: 2500
        'y': 250
    results:
      SUCCESS:
        e0042a54-f492-2f5f-71cc-64ce0f4e90a3:
          x: 3400
          'y': 250
      CUSTOM:
        e43590a8-8206-224d-5634-b0c6ec4b70c3:
          x: 1300
          'y': 125
