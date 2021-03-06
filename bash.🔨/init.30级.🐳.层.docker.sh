# should be run by _b00t_
source "/c0de/_b00t_/_b00t_.bashrc"

## THIS COMMAND SEEMS TO WORK FOR DOCKER IN DOCKER. 
# docker run -d --name systemd-ubuntu --tmpfs /tmp --tmpfs /run --tmpfs /run/lock  --mount type=bind,source="/c0de",target="/c0de"  --privileged -v /var/run/docker.sock:/var/run/docker.sock -v /sys/fs/cgroup:/sys/fs/cgroup:ro jrei/systemd-ubuntu
# requires systemd-ubuntu base image. 

## * * * *// 
#* ð³Docker!
## * * * *\\

# REMEMBER:
#  * Obsolete: Swarm => K8, C-Groups => Systemd

## é²¸ \\
# JÄ«ng :: Whale

log_ð¢_è®°å½ "ð¤ normal for docker Not Be Found:"
WHATIS_DOCKER_VERSION=`docker -v`
if [ $? -ne 0 ]; then
    log_ð¢_è®°å½ "ð installing Docker"
    ##* * * * \\
    #* ð¤ Before you install Docker Engine for the first time on a new host machine, 
    #* you need to set up the Docker repository. Afterward, you can install and update 
    #* Docker from the repository.

    # docker not installed
    # https://docs.docker.com/engine/install/ubuntu/
    # ð³ Remove Old Versions
    $SUDO_CMD apt-get remove -y docker docker-engine docker.io containerd runc
    # ð³ð§¹
    $SUDO_CMD apt-get -y update
    # ð³ Install required modules 
    $SUDO_CMD apt-get -y install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg \
        lsb-release
    # ð³ Add Dockers official GPG Key
    DOCKER_GPG_KEYRING="/usr/share/keyrings/docker-archive-keyring.gpg"
    if [ ! -f $DOCKER_GPG_KEYRING ] ; then
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | $SUDO_CMD gpg --dearmor -o $DOCKER_GPG_KEYRING  
    fi 
    # ð³ Use the following command to set up the stable repository
    echo \
        "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) stable" | $SUDO_CMD tee /etc/apt/sources.list.d/docker.list > /dev/null
    # ð³ð§¹
    $SUDO_CMD apt-get update -y
    # ð³
    $SUDO_CMD apt-get install -y docker-ce docker-ce-cli containerd.io
    ##* * * * // 
fi
# ð³ð¥
DOCKER_isHappy=`$SUDO_CMD docker run hello-world`
if [ -n "$DOCKER_isHappy" ] ; then
    echo "ð³ð¥ docker is br0ked. plz fix."
fi


#ð³â ï¸ Adding a user to the âdockerâ group grants them the ability to run 
# containers which can be used to obtain root privileges on the Docker host. 
# Refer to Docker Daemon Attack Surface for more information.
# sudo usermod -aG docker `whoami`

# TODO: link to the Elasticdotventures repository

# doesn't work presently:  
#docker build -t cowsay .
# ð³â»ï¸ Itâs a good habit to use --rm to avoid filling up your system with stale Docker containers.
#docker run --rm cowsay 

# Azure ACI & Docker Compose Docs: 
# https://docs.docker.com/cloud/aci-integration/

# TODO: DOcker Hub Access Tokens
# https://docs.docker.com/docker-hub/access-tokens/

# Docker
## é²¸ //

 docker service create \
    --mount 'type=volume,src=b00t,dst=/c0de/b00t,volume-driver=local'
    --name b00t \
    <IMAGE>

# todo: https://docs.docker.com/storage/bind-mounts/
docker --mount


docker service create \
    --mount type=bind,source=/c0de/b00t,target=/c0de/b00t \
    --name b00t 
