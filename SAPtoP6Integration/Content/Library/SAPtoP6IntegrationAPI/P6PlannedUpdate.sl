namespace: SAPtoP6IntegrationAPI
flow:
  name: P6PlannedUpdate
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
          - SUCCESS: PlannedP6Extraction
          - WARNING: PlannedP6Extraction
          - FAILURE: on_failure
    - PlannedP6Extraction:
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.PlannedP6Extraction:
            - P6ServiceAccountUsername:
                value: "${get_sp('svc-app-primaveraUSER')}"
                sensitive: true
            - P6ServiceAccountPassword:
                value: "${get_sp('svc-app-primaveraPASS')}"
                sensitive: true
            - ProjectInput: '${ProjectIDs}'
            - Environment: PRD
        publish:
          - ActivitiesFileName
          - ResourcesFileName
          - ProjectsFileName
          - ActivitiesFilePath
          - ResourcesFilePath
          - ProjectsFilePath
          - Check
          - NotValidatedProjects
          - ValidatedProjects
        navigate:
          - NOPROJECTS: NoValidPlannedProjects
          - SOMEPROJECTS: SomeValidPlannedProjects
          - SUCCESS: ValidationCheck
    - PlannedSAPExtraction:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.PlannedSAPExtraction:
            - plannedActivities: '${ActivitiesFileName}'
            - plannedResources: '${ResourcesFileName}'
            - filePath: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/SAP to P6 Integration/'
        navigate:
          - SUCCESS: PlannedP6Update
          - WARNING: PlannedP6Update
          - FAILURE: on_failure
    - OpenSAP:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcprimaintUSER')}"
            - pass:
                value: "${get_sp('svcprimaintPASS')}"
                sensitive: true
            - environment: PRD
        navigate:
          - SUCCESS: PlannedSAPExtraction
          - WARNING: PlannedSAPExtraction
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: STATS_IncreaseRunCountInDevOps
          - WARNING: STATS_IncreaseRunCountInDevOps
          - FAILURE: on_failure
    - PlannedP6Update:
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.PlannedP6Update:
            - P6ServiceAccountUsername:
                value: "${get_sp('svc-app-primaveraUSER')}"
                sensitive: true
            - P6ServiceAccountPassword:
                value: "${get_sp('svc-app-primaveraPASS')}"
                sensitive: true
            - PlannedActivitiesFileName: '${ActivitiesFileName}'
            - PlannedResourcesFileName: '${ResourcesFileName}'
            - Environment: PRD
        navigate:
          - SUCCESS: CompletionEmail
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
          - FAILURE: NoValidPlannedProjects
          - SUCCESS: OpenSAP
    - CompletionEmail:
        robot_group: '${robot}'
        worker_group: '${robot}'
        do:
          SAPtoP6IntegrationAPI.CompletionEmail:
            - activitiesFile: '${ActivitiesFilePath}'
            - resourcesFile: '${ResourcesFilePath}'
            - activitiesUpdatedFile: '${ActivitiesFilePath}'
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
    - NoValidPlannedProjects:
        do:
          SAPtoP6IntegrationAPI.NoValidPlannedProjects:
            - invalidprojectIDs: '${NotValidatedProjects}'
        navigate:
          - SUCCESS: CUSTOM
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - SomeValidPlannedProjects:
        do:
          SAPtoP6IntegrationAPI.SomeValidPlannedProjects:
            - invalidprojectIDs: '${NotValidatedProjects}'
            - validprojectIDs: '${ValidatedProjects}'
        navigate:
          - SUCCESS: ValidationCheck
          - WARNING: ValidationCheck
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
    - CUSTOM
extensions:
  graph:
    steps:
      CompletionEmail:
        x: 1900
        'y': 350
      Kill_ProcessByName_1:
        x: 2500
        'y': 350
      NoValidPlannedProjects:
        x: 720
        'y': 520
        navigate:
          4a4c0d7e-b8b2-8f42-7d9e-d015cd5d0b00:
            targetId: c7ee16af-a9ad-f6c5-b68f-58573e781334
            port: SUCCESS
          81c588a1-82a4-1dae-981e-7810083b8dd4:
            targetId: c7ee16af-a9ad-f6c5-b68f-58573e781334
            port: WARNING
      PlannedSAPExtraction:
        x: 1300
        'y': 350
      STATS_IncreaseRunCountInDevOps:
        x: 2800
        'y': 350
        navigate:
          2a30332d-e7ca-b47c-0a4d-637bfef57805:
            targetId: 0db5a633-2298-0a37-89f2-027604f9cee3
            port: SUCCESS
      ValidationCheck:
        x: 720
        'y': 360
      Kill_ProcessByName:
        x: 100
        'y': 350
      PlannedP6Extraction:
        x: 400
        'y': 350
      PlannedP6Update:
        x: 1600
        'y': 350
      SomeValidPlannedProjects:
        x: 680
        'y': 80
      OpenSAP:
        x: 1040
        'y': 360
      DeleteOldFiles:
        x: 2200
        'y': 350
    results:
      SUCCESS:
        0db5a633-2298-0a37-89f2-027604f9cee3:
          x: 3100
          'y': 350
      CUSTOM:
        c7ee16af-a9ad-f6c5-b68f-58573e781334:
          x: 1040
          'y': 560
