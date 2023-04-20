namespace: FieldServicesLeaveReporting
flow:
  name: LoopLeaveExtractions
  inputs:
    - processDate
    - processMonth
    - structureFile
    - reportFolder
    - iteration
  workflow:
    - OrgStructureExtract:
        do:
          FieldServicesLeaveReporting.OrgStructureExtract:
            - structureFile: '${structureFile}'
            - iteration: '${iteration}'
        publish:
          - orgStructure
          - orgStructureSelection
          - orgStructureValue
          - reportName
          - folder
        navigate:
          - SUCCESS: CreateExcelFiles
          - WARNING: CUSTOM
          - FAILURE: on_failure
    - CreateExcelFiles:
        do:
          FieldServicesLeaveReporting.CreateExcelFiles:
            - orgStructureSelection: '${orgStructureSelection}'
            - reportName: '${reportName}'
            - currentDate: '${processDate}'
            - folderLocation: '${reportFolder}'
            - structureFile: '${structureFile}'
            - iteration: '${iteration}'
        publish:
          - filePath
          - fileName
        navigate:
          - SUCCESS: HRReport_AnnualLeave
          - WARNING: HRReport_AnnualLeave
          - FAILURE: on_failure
    - HRReport_AnnualLeave:
        do:
          FieldServicesLeaveReporting.HRReport_AnnualLeave:
            - orgStructure: '${orgStructure}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: HRReport_PersonalLeave
          - WARNING: HRReport_PersonalLeave
          - FAILURE: on_failure
    - HRReport_PersonalLeave:
        do:
          FieldServicesLeaveReporting.HRReport_PersonalLeave:
            - orgStructureValue: '${orgStructureValue}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: HRReport_Equalisation
          - WARNING: HRReport_Equalisation
          - FAILURE: on_failure
    - HRReport_Equalisation:
        do:
          FieldServicesLeaveReporting.HRReport_Equalisation:
            - orgStructure: '${orgStructure}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: HRReport_TOIL
          - WARNING: HRReport_TOIL
          - FAILURE: on_failure
    - HRReport_TOIL:
        do:
          FieldServicesLeaveReporting.HRReport_TOIL:
            - orgStructure: '${orgStructure}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: HRReport_FlexiandLSL
          - WARNING: HRReport_FlexiandLSL
          - FAILURE: on_failure
    - HRReport_FlexiandLSL:
        do:
          FieldServicesLeaveReporting.HRReport_FlexiandLSL:
            - orgStructure: '${orgStructure}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: OrgStructureUpdate
          - WARNING: OrgStructureUpdate
          - FAILURE: on_failure
    - OrgStructureUpdate:
        do:
          FieldServicesLeaveReporting.OrgStructureUpdate:
            - structureFile: '${structureFile}'
            - iteration: '${iteration}'
        navigate:
          - SUCCESS: SUCCESS
          - WARNING: SUCCESS
          - FAILURE: on_failure
  results:
    - FAILURE
    - SUCCESS
    - CUSTOM
extensions:
  graph:
    steps:
      OrgStructureExtract:
        x: 100
        'y': 250
        navigate:
          5d14c60e-12e9-9006-0504-4a97238fa082:
            targetId: 98aef26e-0397-3111-bffe-f2df4c89c68d
            port: WARNING
      CreateExcelFiles:
        x: 400
        'y': 125
      HRReport_AnnualLeave:
        x: 700
        'y': 250
      HRReport_PersonalLeave:
        x: 1000
        'y': 250
      HRReport_Equalisation:
        x: 1300
        'y': 250
      HRReport_TOIL:
        x: 1600
        'y': 250
      HRReport_FlexiandLSL:
        x: 1900
        'y': 250
      OrgStructureUpdate:
        x: 2200
        'y': 250
        navigate:
          5dd35795-2f70-5cc5-b902-9adc9b93f31c:
            targetId: 9ba30930-ee85-aac9-ff06-055fade9b867
            port: SUCCESS
          be910d0c-ce73-d5b7-5b79-e02678f775cb:
            targetId: 9ba30930-ee85-aac9-ff06-055fade9b867
            port: WARNING
    results:
      CUSTOM:
        98aef26e-0397-3111-bffe-f2df4c89c68d:
          x: 400
          'y': 375
      SUCCESS:
        9ba30930-ee85-aac9-ff06-055fade9b867:
          x: 2500
          'y': 250
