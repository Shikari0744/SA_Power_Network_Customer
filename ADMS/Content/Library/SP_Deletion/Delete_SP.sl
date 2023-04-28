namespace: SP_Deletion
flow:
  name: Delete_SP
  inputs:
    - Datasheet
    - WebDMDURL
    - Email
  workflow:
    - SP_Delete:
        do:
          SP_Deletion.SP_Delete:
            - InputDataSheet: '${Datasheet}'
            - WebDMD_Url: '${WebDMDURL}'
            - email_list: '${Email}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - SUCCESS
    - FAILURE
extensions:
  graph:
    steps:
      SP_Delete:
        x: 100
        'y': 150
        navigate:
          692e89e8-97d4-8d1c-3043-41cbacd1e3f4:
            targetId: 6d2ea9f5-7fb5-3be6-2057-ade007bdfba7
            port: SUCCESS
          157f5d0a-7d34-2644-6959-7f3e3feaa110:
            targetId: 6d2ea9f5-7fb5-3be6-2057-ade007bdfba7
            port: WARNING
    results:
      SUCCESS:
        6d2ea9f5-7fb5-3be6-2057-ade007bdfba7:
          x: 400
          'y': 150
