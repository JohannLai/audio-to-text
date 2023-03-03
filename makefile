# Download command
DOWNLOAD_CMD = ./download_audios.sh
INSTALL_CMD = ./install_dependencies.sh
SETUP_CMD = ./setup.sh
CONVERT_CMD = ./ffmpeg_convert_to_mp3.sh
MP3_TO_TEXT_CMD = ./mp3_to_text.sh

.DEFAULT_GOAL := setup

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