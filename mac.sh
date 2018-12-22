#!/usr/bin/env bash

# Get the admin password upfront
sudo -v



softwareupdate -iva
mas install 441258766 409203825 497799835 409201541 539883307 409183694 1320666476 425424353 405399194

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
# osascript -e 'tell application "System Preferences" to quit'

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


# TODO: Go through this list for useful defaults I want
# https://github.com/mathiasbynens/dotfiles/blob/master/.macos
