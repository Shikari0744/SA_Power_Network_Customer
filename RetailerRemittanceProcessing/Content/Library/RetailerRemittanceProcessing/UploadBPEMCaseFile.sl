namespace: RetailerRemittanceProcessing
operation:
  name: UploadBPEMCaseFile
  inputs:
    - accessToken
    - filePath
  python_action:
    use_jython: false
    script: "def execute(accessToken, filePath): \r\n    import requests\r\n    import os\r\n    \r\n    file = \"BPEM Case File.xlsx\"\r\n    bpemcasefile = filePath+file\r\n    \r\n    url = \"https://graph.microsoft.com/v1.0/drives/b!We-J4UVyOE-27UeuMZYmLMdEdyG2phRCm1ljY56FmwDT47g-QfJ2TZABGsJJ9m2I/root:/Remittance/Automated Remittance Processing/\"+ file +\":/content\"\r\n    body = open(bpemcasefile, 'rb').read()\r\n    head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n    response = requests.put(url, data=body, headers=head)\r\n    \r\n    results = str(response.status_code)\r\n    \r\n    os.remove(bpemcasefile)\r\n\r\n    return{\"results\":results}"
  outputs:
    - results
  results:
    - SUCCESS
