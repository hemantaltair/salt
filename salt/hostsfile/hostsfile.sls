etc-sysconfig-network:
  file.replace:
    - name: {{ salt['pillar.get']('hostsfile:path') }}
    - pattern: 127.0.0.1 localhost
    - repl: 127.0.0.1 ubuntu.{{ salt['pillar.get']('hostsfile:azure_ad_domain_name') }} ubuntu
