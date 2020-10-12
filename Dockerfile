# Container image that runs your code
FROM alpine:latest

# install necessary tools (wget, unzip, git, jq, GitHub CLI, AWS CLI)
RUN apk add --update \
    ca-certificates git wget zip unzip jq \
    aws-cli aws-cli-doc bash make go

# Copies your code file from your action repository to the filesystem path `/` of the container

WORKDIR /tmp/
RUN git clone https://github.com/cli/cli.git gh-cli && \
    cd gh-cli && \
    make && \
    mv ./bin/gh /usr/local/bin/
WORKDIR / 

ADD entrypoint.sh /entrypoint2.sh
# Code file to execute when the docker container starts up (`entrypoint.sh`)
#ENTRYPOINT ["/entrypoint2.sh"]
RUN /entrypoint2.sh