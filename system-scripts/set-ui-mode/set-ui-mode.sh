#!/bin/bash

# --------------- Light Mode Functions ---------------

function switchMacLightMode {
  osascript -e 'tell application "System Events" to activate'
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to false'
}

function switchAtomLightMode {
  cp /Users/amorato/Repos/andys-tools/system-scripts/set-ui-mode/resources/atom-light-mode /Users/amorato/.atom/config.cson
}

function switchTerminalLightMode {
  osascript -e 'tell application "Terminal" to activate'
  osascript -e 'tell application "Terminal" to set default settings to settings set "Novel"'
  osascript -e 'tell application "Terminal" to set current settings of first window to settings set "Novel"'
  sed -i '' -e '$ d' /Users/amorato/.bash_profile
  echo 'export PS1=$PROMPT_LIGHT' >> /Users/amorato/.bash_profile
  source /Users/amorato/.bash_profile
  exec bash
}

# --------------- Dark Mode Functions ---------------

function switchMacDarkMode {
  osascript -e 'tell application "System Events" to activate'
  osascript -e 'tell application "System Events" to tell appearance preferences to set dark mode to true'
}

function switchAtomDarkMode {
  cp /Users/amorato/Repos/andys-tools/system-scripts/set-ui-mode/resources/atom-dark-mode /Users/amorato/.atom/config.cson
}

function switchTerminalDarkMode {
  osascript -e 'tell application "Terminal" to activate'
  osascript -e 'tell application "Terminal" to set default settings to settings set "Pro"'
  osascript -e 'tell application "Terminal" to set current settings of first window to settings set "Pro"'
  sed -i '' -e '$ d' /Users/amorato/.bash_profile
  echo 'export PS1=$PROMPT_DARK' >> /Users/amorato/.bash_profile
  source /Users/amorato/.bash_profile
  exec bash
}

# --------------- Script ---------------

if [[ "$1" == "light" ]]
then
  switchMacLightMode
  switchAtomLightMode
  switchTerminalLightMode
elif [[ "$1" == "dark" ]]
then
  switchMacDarkMode
  switchAtomDarkMode
  switchTerminalDarkMode
else
   echo "Arg has to be 'light' or 'dark'"
fi


# --------------- Unused Functions (potential future use) ---------------

function switchDesktopWallpaperLight {
  sqlite3 "$HOME/Library/Application Support/Dock/desktoppicture.db" "update data set value = '$HOME/dotfiles/scripts/bg/light.png'";
  killall Dock;
}

function switchDesktopWallpaperDark {
  sqlite3 "$HOME/Library/Application Support/Dock/desktoppicture.db" "update data set value = '$HOME/dotfiles/scripts/bg/dark.jpg'";
  killall Dock;
}
