FROM mcr.microsoft.com/devcontainers/python:3.12-bullseye  

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
    sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    sudo apt-get update && sudo apt-get install packer

RUN pip install python-openstackclient