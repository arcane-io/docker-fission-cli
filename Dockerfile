FROM arcaneio/kubectl

RUN apk add --update --no-cache \
            bash-completion \
            bzip2 \
            gzip \
            tar 

ENV FISSION_VERSION="0.11.0"

RUN curl -Lo fission https://github.com/fission/fission/releases/download/0.11.0/fission-cli-linux && chmod +x fission && mv fission /usr/local/bin/