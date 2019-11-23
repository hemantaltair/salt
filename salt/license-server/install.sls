{% import_yaml slspath + '/defaults.yaml' as defaults %}
{%- set license = salt['pillar.get']('license-server', default=defaults, merge=True) %}

licensefile:
  file.managed:
    - name: {{ license['install_tmp'] }}/licensefile
    - source: salt://license-server/files/licensefile
    - template: jinja
    - makedirs: True