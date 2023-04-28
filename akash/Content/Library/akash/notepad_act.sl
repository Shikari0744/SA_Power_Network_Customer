namespace: akash
operation:
  name: notepad_act
  sequential_action:
    gav: 'com.microfocus.seq:akash.notepad_act:1.0.0'
    skills:
      - .NET
      - ActiveX
      - Delphi
      - Flex
      - Java
      - Oracle
      - PeopleSoft
      - PowerBuilder
      - Qt
      - SAP
      - SAP NWBC Desktop
      - SAPUI5
      - SAPWDJ
      - SAPWebExt
      - Stingray
      - Terminal Emulators
      - UI Automation
      - UIA Pro
      - Visual Basic
      - VisualAge SmallTalk
      - Web
      - WPF
      - Silverlight
    settings:
      sap:
        active: false
        auto_log_on: false
        close_on_exit: false
        ignore_existing_sessions: false
        remember_password: false
      windows:
        active: true
        apps:
          app_1:
            args: ''
            directory: ''
            include_child_processes: true
            launch_application: true
            path: "C:\\Program Files\\Notepad++\\notepad++.exe"
      terminal_settings:
        active: false
      web:
        active: false
        close_on_exit: false
    steps:
      - step:
          id: '1'
          object_path: 'Window("Notepad++ [Administrator]").WinObject("Notepad++")'
          action: Click
          default_args: '269,222'
          snapshot: ".\\Snapshots\\ssf1.png"
          highlight_id: '657504'
      - step:
          id: '2'
          object_path: 'Window("Notepad++ [Administrator]").WinObject("Notepad++")'
          action: Type
          default_args: '"n"'
          snapshot: ".\\Snapshots\\ssf2.png"
          highlight_id: '657504'
      - step:
          id: '3'
          object_path: 'Window("Notepad++ [Administrator]").WinObject("Notepad++")'
          action: Click
          default_args: '269,222'
          snapshot: ".\\Snapshots\\ssf3.png"
          highlight_id: '657504'
      - step:
          id: '4'
          object_path: 'Window("Notepad++ [Administrator]").WinObject("Notepad++")'
          action: Type
          default_args: micBack
          snapshot: ".\\Snapshots\\ssf4.png"
          highlight_id: '657504'
      - step:
          id: '5'
          object_path: 'Window("Notepad++ [Administrator]").WinObject("Notepad++")'
          action: Click
          default_args: '269,222'
          snapshot: ".\\Snapshots\\ssf5.png"
          highlight_id: '657504'
      - step:
          id: '6'
          object_path: 'Window("Notepad++ [Administrator]").WinTab("SysTabControl32")'
          action: Select
          default_args: '"new 2"'
          snapshot: ".\\Snapshots\\ssf6.png"
          highlight_id: '329458'
      - step:
          id: '7'
          object_path: 'Window("Notepad++ [Administrator]").WinObject("Notepad++")'
          action: Click
          default_args: '431,8'
          snapshot: ".\\Snapshots\\ssf7.png"
          highlight_id: '657504'
      - step:
          id: '8'
          object_path: 'Window("Notepad++ [Administrator]").WinObject("Notepad++")'
          action: Type
          default_args: '"a"'
          snapshot: ".\\Snapshots\\ssf8.png"
          highlight_id: '657504'
      - step:
          id: '9'
          object_path: 'Window("Notepad++ [Administrator]").WinObject("Notepad++")'
          action: Click
          default_args: '431,8'
          snapshot: ".\\Snapshots\\ssf9.png"
          highlight_id: '657504'
  outputs:
    - return_result: '${return_result}'
    - error_message: '${error_message}'
  results:
    - SUCCESS
    - WARNING
    - FAILURE
object_repository:
  objects:
    - object:
        smart_identification: ''
        name: 'Notepad++ [Administrator]'
        child_objects:
          - object:
              smart_identification: ''
              name: SysTabControl32
              child_objects: []
              properties:
                - property:
                    value:
                      value: SysTabControl32
                      regular_expression: false
                    name: nativeclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: SysTabControl32
                  name: simclass
                  type: STRING
              class: WinTab
              visual_relations: ''
              last_update_time: 'Friday, April 28, 2023 3:11:55 PM'
              basic_identification:
                property_ref:
                  - nativeclass
                ordinal_identifier: ''
          - object:
              smart_identification: ''
              name: Notepad++
              child_objects: []
              properties:
                - property:
                    value:
                      value: Scintilla
                      regular_expression: false
                    name: regexpwndclass
                    hidden: false
                    read_only: false
                    type: STRING
              comments: ''
              custom_replay:
                behavior:
                  value: Scintilla
                  name: simclass
                  type: STRING
              class: WinObject
              visual_relations: ''
              last_update_time: 'Friday, April 28, 2023 3:11:55 PM'
              basic_identification:
                property_ref:
                  - regexpwndclass
                ordinal_identifier: ''
        properties:
          - property:
              value:
                value: 'Notepad++ [Administrator]'
                regular_expression: false
              name: regexpwndtitle
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: Notepad++
                regular_expression: false
              name: regexpwndclass
              hidden: false
              read_only: false
              type: STRING
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is owned window
              hidden: false
              read_only: false
              type: BOOL
          - property:
              value:
                value: '0'
                regular_expression: false
              name: is child window
              hidden: false
              read_only: false
              type: BOOL
        comments: ''
        custom_replay:
          behavior:
            value: Notepad++
            name: simclass
            type: STRING
        class: Window
        visual_relations: ''
        last_update_time: 'Friday, April 28, 2023 3:11:55 PM'
        basic_identification:
          property_ref:
            - regexpwndtitle
            - regexpwndclass
            - is owned window
            - is child window
          ordinal_identifier: ''
  check_points_and_outputs: []
  parameters: []
