{% import_yaml slspath + '/defaults.yaml' as defaults %}
{%- set license = salt['pillar.get']('license-server', default=defaults, merge=True) %}

get licensefile and decrypt using gpgkeys:
  file.managed:
    - name: {{ license['install_tmp'] }}/licensefile
    - source: salt://license-server/files/licensefile
    - template: jinja
    - makedirs: True

# get expectfile:
#   file.managed:
#     - require:
#       - file: licensefile
#     - name: {{ license['install_tmp'] }}/expectfile
#     - source: salt://{{ slspath }}/files/expectfile.template
#     - template: jinja
#     - mode: 700
#     - context:
#         install_dir: {{ license['install_dir'] }}
#         license_file: {{ license['install_tmp'] }}/licensefile


# get license manager binary file from azure storage:
#   file.managed:
#     - require:
#       - file: expectfile
#     - name: {{ license['install_tmp'] }}/license_manager_install_bin
#     - source: {{ license['url'] }}
#     - source_hash: {{ license['sha512'] }}
#     - user: root
#     - group: root
#     - mode: 744

# install expect package:
#   pkg.installed:
#     - name: expect

# install license manager:
#   cmd.run:
#     - require:
#       - file: installer
#       - pkg: expect
#     - cwd: {{ license['install_tmp'] }}
#     - name: |
#         ./expectfile

# clean install folder:
#   file.absent:
#     - name: {{ license['install_tmp'] }}

