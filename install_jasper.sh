#!/bin/bash

# download jasper server 7.8.0
wget -O /tmp/TIB_js-jrs-cp_7.8.0_linux_x86_64.run https://sourceforge.net/projects/jasperserver/files/JasperServer/JasperReports%20Server%20Community%20edition%207.8.0/TIB_js-jrs-cp_7.8.0_linux_x86_64.run/download
chmod +x /tmp/TIB_js-jrs-cp_7.8.0_linux_x86_64.run

# create a user to run jasper server
useradd -m jasper
su - jasper -c "/tmp/TIB_js-jrs-cp_7.8.0_linux_x86_64.run \
  --unattendedmodeui none \
  --mode unattended \
  --chromium_folder_unix /usr/bin/chromium \
  --chromium_folder_windows /usr/bin/chromium \
  --jasperLicenseAccepted \
  --jasperserver_install_sampledata=0"
