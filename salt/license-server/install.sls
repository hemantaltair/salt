{% import_yaml slspath + '/defaults.yaml' as defaults %}
{% set lmx = salt['slsutil.merge'](defaults, pillar) %}

{% if salt.cmd.retcode('test -d '+lmx['install_dir'], ignore_retcode=True) != 0 %}

lmx_licensefile-{{state_id_suffix}}:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/licensefile
    - makedirs: True
    - source: {{ lmx['license_url'] }}
    - source_hash: sha512={{ lmx['license_sha512'] }}

lmx_expectfile-{{state_id_suffix}}:
  file.managed:
    - require:
      - file: lmx_licensefile-{{state_id_suffix}}
    - name: {{ lmx['install_tmp'] }}/expectfile
    - source: salt://{{ slspath }}/files/expectfile.template
    - template: jinja
    - mode: 700
    - context:
        install_dir: {{ lmx['install_dir'] }}
        license_file: {{ lmx['install_tmp'] }}/licensefile

lmx_installer-{{state_id_suffix}}:
  file.managed:
    - require:
      - file: lmx_expectfile-{{state_id_suffix}}
    - name: {{ lmx['install_tmp'] }}/lmx_install_bin
    - source: {{ lmx['url'] }}
    - source_hash: sha512={{ lmx['sha512'] }}
    - user: root
    - group: root
    - mode: 744

expect-{{state_id_suffix}}:
  pkg.installed:
    - name: expect

lmx_install-{{state_id_suffix}}:
  cmd.run:
    - require:
      - file: lmx_installer-{{state_id_suffix}}
      - pkg: expect-{{state_id_suffix}}
    - cwd: {{ lmx['install_tmp'] }}
    - name: |
        ./expectfile

clean_install_folder-{{state_id_suffix}}:
  file.absent:
    - name: {{ lmx['install_tmp'] }}

{% else %}
exit-with-success-even-sls-file-is-evaluate-to-empty-{{state_id_suffix}}:
  test.nop
{% endif %}
