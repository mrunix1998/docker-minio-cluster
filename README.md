![Visits Badge](https://badges.pufler.dev/visits/mrunix1998/docker-minio-cluster)
![GitHub last commit](https://img.shields.io/github/last-commit/mrunix1998/docker-minio-cluster)
[![GitHub issues](https://img.shields.io/github/issues/mrunix1998/docker-minio-cluster)](https://github.com/mrunix1998/docker-minio-cluster/issues)
[![GitHub stars](https://img.shields.io/github/stars/mrunix1998/docker-minio-cluster)](https://github.com/mrunix1998/docker-minio-cluster/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/mrunix1998/docker-minio-cluster)](https://github.com/mrunix1998/docker-minio-cluster/network)
[![made-with-bash](https://img.shields.io/badge/Made%20with-Bash-1f425f.svg)](https://www.gnu.org/software/bash/)


<a href="https://www.linkedin.com/in/mrunix1998/" style="text-align:center">
  <img
    alt="Linkedin"
    src="https://img.shields.io/badge/linkedin-0077B5?logo=linkedin&logoColor=white&style=for-the-badge"
  />
</a>

# Docker-settings
For changing docker to use another path to save config and volumes follow the steps below:

## Stop docker

```bash
systemctl stop docker.service docker.socket
```

## Change settings

First create lib's for docker libraries

```bash
mkdir -p /mnt/docker/lib
```
Then edit docker service 

```bash
vim /lib/systemd/system/docker.service
```

```bash
ExecStart=/usr/bin/dockerd -g /mnt/docker/lib -H fd:// --containerd=/run/containerd/containerd.sock
```

## Restart docker

```bash
systemctl daemon-reload
systemctl start docker
```
# Docker-minio-cluster
Minio Clustering on 4 nodes

## Cloning project 

```bash
cd /root
git clone https://github.com/mrunix1998/docker-minio-cluster.git
```

## Quick Start

1 - Creating certs :

```bash
cd nginx/certs/
```

**note** : you should set your dns domain name in common name section.

```bash
bash create_certs.sh
```

Then insert information that cert needs that

2 - Changing domain in nginx.conf [line 42, 49] :

```bash
vim /root/docker-minio-cluster/nginx/nginx.conf
```

3 - Changing minio consule password in docker-compsoe.yml [ MINIO_ROOT_PASSWORD in line 12]:

```bash
vim /root/docker-minio-cluster/docker-compose.yml
```

4 - Running setup.sh file :

```bash
cd /root/docker-minio-cluster/
```

```bash
bash setup.sh up
```

**After you running the setup.sh file, you can reach minio consule in the web with** --> http://domain_name

## Quick Terminate

```bash
bash setup.sh down
```
