# Download command
DOWNLOAD_CMD = ./script/download_audios.sh
INSTALL_CMD = ./script/install_dependencies.sh
SETUP_CMD = ./script/setup.sh
CONVERT_CMD = ./script/ffmpeg_convert_to_mp3.sh
MP3_TO_TEXT_CMD = ./script/mp3_to_text.sh
SUMMARIZE_CMD = ./script/summarize_and_format.sh

# run setup、 download、 convert、 mp3_to_text
start:
	$(SETUP_CMD)
	$(DOWNLOAD_CMD)
	$(CONVERT_CMD)
	$(MP3_TO_TEXT_CMD)
	$(SUMMARIZE_CMD)

# default target SETUP
setup:
	$(SETUP_CMD)

# Download all audios
download:
	$(DOWNLOAD_CMD)

# Install all dependencies
install:
	$(INSTALL_CMD)

# Convert all audios to mp3
convert:
	$(CONVERT_CMD)

# Convert all mp3 to text
mp3_to_text:
	$(MP3_TO_TEXT_CMD)

# Summarize all audios
summarize:
	$(SUMMARIZE_CMD)

# Reset all audios
reset:
	rm -rf ./audio/*
	rm -rf ./mp3/*
	rm -rf ./text/*
	rm -rf ./text_formatted/*
