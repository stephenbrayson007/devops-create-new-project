#! /bin/bash

# Create projects for any team. This creates a github repo and new pipeline

PIPELINE_NAME="Create New Project"
PIPELINE_DESCRIPTION="A pipeline to create a new repository and pipeline for a dev or test team to their own project"
PIPELINE_ORG="stephenbrayson"
PIPELINE_PROJECT="zero"
PIPELINE_REPO="https://github.org/stephenbrayson007"
PIPELINE_BRANCH="master"
PIPELINE_YAML_PATH="$(pwd)/create_new_project.yaml"

az pipelines create --name "$PIPELINE_NAME" \
	--description "$PIPELINE_DESCRIPTION" \
	--org "$PIPELINE_ORG" \
	--project "$PIPELINE_PROJECT" \
	--repository "$PIPELINE_REPOSITORY" \
	--branch "$PIPELINE_BRANCH" \
	--skip-first-run true
        --yaml-path "$PIPELINE_YAML_PATH" 
