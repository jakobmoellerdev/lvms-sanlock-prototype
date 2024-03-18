# SPDX-License-Identifier: Apache-2.0

# CentOS Stream 9 doesn't provide package nbd
FROM quay.io/fedora/fedora:39

RUN dnf install -qy lvm2-lockd nbd nbdkit-basic-plugins sanlock util-linux && dnf clean all

WORKDIR /lvms

# prevent LVM commands from failing due to thinking that lvmlockd isn't running
RUN touch /run/lvmlockd.pid

COPY conf/lvm.conf /etc/lvm/

ENTRYPOINT []

