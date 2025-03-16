FROM ubuntu:20.04
ENV NVM_DIR=/usr/local/nvm
ENV NODE_VERSION=v20.18.2
RUN mkdir -p /usr/local/nvm && apt-get update && echo "y" | apt-get install curl
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use --delete-prefix $NODE_VERSION"
ENV NODE_PATH=$NVM_DIR/versions/node/$NODE_VERSION/bin
ENV PATH=$NODE_PATH:$PATH
RUN apt install p7zip-full -y
WORKDIR /root
COPY test.7z test.7z
COPY cmd.sh cmd.sh
RUN chmod +x cmd.sh
CMD ["sh", "cmd.sh"]