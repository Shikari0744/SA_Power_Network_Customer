########################################################################################################################
#!!
#! @input findPDFsHere: C:/Users/svcrpabot/OneDrive - SA Power Networks/Enerven Go Canvas Test Results/Bulk Upload of Go Canvas Results 2021/
#!!#
########################################################################################################################
namespace: GoCanvasUploads
flow:
  name: BulkUploadofGoCanvas_2021
  inputs:
    - sap_user: KELLL3
    - sap_pass:
        default: 'L@chlan_bulkupload!123'
        sensitive: true
    - findPDFsHere: 'C:/Users/svcrpabot/OneDrive - SA Power Networks/Enerven Go Canvas Test Results/Bulk Upload of Go Canvas Results 2021/'
  workflow:
    - Kill_ProcessByName:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: OpenSAP
          - WARNING: OpenSAP
          - FAILURE: on_failure
    - Kill_ProcessByName_1:
        do:
          GenericActivities.Kill_ProcessByName: []
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
    - OpenSAP:
        do:
          GenericActivities.OpenSAP:
            - user: '${sap_user}'
            - pass:
                value: '${sap_pass}'
                sensitive: true
            - environment: PRD
            - system: ISU
        navigate:
          - SUCCESS: UploadtoISU
          - WARNING: UploadtoISU
          - FAILURE: on_failure
    - UploadtoISU:
        do:
          GoCanvasUploads.UploadtoISU:
            - log_file: "C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\Enerven Go Canvas Test Results\\Bulk Upload of Go Canvas Results 2021\\Bulk Upload of Meter Testing Results.xlsx"
        navigate:
          - SUCCESS: Kill_ProcessByName_1
          - WARNING: Kill_ProcessByName_1
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      Kill_ProcessByName:
        x: 100
        'y': 150
      OpenSAP:
        x: 400
        'y': 150
      UploadtoISU:
        x: 700
        'y': 150
      Kill_ProcessByName_1:
        x: 1000
        'y': 150
        navigate:
          b6917c6b-4099-4ea3-f278-1d6279a1866d:
            targetId: dcd8bc0f-c44b-2b17-3d83-70766f327473
            port: SUCCESS
          eff44577-b6f8-9dee-ebd2-cfaf70d63bac:
            targetId: dcd8bc0f-c44b-2b17-3d83-70766f327473
            port: WARNING
    results:
      SUCCESS:
        dcd8bc0f-c44b-2b17-3d83-70766f327473:
          x: 1300
          'y': 150
