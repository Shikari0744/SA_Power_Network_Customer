namespace: MSATS_CTC_Compliance
flow:
  name: MSATS_CTC_Compliance_Updates
  inputs:
    - user_msats: RMBOT0
    - pass_msats:
        default: 123wELCOME
        sensitive: true
    - site_url: 'https://msats.preprod.nemnet.net.au/msats/index.jsp'
    - input_sheet: NCR0188932_UMPLP_CTC_Blank_SMALL_LARGE_NMIs_with_checksum_v0.2 test.xlsx
  workflow:
    - CTC_Compliance:
        do:
          MSATS_CTC_Compliance.CTC_Compliance:
            - msats_user: '${user_msats}'
            - new_excel: '${input_sheet}'
            - msats_pass: '${pass_msats}'
            - site_url: '${site_url}'
        navigate:
          - SUCCESS: UploadExcelToOutlook
          - WARNING: UploadExcelToOutlook
          - FAILURE: on_failure
    - UploadExcelToOutlook:
        do:
          MSATS_CTC_Compliance.UploadExcelToOutlook:
            - attachment: '${input_sheet}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
extensions:
  graph:
    steps:
      CTC_Compliance:
        x: 100
        'y': 150
      UploadExcelToOutlook:
        x: 400
        'y': 150
        navigate:
          29001701-742c-7df1-26af-261f325b640b:
            targetId: 03119327-be31-35fb-4612-21371de6a6d3
            port: SUCCESS
          8306ad63-5385-b224-0965-c2fbae110ff4:
            targetId: 03119327-be31-35fb-4612-21371de6a6d3
            port: WARNING
    results:
      SUCCESS:
        03119327-be31-35fb-4612-21371de6a6d3:
          x: 700
          'y': 150
