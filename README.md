# testdc
Test Digital Ocean 03 04 2020
```
Create Personal access token DO-API-Tokens/Keys  > keyfile :
"nano export_key" which contains
"export DO_PAT={your token}"
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

```
