# bot

> 申請流程 (https://dotblogs.com.tw/c5todo/2016/07/10/174049)

- tg @BotFather

```sh
/newbot

Alright, a new bot. How are we going to call it? Please choose a name for your bot.

先輸入暱稱

接著輸入 username # 必須包含 bot

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


Telegram 是藉由下列請求傳送訊息給使用者 GET https://api.telegram.org/bot12345:AAJqs_w-4/sendMessage?chat_id=-1001033293696&text=Hello

chat_id
群組 (Group) 為負數 (例如 -79897268)
超級群組 (Supergroup) 為負數 (例如 -1001033293696) 或是 @頻道名
私訊 (Private) 為正數 (例如 109780439)
頻道 (Channel) 為 @頻道名 (例如 @Telegram)
parse_mode 此為選擇性參數，未設定則為純文字 皆不支援複合使用 (像是 <b><i>重要</i></b>)
Markdown 可以用 [連結](url), *粗體*, _斜體_, `等寬字`, ```程式碼 (等寬區塊)``` 在有使用者輸入資料得環境不建議使用，如果解析錯誤 Telegram Server 會出現錯誤，無法發送訊息
HTML 同一般 HTML 用法，支援 b, strong, i, em, a, code, pre 非標籤的 <, >, &, " 需要 HTML entity 後使用
text 傳送訊息內容