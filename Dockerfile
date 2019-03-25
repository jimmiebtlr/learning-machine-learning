FROM ubuntu

# Install terraform
RUN curl -LO https://releases.hashicorp.com/terraform/0.11.8/terraform_0.11.8_linux_amd64.zip && \
  unzip terraform_0.11.8_linux_amd64.zip && \
  cp terraform /usr/local/bin/terraform
