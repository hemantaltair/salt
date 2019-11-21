{% set lmx = salt['slsutil.merge'](pillar) %}

lmx_licensefile:
  file.managed:
    - name: /tmp/altair/lmx-inst/licensefile
    - contents_pillar: {{ lmx['license-server-v2']['sha512'] }}
    - makedirs: True
