#!/bin/bash
#=================================================
# 默认IP  192.168.12.1
sed -i 's/192.168.1.1/192.168.12.1/g' openwrt/package/base-files/files/bin/config_generate

# 添加额外插件
git clone --depth=1 https://github.com/sbwml/luci-app-airconnect package/luci-app-airconnect

./scripts/feeds update -a
./scripts/feeds install -a
