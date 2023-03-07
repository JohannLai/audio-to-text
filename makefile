# Download command
DOWNLOAD_CMD = ./script/download_audios.sh
INSTALL_CMD = ./script/install_dependencies.sh
SETUP_CMD = ./script/setup.sh
CONVERT_CMD = ./script/ffmpeg_convert_to_mp3.sh
MP3_TO_TEXT_CMD = ./script/mp3_to_text.sh
SUMMARIZE_CMD = ./script/summarize_and_format.sh
ISSUE_CMD = ./script/get_info_from_issue.sh
COMMENT_CMD = ./script/comment.sh
INSTALL_TEST_CMD = ./script/install_unit_test_dependencies.sh
TEST_CMD = ./test/run_test.sh
PROXY_CMD = ./proxy/config_normal.sh
PROXY_C_CMD = ./proxy/config_main.sh

help: # Show help for each of the Makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done


start: # Start the program
	$(SETUP_CMD)
	$(DOWNLOAD_CMD)
	$(CONVERT_CMD)
	$(MP3_TO_TEXT_CMD)
	$(SUMMARIZE_CMD)

start_from_issue: # Start the program from issue
	$(ISSUE_CMD)
	$(SETUP_CMD)
	$(DOWNLOAD_CMD)
	$(CONVERT_CMD)
	$(MP3_TO_TEXT_CMD)
	$(SUMMARIZE_CMD)

setup: # default target SETUP
	$(SETUP_CMD)

download: # Download all audios
	$(DOWNLOAD_CMD)

install: # Install all dependencies
	$(INSTALL_CMD)

install_test: # Install test
	$(INSTALL_TEST_CMD)

unit-test: # Run unit test
	$(TEST_CMD)

convert: # Convert all audios to mp3
	$(CONVERT_CMD)

mp3_to_text: # Convert all mp3 to text
	$(MP3_TO_TEXT_CMD)

summarize: # Summarize all audios
	$(SUMMARIZE_CMD)

comment: # Comment on issue run script
	$(COMMENT_CMD)

issue: # Open issue will write to issue.txt, and run script
	$(ISSUE_CMD)

proxy-config: # Config proxy
	$(PROXY_CMD)

proxy-config-c: # Config proxy c
	$(PROXY_C_CMD)

reset: # Reset all audios, remove all audios, mp3, text, text_formatted
	rm -rf ./audio/*
	rm -rf ./mp3/*
	rm -rf ./text/*
	rm -rf ./text_formatted/*
