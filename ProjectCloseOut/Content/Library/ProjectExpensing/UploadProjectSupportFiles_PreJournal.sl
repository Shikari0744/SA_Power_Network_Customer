namespace: ProjectExpensing
operation:
  name: UploadProjectSupportFiles_PreJournal
  inputs:
    - accessToken
    - filePath
    - supportFile
    - hoursJournal
    - costsJournal
  python_action:
    use_jython: false
    script: "def execute(accessToken, filePath, supportFile, hoursJournal, costsJournal): \r\n    import requests\r\n    import os.path\r\n    import urllib.parse\r\n    import datetime\r\n    import shutil\r\n    \r\n    mytime = datetime.datetime.now()\r\n    currentYear = mytime.strftime(\"%Y\")\r\n    currentMonth = mytime.strftime(\"%Y %B\")   \r\n    currentDate = mytime.strftime(\"%d-%m-%Y\")         \r\n\r\n    uploadResults = \"\"\r\n    \r\n    #TO UPLOAD FILES\r\n    files = [supportFile,hoursJournal,costsJournal]\r\n    \r\n    for file in files:\r\n        #CHECK SIZE OF FILE\r\n        file_path = filePath+file\r\n        fileSize = os.path.getsize(file_path)\r\n        #IF FILE IS GREATER THAN 4MB\r\n        if fileSize > 4000000:\r\n            headers={'Authorization': 'Bearer ' + accessToken}\r\n            result = requests.get(\"https://graph.microsoft.com/v1.0/drives/b!dTrXQn_yX0KjyH_UWTheGsdEdyG2phRCm1ljY56FmwDT47g-QfJ2TZABGsJJ9m2I/root:/General/Project%20Expensing\", headers=headers)\r\n            result.raise_for_status()\r\n            folder_info = result.json()\r\n            folder_id = folder_info['id']\r\n            file_url = urllib.parse.quote(file)\r\n            result = requests.post(f\"https://graph.microsoft.com/v1.0/drives/b!dTrXQn_yX0KjyH_UWTheGsdEdyG2phRCm1ljY56FmwDT47g-QfJ2TZABGsJJ9m2I/items/01GZWJEETAH55ZFZ6WAREZPT5KRVNZF4JG:/{file_url}:/createUploadSession\",headers=headers,json={'@microsoft.graphconflictBehavior':'replace','description':'A large test file','fileSystemInfo':{'@odata.type': 'microsoft.graph.fileSystemInfo'}, 'name': file})\r\n            if result.status_code >= 200 and result.status_code < 300:\r\n                #uploadResults = \"Successful\"   \r\n                uploadResults = uploadResults + \" \" + file + \" \" + str(result.status_code)\r\n                result.raise_for_status()\r\n                upload_session = result.json()\r\n                upload_url = upload_session['uploadUrl']\r\n                st = os.stat(file_path)\r\n                size = st.st_size\r\n                CHUNK_SIZE = 10485760\r\n                chunks = int(size / CHUNK_SIZE) + 1 if size % CHUNK_SIZE > 0 else 0\r\n                with open(file_path, 'rb') as fd:\r\n                    start = 0\r\n                    for chunk_num in range(chunks):\r\n                        chunk = fd.read(CHUNK_SIZE)\r\n                        bytes_read = len(chunk)\r\n                        upload_range = f'bytes {start}-{start + bytes_read - 1}/{size}'\r\n                        #print(f'chunk: {chunk_num} bytes read: {bytes_read} upload range: {upload_range}')\r\n                        result = requests.put(upload_url,headers={'Content-Length': str(bytes_read),'Content-Range': upload_range},data=chunk)\r\n                        if result.status_code >= 200 and result.status_code < 300:\r\n                            #uploadResults = \"Successful\"    \r\n                            uploadResults = uploadResults + \" \" + str(result.status_code)\r\n                            result.raise_for_status()\r\n                            start += bytes_read\r\n        #IF FILE IS LESS THAN 4MB\r\n        else:\r\n            # read file into binary\r\n            body = open(file_path, 'rb').read()\r\n            url = \"https://graph.microsoft.com/v1.0/drives/b!dTrXQn_yX0KjyH_UWTheGsdEdyG2phRCm1ljY56FmwDT47g-QfJ2TZABGsJJ9m2I/root:/General/Project Expensing/\"+ file +\":/content\"\r\n            head = {\"Authorization\": \"Bearer \" + accessToken, \"Content-Type\": \"application/binary\"}\r\n            response = requests.put(url, data=body, headers=head)\r\n            if response.status_code >= 200 and response.status_code < 300:\r\n                #uploadResults = \"Successful\"\r\n                uploadResults = uploadResults + \" \" + file + \" \" + str(response.status_code)\r\n\t            \r\n    return{\"uploadResults\":uploadResults}"
  outputs:
    - uploadResults
  results:
    - FAILURE: '${uploadResults == ""}'
    - SUCCESS
