FROM ubuntu
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y gnupg software-properties-common curl jq postgresql && \
    curl https://apt.releases.hashicorp.com/gpg | gpg --dearmor > hashicorp.gpg && \
    install -o root -g root -m 644 hashicorp.gpg /etc/apt/trusted.gpg.d/ && \
    apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
    apt install terraform -y

