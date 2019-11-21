{% import_yaml slspath + '/defaults.yaml' as defaults %}

licensefile:
  file.managed:
    - name: {{ defaults['install_tmp'] }}/licensefile
    - source: salt://license-server/files/licensefile
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
        install_dir: {{ salt['pillar.get']('license-server:install_dir') }}
        license_file: {{ defaults['install_tmp'] }}/licensefile


installer:
  file.managed:
    - require:
      - file: expectfile
    - name: {{ defaults['install_tmp'] }}/license_manager_install_bin
    - source: {{ salt['pillar.get']('license-server:url') }}
    - source_hash: {{ salt['pillar.get']('license-server:sha512') }}
    - user: root
    - group: root
    - mode: 744

expect:
  pkg.installed:
    - name: expect

install:
  cmd.run:
    - require:
      - file: installer
      - pkg: expect
    - cwd: {{ defaults['install_tmp'] }}
    - name: |
        ./expectfile

clean_install_folder:
  file.absent:
    - name: {{ defaults['install_tmp'] }}
