{% import_yaml slspath + '/defaults.yaml' as defaults %}
{% set lmx = salt['slsutil.merge'](defaults, pillar) %}


{% if salt.cmd.retcode('test -d '+lmx['install_dir'], ignore_retcode=True) != 0 %}

lmx_licensefile:
  file.managed:
    - name: {{ lmx['install_tmp'] }}/licensefile
    - source: salt://license-server-v2/files/licensefile
    - template: jinja
    - makedirs: True
