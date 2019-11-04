# update /etc/ntp.conf:
#   file.line:
#     - name: /etc/ntp.conf
#     - mode: insert
#     - content: server {{ salt['pillar.get']('hostsfile:azure_ad_domain_name') }}
#     - location: end

update /etc/ntp.conf:
  file.append:
    - name: /etc/ntp.conf
    - template: jinja
    - sources:
      - salt://ntp/conf/ntp.conf
