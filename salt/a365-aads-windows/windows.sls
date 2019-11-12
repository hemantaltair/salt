Configure AADS for windows:
    cmd.script:
        - name: Configure AADS
        - source: salt://script/windows.ps1
        - template: jinja
        - shell: powershell
