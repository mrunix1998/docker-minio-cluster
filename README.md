# docker-minio-cluster
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

**After you running the setup.sh file, you can reach minio consule in the web with ** --> http://domain_name
