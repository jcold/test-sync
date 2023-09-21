---
date: 2023-09-09 16:08
---

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

### Http 代理

```bash
# 启动一个HTTP代理
docker run --restart=always --name=proxy -d -e SQUID_USERNAME=dayu -e SQUID_PASSWORD=K4zm8fZV6jw0n -p 8008:3128 robhaswell/squid-authenticated

# 代理验证
curl -x http://dayu:K4zm8fZV6jw0n@dayu.me:8008/  http://ip.gs
```

### 镜像管理

```bash
docker images --format '{{.Size}}\t{{.Repository}}\t{{.Tag}}\t{{.ID}}' | sort -h

docker exec -it dev-registry-1 bin/registry garbage-collect /etc/docker/registry/config.yml

docker exec -it <registry_container_id> bin/registry delete <image_name>:<tag>

dev.liveio.cn:5000/v2/_catalog

curl -k -X GET https://dev.liveio.cn:5000/v2/_catalog
curl -k -X GET https://dev.liveio.cn:5000/v2/gobuilder/tags/list
curl -k -X GET https://dev.liveio.cn:5000/v2/devops/rust-linux-darwin-builder/tags/list
```

### 删除废弃docker镜像

```bash
docker rmi $(docker images -f "dangling=true" -q)
```