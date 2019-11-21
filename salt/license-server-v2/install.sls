{% import_yaml slspath + '/defaults.yaml' as defaults %}
{% set lmx = salt['slsutil.merge'](defaults, pillar) %}


{% if salt.cmd.retcode('test -d '+lmx['pillar.get']('license-server-v2:install_dir'), ignore_retcode=True) != 0 %}

lmx_licensefile:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True


{% else %}
exit-with-success-even-sls-file-is-evaluate-to-empty-{{state_id_suffix}}:
  test.nop
{% endif %}
