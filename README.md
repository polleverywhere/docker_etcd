# Docker etcd image

This is a smaller (25 MB) etcd image built from the `progrium/busybox` base. We needed an image that contained `/bin/echo` so that it was compatibile with [Fig](http://www.fig.sh/). All other etcd images found were based on `ubuntu` or something larger.

There are two configuration environment variables set, `ETCD_DATA_DIR` which is a Docker volume at `/etcddata`, and `ETCD_NAME` which is set to `etcd`. See https://coreos.com/docs/distributed-configuration/etcd-configuration/ for environment variables that can be passed for configuration.
