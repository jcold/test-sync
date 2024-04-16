---
title: Algolia 及时搜索
date: 2024-04-06 17:16
---

内容逐渐多起来了，搜索是时候搭起来起来了。独立静态站的搜索，Algolia 是无异议的首选。

集成分为两部分
1. 索引数据推送
2. 搜索界面集成

## 索引数据推送

可选方式：
1. 生成好 json 后，从官网上传。
2. 自己开发，通过 Rest API or SDK 上传。
3. 通过官网提供的 `DocSearch` 上传，该工具使用 Python 语言开发，官方还提供了 Docker 镜像。

第1种，手动上传不适合自动化。
本着能用就别动的原则，使用第二种，步骤如下：
1. 配置文件 `.env`, API KEY 参数

    ```
    APPLICATION_ID=<YOUR_APP_ID>
    API_KEY=<YOUR_API_KEY>
    ```

2. 抓取配置文件， `config.json`, 配置抓取起始地址和内容选择器

    ```json
    {
        "index_name": "publish",
        "start_urls": [
            "https://publish.everkm.cn/"
        ],
        "stop_urls": [],
        "selectors": {
            "lvl0": "h1",
            "text": "body"
        }
    }
    ```

3. 为了跳过依赖，使用 Docker 方式运行
    ```bash
    docker run -it --env-file=.env -e "CONFIG=$(cat ./config.json | jq -r tostring)" algolia/docsearch-scraper
    ```

    考虑到内存的紧张，再加上之前 Docker Desktop 资源吃紧，索性绕个远道，找个替代品，简单粗暴选择 [[mac docker colima]]。期间没那么顺利，果然任何一个小尝试都没想象中简单，**能用就别动的原则依然值得践行**。

使用步骤还是挺简单的，运行也没什么问题，可还是掉入了贫穷陷井，免费服务内容限制在1000个字符，付费也限制在10000，官方给的方案是，做内容拆分后提交。可从 `DocSearch` 文档中没有发现拆分的参数项，这也意味着，只能走自研这条路了。

考虑到后续搜索 UI 也需要不少开发工作量，而以后肯定是要提供内置的搜索服务，索性界面也不用官方的，免得以后再开发一遍。真是路途坎坷呀！


**Ref:**
- [Prepare your records for indexing | Algolia](https://www.algolia.com/doc/guides/sending-and-managing-data/prepare-your-data/)
- [Netlify FAQ | Algolia](https://www.algolia.com/doc/tools/crawler/netlify-plugin/netlify-faq/)
- [Showcase for InstantSearch.js widgets | Algolia](https://www.algolia.com/doc/guides/building-search-ui/widgets/showcase/js/)
- [如何手动跑algolia的爬虫来打造自己的站点搜索呢🤔 - 掘金](https://juejin.cn/post/7265265606436962341)
- [Data, record size, and usage limits | Algolia](https://www.algolia.com/doc/guides/sending-and-managing-data/prepare-your-data/in-depth/index-and-records-size-and-usage-limitations/#record-size-limits)
- [Search API reference | Algolia](https://www.algolia.com/doc/rest-api/search/#hosts)
