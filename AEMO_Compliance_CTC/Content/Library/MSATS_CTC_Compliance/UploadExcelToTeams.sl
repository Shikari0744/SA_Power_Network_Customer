namespace: MSATS_CTC_Compliance
operation:
  name: UploadExcelToTeams
  inputs:
    - api_user
    - api_pass:
        sensitive: true
    - new_file
    - accessToken
  python_action:
    use_jython: false
    script: "#for teams\ndef execute(api_user, api_pass,new_file,accessToken): \n    import requests\n    import os.path\n    import urllib.parse\n    import os\n    from os import path\n    from msal import PublicClientApplication\n    from os import listdir\n    import datetime\n    import shutil\n\timport datetime\n\n    now = datetime.datetime.now()\n\tnow = now.strftime(\"%d/%m/%Y %H:%M:%S\")\n    f = open(\"C:/Users/svcrpabot/OneDrive - SA Power Networks/MSATS CTC/Python API results.txt\", \"a\")\n    f.write(\"\\n\"+now)\n    f.write(\"\\nUpload Excel to Teams\")\n    f.close()      \n\n    filePath = \"C:\\Users\\svcrpabot\\OneDrive - SA Power Networks\\CTC_Compliance\\\"+new_file\n    now = str(datetime.datetime.now())[:19]\n    today, y = now.split(\" \")        \n    \n    # read file into binary\n    body = open(filePath, 'rb').read()\n    url = 'https://graph.microsoft.com/v1.0/drives/b!GeKTqWj7AUSK5qB7N7Gq5pHuj9-5tU9AplDALI4Y-yr80MoHEujeT5awhjy6CLvy/root:/General/Enablon%20Reports/CTC Compliance Updates '+ today + '.xlsx:/content'\n    head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\n    response = requests.put(url, data=body, headers=head)\n    \n    f = open(\"C:/Users/svcrpabot/OneDrive - SA Power Networks/MSATS CTC/Python API results.txt\", \"a\")\n    f.write(\"\\nUploading file\")\n    f.write(\"\\n\"+str(response))\n    f.write(\"\\n\"+response.text)\n    f.close()      \n    \n    return{\"response\":response}"
  outputs:
    - response
  results:
    - SUCCESS
