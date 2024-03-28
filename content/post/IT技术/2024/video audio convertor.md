---
title: 音视频转换
date: 2024-03-28 16:24
---


## wma 音频转 mp3

```bash
# 转换当前目录和子目录下所有 wma 文件格式为 mp3
find . -type f -name "*.wma" -exec ffmpeg -i {} -codec:a libmp3lame -qscale:a 2 {}.mp3 \;
```

解释：

- `-codec:a libmp3lame`：指定音频编解码器为 libmp3lame，用于将音频编码为 MP3 格式。
- `-qscale:a 2`：指定 MP3 的质量，取值范围为 0-9，其中 0 是最高质量，9 是最低质量，一般推荐使用 2-5 之间的值。



## 下载网络 ts/m3u8 资源到 mp4

```bash
ffmpeg -http_persistent 0 -i https://address.m3u8 -c copy output.mp4
```