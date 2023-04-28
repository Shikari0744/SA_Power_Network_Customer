namespace: GenericActivities
flow:
  name: DeleteOldFilesFromDirectory
  workflow:
    - DeleteOldFiles_601:
        worker_group: B601
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Automation Downloads\\"
            - numberOfDays: '14'
        navigate:
          - SUCCESS: DeleteOldFiles_602
    - DeleteOldFiles_602:
        worker_group: B602
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Automation Downloads\\"
            - numberOfDays: '14'
        navigate:
          - SUCCESS: DeleteOldFiles_603
    - DeleteOldFiles_603:
        worker_group: B603
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Automation Downloads\\"
            - numberOfDays: '14'
        navigate:
          - SUCCESS: DeleteOldFiles_604
    - DeleteOldFiles_604:
        worker_group: B604
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Automation Downloads\\"
            - numberOfDays: '14'
        navigate:
          - SUCCESS: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      DeleteOldFiles_601:
        x: 100
        'y': 150
      DeleteOldFiles_602:
        x: 400
        'y': 150
      DeleteOldFiles_603:
        x: 700
        'y': 150
      DeleteOldFiles_604:
        x: 1000
        'y': 150
        navigate:
          4630e49f-59f0-c7ec-727c-4ee299552ca7:
            targetId: 91c1d0c4-2f0a-95da-4329-fba79d289591
            port: SUCCESS
    results:
      SUCCESS:
        91c1d0c4-2f0a-95da-4329-fba79d289591:
          x: 1300
          'y': 150
