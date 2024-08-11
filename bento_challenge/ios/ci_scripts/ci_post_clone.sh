#!/bin/sh

# The default execution directory of this script is the ci_scripts directory.
cd $CI_WORKSPACE # change working directory to the root of your cloned repo.

# Specify the Flutter tag you want to checkout.
FLUTTER_TAG="3.22.0"

# Install Flutter using git with the specified tag.
git clone https://github.com/flutter/flutter.git --depth 1 --branch $FLUTTER_TAG $HOME/flutter

# Check if git clone was successful
if [ $? -ne 0 ]; then
  echo "Error: Git clone failed"
  exit 1
fi

export PATH="$PATH:$HOME/flutter/bin"

# Install Flutter artifacts for iOS (--ios), or macOS (--macos) platforms.
flutter precache --ios

# Install Flutter dependencies.
flutter pub get

# Install CocoaPods using Homebrew.
HOMEBREW_NO_AUTO_UPDATE=1 # disable homebrew's automatic updates.
brew install cocoapods

# Install CocoaPods dependencies.
cd $CI_PRIMARY_REPOSITORY_PATH/bento_challenge && flutter pub get #Installing Flutter packages
cd $CI_PRIMARY_REPOSITORY_PATH/bento_challenge/ios && pod install #Installing Pods


exit 0