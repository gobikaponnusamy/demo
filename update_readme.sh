#!/bin/bash

# Ensure we are in the repository root directory
cd "$(git rev-parse --show-toplevel)"

# Get the pull request title and description
pr_title=$(git log --format=%s -n 1)
pr_description=$(git log --format=%b -n 1)

# Extract the readable title from the commit message
readable_title=$(echo "$pr_title" | sed -E 's/Merge (.*) into .*/\1/')

# Create the output directory if it doesn't exist
mkdir -p output

# Check if the description is not empty before appending to the readme.txt file
if [ -n "$pr_description" ]; then
  echo "### Pull Request Title: $readable_title" >> output/readme.txt
  echo "**Description:**" >> output/readme.txt
  echo "$pr_description" >> output/readme.txt
  echo "=========================" >> output/readme.txt
else
  echo "### Pull Request Title: $readable_title" >> output/readme.txt
  echo "=========================" >> output/readme.txt
fi
