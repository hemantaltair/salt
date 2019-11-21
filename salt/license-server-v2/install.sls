{% import_yaml slspath + '/defaults.yaml' as defaults %}

licensefile:
  file.managed:
    - name: {{ defaults['install_tmp'] }}/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True

expectfile:
  file.managed:
    - require:
      - file: licensefile
    - name: {{ defaults['install_tmp'] }}/expectfile
    - source: salt://{{ slspath }}/files/expectfile.template
    - template: jinja
    - mode: 700
    - context:
        install_dir: {{ salt['pillar.get']('license-server-v2:install_dir') }}
        license_file: {{ defaults['install_tmp'] }}/licensefile


installer:
  file.managed:
    - require:
      - file: lmx_expectfile
    - name: {{ defaults['install_tmp'] }}/lmx_install_bin
    - source: {{ salt['pillar.get']('license-server-v2:url') }}
    - source_hash: {{ salt['pillar.get']('license-server-v2:sha512') }}
    - user: root
    - group: root
    - mode: 744

expect:
  pkg.installed:
    - name: expect
