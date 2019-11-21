{% import_yaml slspath + '/defaults.yaml' as defaults %}
{% set lmx = salt['slsutil.merge'](defaults, pillar) %}

lmx_licensefile:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True

lmx_expectfile-{{state_id_suffix}}:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/expectfile
    - source: salt://{{ slspath }}/files/expectfile.template
    - template: jinja
    - mode: 700
    - context:
        install_dir: {{ lmx['install_dir'] }}
        license_file: {{ lmx['install_tmp'] }}/licensefile
