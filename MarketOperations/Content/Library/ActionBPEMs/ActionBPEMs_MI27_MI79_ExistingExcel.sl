namespace: ActionBPEMs
flow:
  name: ActionBPEMs_MI27_MI79_ExistingExcel
  inputs:
    - robot: B602
    - excel
    - original_date:
        required: false
  workflow:
    - Kill_ProcessByName:
        robot_group: '${robot}'
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
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
            - fileName: '${excel}'
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
            - Attachment: '${excel}'
        navigate:
          - SUCCESS: DeleteOldFiles
          - WARNING: DeleteOldFiles
          - FAILURE: on_failure
    - DeleteOldFiles:
        worker_group: '${robot}'
        do:
          GenericActivities.DeleteOldFiles:
            - filePath: "C:\\Users\\SVCRPABOT\\OneDrive - SA Power Networks\\Action BPEMs\\"
        navigate:
          - SUCCESS: Kill_ProcessByName_1
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
      OpenSAP:
        x: 400
        'y': 250
        navigate:
          2a20cda1-e0df-52fb-0373-365ccf21eba3:
            targetId: 77781164-5f40-bb08-bf74-502ff1c521e8
            port: WARNING
      Action_MI27_MI79_BPEM:
        x: 700
        'y': 125
      Send_Email_Success:
        x: 1000
        'y': 250
      DeleteOldFiles:
        x: 1300
        'y': 250
      Kill_ProcessByName_1:
        x: 1600
        'y': 250
        navigate:
          591be7c5-6764-c985-32db-7c87a3fd8c22:
            targetId: ed7ecc71-55cc-9f45-6e8e-3660330e5573
            port: SUCCESS
          c31ea9c9-7164-1de5-22ce-986fba5fb061:
            targetId: ed7ecc71-55cc-9f45-6e8e-3660330e5573
            port: WARNING
    results:
      CUSTOM:
        77781164-5f40-bb08-bf74-502ff1c521e8:
          x: 700
          'y': 375
      SUCCESS:
        ed7ecc71-55cc-9f45-6e8e-3660330e5573:
          x: 1900
          'y': 250
