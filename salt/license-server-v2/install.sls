lmx_licensefile:
  file.managed:
    - name: /tmp/altair/lmx-inst/licensefile
    - contents_pillar: {{ salt['pillar.get']('secrets:a-secret') }}
    - makedirs: True
