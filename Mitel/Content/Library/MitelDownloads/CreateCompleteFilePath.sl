namespace: MitelDownloads
operation:
  name: CreateCompleteFilePath
  python_action:
    use_jython: false
    script: "def execute(): \n    import os\n    from dateutil import rrule\n    from datetime import datetime\n    \n    year = [\"2021\", \"2020\",\"2019\",\"2018\",\"2017\"]\n\n    for x in year:\n        first = x+\"-01-01\" \n        last = x+\"-12-31\"\n        \n        for dt in rrule.rrule(rrule.DAILY, dtstart=datetime.strptime(first, \"%Y-%m-%d\"),until=datetime.strptime(last, \"%Y-%m-%d\")):\n            date = dt.strftime(\"%Y-%m-%d\")\n            path = \"/temp/Mitel/\"+x+\"/\" + date\n            try:\n                os.makedirs(path)\n            except OSError:\n                result = \"Creation of the directory %s failed\" % path\n            else:\n                result = \"Successfully created the directory %s\" % path"
  outputs:
    - result
  results:
    - SUCCESS
