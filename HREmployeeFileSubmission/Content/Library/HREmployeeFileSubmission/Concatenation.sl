########################################################################################################################
#!!
#! @result FAILURE: if new file doesn't exist
#!!#
########################################################################################################################
namespace: HREmployeeFileSubmission
operation:
  name: Concatenation
  inputs:
    - filepath
    - subject
  python_action:
    use_jython: false
    script: "def execute(filepath, subject):\n    import os\n    from os import listdir\n    from os.path import isfile, join\n    from PyPDF2 import PdfWriter\n    import time\n    \n    onlyfiles = [f for f in listdir(filepath) if isfile(join(filepath, f))]\n    \n    filescombined = 0 \n\n    merger = PdfWriter()\n    \n    for file in onlyfiles:\n        if subject in file:\n            merger.append(filepath+file)\n            filescombined += 1\n    \n    \n    combinedFile = filepath+subject+\" Combined.pdf\"\n    merger.write(combinedFile)\n    merger.close()\n    \n    time.sleep(3)\n    \n    if os.path.exists(combinedFile):\n        result = \"success\"\n    else:\n        result = \"error occurred\"\n    \n    return{\"combinedFile\":combinedFile,\"result\":result,\"filescombined\":filescombined}"
  outputs:
    - combinedFile
    - result
    - filescombined
  results:
    - FAILURE: '${ result != "success"}'
    - SUCCESS
