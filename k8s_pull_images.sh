#!/bin/bash
registry_url=registry.cn-hangzhou.aliyuncs.com/wader-k8s

# pull k8s images
images_list=(
    kube-proxy-amd64:v1.11.1
    kube-scheduler-amd64:v1.11.1
    kube-apiserver-amd64:v1.11.1
    kube-controller-manager-amd64:v1.11.1
    coredns:1.1.3
    etcd-amd64:3.2.18
    pause:3.1
)

for image in ${images_list[@]}
do
    cur_image=${registry_url}/${image}
    echo "pull image ==>" ${cur_image}
    docker pull ${cur_image}
    docker tag ${cur_image} k8s.gcr.io/${image}
done

# pull flannel image
cur_image=${registry_url}/flannel:v0.11.0-amd64
docker pull ${cur_image}
docker tag ${cur_image} quay.io/coreos/flannel:v0.11.0-amd64