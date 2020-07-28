#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  echo "Commiting files..."
  git add .
  git commit --message "[skip ci] Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  echo "Uploading files..."
  git remote add origin-pages https://${GH_TOKEN}@github.com/reichlab/covid19-forecast-hub.git > /dev/null 2>&1
  git push --quiet --set-upstream origin-pages HEAD:master
  echo "pushed to github"
}

setup_git
commit_website_files
upload_files