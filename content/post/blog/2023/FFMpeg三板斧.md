---
date: 2023-09-09 22:54
---

### MP4导出图片

```bash
ffmpeg -i dahua_shenbu.mp4 -an -vf select='eq(pict_type\,I)' -vsync 2 -s '544*960' -f image2 dstPath/image-%05d.jpg
```


记忆题目

可以吗


近期有一定关系好吗？