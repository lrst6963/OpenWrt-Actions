# Modify default IP
sed -i 's/192.168.1.1/192.168.12.1/g' package/base-files/files/bin/config_generate

#添加smartdns
git clone https://github.com/pymumu/openwrt-smartdns package/smartdns
git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns

# 添加 airconnect
git clone --depth=1 https://github.com/sbwml/luci-app-airconnect package/luci-app-airconnect
