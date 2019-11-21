lmx_licensefile:
  file.managed:
    - name: /tmp/altair/lmx-inst/licensefile
    - contents_pillar: pillar['license-server-v2']['license_file']
    - makedirs: True
