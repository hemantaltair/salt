configure the hosts file:
  file.replace:
    - name: {{ salt['pillar.get']('hostsfile:path') }}
    - pattern: 127.0.0.1 localhost
    - repl: 127.0.0.1 {{ salt['pillar.get']('hostsfile:hostname') }}.{{ salt['pillar.get']('hostsfile:azure_ad_domain_name') }} {{ salt['pillar.get']('hostsfile:hostname') }}
