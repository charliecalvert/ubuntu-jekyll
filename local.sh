#!/bin/bash

# This script is used to create a new Jekyll site
# in the current directory. It will remove any
# existing Gemfile and Gemfile.lock files, then
# create a new Jekyll site scaffold in the current
# directory. It will then install the webrick gem
# and start the Jekyll server.

if [ -d _site ]; then
    echo "Removing _site directory"
    rm -rf _site
else
    echo "_site directory does not exist"
fi

if [ -d .jekyll-cache ]; then
    echo "Removing .jekyll-cache directory"
    rm -rf .jekyll-cache        
else    
    echo ".jekyll-cache directory does not exist"
fi

if [ -f Gemfile ]; then
    echo "Gemfile exists"
    rm Gemfile Gemfile.lock
else
    echo "Gemfile does not exist"
fi

gem install jekyll bundler
bundle init
bundle add jekyll --version "~>4.3.2"
jekyll new --force .        # Creates a new Jekyll site scaffold in .   
bundle add webrick
bundle install
bundle update
bundle exec jekyll serve --livereload
