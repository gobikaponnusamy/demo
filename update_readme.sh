#!/bin/bash

# Ensure we are in the repository root directory
cd "$(git rev-parse --show-toplevel)"

# Get the pull request title and description
pr_title=$(git log -1 --pretty=%s)
pr_description=$(git log -1 --pretty=%b)

# Create the output directory if it doesn't exist
mkdir -p output

# Check for specific cases and display the title accordingly
if [ "$pr_title" == "files added" ]; then
  echo "PR Title: $pr_title" >> output/readme.txt
else
  # Check if the description is not empty before appending to the readme.txt file
  if [ -n "$pr_description" ]; then
    echo "PR Title: $pr_title" >> output/readme.txt
    echo "PR Description: $pr_description" >> output/readme.txt
    echo "=========================" >> output/readme.txt
  else
    echo "PR Title: $pr_title" >> output/readme.txt
    echo "=========================" >> output/readme.txt
  fi
fi

