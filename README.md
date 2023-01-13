# Workload Identity Federation with Github actions
Keylessly Access GCP Resources from GitHub Self Hosted Runners.

## Description
In this tutorial we access resources in Google Cloud from GitHub Workflows without using Service Account Keys.

This can be achieved thanks to a new feature of GitHub: 
* The GitHub actions OIDC - Read more [here](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect#adding-permissions-settings). This feature exposes an IDToken in the workflow's variables and in combination with Workload Identity Federation we can exchange GitHub Identities for a GCP Access Token.
* [This GitHub Action authenticates to Google Cloud](https://github.com/marketplace/actions/authenticate-to-google-cloud)


## Step1.
Go to terraform_wlif and run terraform init, terraform plan, terraform apply

## Step2.
Go to terraform_sa and run terraform init, terraform plan, terraform apply

## Step3.
Enable following GCP APIs
```
Secret Manager - https://console.cloud.google.com/marketplace/product/google/secretmanager.googleapis.com
Service Account Credentials - https://console.developers.google.com/apis/api/iamcredentials.googleapis.com/overview
```
	
## Step4.
Set the following repository secrets in github. Go to settings->Secrets and Variables->New Repository Secrets
```
GCP_POOL_AUDIENCE = google-wlif
GCP_PROJECT_ID = <Output from terraform run in step1> 
GCP_SA_NAME = <Output from terraform run in step2>
GCP_WORKLOAD_IDENTITY_PROVIDER = projects/<Output from terraform run in step1>/locations/global/workloadIdentityPools/gh-pool/providers/gh-provider
```

## Step5.
Create a secret in GCP console or using a terraform module(not provided) with name "my-secret" in appropriate region(s).
 
## Step6.
Grant the Google Cloud Service Account permissions to access Google Cloud resources. This step varies by use case. For demonstration purposes, you could grant access to a Google Secret Manager secret or Google Cloud Storage object.


## Github-Self-Hosted-Runner
```
mkdir actions-runner && cd actions-runner
curl -o actions-runner-linux-x64-2.300.2.tar.gz -L https://github.com/actions/runner/releases/download/v2.300.2/actions-runner-linux-x64-2.300.2.tar.gz
echo "ed5bf2799c1ef7b2dd607df66e6b676dff8c44fb359c6fedc9ebf7db53339f0c  actions-runner-linux-x64-2.300.2.tar.gz" | shasum -a 256 -c
tar xzf ./actions-runner-linux-x64-2.300.2.tar.gz

./config.sh --url https://github.com/reporURL --token Axxxxxxxxxxxxxxxxxxxxxxxxxxxx

./run.sh
```

Also see [Setting up Workload Identity Federation](https://github.com/marketplace/actions/authenticate-to-google-cloud#:~:text=Setting%20up%20Workload%20Identity%20Federation)


For learning - There is this simple [tutorial](https://www.youtube.com/watch?v=AvRHU-P5Cdg) from scratch which /authenticate-to-google-cloud does for us. 
