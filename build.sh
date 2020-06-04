#!/bin/bash

set -ex

qcow2_image="${1}"

if [ -z "${qcow2_image}" ]; then
	qcow2_image='https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img'
fi

workdir=$(mktemp -d)

wget -P ${workdir} ${qcow2_image}

image=$(echo ${qcow2_image} | sed -e 's#^.*/\([^/]*\)$#\1#g')

imagedir=${workdir}/qcow2
rootfs=${workdir}/rootfs

mkdir ${imagedir}
mkdir ${rootfs}

guestmount -a ${workdir}/${image} -m /dev/sda1 ${imagedir}

cp -rp ${imagedir}/* ${rootfs}/

umount ${imagedir}

mkdir ${workdir}/build/

pushd ${rootfs}
tar czf ${workdir}/build/${image}.tar.gz *
popd

if [ -d /vagrant ]; then
	mkdir /vagrant/build/
	mv ${workdir}/build/* /vagrant/build/
fi
