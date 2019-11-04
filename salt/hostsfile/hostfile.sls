{% from "hostfile/map.jinja" import hostfile with context %}

etc-sysconfig-network:
  file.replace:
    - name: {{ hostfile.path }}
    - pattern: 127.0.0.1 localhost
    - repl: 127.0.0.1 ubuntu.{{ hostfile.azure_ad_domain_name }} ubuntu
