Configure AADS for windows:
    cmd.script:
        - name: Configure AADS
        - source: salt://a365-aads-windows/script/windows.ps1
        - template: jinja
        - shell: powershell
