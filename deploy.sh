#!/bin/bash

bold=$(tput bold)
normal=$(tput sgr0)

echo -e "\033[0;32mDeployment started. ${bold}Go${normal} ...\033[0m"
echo -e "\033[0;32mDeploying site to ${bold}https://github.com/BlockchainNTU/chai${normal} ...\033[0m"

# Delete all .DS_Store files
find . -name ".DS_Store" -delete

# Build the project.
hugo # if using a theme, replace with `hugo -t <YOURTHEME>`

# Checkout to master branch
git checkout master

# Update username, email and credential
git config --local user.name "BlockchainNTU"
git config --local user.email "BlockchainNTU@gmail.com"
git config credential.username "BlockchainNTU"

# Check status
git status
# Add all changes to git staging area
git add .

# Commit changes.
msg="Rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

echo -e "\033[0;32mDeployment complete. ${bold}Done${normal} ...\033[0m"