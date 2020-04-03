# testdc
Test Digital Ocean 03 04 2020
```
Create Personal access token DO-API-Tokens/Keys  > keyfile :
"nano export_key" which contains

export DO_PAT={your token}
export FLOATING_IP=45.55.X.X
```

```
Import token from file export_key into env:
"source export_key"
Test
"env | grep DO_PAT"
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
Start terraform plan

terraform plan -out=tfplan -input=false 
  -var "do_token=${DO_PAT}" \
  -var "pub_key=$HOME/.ssh/digital_ocean_rsa.pub" \
  -var "pvt_key=$HOME/.ssh/digital_ocean_rsa" \
  -var "ssh_fingerprint=f7:19:8a:b5:73:cc:46:5f:7b:be:0c:56:5d:41:96:b0" \
  -var "digitalocean_floating_ip=$FLOATING_IP"
terraform apply tfplan

```
