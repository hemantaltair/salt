{% import_yaml slspath + '/defaults.yaml' as defaults %}
{% set license-server = salt['pillar.get']('license-server', 'defaults', merge=True) %}



licensefile:
  file.managed:
    - name: {{ license-server['install_tmp'] }}/licensefile
    - source: salt://license-server/files/licensefile
    - template: jinja
    - makedirs: True