FROM gitpod/workspace-full:latest

RUN sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install -y build-essential

USER gitpod

RUN wget https://github.com/ethereum/go-ethereum/archive/refs/tags/v1.10.8.tar.gz && wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz
RUN tar -C . -xzf v1.10.8.tar.gz && \
    rm v1.10.8.tar.gz && \
    sudo tar -C /usr/local -xzf go1.9.3.linux-amd64.tar.gz && \
    rm go1.9.3.linux-amd64.tar.gz && \
    export PATH="$PATH:/usr/local/go/bin"
RUN sudo chown -R gitpod /workspace && sudo chmod -R 700 /workspace
RUN mv go-ethereum-1.10.8 go-ethreum && cd go-ethereum && make geth
RUN npm install -g pm2

RUN echo 'export PATH=$PATH:/home/gitpod/go-ethereum/build/bin' >> ~/.bashrc