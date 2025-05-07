#!/bin/bash

# Script to disable Spotlight's Cmd + Space shortcut and prepare for setting Alfred's hotkey

# Exit on error
set -e

# Step 1: Disable Spotlight's Cmd + Space shortcut
echo "Disabling Spotlight's Cmd + Space shortcut..."
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "{ enabled = 0; value = { parameters = (65535, 49, 1048576); type = standard; }; }"

# Step 2: Restart SystemUIServer to apply changes
echo "Restarting SystemUIServer to apply changes..."
killall SystemUIServer

# Step 3: Attempt to set Alfred's hotkey to Cmd + Space using AppleScript (optional, may require manual intervention)
echo "Attempting to set Alfred's hotkey to Cmd + Space (may require manual confirmation)..."

# Create a temporary AppleScript file
cat << 'EOF' > /tmp/set_alfred_hotkey.scpt
tell application "Alfred 5"
    activate
end tell
tell application "System Events"
    tell process "Alfred Preferences"
        delay 1
        keystroke "t" using {command down} -- Switch to General tab
        delay 1
        keystroke " " using {command down} -- Set Cmd + Space as hotkey
        delay 1
        keystroke return -- Confirm
    end tell
end tell
EOF

# Run the AppleScript (requires Accessibility permissions)
if osascript /tmp/set_alfred_hotkey.scpt; then
    echo "AppleScript executed. Check if Alfred's hotkey is set to Cmd + Space."
else
    echo "AppleScript failed. You may need to manually set Alfred's hotkey."
fi

# Clean up temporary AppleScript file
rm /tmp/set_alfred_hotkey.scpt

# Step 4: Restart Alfred to ensure changes take effect
echo "Restarting Alfred..."
osascript -e 'tell application "Alfred 5" to quit'
sleep 1
open -a "Alfred 5"

# Step 5: Notify user of manual steps or verification
echo "Script completed. Please verify the following:"
echo "1. Press Cmd + Space to ensure Alfred opens instead of Spotlight."
echo "2. If Alfred does not open, manually set the hotkey in Alfred Preferences:"
echo "   - Open Alfred Preferences > General."
echo "   - Click the 'Alfred Hotkey' field and press Cmd + Space."
echo "3. Check System Settings > Keyboard > Keyboard Shortcuts > Spotlight to ensure Spotlight's shortcut is disabled."
echo "4. Ensure no other apps (e.g., Input Sources or Dictation) are using Cmd + Space."

exit 0