namespace: AEMOSnapshots
operation:
  name: Combine_All_CSV
  inputs:
    - filePath
    - csvlog
    - folderType
  python_action:
    use_jython: false
    script: "def execute(filePath,csvlog, folderType):\n    import os.path\n    import os\n    import pandas as pd\n    import glob\n    \n    direc = os.listdir(filePath)\n    \n    #COMBINE INTO 1 CSV\n    for folder in direc:\n        if folderType in folder:\n            combinedCSVName = folder+\".csv\"\n            folderdirec = filePath+folder+\"/\"\n            items = os.listdir(folderdirec)\n            for csvfile in items:    \n                #COMBINING ALL CSVS INTO 1 FILE\n                os.chdir(folderdirec)\n                extension = \"csv\"\n                all_filenames = [i for i in glob.glob('*.{}'.format(extension))]\n                combined_csv = pd.concat([pd.read_csv(f) for f in all_filenames ])\n                combinedLocation = filePath+combinedCSVName\n                combined_csv.to_csv(combinedLocation, index=False, encoding='utf-8')\n                \n                f = open(csvlog, \"a\")\n                f.write(\"\\n\"+combinedLocation)\n                f.close()\n    \n    #DELETE INDIVIDUAL CSVS           \n    for folder in direc:\n        if folderType in folder:\n            folderdirec = filePath+folder+\"/\"\n            items = os.listdir(folderdirec)\n            for csvfile in items:\n                os.remove(folderdirec+csvfile)\n                \n    return{\"combinedLocation\":combinedLocation}"
  outputs:
    - combinedLocation
  results:
    - SUCCESS
