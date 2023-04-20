namespace: MitelDownloads
operation:
  name: IndexUpdate
  python_action:
    use_jython: false
    script: "def execute(): \r\n    def write_data_to_excel(workbooklocation,sheetname,columnletter):\r\n        import xlwings as xw\r\n        wb = xw.Book(workbooklocation)\r\n        rowNumber = wb.sheets[sheetname].range(columnletter + str(wb.sheets[sheetname].cells.last_cell.row)).end('up').row + 1\r\n        return rowNumber\r\n    \r\n    from openpyxl import load_workbook\r\n    import requests\r\n    from datetime import datetime\r\n    import time\r\n    import xlwings as xw\r\n    workbookMain = load_workbook(filename=\"C:/temp/MiCR call records.xlsx\",read_only=True)\r\n    sheetMain = workbookMain.active\r\n    \r\n    previousIndex = \"\"\r\n    for x in range(1,442474):\r\n        start_time = time.time()\r\n        start = sheetMain[\"A\"+str(x)].value\r\n        duration = sheetMain[\"B\"+str(x)].value\r\n        direction = sheetMain[\"C\"+str(x)].value\r\n        outside_number = sheetMain[\"F\"+str(x)].value\r\n        extension = sheetMain[\"G\"+str(x)].value\r\n        ref_id = sheetMain[\"I\"+str(x)].value\r\n        \r\n        if start != \"Start\":\r\n            dateOfRecording = start.strftime(\"%Y-%m-%d %H.%M\") #for download location\r\n            dateOfRecording1 = start.strftime(\"%Y-%m-%d %H:%M\") #for excel\r\n            yearOfRecording = start.strftime(\"%Y\")\r\n            folderLoc = start.strftime(\"%Y-%m-%d\")\r\n            indexLoc = start.strftime(\"%Y-%m\")\r\n    \r\n            #update index\r\n            workbookName = \"C:/temp/Mitel/index\" +indexLoc+\".xlsx\"\r\n            if indexLoc != previousIndex:\r\n                wb = xw.Book(workbookName)\r\n                nextRow = write_data_to_excel(workbookName,'Sheet1','A')\r\n                wb.save()\r\n                wb.close()\r\n            else:\r\n                nextRow = nextRow + 1\r\n            workbookIndex = load_workbook(filename=workbookName,read_only=False)                \r\n            sheetIndex = workbookIndex.active\r\n            sheetIndex[\"A\"+str(nextRow)] = dateOfRecording1\r\n            sheetIndex[\"B\"+str(nextRow)] = duration\r\n            sheetIndex[\"C\"+str(nextRow)] = extension\r\n            sheetIndex[\"D\"+str(nextRow)] = outside_number\r\n            sheetIndex[\"E\"+str(nextRow)] = direction\r\n            sheetIndex[\"F\"+str(nextRow)] = extension\r\n            sheetIndex[\"G\"+str(nextRow)] = extension\r\n            sheetIndex[\"H\"+str(nextRow)] = outside_number\r\n            sheetIndex[\"I\"+str(nextRow)] = \"\\\\\"+\"\\\\utilities.etsa.net.au\\\\AppData\\\\MitelExport\\\\Mitel\\\\\"+yearOfRecording+\"\\\\\"+folderLoc+\"\\\\\"+dateOfRecording + \" - \" + ref_id +\".mp3\"\r\n            workbookIndex.save(\"C:/temp/Mitel/index\" +indexLoc+\".xlsx\")\r\n            previousIndex = indexLoc\r\n        end_time = time.time()\r\n        duration = end_time - start_time\r\n        log = open(\"C:/temp/Mitel/logfile.txt\",\"a\")\r\n        log.write(\"row: \" + str(x) + \" total time taken: \" + str(duration) + \",\\n\")\r\n    workbookMain.close(\"C:/temp/MiCR call records.xlsx\")"
  results:
    - SUCCESS