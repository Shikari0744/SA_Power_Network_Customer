namespace: GoCanvasUploads
operation:
  name: MoveCompletedPDF
  inputs:
    - filePath
    - fileName
  python_action:
    use_jython: false
    script: "def execute(filePath, fileName):\n    from os import listdir\n    from os.path import isfile, join\n    import os\n    \n    os.replace(filePath+fileName,filePath+\"Completed/\"+fileName)"
  results:
    - SUCCESS
