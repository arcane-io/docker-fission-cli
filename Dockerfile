FROM arcaneio/kubectl:gcloud-sdk

RUN apk add --update --no-cache \
            bash-completion \
            bzip2 \
            gzip \
            tar \
            wget

ENV FISSION_VERSION "0.11.0"

RUN curl -Lo fission https://github.com/fission/fission/releases/download/${FISSION_VERSION}/fission-cli-linux && chmod +x fission && mv fission /usr/local/bin/