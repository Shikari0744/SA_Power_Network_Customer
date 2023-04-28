namespace: MyLearningScheduleToClickFSE
flow:
  name: MyLearningtoClickFSETrainingUpdates
  inputs:
    - scheduleName: 'My Learning Enrolment Report - METRO OPS 3RD & 4TH QTR 2023.xlsx'
  workflow:
    - SetScheduleLocation:
        worker_group: B603
        do:
          MyLearningScheduleToClickFSE.SetScheduleLocation:
            - scheduleName: '${scheduleName}'
            - fileLocation: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Field Services MyLearning to ClickFSE/'
        publish:
          - schedule_fileLocation
          - travel_fileLocation
        navigate:
          - SUCCESS: DownloadReport
    - DownloadReport:
        worker_group: B603
        do:
          MyLearningScheduleToClickFSE.DownloadReport:
            - fileName: '${schedule_fileLocation}'
        publish:
          - rowCount
        navigate:
          - SUCCESS: MyLearningtoClickFSE
    - MyLearningtoClickFSE:
        loop:
          for: x in rowCount
          do:
            MyLearningScheduleToClickFSE.MyLearningtoClickFSE:
              - fileLocation_schedule: '${schedule_fileLocation}'
              - fileLocation_travelTimes: '${travel_fileLocation}'
          break:
            - SUCCESS_1
        navigate:
          - SUCCESS:
              next_step: SUCCESS
              ROI: '28800'
          - SUCCESS_1: SUCCESS
  results:
    - SUCCESS
extensions:
  graph:
    steps:
      SetScheduleLocation:
        x: 100
        'y': 150
      DownloadReport:
        x: 400
        'y': 150
      MyLearningtoClickFSE:
        x: 700
        'y': 150
        navigate:
          579777c3-0623-568f-9624-956390ad7df5:
            targetId: 61781b22-0306-1755-dbfe-42b455cafc13
            port: SUCCESS
          145b8e92-d033-5e17-62e9-aaa79fd132e7:
            targetId: 61781b22-0306-1755-dbfe-42b455cafc13
            port: SUCCESS_1
    results:
      SUCCESS:
        61781b22-0306-1755-dbfe-42b455cafc13:
          x: 1000
          'y': 150
