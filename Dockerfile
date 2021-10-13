FROM gitpod/workspace-full:latest

RUN sudo apt-get update && sudo apt-get upgrade && apt-get install -y build-essential

WORKDIR /workspace

RUN git clone https://github.com/ethereum/go-ethereum.git && wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz
RUN tar -C /usr/local -xzf go1.9.3.linux-amd64.tar.gz && export PATH="$PATH:/usr/local/go/bin"
RUN cd go-ethereum && make geth

RUN cd /workspace && mkdir ethreum-datadir

COPY genesis.json /workspace/
