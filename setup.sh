#! /bin/bash
# Programming and idea by : Mohammad Hossein Salehinezhad
# GitLab : https://github.com/mrunix1998/docker-minio-cluster.git 
# Email : salehimohammad331@gmail.com
# Last update : Wed, 23 Feb 2022 17:09:25 +0330
# Minio v1.0.0 [Minio]
# -------------------------------------------------------------------------------------------------------------------------- #



if [ "$1" = "up" ]; then

        # install some packages # ------------------------------------------------------------------------------------------ #
        apt-get install docker-compose figlet -y
        [ "$?" != "0" ] && echo -e '\e[31m[>] We can not install docker-compose figlet\e[39m' && exit 1
        apt-get clean
        sleep 1
        clear
        # ------------------------------------------------------------------------------------------------------------------ #


        # check nginx image in docker localhost repo # --------------------------------------------------------------------- #
        docker images | grep quay.io/minio/minio | grep RELEASE.2022-02-18T01-50-10Z &> /dev/null
        if [ "$?" != "0" ] ; then
                echo -e "\e[31m[>] Can not find minio image \e[39m"
                echo -e "\e[32m[>] You should pull it with below commad :\e[39m"
                echo -e "\e[36m[>] docker pull quay.io/minio/minio:RELEASE.2022-02-18T01-50-10Z \e[39m"
                exit 1
        fi
        # ------------------------------------------------------------------------------------------------------------------ #


        # check nginx image in docker localhost repo # --------------------------------------------------------------------- #
        docker images | grep nginx | grep 1.19.2-alpine &> /dev/null
        if [ "$?" != "0" ] ; then
                echo -e "\e[31m[>] Can not find nginx latest image\e[39m"
                echo -e "\e[32m[>] You should pull it with below commad :\e[39m"
                echo -e "\e[36m[>] docker pull nginx:1.19.2-alpine \e[39m"
                exit 1
        fi
        # ------------------------------------------------------------------------------------------------------------------ #


        # move dirs to /mnt/shetab/docker/apps/jira/ # ---------------------------------------------------------------------------------- #
        mkdir /mnt/docker/apps/nginx -p &> /dev/null

        if [ ! -d /mnt/docker/apps/nginx/certs ] ; then
                cp -r nginx/certs /mnt/docker/apps/nginx/
        fi

        if [ ! -d /mnt/docker/apps/nginx/conf.d ] ; then
                cp -r nginx/nginx.conf /mnt/docker/apps/nginx/
        fi
        # ------------------------------------------------------------------------------------------------------------------------------- #


        # launch project # ------------------------------------------------------------------------------------------------- #
        echo '[>] ------------------------------------------------------------ [<]'
        figlet -ptk -f slant Minio-Cluster
            docker-compose -f docker-compose.yml up -d
        echo -e "\e[32m[>] All minio files : /mnt/docker/apps/minio/ \e[39m"
        echo -e "\e[32m[>] All nginx files : /mnt/docker/apps/nginx/ \e[39m"
        echo '[>] ------------------------------------------------------------ [<]'

        exit 0
        # ------------------------------------------------------------------------------------------------------------------ #

elif [ "$1" = "down" ]; then

        # install some packages # ------------------------------------------------------------------------------------------ #
        apt-get install docker-compose figlet -y
        [ "$?" != "0" ] && echo -e "\e[31m[>] We can not install docker-compose figlet\e[39m" && exit 1
        apt-get clean
        sleep 1
        clear
        # ------------------------------------------------------------------------------------------------------------------ #


        # down project # --------------------------------------------------------------------------------------------------- #
        echo '[>] ------------------------------------------------------------ [<]'
        figlet -ptk -f slant Minio-Cluster
            docker-compose -f docker-compose.yml down
        echo '[>] ------------------------------------------------------------ [<]'
        # ------------------------------------------------------------------------------------------------------------------ #


        # print msg in terminal # ------------------------------------------------------------------------------------------ #
        echo -en "\e[31m[>] It will be delete all files and certs [press to continue] \e[39m" ; read q
        unset q
        # ------------------------------------------------------------------------------------------------------------------ #


        # remove all nginx files # ----------------------------------------------------------------------------------------- #
        rm -rf /mnt/docker/apps/minio/ &> /dev/null
        # ------------------------------------------------------------------------------------------------------------------ #

        # remove all nginx files # ----------------------------------------------------------------------------------------- #
        rm -rf /mnt/docker/apps/nginx/ &> /dev/null
        # ------------------------------------------------------------------------------------------------------------------ #
        
	exit 0

fi

echo -e "\e[32m[>] bash setup.sh up {launch project}\e[39m"
echo -e "\e[36m[>] bash setup.sh down {down project}\e[39m"
