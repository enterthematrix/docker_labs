<img src="/images/readme.png" align="center" />





## Application Workflow:
<img src="/images/ApplicationFlow.png" align="center" />

## Creating an encoded secret:

kubectl create secret generic pgpassword --from-literal PGPASSWORD=postgres

## Running Travis CLI in a container to encrypt Google service account json file
docker run -it -v $(pwd):/app ruby:2.4 sh
gem install travis
travis login
travis encrypt-file service-account.json -r enterthematrix/multi-k8s

## See chapter 278 for configuring the GCloud CLI on Cloud Console

## Diable google cloud command
CLOUDSDK_CORE_DISABLE_PROMPTS=1

### External ref:
https://github.com/StephenGrider/DockerCasts
