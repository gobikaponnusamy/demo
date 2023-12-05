#!/bin/bash

# Ensure we are in the repository root directory
cd "$(git rev-parse --show-toplevel)"

# Get the pull request title and description
pr_title=$(git log -1 --pretty=%s)
pr_description=$(git log -1 --pretty=%b)

# Create the output directory if it doesn't exist
mkdir -p output

# Append the pull request title and description to the readme.txt file
echo "PR Title: $pr_title" >> output/readme.txt
echo "PR Description: $pr_description" >> output/readme.txt
echo "=========================" >> output/readme.txt