namespace: ProjectExpensing
operation:
  name: CreateFolder
  python_action:
    use_jython: false
    script: "def execute():\n    import os\n    import datetime\n    \n    mytime = datetime.datetime.now()\n    currentMonth = mytime.strftime(\"%Y %B\")   \n    currentDate = mytime.strftime(\"%d-%m-%Y\")"
  results:
    - SUCCESS
