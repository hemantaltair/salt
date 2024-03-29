$userName = "hemank@altairunlimited.com"
$userPassword = {{ salt['pillar.get']('secrets:hemant-secret:password') }}
$secureStringPwd = $userPassword | ConvertTo-SecureString -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $userName, $secureStringPwd

Add-Computer -DomainName {{ salt['pillar.get']('hostsfile:azure_ad_domain_name') }} -Credential $credentials -Restart -Force
