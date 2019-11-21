lmx_licensefile:
  file.managed:
    - name: /tmp/altair/lmx-inst/licensefile
    - contents_pillar: {{ salt['pillar.get']('license-server-v2:sha512') }}
    - makedirs: True
