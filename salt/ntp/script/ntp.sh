#!/bin/bash

sudo systemctl stop ntp
sudo ntpdate {{ salt['pillar.get']('hostsfile:azure_ad_domain_name') }}
sudo systemctl start ntp
