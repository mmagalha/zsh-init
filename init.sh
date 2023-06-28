#!/bin/bash

sudo apt install curl -y

echo "Add Sublime Repo"

curl -fsSL https://download.sublimetext.com/sublimehq-pub.gpg | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/sublimehq-archive.gpg
echo "deb [signed-by=/usr/share/keyrings/sublimehq-archive.gpg] https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

echo "Add K8S Repo"

curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

echo "Add Helm Repo"
curl https://baltocdn.com/helm/signing.asc | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/helm.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list


echo "Add vscode Repo"
curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --batch --yes --dearmor -o  /usr/share/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

sudo apt-get update

sudo apt-get install sublime-text kubectl helm code -y