{% import_yaml slspath + '/defaults.yaml' as defaults %}

licensefile:
  file.managed:
    - name: {{ defaults['install_tmp'] }}/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True

# lmx_expectfile:
#   file.managed:
#     - name: {{ lmx['install_tmp'] }}/expectfile
#     - source: salt://{{ slspath }}/files/expectfile.template
#     - template: jinja
#     - mode: 700
#     - context:
#         install_dir: {{ salt['pillar.get']('license-server-v2:install_dir') }}
#         license_file: {{ lmx['install_tmp'] }}/licensefile
#
#
# lmx_installer:
#   file.managed:
#     - name: {{ lmx['install_tmp'] }}/lmx_install_bin
#     - source: {{ salt['pillar.get']('license-server-v2:url') }}
#     - source_hash: {{ salt['pillar.get']('license-server-v2:sha512') }}
#     - user: root
#     - group: root
#     - mode: 744
#
# expect:
#   pkg.installed:
#     - name: expect
#
# lmx_install:
#   cmd.run:
#     - require:
#       - file: lmx_installer
#       - pkg: expect-{{state_id_suffix}}
#     - cwd: {{ lmx['install_tmp'] }}
#     - name: |
#         ./expectfile
