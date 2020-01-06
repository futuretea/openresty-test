FROM openresty/openresty:1.13.6.2-alpine
RUN sed -i "s|http://dl-cdn.alpinelinux.org|https://mirrors.aliyun.com|g" /etc/apk/repositories \
&& apk add wget wrk git make perl perl-utils perl-test-nginx perl-ipc-run bash
RUN git clone https://github.com/openresty/test-nginx.git \
&& cd test-nginx \
&& prove -Itest-nginx/lib -r t
