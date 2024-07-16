 for kubectl configuration
KUBECTL_VERSION="v1.21.0"
K8S_SERVER="https://ccnp-dev01.api.intraorange"
K8S_CA_CERT=$(cat <<'EOF'
-----BEGIN CERTIFICATE-----
MIIC6jCCAdKgAwIBAgIBADANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDEwprdWJl
cm5ldGVzMB4XDTI0MDExNzEzMTQ1NloXDTM0MDExNDEzMTk1NlowFTETMBEGA1UE
AxMKa3ViZXJuZXRlczCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOzb
TpmHzKMqplK2IyK3npSubCu3t1fWOeQPfNg/gtiWTwxHJtBBoJ/d8g7lHizw1LzG
PRlzSp7mKadAWBY5Fjj+ohrvvhDSNi/YiZyYinBIkVwWdyGr9H6CNvgUDRM9krGT
gpwMtgvr0+5p/37BWS3GiO4WkniULzdodQ0d1ymaTnbFYddNKAZsrmxqCMOfBRNE
Ie5/PiAcBSeqAPZE15sIFLcbd9k2i7hx4FdeBHjWM+mQ3I4EetQKYx9HTidwtFJx
XMHCz2isA1pux8uMDDG7yOt/zPNR+WOKOkxI7CiwoRlzwps2vmVcaDLvUBimK6LC
u8MuBSO5Ke/uVRYRSO8CAwEAAaNFMEMwDgYDVR0PAQH/BAQDAgKkMBIGA1UdEwEB
/wQIMAYBAf8CAQAwHQYDVR0OBBYEFFKa9UuaySl1tqChQGuWCzZ3xfZVMA0GCSqG
SIb3DQEBCwUAA4IBAQBh2ts34PshMT4khhAw1V1MS6Vf0MGCHhGfhZlkXbWYoLFk
VnXN+AZ2jgnxMOA7OFZd/ETCWqIa3twCnMnRfqBnl9uuJ0NcoOGdeYHbm5RElMLP
zAeVVogQWYL32l8NZAbsXiyehTG4kM8FJNEn/eZLT8WBO0lEqm4RiRaDisuEf52Y
RMaHVvaItzeBAOM7+m/ATJraQoKBJ2RdAyh26mwcpuvzRUtEHyWW5F91vZuaI/IS
lPVgLVpQQ4BH+f3ZPlATJJDu0YHCv0d65sJTZTPmheAwGgBad5523M0ugl0+HMS+
70MLcxRW7Zpb3/xj6P2papV+ntDOAoueHjGJeWMo
-----END CERTIFICATE-----
EOF
)
K8S_IDP_ISSUER_URL="https://auth.ccnp-dev01.com.intraorange"
K8S_CLIENT_ID="loginapp"
K8S_CLIENT_SECRET="4TORGiNV9M54BTk1v7dNuFSaI6hUdrth"
K8S_REFRESH_TOKEN="Chltd3hyaXB1endxZmduYWQ0cTJxcjR5amR0EhlwM2RrbDNnb2htenpndzZqYno1ZzZ5ZmJu"
K8S_ID_TOKEN="eyJhbGciOiJSUzI1NiIsImtpZCI6IjA4MjExMThiOWEyOTY1ODdlZDI2OThkMTIxNGJlZjNjMWE2YTJkZTAifQ.eyJpc3MiOiJodHRwczovL2F1dGguY2NucC1kZXYwMS5jb20uaW50cmFvcmFuZ2UiLCJzdWIiOiJDZ2hqYUhkeU56SXlNaElOYjNKaGJtZGxZMjl1Ym1WamRBIiwiYXVkIjoibG9naW5hcHAiLCJleHAiOjE3MjExNjQxNzksImlhdCI6MTcyMTA3Nzc3OSwiYXRfaGFzaCI6IjdVaWp3X2pCY1VoMVhkRWVqSXpwSHciLCJjX2hhc2giOiJuZWR2bFpTQWRXZEJLNU5OV0JzVGlRIiwiZW1haWwiOiJhYmRlbHJhaG1hbi5iYWRyQG9yYW5nZS5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwibmFtZSI6ImNod3I3MjIyIiwicHJlZmVycmVkX3VzZXJuYW1lIjoiQWJkZWxyYWhtYW4gQmFkciJ9.WJyLk4wNfXuRUvJYmSX3JARlOeYg5ysDiHLv00L-sW28JnOCMrhYis5eTk4KkIKzwWdhINWK_6e64wcKO75bg46WWFX16vNMw1QoaHn4uCiSp1FI_iOwwjeburbvR8pdJcyJUJOv-2wuPu1LvsMUbgxuUsjJEBDd0qlrAsNHbalzjmHu9XxU5Q56Atr6yESdb9CW6oIu7MwPysBq0Q9TFPez_68dbzD6z9M-rqnF7XSWFDJSVszhpQwC24iD4yhIUvMQ0Nzu0uh7us31kAqz4-Hok6Pp44LevHg4L8wStJshnzcTUyXj1IYNOtoBO7Tg7Gk91KZQdyf5k7qouH0h5Q"

# Update package list and install curl
sudo apt-get update
sudo apt-get install -y curl

# Install kubectl
echo "Installing kubectl..."
curl -LO "https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
kubectl version --client

# Configure kubectl
echo "Configuring kubectl..."
mkdir -p ~/.kube/certs/OBSIT-cluster-ccnp-dev01/
echo "$K8S_CA_CERT" > ~/.kube/certs/OBSIT-cluster-ccnp-dev01/k8s-ca.crt

kubectl config set-cluster OBSIT-cluster-ccnp-dev01 \
    --certificate-authority=${HOME}/.kube/certs/OBSIT-cluster-ccnp-dev01/k8s-ca.crt \
    --server=$K8S_SERVER

kubectl config set-credentials abdelrahman.badr-OBSIT-cluster-ccnp-dev01 \
    --auth-provider=oidc \
    --auth-provider-arg="idp-issuer-url=$K8S_IDP_ISSUER_URL" \
    --auth-provider-arg="client-id=$K8S_CLIENT_ID" \
    --auth-provider-arg="client-secret=$K8S_CLIENT_SECRET" \
    --auth-provider-arg="refresh-token=$K8S_REFRESH_TOKEN" \
    --auth-provider-arg="id-token=$K8S_ID_TOKEN"

kubectl config set-context abdelrahman.badr-OBSIT-cluster-ccnp-dev01 \
    --cluster=OBSIT-cluster-ccnp-dev01 \
    --user=abdelrahman.badr-OBSIT-cluster-ccnp-dev01

kubectl config use-context abdelrahman.badr-OBSIT-cluster-ccnp-dev01

echo "kubectl has been configured successfully."

