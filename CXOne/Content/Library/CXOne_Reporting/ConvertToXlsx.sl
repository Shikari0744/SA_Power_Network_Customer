namespace: CXOne_Reporting
operation:
  name: ConvertToXlsx
  inputs:
    - xlsFile
    - file
  python_action:
    use_jython: false
    script: "def execute(xlsFile, file):\n    from xls2xlsx import XLS2XLSX\n    \n    xlsxFile = xlsFile+\"x\"\n    xlsx = file+\"x\"\n    \n    x2x = XLS2XLSX(xlsFile)\n    x2x.to_xlsx(xlsxFile)\n    \n    return{\"xlsxFile\":xlsxFile,\"xlsx\":xlsx}"
  outputs:
    - xlsxFile
    - xlsx
  results:
    - SUCCESS
