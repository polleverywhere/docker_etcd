FROM progrium/busybox

ENV ETCD_VERSION v0.4.6
ENV ETCD_DATA_DIR /etcddata
ENV ETCD_NAME etcd

RUN opkg-install wget \
  && wget --no-check-certificate -qO etcd.tar.gz https://github.com/coreos/etcd/releases/download/$ETCD_VERSION/etcd-$ETCD_VERSION-linux-amd64.tar.gz \
  && gunzip -c etcd.tar.gz | tar -x -f - \
  && mv /etcd-$ETCD_VERSION-linux-amd64/etcd /etcd-$ETCD_VERSION-linux-amd64/etcdctl /bin/ \
  && rm -rf /etcd-$ETCD_VERSION-linux-amd64 \
  && rm -rf /etcd.tar.gz \
  && opkg-cl remove wget libpcre libopenssl zlib

VOLUME ["/etcddata"]

EXPOSE 4001 7001

CMD ["/bin/etcd"]
