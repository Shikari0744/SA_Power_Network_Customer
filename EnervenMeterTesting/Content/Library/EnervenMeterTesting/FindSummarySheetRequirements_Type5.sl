namespace: EnervenMeterTesting
operation:
  name: FindSummarySheetRequirements_Type5
  inputs:
    - mypath: 'C:/temp/Enerven Meter/Type 6/'
  python_action:
    use_jython: false
    script: "def execute(mypath):\n    from os import listdir\n    from os.path import isfile, join\n    from openpyxl import load_workbook  \n    \n    onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]\n    \n    summarySheetDict = {\"Sample Lot Number\":\"ID\"}\n    \n    for files in onlyfiles:\n        workbook = load_workbook(filename=mypath+files,read_only=True)\n        worksheet = workbook.active\n        rowCount = worksheet.max_row + 1\n        \n        if \"Inspection\" in files:\n            for row in range(1,rowCount):\n                summarysheetcreated = worksheet[\"AX\"+str(row)].value\n                if summarysheetcreated == None:\n                    sampleLot = \"Meter Inspection Attachments\"\n                    spID = worksheet[\"AV\"+str(row)].value\n                    spID = str(spID)\n                    if sampleLot not in summarySheetDict:\n                        summarySheetDict[sampleLot] = spID\n                    else:\n                        dictID = summarySheetDict.get(sampleLot)\n                        if spID not in dictID:\n                            dictID = dictID + \",\" + spID\n                            summarySheetDict[sampleLot] = dictID        \n        else:\n            for row in range(1,rowCount):\n                summarysheetcreated = worksheet[\"CF\"+str(row)].value\n                if summarysheetcreated == None:\n                    sampleLot = worksheet[\"I\"+str(row)].value\n                    sampleLot = \"Sample \"+ str(sampleLot) + \" Attachments\"\n                    spID = worksheet[\"CD\"+str(row)].value\n                    spID = str(spID)\n                    if sampleLot not in summarySheetDict:\n                        summarySheetDict[sampleLot] = spID\n                    else:\n                        dictID = summarySheetDict.get(sampleLot)\n                        if spID not in dictID:\n                            dictID = dictID + \",\" + spID\n                            summarySheetDict[sampleLot] = dictID\n        workbook.close()\n    \n    return{\"summarySheetDict\":summarySheetDict}"
  outputs:
    - summarySheetDict
  results:
    - SUCCESS
