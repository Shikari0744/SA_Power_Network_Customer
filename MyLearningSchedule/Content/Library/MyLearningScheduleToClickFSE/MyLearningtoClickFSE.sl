namespace: MyLearningScheduleToClickFSE
flow:
  name: MyLearningtoClickFSE
  inputs:
    - fileLocation_schedule: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services MyLearning to ClickFSE/My Learning Enrolment Report - METRO OPS 1ST & 2ND QTR 2023'
    - fileLocation_travelTimes: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services MyLearning to ClickFSE/Depot Travel Time'
  workflow:
    - MyLearningReport:
        worker_group: B603
        do:
          MyLearningScheduleToClickFSE.MyLearningReport:
            - fileName: '${fileLocation_schedule}'
        publish:
          - personnelNo
          - courseInfo
          - trainingTimes
          - employeeDepot
          - trainingDepot
          - complete
          - currentRow
        navigate:
          - SUCCESS: CompletionCheck
    - ClickFSE:
        worker_group: B603
        do:
          MyLearningScheduleToClickFSE.ClickFSE:
            - username: "${get_sp('clickFSEUSER_prd')}"
            - password: "${get_sp('clickFSEPASS_prd')}"
            - trainingTime: '${trainingTimes}'
            - employeeID: '${personnelNo}'
            - training: '${courseInfo}'
            - travelTimes: '${trainingTravelDates}'
            - currentRow: '${currentRow}'
            - fileName: '${fileLocation_schedule}'
            - environment: prod
        publish:
          - error
        navigate:
          - SUCCESS: SUCCESS
    - TravelTimeLookup:
        worker_group: B603
        do:
          MyLearningScheduleToClickFSE.TravelTimeLookup:
            - filename_travelTimes: '${fileLocation_travelTimes}'
            - homeDepot: '${employeeDepot}'
            - trainDepot: '${trainingDepot}'
            - trainingTime: '${trainingTimes}'
        publish:
          - trainingTravelDates
        navigate:
          - SUCCESS: ClickFSE
    - CompletionCheck:
        worker_group: B603
        do:
          MyLearningScheduleToClickFSE.CompletionCheck:
            - completed: '${complete}'
        navigate:
          - FAILURE: SUCCESS_1
          - SUCCESS: TravelTimeLookup
  results:
    - SUCCESS
    - SUCCESS_1
extensions:
  graph:
    steps:
      MyLearningReport:
        x: 100
        'y': 150
      ClickFSE:
        x: 1000
        'y': 150
        navigate:
          111ab61e-a43a-1b2d-85b7-c09a0a88ca97:
            targetId: c13aab4d-eb93-2410-6ecf-9f68ddb61c73
            port: SUCCESS
      TravelTimeLookup:
        x: 700
        'y': 150
      CompletionCheck:
        x: 400
        'y': 150
        navigate:
          a424b8e3-cac6-cf56-476c-acad443c4e9d:
            targetId: 7b42b6cd-866f-7fcc-4af4-b9b7be4930d5
            port: FAILURE
    results:
      SUCCESS:
        c13aab4d-eb93-2410-6ecf-9f68ddb61c73:
          x: 1300
          'y': 150
      SUCCESS_1:
        7b42b6cd-866f-7fcc-4af4-b9b7be4930d5:
          x: 400
          'y': 400
