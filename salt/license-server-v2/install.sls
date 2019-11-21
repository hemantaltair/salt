{% import_yaml slspath + '/defaults.yaml' as defaults %}
{% set lmx = salt['slsutil.merge'](defaults, pillar) %}

lmx_licensefile-{{state_id_suffix}}:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True
