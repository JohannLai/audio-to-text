# ChatGPT Audio link to text and summary


This project is a shell script implementation of the ChatGPT API to convert audio to text and summary **just need to input the audio link**.

## Play with Issue

You can play with this project by opening an issue. [Just fill in the text with a audio link and publish it here](https://github.com/JohannLai/audio-to-text/issues/new?assignees=&labels=&template=%F0%9F%8E%AC-auto-convert-video-links-to-text-and-summary-%F0%9F%93%9D.md&title=%5B%F0%9F%8E%AC+Auto-Convert%5D)

If you have any questions, please feel free to open an issue. I will try my best to answer your questions.

<a href="https://www.buymeacoffee.com/johannli"><img src="https://img.buymeacoffee.com/button-api/?text=Buy me a coffee&emoji=&slug=johannli&button_colour=FFDD00&font_colour=000000&font_family=Poppins&outline_colour=000000&coffee_colour=ffffff" /></a>

## For developers

### run on local
clone it and run it on your local machine

```bash
$ git clone https://github.com/JohannLai/audio-to-text.git
$ cd audio-to-text

# input your audio link in audio.txt
echo "https://xxx/watch?v=xxx" > audios_list.txt
# input your API_KEY in .env
echo "API_KEY=xxx" > .env

# 🙏🙏🙏
$ make start

# 👍👍👍
$ cat text_formatted/*.txt
```


## License
This project is licensed under the terms of the MIT License. See the LICENSE file for details.
