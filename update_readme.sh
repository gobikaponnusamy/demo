#!/bin/bash

# Ensure we are in the repository root directory
cd "$(git rev-parse --show-toplevel)"

# Get the pull request title and description
pr_title=$(git log -1 --pretty=%s)
pr_description=$(git log -1 --pretty=%b)

# Create the output directory if it doesn't exist
mkdir -p output

# Display the original title without modification
echo "### Pull Request Title: $pr_title" >> output/readme.txt

# Check if the description is not empty before appending to the readme.txt file
if [ -n "$pr_description" ]; then
  echo "**Description:**" >> output/readme.txt
  echo "$pr_description" >> output/readme.txt
  echo "=========================" >> output/readme.txt
else
  echo "=========================" >> output/readme.txt
fi


