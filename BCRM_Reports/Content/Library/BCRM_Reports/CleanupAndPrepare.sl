########################################################################################################################
#!!
#! @description: This task is to cleanup the excel working folder and get the folder name of the previous days formatted reports folder to be used to compare at later stage
#!!#
########################################################################################################################
namespace: BCRM_Reports
operation:
  name: CleanupAndPrepare
  inputs:
  - location
  sequential_action:
    gav: com.microfocus.seq:BCRM_Reports.CleanupAndPrepare:1.0.0
    skills:
    - Web
    settings:
      windows:
        active: true
      web:
        active: false
        address: http://advantageonlineshopping.com
        browser: IE
        close_on_exit: true
    steps:
    - step:
        id: '1'
        action: Script
        object_path: '''get input values'
    - step:
        id: '2'
        action: Script
        object_path: parentFolder = Parameter("location")
    - step:
        id: '3'
        action: Script
        object_path: '''Delete files from the excel working folder'
    - step:
        id: '4'
        action: Script
        object_path: Const DeleteReadOnly = TRUE
    - step:
        id: '5'
        action: Script
        object_path: Set oFSO = CreateObject("Scripting.FileSystemObject")
    - step:
        id: '6'
        action: Script
        object_path: If Not oFSO.FolderExists(parentFolder) Then
    - step:
        id: '7'
        object_path: oFSO
        action: CreateFolder(parentFolder)
    - step:
        id: '8'
        action: Script
        object_path: End If
    - step:
        id: '9'
        action: Script
        object_path: '''****************************************************************************'
    - step:
        id: '10'
        action: Script
        object_path: xmlFolder = parentFolder & "\XML Files\"
    - step:
        id: '11'
        action: Script
        object_path: Parameter("xmlFolder") = xmlFolder
    - step:
        id: '12'
        action: Script
        object_path: excelFolder = parentFolder & "\Excel Files\"
    - step:
        id: '13'
        action: Script
        object_path: Parameter("excelFolder") = excelFolder
    - step:
        id: '14'
        action: Script
        object_path: formattedFolder = parentFolder & "\Formatted Files\"
    - step:
        id: '15'
        action: Script
        object_path: Parameter("formattedFiles")  = formattedFolder
    - step:
        id: '16'
        action: Script
        object_path: oldReportsFolder = parentFolder & "\Old Reports\"
    - step:
        id: '17'
        action: Script
        object_path: Parameter("oldReports") = oldReportsFolder
    - step:
        id: '18'
        action: Script
        object_path: '''****************************************************************************'
    - step:
        id: '19'
        action: Script
        object_path: '''xml folder check'
    - step:
        id: '20'
        action: Script
        object_path: If Not oFSO.FolderExists(parentFolder & "\XML Files") Then
    - step:
        id: '21'
        object_path: oFSO
        action: CreateFolder(parentFolder
        args: '& "\XML Files")'
    - step:
        id: '22'
        action: Script
        object_path: End If
    - step:
        id: '23'
        action: Script
        object_path: '''excel folder check'
    - step:
        id: '24'
        action: Script
        object_path: If Not oFSO.FolderExists(parentFolder & "\Excel Files") Then
    - step:
        id: '25'
        object_path: oFSO
        action: CreateFolder(parentFolder
        args: '& "\Excel Files")'
    - step:
        id: '26'
        action: Script
        object_path: End If
    - step:
        id: '27'
        action: Script
        object_path: '''format folder check'
    - step:
        id: '28'
        action: Script
        object_path: If Not oFSO.FolderExists(parentFolder & "\Formatted Files") Then
    - step:
        id: '29'
        object_path: oFSO
        action: CreateFolder(parentFolder
        args: '& "\Formatted Files")'
    - step:
        id: '30'
        action: Script
        object_path: End If
    - step:
        id: '31'
        action: Script
        object_path: '''old folder check'
    - step:
        id: '32'
        action: Script
        object_path: If Not oFSO.FolderExists(parentFolder & "\Old Reports") Then
    - step:
        id: '33'
        object_path: oFSO
        action: CreateFolder(parentFolder
        args: '& "\Old Reports")'
    - step:
        id: '34'
        action: Script
        object_path: End If
    - step:
        id: '35'
        action: Script
        object_path: '''****************************************************************************'
    - step:
        id: '36'
        action: Script
        object_path: '''clean up xml'
    - step:
        id: '37'
        action: Script
        object_path: Set xmlFolder = oFSO.GetFolder(xmlFolder)
    - step:
        id: '38'
        action: Script
        object_path: If xmlFolder.Files.Count <> 0 Then
    - step:
        id: '39'
        object_path: oFSO
        action: DeleteFile(xmlFolder&"*"),
        args: DeleteReadOnly
    - step:
        id: '40'
        action: Script
        object_path: End If
    - step:
        id: '41'
        action: Script
        object_path: Set xmlFolder = nothing
    - step:
        id: '42'
        action: Script
        object_path: '''clean up xlsx'
    - step:
        id: '43'
        action: Script
        object_path: Set xlsfolder = oFSO.GetFolder(excelFolder)
    - step:
        id: '44'
        action: Script
        object_path: If xlsfolder.Files.Count <> 0 Then
    - step:
        id: '45'
        object_path: oFSO
        action: DeleteFile(excelFolder&"*"),
        args: DeleteReadOnly
    - step:
        id: '46'
        action: Script
        object_path: End If
    - step:
        id: '47'
        action: Script
        object_path: Set xlsfolder = nothing
    - step:
        id: '48'
        action: Script
        object_path: '''clean up formatted'
    - step:
        id: '49'
        action: Script
        object_path: Set fmtFolder = oFSO.GetFolder(formattedFolder)
    - step:
        id: '50'
        action: Script
        object_path: If fmtFolder.Files.Count <> 0 Then
    - step:
        id: '51'
        object_path: oFSO
        action: DeleteFile(formattedFolder&"*"),
        args: DeleteReadOnly
    - step:
        id: '52'
        action: Script
        object_path: End If
    - step:
        id: '53'
        action: Script
        object_path: Set fmtFolder = nothing
    - step:
        id: '54'
        action: Script
        object_path: '''clean up old'
    - step:
        id: '55'
        action: Script
        object_path: Set oldrptfolder = oFSO.GetFolder(oldReportsFolder)
    - step:
        id: '56'
        action: Script
        object_path: If oldrptfolder.Files.Count <> 0 Then
    - step:
        id: '57'
        object_path: oFSO
        action: DeleteFile(oldReportsFolder&"*"),
        args: DeleteReadOnly
    - step:
        id: '58'
        action: Script
        object_path: End If
    - step:
        id: '59'
        action: Script
        object_path: Set oldrptfolder = nothing
    - step:
        id: '60'
        action: Script
        object_path: '''****************************************************************************'
    - step:
        id: '61'
        action: Script
        object_path: '''''get the last updated folder name as the previous days formatted
          folder'
    - step:
        id: '62'
        action: Script
        object_path: '''Set objFolder = oFSO.GetFolder(formattedFolder)'
    - step:
        id: '63'
        action: Script
        object_path: '''Set colFolders = objFolder.SubFolders'
    - step:
        id: '64'
        action: Script
        object_path: '''dDate = Now - 365'
    - step:
        id: '65'
        action: Script
        object_path: '''For Each objFolder in colFolders'
    - step:
        id: '66'
        action: Script
        object_path: "'\tIf objFolder.DateCreated > dDate Then"
    - step:
        id: '67'
        action: Script
        object_path: "'\t\tdDate = objFolder.DateCreated"
    - step:
        id: '68'
        action: Script
        object_path: "'\t\tstrNewestFolder = objFolder"
    - step:
        id: '69'
        action: Script
        object_path: "'\tEnd If"
    - step:
        id: '70'
        action: Script
        object_path: '''Next'
    - step:
        id: '71'
        action: Script
        object_path: '''write previous days folder to output'
    - step:
        id: '72'
        action: Script
        object_path: '''Parameter("oldReports") = oldReportsFolder'
    - step:
        id: '73'
        action: Script
        object_path: '''Parameter("xmlFolder") = xmlFolder'
    - step:
        id: '74'
        action: Script
        object_path: '''Parameter("excelFolder") = excelFolder'
    - step:
        id: '75'
        action: Script
        object_path: '''Parameter("formattedFiles")  = formattedFolder'
    - step:
        id: '76'
        action: Script
        object_path: Set oFSO = Nothing
    - step:
        id: '77'
        action: Script
        object_path: Set objFolder = Nothing
    - step:
        id: '78'
        action: Script
        object_path: Set colFolders = Nothing
    - step:
        id: '79'
        action: Script
        object_path: strNewestFolder = empty
    - step:
        id: '80'
        action: Script
        object_path: oldReportsFolder = empty
    - step:
        id: '81'
        action: Script
        object_path: xmlFolder = empty
    - step:
        id: '82'
        action: Script
        object_path: excelFolder = empty
    - step:
        id: '83'
        action: Script
        object_path: formattedFiles = empty
    - step:
        id: '84'
        action: Script
        object_path: ExitTest
  outputs:
  - oldReports:
      robot: true
      value: ${oldReports}
  - xmlFolder:
      robot: true
      value: ${xmlFolder}
  - excelFolder:
      robot: true
      value: ${excelFolder}
  - formattedFiles:
      robot: true
      value: ${formattedFiles}
  - return_result: ${return_result}
  - error_message: ${error_message}
  results:
  - SUCCESS
  - WARNING
  - FAILURE
object_repository:
  objects: []
  check_points_and_outputs: []
  parameters: []
