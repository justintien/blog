# bot

> 申请流程 (https://dotblogs.com.tw/c5todo/2016/07/10/174049)

- tg @BotFather

```sh
/newbot

Alright, a new bot. How are we going to call it? Please choose a name for your bot.

先输入昵称

接着输入 username # 必须包含 bot

```


```sh

https://t.me/joinchat/{session}

https://api.telegram.org/bot{password}/getUpdates


 Done! Congratulations on your new bot. You will find it at t.me/{bot_name}. You can now add a description, about section and profile picture for your bot, see /help for a list of commands. By the way, when you've finished creating your cool bot, ping our Bot Support if you want a better username for it. Just make sure the bot is fully operational before you do this.

Use this token to access the HTTP API:

<token>

For a description of the Bot API, see this page: https://core.telegram.org/bots/api


# setWebhook
curl https://api.telegram.org/bot{password}/setWebhook?url=

```