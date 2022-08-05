FROM busybox

COPY --from=ctfd/ctfd / /

COPY ./contrib /usr/local/bin

RUN git clone https://github.com/hmrserver/CTFd-theme-pixo.git /opt/CTFd/CTFd/themes/pixo && \
  git clone https://github.com/noraj/ctfd-theme-sigsegv2.git /opt/CTFdCTFd/themes/sigsegv2 && \
  git clone https://github.com/0xdevsachin/CTFD-crimson-theme.git /opt/CTFd/CTFd/themes/crimson

RUN chown -R 1001:0 /opt/CTFd /var/log/CTFd /var/uploads && \
  /usr/local/bin/fix-permissions /opt/CTFd &&\
  /usr/local/bin/fix-permissions /var/log/CTFd &&\
  /usr/local/bin/fix-permissions /var/uploads

WORKDIR /opt/CTFd

USER 1001
EXPOSE 8000
ENTRYPOINT ["/opt/CTFd/docker-entrypoint.sh"]
