```yaml
date: 2023-09-09 16:08
```

### 搭建OpenVPN服务

```bash
# Step 1: 生成配置
docker run -v /root/openvpn:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_genconfig -u udp://y4.yuid.org

# Step 2: 初始化pki
docker run -v /root/openvpn:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn ovpn_initpki

# Step 3: 启动服务
docker run -v /root/openvpn:/etc/openvpn -d -p 1194:1194/udp --cap-add=NET_ADMIN --name ovpn kylemanna/openvpn


# 用户与登录证书

# 创建用户
docker run -v /root/openvpn:/etc/openvpn --log-driver=none --rm -it kylemanna/openvpn easyrsa build-client-full dayu nopass

# 导出用户客户端证书
docker run -v /root/openvpn:/etc/openvpn --log-driver=none --rm kylemanna/openvpn ovpn_getclient dayu > member/dayu.ovpn
```