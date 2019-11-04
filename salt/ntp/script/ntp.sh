#!/bin/bash

sudo systemctl stop ntp
sudo ntpdate contoso.com
sudo systemctl start ntp
