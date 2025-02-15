#!/bin/bash

# === Ubuntu ===
## ubuntu 20.04
bootstrap_ubuntu_focal() {
    IMAGE_URL="https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="20.04"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    openstack image create --disk-format $IMAGE_FORMAT --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-$(date +%Y%m%d)
    cd -
    rm -rf $tmp_dir
}

## ubuntu 22.04
bootstrap_ubuntu_jammy() {
    IMAGE_URL="https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="2204"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    openstack image create --disk-format $IMAGE_FORMAT --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-$(date +%Y%m%d)
    cd -
    rm -rf $tmp_dir
}

## ubuntu 24.04
bootstrap_ubuntu_noble() {
    IMAGE_URL="https://cloud-images.ubuntu.com/noble/current/noble-server-cloudimg-amd64.img"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="2404"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL    
    openstack image create --disk-format $IMAGE_FORMAT --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    openstack image create --disk-format $IMAGE_FORMAT --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}


# === Debian ===
## Debian 12
bootstrap_debian_bookworm() {
    IMAGE_URL="https://cloud.debian.org/images/cloud/bookworm/latest/debian-12-generic-amd64.qcow2"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="12"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL    
    openstack image create --disk-format $IMAGE_FORMAT --property hw_disk_bus=scsi \
        --property hw_scsi_model=virtio-scsi --property os_type=linux \
        --property os_admin_user=debian --property os_distro=debian \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT --property hw_disk_bus=scsi \
        --property hw_scsi_model=virtio-scsi --property os_type=linux \
        --property os_admin_user=debian --property os_distro=debian \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}


## Debian 11
bootstrap_debian_bullseye() {
    IMAGE_URL="https://cloud.debian.org/images/cloud/bullseye/latest/debian-11-generic-amd64.qcow2"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="11"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL    
    openstack image create --disk-format $IMAGE_FORMAT --property hw_disk_bus=scsi \
        --property hw_scsi_model=virtio-scsi --property os_type=linux \
        --property os_admin_user=debian --property os_distro=debian \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT --property hw_disk_bus=scsi \
        --property hw_scsi_model=virtio-scsi --property os_type=linux \
        --property os_admin_user=debian --property os_distro=debian \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_debian_buster() {
    IMAGE_URL="https://cloud.debian.org/images/cloud/buster/latest/debian-10-generic-amd64.qcow2"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="10"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL    
    openstack image create --disk-format $IMAGE_FORMAT --property hw_disk_bus=scsi \
        --property hw_scsi_model=virtio-scsi --property os_type=linux \
        --property os_admin_user=debian --property os_distro=debian \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT --property hw_disk_bus=scsi \
        --property hw_scsi_model=virtio-scsi --property os_type=linux \
        --property os_admin_user=debian --property os_distro=debian \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

## Main
bootstrap_ubuntu_focal
bootstrap_ubuntu_jammy
bootstrap_ubuntu_noble

bootstrap_debian_bookworm
bootstrap_debian_bullseye
bootstrap_debian_buster