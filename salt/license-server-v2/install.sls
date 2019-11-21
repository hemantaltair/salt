lmx_licensefile:
  file.managed:
    - name: /tmp/altair/lmx-inst/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True
