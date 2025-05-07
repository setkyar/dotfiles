#!/bin/bash
# sidebar.sh - Add directories to Finder sidebar using keyboard shortcut method

# Define an array of directories to add
SIDEBAR_DIRS=(
    "$HOME/explore-code"
    "$HOME/work"
    "$HOME/school"
    # Add more paths here as needed, for example:
    # "$HOME/Documents/projects"
    # "$HOME/Downloads/important"
)

echo "Adding directories to Finder sidebar..."

# Loop through each directory
for DIR in "${SIDEBAR_DIRS[@]}"; do
    # Check if directory exists
    if [ ! -d "$DIR" ]; then
        echo "Directory $DIR does not exist! Skipping..."
        continue
    fi
    
    echo "Adding $DIR to sidebar..."
    
    # Use AppleScript to select the folder and use keyboard shortcut
  osascript <<EOF
tell application "Finder"
  activate
  set target_folder to POSIX file "$DIR" as alias
  select target_folder
  tell application "System Events"
    tell process "Finder"
      delay 1
      keystroke "t" using {control down, command down}
      delay 1
    end tell
  end tell
end tell
EOF
    
done

echo "All existing directories have been added to the sidebar."
echo "If you don't see them, try restarting Finder with 'killall Finder'"