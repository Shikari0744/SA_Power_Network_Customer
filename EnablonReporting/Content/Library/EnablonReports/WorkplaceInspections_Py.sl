namespace: EnablonReports
flow:
  name: WorkplaceInspections_Py
  inputs:
    - electrical
    - metroNorth
    - metroSouth
    - opsPlanning
    - metroOps
    - opsRegional
    - reportLocation
  workflow:
    - ClearReports:
        do:
          EnablonReports.ClearReports:
            - reportLocation: '${reportLocation}'
            - reportType: Workplace Inspections
        navigate:
          - SUCCESS: GenerateReport_Electrical
    - GenerateReport_Regional:
        do:
          EnablonReports.GenerateReport:
            - firstWorkbookName: '${opsRegional}'
            - firstSheetName: Regional
            - reportLocation: '${reportLocation}'
            - reportName: Regional Field Services Combined Workplace Inspections Report.xlsx
        publish:
          - regionalNew: '${newReportName}'
        navigate:
          - SUCCESS: GetAccessToken_Teams
    - GenerateReport_Ops:
        do:
          EnablonReports.GenerateReport:
            - firstWorkbookName: '${metroOps}'
            - firstSheetName: Metro Ops
            - secondWorkbookName: '${opsPlanning}'
            - secondSheetName: Ops Planning
            - reportLocation: '${reportLocation}'
            - reportName: Metro Ops Field Services Combined Workplace Inspections Report.xlsx
            - reportName_1: Electrical Field Services Combined Field Observations Report.xlsx
        publish:
          - opsNew: '${newReportName}'
        navigate:
          - SUCCESS: GenerateReport_Regional
    - GetAccessToken_Teams:
        do:
          GenericActivities.GetAccessToken_Teams:
            - UserName: "${get_sp('svcrpabotAPIuser')}"
            - Password:
                value: "${get_sp('svcrpabotAPIpass')}"
                sensitive: true
        publish:
          - accessToken
        navigate:
          - FAILURE: CUSTOM
          - SUCCESS: UploadToSharePoint
    - UploadToSharePoint:
        do:
          EnablonReports.UploadToSharePoint:
            - accessToken: '${accessToken}'
            - electrical: '${electricalNew}'
            - metro: '${metroNew}'
            - ops: '${opsNew}'
            - regional: '${regionalNew}'
        publish:
          - electricalResult
          - metroOpsResult
          - metroResult
          - regionalResult
        navigate:
          - FAILURE: CUSTOM
          - SUCCESS: SUCCESS
    - GenerateReport_Electrical:
        do:
          EnablonReports.GenerateReport:
            - firstWorkbookName: '${electrical}'
            - firstSheetName: Electrical
            - reportLocation: '${reportLocation}'
            - reportName: Electrical Field Services Combined Workplace Inspections Report.xlsx
        publish:
          - electricalNew: '${newReportName}'
        navigate:
          - SUCCESS: GenerateReport_Metro
    - GenerateReport_Metro:
        do:
          EnablonReports.GenerateReport:
            - firstWorkbookName: '${metroNorth}'
            - firstSheetName: Metro North
            - secondWorkbookName: '${metroSouth}'
            - secondSheetName: Metro South
            - reportLocation: '${reportLocation}'
            - reportName: Metro Field Services Combined Workplace Inspections Report.xlsx
            - reportName_1: Electrical Field Services Combined Field Observations Report.xlsx
        publish:
          - metroNew: '${newReportName}'
        navigate:
          - SUCCESS: GenerateReport_Ops
  results:
    - SUCCESS
    - CUSTOM
extensions:
  graph:
    steps:
      ClearReports:
        x: 100
        'y': 250
      GenerateReport_Electrical:
        x: 400
        'y': 250
      GenerateReport_Metro:
        x: 700
        'y': 250
      GenerateReport_Ops:
        x: 1000
        'y': 250
      GenerateReport_Regional:
        x: 1300
        'y': 250
      GetAccessToken_Teams:
        x: 1600
        'y': 250
        navigate:
          f300f590-2ec7-a9c7-88a8-a96a0e76ac21:
            targetId: b07841b6-cc35-756e-e967-334de2700eb0
            port: FAILURE
      UploadToSharePoint:
        x: 1900
        'y': 250
        navigate:
          dc462bee-19f8-0544-e165-11f2981356d6:
            targetId: b07841b6-cc35-756e-e967-334de2700eb0
            port: FAILURE
          e2e9b804-fc6f-0dd1-c167-01fa0575f2d0:
            targetId: 3ac10656-5fc6-c684-f1b3-2dbf90062705
            port: SUCCESS
    results:
      CUSTOM:
        b07841b6-cc35-756e-e967-334de2700eb0:
          x: 2200
          'y': 125
      SUCCESS:
        3ac10656-5fc6-c684-f1b3-2dbf90062705:
          x: 2200
          'y': 375
