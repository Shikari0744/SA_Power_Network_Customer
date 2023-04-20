namespace: AEMOSnapshotsToOracle
operation:
  name: ParseXMLtoCSV
  inputs:
    - downloadlog
    - xmlFile
    - folderName
    - folderdirec
  python_action:
    use_jython: false
    script: "def execute(downloadlog,xmlFile,folderName):\n    import xmltodict\n    import pandas as pd\n    import os\n    \n    if xmlFile != \"csv exists\":\n        csvfile = xmlFile.replace(\".xml\", \".csv\")\n        with open(xmlFile, 'r') as f:\n            data = f.read() \n        x = xmltodict.parse(data)\n        a = x['ase:aseXML']['Transactions']['Transaction']['ReportResponse']['ReportResults']['ReplicationBlock']['Row']\n        #Get header parts\n        b = x['ase:aseXML']['Header']\n        #add bits incase nested dictionary to extract those values then add to excel on seperate sheet at bottom\n        c = x['ase:aseXML']['Transactions']['Transaction']['ReportResponse']['ReportParameters']\n        listofdict = []\n        for i in a:\n            dicttest = {}\n            for y in i:\n                dicttest[y] = i[y]\n            listofdict.append(dicttest)\n        df = pd.DataFrame(listofdict)\n        df.to_csv(csvfile)\n        #delete the xml\n        os.remove(xmlFile)\n        f = open(downloadlog, \"a\")\n        f.write(\"\\n\"+csvfile)\n        f.close()        \n        completed = csvfile\n    else:\n        completed = \"csv already existed\"\n    \n    return{\"completed\":completed}"
  outputs:
    - completed
  results:
    - SUCCESS
