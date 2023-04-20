namespace: EnervenMeterTesting
operation:
  name: ConvertSampleLotsToTables
  inputs:
    - filePath
  python_action:
    use_jython: false
    script: "def execute(filePath):\n    from openpyxl.worksheet.table import Table\n    from openpyxl.utils import get_column_letter\n    from openpyxl import load_workbook\n    import os\n    \n    arr = os.listdir(filePath)\n    \n    for file in arr:\n        if \"xlsx\" in file:\n            mainName = filePath + file \n            wbMain = load_workbook(mainName, read_only=False)\n            sheet = wbMain.active\n    \n            if len(sheet.tables) < 1:\n                start = sheet[\"A14\"].value\n                if sheet[\"A14\"].value == \"Suburb\":\n                    table = Table(displayName=\"Table1\", ref=\"A14:\" + get_column_letter(sheet.max_column) + str(sheet.max_row))\n                elif sheet[\"A17\"].value == \"Suburb\":\n                    table = Table(displayName=\"Table1\", ref=\"A17:\" + get_column_letter(sheet.max_column) + str(sheet.max_row))\n    \n                sheet.add_table(table)\n            wbMain.save(mainName)\n            wbMain.close()"
  results:
    - SUCCESS
