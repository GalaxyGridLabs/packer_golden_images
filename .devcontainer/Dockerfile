FROM mcr.microsoft.com/devcontainers/python:3.12-bullseye  

RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - && \
    echo "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/packer.list && \
    sudo apt-get update && sudo apt-get install packer

RUN pip install python-openstackclient

# Persist Bash History
RUN SNIPPET="export PROMPT_COMMAND='history -a' && export HISTFILE=/commandhistory/.bash_history" \
    && echo $SNIPPET >> "/etc/skel/.bashrc"
