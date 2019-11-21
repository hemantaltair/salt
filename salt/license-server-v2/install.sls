{% import_yaml slspath + '/defaults.yaml' as defaults %}
{% set lmx = salt['slsutil.merge'](defaults, pillar) %}

lmx_licensefile:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True

lmx_expectfile:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/expectfile
    - source: salt://{{ slspath }}/files/expectfile.template
    - template: jinja
    - mode: 700
    - context:
        install_dir: {{ salt['pillar.get']('license-server-v2:install_dir') }}
        license_file: {{ lmx['install_tmp'] }}/licensefile


lmx_installer:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/lmx_install_bin
    - source: {{ salt['pillar.get']('license-server-v2:url') }}
    - source_hash: {{ salt['pillar.get']('license-server-v2:sha512') }}
    - user: root
    - group: root
    - mode: 744
