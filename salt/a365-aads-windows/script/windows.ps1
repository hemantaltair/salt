$userName = "hemank@altairunlimited.com"
$userPassword = "altair@12345"
$secureStringPwd = $userPassword | ConvertTo-SecureString -AsPlainText -Force
$credentials = New-Object System.Management.Automation.PSCredential -ArgumentList $userName, $secureStringPwd

Add-Computer -DomainName {{ salt['pillar.get']('hostsfile:azure_ad_domain_name') }} -Credential $credentials -Retart -Force
