#!/bin/bash

# 将默认主题设置为luci-theme-argon
# uci set luci.main.mediaurlbase='/luci-static/argon'
# uci commit luci

# 禁用IPv6 ULA 前缀
sed -i 's/^[^#].*option ula/#&/' /etc/config/network

# Check file system during boot
# uci set fstab.@global[0].check_fs=1
# uci commit fstab

exit 0
