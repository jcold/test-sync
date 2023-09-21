---
date: 2023-09-09 18:08
---

## 监听目录数据变化

```bash
# 当前目录变化时，打印出路径
fswatch -0  . |xargs -0 -n1 -I{} echo {}

# eg. 当指定目录文件变化时，自动SASS编译
fswatch -0 ~/ybf5/src/assets/css/view.scss | xargs -0 -n1  ~/bin/sass {} ~/ybf5/dist/static/css/view.css
```