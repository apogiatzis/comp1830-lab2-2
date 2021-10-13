FROM gitpod/workspace-full:latest

RUN sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get install -y build-essential

USER gitpod

RUN git clone https://github.com/ethereum/go-ethereum.git && wget https://dl.google.com/go/go1.9.3.linux-amd64.tar.gz
RUN sudo tar -C /usr/local -xzf go1.9.3.linux-amd64.tar.gz && rm go1.9.3.linux-amd64.tar.gz && export PATH="$PATH:/usr/local/go/bin"
RUN sudo chown -R gitpod /workspace && sudo chmod -R 700 /workspace
RUN cd go-ethereum && make geth

RUN echo 'export PATH=$PATH:/home/gitpod/go-ethereum/build/bin' >> ~/.bashrc
