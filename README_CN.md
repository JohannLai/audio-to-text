<img height="129" align="left" src="https://user-images.githubusercontent.com/10769405/223718552-d6bbf8a5-0eba-486b-9619-64e27d690435.png" alt="Logo">

# ChatGPT 音频链接转文本、摘要

[![LICENSE](https://img.shields.io/github/license/JohannLai/audio-to-text)](https://github.com/JohannLai/audio-to-text/blob/main/LICENSE)

将音频转换成文本和摘要，**只需输入音频链接**。

## [在 Issue 中把玩](https://github.com/JohannLai/audio-to-text/issues/new?assignees=&labels=&template=%F0%9F%8E%AC-auto-convert-video-links-to-text-and-summary-%F0%9F%93%9D.md&title=%5B%F0%9F%8E%AC+Auto-Convert%5D)

您可以通过打开 issue 来玩这个项目。[只需在此处填写带有音频链接的文本并发布](https://github.com/JohannLai/audio-to-text/issues/new?assignees=&labels=&template=%F0%9F%8E%AC-auto-convert-video-links-to-text-and-summary-%F0%9F%93%9D.md&title=%5B%F0%9F%8E%AC+Auto-Convert%5D)

如果您有任何问题，请随时提出问题。我会尽力回答您的问题。

<a href="https://www.buymeacoffee.com/johannli"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=johannli&button_colour=FFDD00&font_colour=000000&font_family=Poppins&outline_colour=000000&coffee_colour=ffffff" /></a>


## 📚 基于视频构建你的私人教师 

通过利用 ChatGPT OpenAPI 和 GPT Index，您可以通过下载 多个视频，创建一个知识数据库，然后向 AI 提出任何问题。

```bash
# clone it
$ git clone https://github.com/JohannLai/audio-to-text.git

# cd to the project
$ cd audio-to-text

# input your audio link in audio.txt
echo "https://xxx/watch?v=xxx" > audios_list.txt
# input your OPENAI_API_KEY in .env
echo "OPENAI_API_KEY=xxx" > .env
source .env

# 🙏🙏🙏 (it will take a long time)
$ make ask_ai

# 👍👍👍  (you can ask any questions you want)
```


## 🕹️ 开发者

### run on local
clone it and run it on your local machine

```bash
$ git clone https://github.com/JohannLai/audio-to-text.git
$ cd audio-to-text

# input your audio link in audio.txt
echo "https://xxx/watch?v=xxx" > audios_list.txt
# input your OPENAI_API_KEY in .env
echo "OPENAI_API_KEY=xxx" > .env
source .env

# 🙏🙏🙏 (it will take a long time)
$ make start

# 👍👍👍
$ cat text_formatted/*.txt
```
