{% from "hostsfile/map.jinja" import hostsfile with context %}

etc-sysconfig-network:
  file.replace:
    - name: {{ hostsfile.path }}
    - pattern: 127.0.0.1 localhost
    - repl: 127.0.0.1 ubuntu.{{ hostsfile.azure_ad_domain_name }} ubuntu
