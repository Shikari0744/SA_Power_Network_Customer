namespace: ITAzureChargeBack
operation:
  name: getActiveProjects
  inputs:
    - filePath
  python_action:
    use_jython: false
    script: "def execute(filePath):\n    import pandas as pd\n    df = pd.read_excel(filePath, sheet_name=\"Configuration\")\n    df = df[df.Active == 'Yes']\n    activeProjects = \"\"\n    sapCode = \"\"\n    firstName = \"\"\n    lastName = \"\"\n    email = \"\"\n    i = 0\n    loopCount = \"\"\n    for x in df.index:\n        completed = df[\"Completed\"][x]\n        if completed != \"Yes\":        \n            if activeProjects == \"\":\n                activeProjects= df[\"Project Name\"][x]\n                sapCode= str(df[\"SAP CODE\"][x])\n                firstName= df[\"First Name\"][x]\n                lastName= df[\"Last name\"][x]\n                email= df[\"Email\"][x]\n                loopCount = str(i)\n            else:\n                activeProjects = activeProjects + \", \" + df[\"Project Name\"][x]\n                sapCode = sapCode + \", \" + str(df[\"SAP CODE\"][x])\n                firstName = firstName + \", \" + df[\"First Name\"][x]\n                lastName = lastName + \", \" + df[\"Last name\"][x]\n                email = email + \", \" + df[\"Email\"][x]\n                loopCount = loopCount + \",\" + str(i)\n            i = i + 1\n    return{'activeProjects':activeProjects, 'sapCode':sapCode, 'firstName':firstName, 'lastName':lastName, 'email':email, 'loopCount':loopCount}"
  outputs:
    - activeProjects
    - sapCode
    - firstName
    - lastName
    - email
    - loopCount
  results:
    - SUCCESS
