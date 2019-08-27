#!/bin/sh

# Constants
VERSION="v1.0"

FONT_FILE_NAME="SourceCodePro.zip"
XCODE_THEME_FILE_NAME="DeveloperInsider.xccolortheme"

FONT_ZIP_FILE_URL="https://github.com/developerinsider/XcodeTheme/releases/download/$VERSION/SourceCodePro.zip"
XCODE_THEME_FILE_URL="https://github.com/developerinsider/XcodeTheme/releases/download/$VERSION/DeveloperInsider.xccolortheme"

FONT_INSTALL_PATH="${HOME}/Library/Fonts/"
XCODE_THEME_PATH="${HOME}/Library/Developer/Xcode/UserData/FontAndColorThemes/"

# Color Constants
RED_COLOR=`tput setaf 1`
GREEN_COLOR=`tput setaf 2`
YELLOW_COLOR=`tput setaf 3`
CLEAR_COLOR=`tput sgr 0`

# Functions
checkError() {
  if [ $1 -ne 0 ]; then
    echo "🔥  ${RED_COLOR}There are some error in installation Developer Insider Xcode theme.${CLEAR_COLOR}"
    exit
  fi
}

# Setup and Installation
echo "🔤  Downloading Source Code Pro fonts..."
curl -sSOL $FONT_ZIP_FILE_URL
checkError $?

echo "🔤  Installing Source Code Pro fonts..."
unzip -o -j -q $FONT_FILE_NAME -d $FONT_INSTALL_PATH
checkError $?

echo "🎨  Downloading Developer Insider Xcode Theme..."
curl -sSOL $XCODE_THEME_FILE_URL
checkError $?

echo "🎨  Installing Developer Insider Xcode Theme..."
mkdir -p $XCODE_THEME_PATH 
cp $XCODE_THEME_FILE_NAME $XCODE_THEME_PATH
checkError $?

rm $FONT_FILE_NAME
rm $XCODE_THEME_FILE_NAME

echo "🎉  ${GREEN_COLOR}Developer Insider Xcode theme successfully installed.${CLEAR_COLOR}"
echo "👍  ${YELLOW_COLOR}Now, select DeveloperInsider Xcode theme in Xcode's preferences to start using it. You may have to restart Xcode first.${CLEAR_COLOR}"