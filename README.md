# testdc
Test Digital Ocean 03 04 2020
```
Create Personal access token (DO-API-Tokens/Keys) .
Create new ssh keys and get md5 fingerprint.
ssh-keygen -E md5 -lf ./digital_ocean_rsa.pub

```

```
Fill terraform.tfvars file with your secrets :
do_token = "<Your API Digitalocean token>"
pub_key="/testgomage/digital_ocean_rsa.pub" #Path to pubkey
pvt_key="/testgomage/digital_ocean_rsa"   #Path to secret key
ssh_fingerprint="<Your public key fingerpint>" 


```

```
Install terraform11

curl https://releases.hashicorp.com/terraform/0.11.14/terraform_0.11.14_linux_amd64.zip -o "terraform.zip"
unzip terraform.zip
cp terraform /usr/local/bin/terraform
chmod u+x /usr/local/bin/terraform
terraform version

Terraform v0.11.14
```

```
terraform init -var-file=terraform.tfvars
terraform plan -var-file=terraform.tfvars
terraform apply

```
