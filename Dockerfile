FROM openresty/openresty:1.13.6.2-alpine
RUN sed -i "s|http://dl-cdn.alpinelinux.org|https://mirrors.aliyun.com|g" /etc/apk/repositories \
&& apk add wget wrk git make perl perl-utils perl-test-nginx perl-ipc-run
RUN git clone https://github.com/openresty/test-nginx.git \
&& cd test-nginx \
&& prove -Itest-nginx/lib -r t
RUN echo "#!/bin/sh" > /entrypoint.sh && echo "prove -r ./t/">>/entrypoint.sh && chmod +x /entrypoint.sh
WORKDIR /test
VOLUME /test
ENTRYPOINT /entrypoint.sh