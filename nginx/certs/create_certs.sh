#! /bin/bash
# Programming and idea by : Mohammad Hossein Salehinezhad
# GitLab : 
# Email : salehimohammad331@gmail.com
# Last update : Wed, 23 Feb 2022 17:09:25 +0330
# Minio-nginx v1.0.0 [Nginx]
# -------------------------------------------------------------------------------------------------------------------------- #

openssl genrsa -out PrivateKey.key
openssl req -new -key PrivateKey.key -out request.csr
openssl x509 -req -days 365 -in request.csr -signkey PrivateKey.key -out PublicKey.crt

rm request.csr
