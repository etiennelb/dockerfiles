FROM golang:alpine

RUN apk add --update git bash openssl curl zsh
RUN go get github.com/sachaos/todoist

WORKDIR $GOPATH/src/github.com/sachaos/todoist

RUN go install
ARG TODOIST_API_TOKEN
RUN echo '{"token": "##TOKEN##", "color":"true"}' >> $HOME/.todoist.config.json
RUN sed -i 's|##TOKEN##|'$TODOIST_API_TOKEN'|g' $HOME/.todoist.config.json

# install PECO
RUN curl -SsL -o peco.tar.gz https://github.com/peco/peco/releases/download/v0.5.3/peco_linux_amd64.tar.gz
RUN tar xvzf peco.tar.gz
RUN mv peco_linux_amd64/peco /usr/bin/peco

WORKDIR $GOPATH

# TODO change shell to zsh
# SHELL ["/bin/zsh"]
# TODO source todoist_functions

RUN echo 'alias todoist="todoist sync && todoist"' >> $HOME/.zshrc
RUN echo 'alias todoist="todoist sync && todoist"' >> $HOME/.bashrc
RUN source $HOME/.bashrc
#RUN source todoist_functions.sh

