lmx_licensefile:
  file.managed:
    - name: /tmp/altair/lmx-inst/licensefile
    - contents: {{ salt['pillar.get']('license-server-v2:url') }}
    - makedirs: True
