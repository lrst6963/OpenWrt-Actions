#!/bin/bash
#=================================================
# 默认IP  192.168.12.1
sed -i 's/192.168.1.1/192.168.12.1/g' openwrt/package/base-files/files/bin/config_generate

# 修改本地时间格式
sed -i 's/os.date()/os.date("%Y-%m-%d %H:%M:%S")/g' package/lean/autocore/files/*/index.htm

# 修改版本为编译日期
date_version=$(date +"%y.%m.%d")
orig_version=$(cat "package/lean/default-settings/files/zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
sed -i "s/${orig_version}/R${date_version}/g" package/lean/default-settings/files/zzz-default-settings
sed -i 's/distversion)%>/distversion)%><!--/g' package/lean/autocore/files/*/index.htm
sed -i 's/luciversion)%>)/luciversion)%>)-->/g' package/lean/autocore/files/*/index.htm

# 添加额外插件
git clone --depth=1 https://github.com/sbwml/luci-app-airconnect package/luci-app-airconnect

./scripts/feeds update -a
./scripts/feeds install -a
