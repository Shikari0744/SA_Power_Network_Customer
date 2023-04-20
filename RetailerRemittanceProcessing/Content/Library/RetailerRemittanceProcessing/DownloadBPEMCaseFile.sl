namespace: RetailerRemittanceProcessing
operation:
  name: DownloadBPEMCaseFile
  inputs:
    - accessToken
    - filePath
  python_action:
    use_jython: false
    script: "def execute(accessToken, filePath): \r\n    import os \r\n    import requests\r\n\r\n    file = \"BPEM Case File.xlsx\"\r\n    bpemcasefile = filePath+file\r\n\r\n    if os.path.exists(bpemcasefile):\r\n        os.remove(bpemcasefile)\r\n    \r\n    \r\n    url = \"https://graph.microsoft.com/v1.0/drives/b!We-J4UVyOE-27UeuMZYmLMdEdyG2phRCm1ljY56FmwDT47g-QfJ2TZABGsJJ9m2I/root:/Remittance/Automated Remittance Processing/\"+ file +\":/content\"\r\n    body = None\r\n    head = {\"Authorization\": \"Bearer \" + accessToken}\r\n    response = requests.get(url, data=body, headers=head)\r\n    \r\n    results = str(response.status_code)\r\n    \r\n    with open(bpemcasefile, 'wb') as f:\r\n        f.write(response.content)\r\n    \r\n    return{\"results\":results,\"bpemcasefile\":bpemcasefile}"
  outputs:
    - bpemcasefile
    - result
  results:
    - SUCCESS
