#!/bin/bash

# === Ubuntu ===
## ubuntu 16.04
bootstrap_ubuntu_trusty() {
    IMAGE_URL="https://cloud-images.ubuntu.com/trusty/current/trusty-server-cloudimg-amd64-disk1.img"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="1604"
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

## ubuntu 16.04
bootstrap_ubuntu_xenial() {
    IMAGE_URL="https://cloud-images.ubuntu.com/xenial/current/xenial-server-cloudimg-amd64-disk1.img"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="1604"
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

## ubuntu 18.04
bootstrap_ubuntu_bionic() {
    IMAGE_URL="https://cloud-images.ubuntu.com/bionic/current/bionic-server-cloudimg-amd64.img"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="1804"
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

## ubuntu 20.04
bootstrap_ubuntu_focal() {
    IMAGE_URL="https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="2004"
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

# === Flatcar ===

bootstrap_flatcar() {
    IMAGE_URL="https://stable.release.flatcar-linux.net/amd64-usr/4152.2.1/flatcar_production_openstack_image.img.bz2"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL
    bunzip2 $IMAGE_NAME
    IMAGE_NAME="${IMAGE_NAME%.*}"
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux \
        --property os_distro=debian \
        --property hw_qemu_guest_agent=yes \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    
    cd -
    rm -rf $tmp_dir
}

# === Centos ===


bootstrap_centos_10() {
    IMAGE_URL="https://cloud.centos.org/centos/10-stream/x86_64/images/CentOS-Stream-GenericCloud-10-latest.x86_64.qcow2"
    IMAGE_NAME="centos-generic-cloud"
    IMAGE_VERSION="10"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_centos_9() {
    IMAGE_URL="https://cloud.centos.org/centos/9-stream/x86_64/images/CentOS-Stream-GenericCloud-9-latest.x86_64.qcow2"
    IMAGE_NAME="centos-generic-cloud"
    IMAGE_VERSION="9"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_centos_8() {
    IMAGE_URL="https://cloud.centos.org/centos/8/x86_64/images/CentOS-8-GenericCloud-8.4.2105-20210603.0.x86_64.qcow2"
    IMAGE_NAME="centos-generic-cloud"
    IMAGE_VERSION="8"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_centos_7() {
    IMAGE_URL="https://cloud.centos.org/centos/7/images/CentOS-7-x86_64-GenericCloud-2211.qcow2"
    IMAGE_NAME="centos-generic-cloud"
    IMAGE_VERSION="7"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

# === Fedora ===

bootstrap_fedora_41() {
    IMAGE_URL="https://mirror.umd.edu/fedora/linux/releases/41/Cloud/x86_64/images/Fedora-Cloud-Base-Generic-41-1.4.x86_64.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="41"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_fedora_40() {
    IMAGE_URL="https://mirror.umd.edu/fedora/linux/releases/40/Cloud/x86_64/images/Fedora-Cloud-Base-Generic.x86_64-40-1.14.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="40"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_fedora_39() {
    IMAGE_URL="https://mirror.umd.edu/fedora/linux/releases/39/Cloud/x86_64/images/Fedora-Cloud-Base-39-1.5.x86_64.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="39"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_fedora_39() {
    IMAGE_URL="https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/39/Cloud/x86_64/images/Fedora-Cloud-Base-39-1.5.x86_64.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="39"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_fedora_38() {
    IMAGE_URL="https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/38/Cloud/x86_64/images/Fedora-Cloud-Base-38-1.6.x86_64.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="38"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_fedora_37() {
    IMAGE_URL="https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/37/Cloud/x86_64/images/Fedora-Cloud-Base-37-1.7.x86_64.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="37"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=centos \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}


bootstrap_fedora_36() {
    IMAGE_URL="https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/36/Cloud/x86_64/images/Fedora-Cloud-Base-36-1.5.x86_64.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="36"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=fedora \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=fedora \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}


bootstrap_fedora_35() {
    IMAGE_URL="https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/35/Cloud/x86_64/images/Fedora-Cloud-Base-35-1.2.x86_64.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="35"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=fedora \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=fedora \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_fedora_34() {
    IMAGE_URL="https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/34/Cloud/x86_64/images/Fedora-Cloud-Base-34-1.2.x86_64.qcow2"
    IMAGE_NAME="fedora-cloud-base"
    IMAGE_VERSION="34"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=fedora \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=fedora \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_rocky_9() {
    IMAGE_URL="https://dl.rockylinux.org/pub/rocky/9/images/x86_64/Rocky-9-GenericCloud.latest.x86_64.qcow2"
    IMAGE_NAME="rocky-generic-cloud"
    IMAGE_VERSION="9"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=rocky \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=rocky \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_rocky_8() {
    IMAGE_URL="https://dl.rockylinux.org/pub/rocky/8/images/x86_64/Rocky-8-GenericCloud-Base.latest.x86_64.qcow2"
    IMAGE_NAME="rocky-generic-cloud"
    IMAGE_VERSION="8"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=rocky \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=rocky \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}


bootstrap_freebsd_142() {
    IMAGE_URL="https://object-storage.public.mtl1.vexxhost.net/swift/v1/1dbafeefbd4f4c80864414a441e72dd2/bsd-cloud-image.org/images/freebsd/14.2/2024-12-08/zfs/freebsd-14.2-zfs-2024-12-08.qcow2"
    IMAGE_NAME="freebsd-zfs"
    IMAGE_VERSION="142"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=bsd --property os_distro=freebsd \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=bsd --property os_distro=freebsd \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_freebsd_134() {
    IMAGE_URL="https://object-storage.public.mtl1.vexxhost.net/swift/v1/1dbafeefbd4f4c80864414a441e72dd2/bsd-cloud-image.org/images/freebsd/13.4/2024-10-28/zfs/freebsd-13.4-zfs-2024-10-28.qcow2"
    IMAGE_NAME="freebsd-zfs"
    IMAGE_VERSION="134"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=bsd --property os_distro=freebsd \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=bsd --property os_distro=freebsd \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_alpine_3205() {
    IMAGE_URL="https://dl-cdn.alpinelinux.org/alpine/v3.20/releases/cloud/generic_alpine-3.20.5-x86_64-bios-cloudinit-r0.qcow2"
    IMAGE_NAME="alpine-generic"
    IMAGE_VERSION="3205"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=alpine \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=alpine \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}


bootstrap_alpine_3212() {
    IMAGE_URL="https://dl-cdn.alpinelinux.org/alpine/v3.21/releases/cloud/generic_alpine-3.21.2-x86_64-bios-cloudinit-r0.qcow2"
    IMAGE_NAME="alpine-generic"
    IMAGE_VERSION="3212"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=alpine \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=alpine \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

bootstrap_arch() {
    IMAGE_URL="https://gitlab.archlinux.org/archlinux/arch-boxes/-/package_files/8115/download"
    IMAGE_NAME="arch-linux"
    IMAGE_VERSION="v20241201.284788"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget -O "$IMAGE_NAME" $IMAGE_URL
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=arch \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --property os_type=linux --property os_distro=arch \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}


bootstrap_windows_7() {
    IMAGE_URL="https://mirrors.rit.edu/oszoo/Win7.qcow2"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="7"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL    
    openstack image create --disk-format $IMAGE_FORMAT \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}


bootstrap_windows_8() {
    IMAGE_URL="https://mirrors.rit.edu/oszoo/Win8.1.qcow2"
    IMAGE_NAME=$(basename $IMAGE_URL)
    IMAGE_VERSION="8"
    IMAGE_FORMAT="qcow2"

    if openstack image show ${IMAGE_NAME%.*}-$IMAGE_VERSION-current 2>&1 1>/dev/null; then 
        openstack image delete ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    fi

    tmp_dir=$(mktemp -d)
    cd $tmp_dir

    wget $IMAGE_URL    
    openstack image create --disk-format $IMAGE_FORMAT \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-current
    
    openstack image create --disk-format $IMAGE_FORMAT \
        --container-format bare --public --file ./$IMAGE_NAME ${IMAGE_NAME%.*}-$IMAGE_VERSION-$(date +%Y%m%d)

    cd -
    rm -rf $tmp_dir
}

# bootstrap_windows_7
# bootstrap_windows_8

# bootstrap_fedora_41
# bootstrap_fedora_40
# bootstrap_fedora_39
# bootstrap_fedora_38
# bootstrap_fedora_37
# bootstrap_fedora_36
# bootstrap_fedora_35
# bootstrap_fedora_34

# bootstrap_centos_10
# bootstrap_centos_9
# bootstrap_centos_8
# bootstrap_centos_7

# bootstrap_rocky_9
# bootstrap_rocky_8

bootstrap_freebsd_142
bootstrap_freebsd_134

bootstrap_alpine_3205
bootstrap_alpine_3212

# bootstrap_ubuntu_trusty
# bootstrap_ubuntu_xenial
# bootstrap_ubuntu_bionic
# bootstrap_ubuntu_focal
# bootstrap_ubuntu_jammy
# bootstrap_ubuntu_noble

# bootstrap_debian_bookworm
# bootstrap_debian_bullseye
# bootstrap_debian_buster

# bootstrap_flatcar