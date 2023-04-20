namespace: ActionBPEMs
flow:
  name: ActionBPEMs_MI27_MI79
  inputs:
    - robot: B602
    - original_date:
        required: false
  workflow:
    - Kill_ProcessByName:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: CreateLogFile
          - WARNING: CreateLogFile
          - FAILURE: on_failure
    - OpenSAP:
        robot_group: '${robot}'
        do:
          GenericActivities.OpenSAP:
            - user: "${get_sp('svcbpemrpaUSER')}"
            - pass:
                value: "${get_sp('svcbpemrpaPASS')}"
                sensitive: true
            - environment: PRD
            - system: ISU
        navigate:
          - SUCCESS: Action_MI27_MI79_BPEM
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - Action_MI27_MI79_BPEM:
        robot_group: '${robot}'
        do:
          ActionBPEMs.Action_MI27_MI79_BPEM:
            - fileName: '${excelFile}'
            - Email: 'Jefferson.Retallack@sapowernetworks.com.au,Ancilla.Dias@sapowernetworks.com.au'
            - originalDate: '${original_date}'
        publish:
          - bpemRowsCnt
          - completedBpems
        navigate:
          - SUCCESS: Send_Email_Success
          - WARNING: Send_Email_Success
          - FAILURE: on_failure
    - Send_Email_Success:
        robot_group: '${robot}'
        do:
          ActionBPEMs.Send_Email_Success:
            - Attachment: '${excelFile}'
        navigate:
          - SUCCESS: DeleteOldFiles
          - WARNING: DeleteOldFiles
          - FAILURE: on_failure
    - CreateLogFile:
        robot_group: '${robot}'
        do:
          ActionBPEMs.CreateLogFile: []
        publish:
          - excelFile
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - DeleteOldFiles:
        worker_group: '${robot}'
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Users\\SVCRPABOT\\OneDrive - SA Power Networks\\Action BPEMs\\"
        navigate:
          - SUCCESS: Kill_ProcessByName_1
  outputs:
    - excel: '${excelFile}'
  results:
    - FAILURE
    - SUCCESS
    - CUSTOM
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 250
      CreateLogFile:
        x: 400
        'y': 250
      OpenSAP:
        x: 700
        'y': 250
        navigate:
          f5102e1e-1635-54b2-3ed2-404a8674ba39:
            targetId: 5bf385cc-d861-9cbd-c557-641c18b08497
            port: WARNING
      Action_MI27_MI79_BPEM:
        x: 1000
        'y': 125
      Send_Email_Success:
        x: 1300
        'y': 250
      DeleteOldFiles:
        x: 1600
        'y': 250
      Kill_ProcessByName_1:
        x: 1900
        'y': 250
        navigate:
          db4f8754-4338-c269-7562-6eae4c52128e:
            targetId: 82796454-a9ba-66e9-3489-1e901430c2ed
            port: SUCCESS
          4a51b60a-3adb-b47d-3bbb-cf9f99e7e7ad:
            targetId: 82796454-a9ba-66e9-3489-1e901430c2ed
            port: WARNING
    results:
      CUSTOM:
        5bf385cc-d861-9cbd-c557-641c18b08497:
          x: 1000
          'y': 375
      SUCCESS:
        82796454-a9ba-66e9-3489-1e901430c2ed:
          x: 2200
          'y': 250
