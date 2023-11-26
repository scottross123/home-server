#!/bin/bash

# have to do this because docker compose secret management sucks

pass show ProtonVPN/openvpn_username > /tmp/proton_openvpn_username
pass show ProtonVPN/openvpn_password > /tmp/proton_openvpn_password
docker compose up -d
shred -zu /tmp/proton_openvpn_username
shred -zu /tmp/proton_openvpn_password
