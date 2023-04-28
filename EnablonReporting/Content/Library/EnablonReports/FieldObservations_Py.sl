namespace: EnablonReports
flow:
  name: FieldObservations_Py
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
            - reportType: Field Observations
        navigate:
          - SUCCESS: GenerateReport_Electrical
    - GenerateReport_Regional:
        do:
          EnablonReports.GenerateReport:
            - firstWorkbookName: '${opsRegional}'
            - firstSheetName: Regional
            - reportLocation: '${reportLocation}'
            - reportName: Regional Field Services Combined Field Observations Report.xlsx
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
            - reportName: Metro Ops Field Services Combined Field Observations Report.xlsx
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
            - reportName: Electrical Field Services Combined Field Observations Report.xlsx
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
            - reportName: Metro Field Services Combined Field Observations Report.xlsx
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
      GenerateReport_Regional:
        x: 1300
        'y': 250
      GenerateReport_Ops:
        x: 1000
        'y': 250
      GetAccessToken_Teams:
        x: 1600
        'y': 250
        navigate:
          5de64e4a-eed7-99f8-aa1b-5eafc42cbfc4:
            targetId: ab1cf6c3-d3b5-b1b0-b8f0-d6f2ad56b916
            port: FAILURE
      UploadToSharePoint:
        x: 1900
        'y': 250
        navigate:
          a391d7a8-d891-7ddf-68d2-80f2a384ca7b:
            targetId: ab1cf6c3-d3b5-b1b0-b8f0-d6f2ad56b916
            port: FAILURE
          93779bb9-2e69-e220-3ab2-d3480fc9cc22:
            targetId: aa310c7a-69cd-e60a-b462-0cf28fba8e38
            port: SUCCESS
      GenerateReport_Electrical:
        x: 400
        'y': 250
      GenerateReport_Metro:
        x: 700
        'y': 250
    results:
      SUCCESS:
        aa310c7a-69cd-e60a-b462-0cf28fba8e38:
          x: 2200
          'y': 375
      CUSTOM:
        ab1cf6c3-d3b5-b1b0-b8f0-d6f2ad56b916:
          x: 2200
          'y': 125
