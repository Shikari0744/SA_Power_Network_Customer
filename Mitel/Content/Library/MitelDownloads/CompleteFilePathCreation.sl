########################################################################################################################
#!!
#! @description: This flow will create a folder for each date of the year, for the specified year range
#!!#
########################################################################################################################
namespace: MitelDownloads
flow:
  name: CompleteFilePathCreation
  workflow:
    - CreateCompleteFilePath:
        do:
          MitelDownloads.CreateCompleteFilePath: []
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      CreateCompleteFilePath:
        x: 100
        'y': 150
        navigate:
          74665438-5740-59eb-f3b7-9e0ea2f0e623:
            targetId: 51b52c7d-08cd-4a2c-cb50-30fb33b972d4
            port: SUCCESS
    results:
      SUCCESS:
        51b52c7d-08cd-4a2c-cb50-30fb33b972d4:
          x: 400
          'y': 150
