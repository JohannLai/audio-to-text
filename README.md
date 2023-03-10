<img height="129" align="left" src="https://user-images.githubusercontent.com/10769405/223718552-d6bbf8a5-0eba-486b-9619-64e27d690435.png" alt="Logo">

# ChatGPT Audio link to text and summary

[![LICENSE](https://img.shields.io/github/license/JohannLai/audio-to-text)](https://github.com/JohannLai/audio-to-text/blob/main/LICENSE)
---

Convert audio to text and summary **just need to input the audio link**.

[δΈ­ζζζ‘£](README_CN.md)

## [Play with Issue](https://github.com/JohannLai/audio-to-text/issues/new?assignees=&labels=&template=%F0%9F%8E%AC-auto-convert-video-links-to-text-and-summary-%F0%9F%93%9D.md&title=%5B%F0%9F%8E%AC+Auto-Convert%5D)

You can play with this project by opening an issue. [Just fill in the text with a audio link and publish it here](https://github.com/JohannLai/audio-to-text/issues/new?assignees=&labels=&template=%F0%9F%8E%AC-auto-convert-video-links-to-text-and-summary-%F0%9F%93%9D.md&title=%5B%F0%9F%8E%AC+Auto-Convert%5D)

If you have any questions, please feel free to open an issue. I will try my best to answer your questions.

<a href="https://www.buymeacoffee.com/johannli"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=johannli&button_colour=FFDD00&font_colour=000000&font_family=Poppins&outline_colour=000000&coffee_colour=ffffff" /></a>


## π Build Your Personal Teacher Based on Videos

By utilizing ChatGPT OpenAPI and GPT Index, you can create a knowledge database by compiling multiple videos, and then ask any questions you want.

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

# πππ (it will take a long time)
$ make ask_ai

# πππ  (you can ask any questions you want)
```


## πΉοΈ For developers

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

# πππ (it will take a long time)
$ make start

# πππ
$ cat text_formatted/*.txt
```
