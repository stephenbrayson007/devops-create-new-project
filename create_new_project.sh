#! /bin/bash

# Create projects for any team. This creates a github repo and new pipeline

usage() {
  echo "Requires github token as parameter"
  echo "Usage: create_new_project.sh <github token> <repo_name>"
  exit -1
}



if [[ -z "$1" || -z "$2" ]]; then
  usage
fi

GITHUB_TKN=$1
NEW_REPO_NAME=$2

create_github_repo() {
  curl -u "stephenbrayson007:$GITHUB_TKN" https://api.github.com/user/repos -d "{\"name\":\"${NEW_REPO_NAME}\"}"
}

create_new_pipeline() {
  PIPELINE_NAME="Create New Project"
  PIPELINE_DESCRIPTION="A pipeline to create a new repository and pipeline for a dev or test team to their own project"
  PIPELINE_ORG="stephenbrayson"
  PIPELINE_PROJECT="zero"
  PIPELINE_REPO="https://github.org/stephenbrayson007/${NEW_REPO_NAME}"
  PIPELINE_BRANCH="master"
  PIPELINE_YAML_PATH="$(pwd)/create_new_project.yaml"
  
  
  az pipelines create --name "$PIPELINE_NAME" \
  	--description "$PIPELINE_DESCRIPTION" \
  	--org "$PIPELINE_ORG" \
  	--project "$PIPELINE_PROJECT" \
  	--repository "$PIPELINE_REPOSITORY" \
  	--branch "$PIPELINE_BRANCH" \
  	--skip-first-run true \
        --yaml-path "$PIPELINE_YAML_PATH"
}

#create_github_repo
#create_new_pipeline

echo done
