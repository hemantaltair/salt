# update /etc/ntp.conf:
#   file.line:
#     - name: /etc/ntp.conf
#     - mode: insert
#     - content: server {{ salt['pillar.get']('hostsfile:azure_ad_domain_name') }}
#     - location: end

update /etc/ntp.conf:
  file:
    - append
    - template: jinja
    - sources:
      - salt://ntp/ntp.conf
