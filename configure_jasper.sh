#!/bin/bash

# move keys to a common directory
mkdir -p /opt/keys/
cp /home/jasper/.jrsks /opt/keys/
cp /home/jasper/.jrsksp /opt/keys/
chown -R jasper:jasper /opt/keys/

# decode jrsksp and change key location
cat .jrsksp | openssl base64 -d > .jrsksp_decoded
sed -i 's/ksp = ${sys:user.home}/ksp = \/opt\/keys\//' .jrsksp_decoded
base64 .jrsksp_decoded > .jrsksp
rm .jrsksp_decoded

# add environment variables
echo "export ks=/opt/keys" >> /etc/profile
echo "export ksp=/opt/keys" >> /etc/profile
