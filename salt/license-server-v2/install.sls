{% import_yaml slspath + '/defaults.yaml' as defaults %}

licensefile:
  file.managed:
    - name: {{ defaults['install_tmp'] }}/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True
