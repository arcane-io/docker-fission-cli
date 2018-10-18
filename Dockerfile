FROM arcaneio/kubectl:gcloud-sdk

RUN apk add --update --no-cache \
            bash-completion \
            bzip2 \
            gzip \
            tar \
            wget

ENV FISSION_VERSION "0.11.0"
ENV GLIBC_VERSION "2.28-r0"

RUN apk --no-cache add ca-certificates wget \
    && wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub \
    && wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_VERSION}/glibc-${GLIBC_VERSION}.apk \
    && apk add glibc-${GLIBC_VERSION}.apk

RUN curl -Lo fission https://github.com/fission/fission/releases/download/${FISSION_VERSION}/fission-cli-linux && chmod +x fission && mv fission /usr/local/bin/