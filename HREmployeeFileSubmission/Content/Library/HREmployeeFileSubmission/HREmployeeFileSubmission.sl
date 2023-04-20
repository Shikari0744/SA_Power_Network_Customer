namespace: HREmployeeFileSubmission
flow:
  name: HREmployeeFileSubmission
  inputs:
    - filepath: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\HR Employee File Submission\\"
    - rundate:
        required: false
  workflow:
    - GetTodaysFile:
        do:
          HREmployeeFileSubmission.GetTodaysFile:
            - dateEntry: '${rundate}'
            - location: '${filepath}'
        publish:
          - file
        navigate:
          - SUCCESS: GetDataLine
    - GetDataLine:
        do:
          HREmployeeFileSubmission.GetDataLine:
            - filename: '${file}'
        publish:
          - allSubjects
        navigate:
          - CUSTOM: SUCCESS
          - SUCCESS: ProcessEmployee
    - ProcessEmployee:
        loop:
          for: subject in allSubjects
          do:
            HREmployeeFileSubmission.ProcessEmployee:
              - subject: '${subject}'
              - filepath: '${filepath}'
          break:
            - FAILURE
        navigate:
          - SUCCESS: SUCCESS
          - FAILURE: on_failure
          - SUCCESS_1: SUCCESS
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      GetTodaysFile:
        x: 100
        'y': 150
      GetDataLine:
        x: 400
        'y': 150
        navigate:
          9c90d5ae-4809-6e26-f56f-3b5f83fc0998:
            targetId: a9a12723-aa22-2001-32f3-476a4f0449bb
            port: CUSTOM
      ProcessEmployee:
        x: 720
        'y': 280
        navigate:
          3192a8f0-0ba5-2417-ea02-55b95ac7e12c:
            targetId: a9a12723-aa22-2001-32f3-476a4f0449bb
            port: SUCCESS
          a4a3c5f4-6bfc-4b44-a530-c104eb6ed8e4:
            targetId: a9a12723-aa22-2001-32f3-476a4f0449bb
            port: SUCCESS_1
    results:
      SUCCESS:
        a9a12723-aa22-2001-32f3-476a4f0449bb:
          x: 1000
          'y': 150
