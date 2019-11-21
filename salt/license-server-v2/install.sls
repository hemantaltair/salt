lmx_licensefile:
  file.managed:
    - name: /tmp/altair/lmx-inst/licensefile
    - contents: {{ salt['pillar.get']('license-server-v2:license_file') }}
    - makedirs: True

# api_token:
#   file.managed:
#     - name: /var/your_app/api_token
#     - contents: {{ pillar['linode_api_token'] }}
#
#
# $userName = "hemank@altairunlimited.com"
# $userPassword = {{ salt['pillar.get']('secrets:hemant-secret:password') }}
# $secureStringPwd = $userPassword | ConvertTo-SecureString -AsPlainText -Force
# $credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $userName, $secureStringPwd
#
# Add-Computer -DomainName {{ salt['pillar.get']('hostsfile:azure_ad_domain_name') }} -Credential $credentials -Restart -Force
