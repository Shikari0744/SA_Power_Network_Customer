########################################################################################################################
#!!
#!!#
########################################################################################################################
namespace: GoCanvasUploads
operation:
  name: DownloadPDFs
  inputs:
    - accessToken
    - location
  python_action:
    use_jython: false
    script: "def execute(accessToken,location):\n    import requests\n    import json\n    import base64\n    \n    #downloading from RES: Metering Test Data\n    \n    # get the email\n    url = \"https://graph.microsoft.com/v1.0/users/meteringtestdata@sapowernetworks.com.au/messages?$search=\\\"Meter Test Results\\\"\"\n    payload = {}\n    headers = {\"Authorization\": \"Bearer \" + accessToken}\n    response = requests.get(url, headers=headers, data=payload)    \n    json_data = json.loads(response.text)\n    \n    for x in json_data['value']:\n        subject = x['subject']\n        messageID = x['id']\n        attachments = x['hasAttachments']   \n        break\n    \n    if attachments == False:\n        # update the subject\n        oldsubject = subject.split(\"Test\")\n        newsubject = oldsubject[0] + \"Test UNPROCESSED\" + oldsubject[1]\n\n        url = \"https://graph.microsoft.com/v1.0/users/meteringtestdata@sapowernetworks.com.au/messages/\" + messageID\n        payload = \"{\\r\\n  \\\"subject\\\": \\\"\"+newsubject+\"\\\"\\r\\n }\"\n        headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer ' + accessToken}\n        response2 = requests.request(\"PATCH\", url, headers=headers, data = payload)\n        \n        result = \"No attachments found\"\n        \n    elif response.status_code == 200 and attachments == True:\n        # get the attachments\n        url = 'https://graph.microsoft.com/v1.0/users/svcrpabot@sapowernetworks.com.au/messages/' + messageID + '/attachments'\n        body = {}\n        head = {\"Authorization\": \"Bearer \" + accessToken}\n        response1 = requests.request(\"GET\", url, headers=head, data = body)\n        json_data = json.loads(response1.text.encode('utf8'))\n    \n        #where to save\n        for file in json_data[\"value\"]:\n            imgdata = base64.b64decode(file[\"contentBytes\"])  \n            pdfname = file[\"name\"]\n            if pdfname.find(\".pdf\") > 0:\n                #filename = location + pdfname\n                filename = location + pdfname\n                with open(filename, 'wb') as f:\n                    f.write(imgdata)\n                break   \n\n        if response1.status_code == 200:\n            # update the subject\n            oldsubject = subject.split(\"Test\")\n            newsubject = oldsubject[0] + \"Test PROCESSED\" + oldsubject[1]\n    \n            url = \"https://graph.microsoft.com/v1.0/users/meteringtestdata@sapowernetworks.com.au/messages/\" + messageID\n            payload = \"{\\r\\n  \\\"subject\\\": \\\"\"+newsubject+\"\\\"\\r\\n }\"\n            headers = {'Content-Type': 'application/json','SdkVersion': 'postman-graph/v1.0','Authorization': 'Bearer ' + accessToken}\n            response2 = requests.request(\"PATCH\", url, headers=headers, data = payload)\n            \n            result = \"Attachment downloaded successfully\"\n\n    return{\"result\":result,\"subject\":subject,\"newsubject\":newsubject,\"attachments\":attachments, \"pdfname\":pdfname}"
  outputs:
    - result
    - subject
    - newsubject
    - attachments
    - pdfname
  results:
    - SUCCESS
