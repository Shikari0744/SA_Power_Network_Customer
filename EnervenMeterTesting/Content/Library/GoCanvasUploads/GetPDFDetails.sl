namespace: GoCanvasUploads
operation:
  name: GetPDFDetails
  inputs:
    - filePath
  python_action:
    use_jython: false
    script: "def execute(filePath):\n    from os import listdir\n    from os.path import isfile, join\n    \n    onlyfiles = [f for f in listdir(filePath) if isfile(join(filePath, f))]\n    \n    for file in onlyfiles:\n        pdfName = file\n        break\n    \n    return{\"pdfName\":pdfName}"
  outputs:
    - pdfName
  results:
    - SUCCESS
