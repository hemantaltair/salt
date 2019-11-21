lmx_licensefile:
  file.managed:
    - name: /tmp/altair/lmx-inst/licensefile
    # - contents_pillar: {{ salt['pillar.get']('license-server-v2:license_file') }}
    - contents: |
        hemant
    - makedirs: True
