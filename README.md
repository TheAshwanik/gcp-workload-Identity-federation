# Workload Identity Federation with Github actions
Keylessly Access GCP Resources from GitHub Self Hosted Runners.

## Description
In this tutorial we access resources in Google Cloud from GitHub Workflows without using Service Account Keys.

This can be achieved thanks to a new feature of GitHub: 
* The GitHub actions OIDC - Read more [here](https://docs.github.com/en/actions/deployment/security-hardening-your-deployments/about-security-hardening-with-openid-connect#adding-permissions-settings). This feature exposes an IDToken in the workflow's variables and in combination with Workload Identity Federation we can exchange GitHub Identities for a GCP Access Token.
* [This GitHub Action authenticates to Google Cloud](https://github.com/marketplace/actions/authenticate-to-google-cloud)


For learning - There is this simple [tutorial](https://www.youtube.com/watch?v=AvRHU-P5Cdg) from scratch which /authenticate-to-google-cloud does for us. 
