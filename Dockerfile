FROM docker:29

RUN apk update
RUN apk upgrade
RUN apk add --no-cache --update python3 py3-pip coreutils bash
RUN rm -rf /var/cache/apk/*
RUN pip3 install --break-system-packages pyyaml
RUN pip3 install --break-system-packages -U 'awscli>=1.44'
RUN apk --purge -v del py3-pip

ADD entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]
