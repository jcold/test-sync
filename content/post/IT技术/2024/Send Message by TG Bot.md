---
date: 2024-03-21 16:26
---

时常有些事儿离不开个在线及时通知，使用国内微信无疑是最方便的，奈何人家不提供这样服务呀，强迫你用企业微信，又或者用其他的如钉钉之类的，太重了，还很容易被打扰。最后不得不转向国外的服务，专业专注，非常符合我的口味。

## Telegram Bot 解决方案

1. 添加联系人 `@BotFather`, 输入命令 `/newbot`，接着与他聊天交互就可以创建好一个机器人。
2. 创建完成后，它会发给你与机器人聊天的地址，如 `t.me/<Your name of bot>`, 点击即可开启一个与机器人的聊天对话。
3. 使用以下 `curl` 命令，从返回内容中获取 `chat_id`:
    ```bash
    curl https://api.telegram.org/bot<bot token>/getUpdates
    ```
4. 通过下面的 Web 接口就可以以机器人的身份给你发消息啦。完美！
    ```bash
    curl -X POST \
        -H 'Content-Type: application/json' \
        -d '{"chat_id": "<chat_id>", "text": "This is a test message from your bot!, 中文"}' \
        https://api.telegram.org/bot<bot token>/sendMessage
    ```