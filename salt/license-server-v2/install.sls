{% import_yaml slspath + '/defaults.yaml' as defaults %}
{% set lmx = salt['slsutil.merge'](defaults, pillar) %}

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
