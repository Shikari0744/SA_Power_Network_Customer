namespace: FieldServicesConsolidatedLeaveReporting
flow:
  name: LoopLeaveExtractions
  inputs:
    - processDate
    - processMonth
    - structureFile
    - reportFolder
    - iteration
  workflow:
    - ConsolOrgStructureExtract:
        do:
          FieldServicesConsolidatedLeaveReporting.ConsolOrgStructureExtract:
            - structureFile: '${structureFile}'
            - iteration: '${iteration}'
        publish:
          - orgStructure
          - orgStructureSelection
          - orgStructureValue
          - reportName
        navigate:
          - SUCCESS: CreateExcelFiles
          - WARNING: CreateExcelFiles
          - FAILURE: on_failure
    - CreateExcelFiles:
        do:
          FieldServicesConsolidatedLeaveReporting.CreateExcelFiles:
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
          FieldServicesConsolidatedLeaveReporting.HRReport_AnnualLeave:
            - orgStructure: '${orgStructure}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: HRReport_PersonalLeave
          - WARNING: HRReport_PersonalLeave
          - FAILURE: on_failure
    - HRReport_PersonalLeave:
        do:
          FieldServicesConsolidatedLeaveReporting.HRReport_PersonalLeave:
            - orgStructureValue: '${orgStructureValue}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: HRReport_Equalisation
          - WARNING: HRReport_Equalisation
          - FAILURE: on_failure
    - HRReport_Equalisation:
        do:
          FieldServicesConsolidatedLeaveReporting.HRReport_Equalisation:
            - orgStructure: '${orgStructure}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: HRReport_FlexiandLSL
          - WARNING: HRReport_FlexiandLSL
          - FAILURE: on_failure
    - HRReport_FlexiandLSL:
        do:
          FieldServicesConsolidatedLeaveReporting.HRReport_FlexiandLSL:
            - orgStructure: '${orgStructure}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: HRReport_TOIL
          - WARNING: HRReport_TOIL
          - FAILURE: on_failure
    - HRReport_TOIL:
        do:
          FieldServicesConsolidatedLeaveReporting.HRReport_TOIL:
            - orgStructure: '${orgStructure}'
            - filepath: '${filePath}'
            - orgStructureSelection: '${orgStructureSelection}'
        navigate:
          - SUCCESS: ConsolOrgStructureUpdate
          - WARNING: ConsolOrgStructureUpdate
          - FAILURE: on_failure
    - ConsolOrgStructureUpdate:
        do:
          FieldServicesConsolidatedLeaveReporting.ConsolOrgStructureUpdate:
            - structureFile: '${structureFile}'
            - iteration: '${iteration}'
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
      ConsolOrgStructureExtract:
        x: 100
        'y': 150
      CreateExcelFiles:
        x: 400
        'y': 150
      HRReport_AnnualLeave:
        x: 700
        'y': 150
      HRReport_PersonalLeave:
        x: 1000
        'y': 150
      HRReport_Equalisation:
        x: 1300
        'y': 150
      HRReport_FlexiandLSL:
        x: 1600
        'y': 150
      HRReport_TOIL:
        x: 1900
        'y': 150
      ConsolOrgStructureUpdate:
        x: 2200
        'y': 150
        navigate:
          e5f7b353-aeca-d8b4-16b6-235694487d06:
            targetId: 66dac8d6-595b-22f4-eff8-af0610bac9b7
            port: SUCCESS
          2ae7424c-d198-5428-c44f-5b91f366838e:
            targetId: 66dac8d6-595b-22f4-eff8-af0610bac9b7
            port: WARNING
    results:
      SUCCESS:
        66dac8d6-595b-22f4-eff8-af0610bac9b7:
          x: 2500
          'y': 150
