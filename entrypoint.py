import os


# Deploy infrastructure in AZURE using terraform. Azure creds are already in env

os.system("terraform chdir=terraform init")
os.system("terraform chdir=terraform plan -auto-approve")
os.system("terraform chdir=terraform apply -auto-approve")

# Use GitHub actions or Azure DevOps pipleine to deploy app to the infrastructure


# When app is deployed, on new commit, run tests and deploy to production if tests pass





