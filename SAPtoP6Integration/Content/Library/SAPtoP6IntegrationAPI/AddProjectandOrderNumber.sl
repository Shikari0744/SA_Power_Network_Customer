namespace: SAPtoP6IntegrationAPI
operation:
  name: AddProjectandOrderNumber
  inputs:
    - FilePath
    - ActualsActivitiesFileName
    - ActualsResourcesFileNameUpdated
  python_action:
    use_jython: false
    script: "def execute(FilePath,ActualsActivitiesFileName,ActualsResourcesFileNameUpdated):\n    import pandas as pd\n    import os\n    \n    if os.path.exists(FilePath+ActualsResourcesFileNameUpdated):\n        # Open the source spreadsheet and select the sheet\n        src_df = pd.read_excel(FilePath+ActualsResourcesFileNameUpdated, sheet_name=\"Sheet1\")\n        \n        # Open the destination spreadsheet and select the sheet\n        dst_df = pd.read_excel(FilePath+ActualsActivitiesFileName, sheet_name=\"Sheet1\")\n        \n        # Iterate through the rows of the source sheet\n        for index, row in src_df.iterrows():\n            cell_value = row[\"ActivityID\"]  # Get the value in column A of the current row\n            match_row = dst_df.loc[dst_df[\"ActivityID\"] == cell_value]  # Find the row in the destination sheet that matches the value\n            if not match_row.empty:\n                # Get the values in column E and column G of the matching row\n                match_e = match_row.iloc[0][\"FSOrderNumber\"]\n                match_g = match_row.iloc[0][\"ProjectName\"]\n                src_df.at[index, \"FSOrderNumber\"] = match_e  # Update the value in column E of the corresponding row of the source sheet\n                src_df.at[index, \"ProjectName\"] = match_g  # Update the value in column G of the corresponding row of the source sheet\n        \n        # Save the changes to the source spreadsheet\n        writer = pd.ExcelWriter(FilePath+ActualsResourcesFileNameUpdated, engine='xlsxwriter')\n        src_df.to_excel(writer, sheet_name=\"Sheet1\", index=False)\n        writer.save()"
  results:
    - SUCCESS
