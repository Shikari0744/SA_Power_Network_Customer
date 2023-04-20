namespace: EnablonReports
operation:
  name: ClearReports
  inputs:
    - reportLocation
    - reportType
  python_action:
    use_jython: false
    script: "def execute(reportLocation, reportType):\n    from openpyxl import load_workbook\n    from openpyxl.styles import PatternFill\n    \n    if reportType == \"Field Observations\":\n        formattedReports = [\"Electrical Field Services Combined Field Observations Report.xlsx\",\"Metro Field Services Combined Field Observations Report.xlsx\",\"Metro Ops Field Services Combined Field Observations Report.xlsx\",\"Regional Field Services Combined Field Observations Report.xlsx\"]\n    elif reportType == \"Workplace Inspections\":\n        formattedReports = [\"Electrical Field Services Combined Workplace Inspections Report.xlsx\",\"Metro Field Services Combined Workplace Inspections Report.xlsx\",\"Metro Ops Field Services Combined Workplace Inspections Report.xlsx\",\"Regional Field Services Combined Workplace Inspections Report.xlsx\"]\n    \n    for formattedReportName in formattedReports:\n        report = reportLocation + formattedReportName\n        \n        #open the formatted report and get all sheets\n        formattedWorkbook = load_workbook(filename=report,read_only=False)\n        combinedWorksheet = formattedWorkbook[\"Field Services Combined Workpla\"]\n        combinedRowCount = combinedWorksheet.max_row + 1\n        combinedStartingRow = 18\n        \n        getSheetNames = formattedWorkbook.sheetnames\n        formattedSheet1 = formattedWorkbook[getSheetNames[2]]\n        formattedSheet1Count = formattedSheet1.max_row + 1\n        formattedStartingRow = 2\n        \n        if len(formattedWorkbook.sheetnames) == 4:\n            formattedSheet2 = formattedWorkbook[getSheetNames[3]]\n            formattedSheet2Count = formattedSheet2.max_row + 1\n        \n        #clear old values\n        for row in combinedWorksheet['A18:J'+str(combinedRowCount)]:\n            for cell in row:\n                cell.value = None\n                cell.fill = PatternFill(fill_type=None)\n        formattedWorkbook.save(report)\n        \n        for row in formattedSheet1['A2:J'+str(formattedSheet1Count)]:\n            for cell in row:\n                cell.value = None\n                cell.fill = PatternFill(fill_type=None)\n        formattedWorkbook.save(report)\n        \n        if len(formattedWorkbook.sheetnames) == 4:\n            for row in formattedSheet2['A2:J'+str(formattedSheet2Count)]:\n                for cell in row:\n                    cell.value = None\n                    cell.fill = PatternFill(fill_type=None)\n            formattedWorkbook.save(report)\n        formattedWorkbook.close()"
  results:
    - SUCCESS
