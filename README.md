# Create Gitlab Merge using API

This is a repository that contained how i create gitlab PR request when pipeline success.
See [Gitlab Documentation about auto PR] for further reference

## How to use create PR request when pipeline success

Requirements:
1. Gitlab server, both gitlab.com or self-hosted are working.
1. Basic knowledge about gitlab-ci, see [Pipeline using gitlab-ci.yml]
1. Create private token, please go to [Personal access token]. We will use token as
   `GITLAB_PRIVATE_TOKEN`

Download below files and add into your `GIT_REPO/utils`
1. https://gitlab.com/udienz/gitlab-merge-api/blob/master/utils/merge.sh
1. Open your repo annd point to *CI/CD Settings* > *Environment variables*, add below env:
 * `GITLAB_PRIVATE_TOKEN`
 * `TARGET_BRANCH`
1. Edit your `.gitlab-ci.yml` and add below line
```
include:
 - remote: 'https://gitlab.com/udienz/gitlab-merge-api/raw/master/template/create-merge.yml'
```

[Personal access token]: https://gitlab.com/help/user/profile/personal_access_tokens.md
[Gitlab Documentation about auto PR]: https://about.gitlab.com/2017/09/05/how-to-automatically-create-a-new-mr-on-gitlab-with-gitlab-ci/
[Pipeline using gitlan-ci.yml]: https://docs.gitlab.com/ee/ci/yaml/README.html
