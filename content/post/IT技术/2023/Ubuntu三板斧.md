```yaml
date: 2023-08-31 11:36
```

记录我的Ubuntu三板斧技能

### 为所有用户增加环境变量

将变量键值对写入 `/etc/environment`。查看如下：

```bash
root@y5:~# cat /etc/environment
PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"
LOCAL_IP="10.0.4.11"
```

### 永久更改 Host Name

```bash
# 写入新的HostName到文件 /etc/hostname
echo dayu > /etc/hostname

# 显示当前HostName
root@y5:~# hostname
y5

# 查看包括HostName在内系统信息
root@y5:~# hostnamectl
 Static hostname: y5
 Pretty hostname: y5.liveio.cn
       Icon name: computer-vm
         Chassis: vm
      Machine ID: 8053f6f3b11c4c898c03c8dac1ce1ac3
         Boot ID: b1a053915d01402c90fd11c2c43870d1
  Virtualization: kvm
Operating System: Ubuntu 22.04 LTS
          Kernel: Linux 5.15.0-72-generic
    Architecture: x86-64
 Hardware Vendor: Tencent Cloud
  Hardware Model: CVM

```

Pretty hostname 保存在：`/etc/machine-info`。某些情况下需要引用该HostName，还需要在 `/etc/hosts` 文件中增加该地址解析。

