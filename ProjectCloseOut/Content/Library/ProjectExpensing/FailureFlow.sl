namespace: ProjectExpensing
flow:
  name: FailureFlow
  inputs:
    - reportsHere
    - projectSupportFile
    - hoursJournalFile
    - costsJournalFile
    - userEmail
  workflow:
    - CloseExcelObjects:
        do:
          ProjectExpensing.CloseExcelObjects: []
        navigate:
          - SUCCESS: GetAccessToken_Teams
          - WARNING: GetAccessToken_Teams
          - FAILURE: on_failure
    - FailureEmail:
        do:
          ProjectExpensing.FailureEmail:
            - ToEmail: '${userEmail}'
        navigate:
          - SUCCESS: FAILURE
          - WARNING: FAILURE
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
          - SUCCESS: UploadProjectSupportFiles_PreJournal
    - UploadProjectSupportFiles_PreJournal:
        do:
          ProjectExpensing.UploadProjectSupportFiles_PreJournal:
            - accessToken: '${accessToken}'
            - filePath: '${reportsHere}'
            - supportFile: '${projectSupportFile}'
            - hoursJournal: '${hoursJournalFile}'
            - costsJournal: '${costsJournalFile}'
        navigate:
          - FAILURE: on_failure
          - SUCCESS: FailureEmail
  results:
    - FAILURE
extensions:
  graph:
    steps:
      CloseExcelObjects:
        x: 100
        'y': 150
      GetAccessToken_Teams:
        x: 400
        'y': 150
      UploadProjectSupportFiles_PreJournal:
        x: 700
        'y': 150
      FailureEmail:
        x: 1000
        'y': 150
        navigate:
          c6e1d2ad-a6d6-d2bf-3c71-689d4e92844c:
            targetId: 314d8a27-52ed-86dd-2e3c-dce557e3fd1f
            port: SUCCESS
          70a63697-0a3a-b597-dc17-c1c172be7ac2:
            targetId: 314d8a27-52ed-86dd-2e3c-dce557e3fd1f
            port: WARNING
    results:
      FAILURE:
        314d8a27-52ed-86dd-2e3c-dce557e3fd1f:
          x: 1300
          'y': 150
