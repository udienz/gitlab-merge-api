#!/usr/bin/env bash
set -e

if [ -z "$GITHUB_REPO" ]; then
  echo "$GITHUB_REPO"
  echo "Please set the GitLab Private Token as GITHUB_REPO"
  exit 1
fi

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Please set the GitLab Private Token as GITHUB_TOKEN"
  exit 1
fi

if [ -z "$1" ]; then
  echo "Please input the build status"
  exit 1
fi

STATUS=$1
# https://developer.github.com/v3/repos/statuses/#create-a-status
# POST /repos/:owner/:repo/statuses/:sha
BODY="{
    \"state\": \"${STATUS}\",
    \"target_url\": \"${CI_PROJECT_URL}/commits/master\",
    \"description\": \"The build is ${STATUS}ed\",
    \"context\": \"continous-integration/gitlab-ci\"
}";

curl -X "POST https://api.github.com/repos/${GITHUB_REPO}/statuses/${CI_COMMIT_SHA}" \
    --header "Authorization: token ${GITHUB_TOKEN}" \
    --header "Content-Type: application/json" \
    --data "${BODY}";

