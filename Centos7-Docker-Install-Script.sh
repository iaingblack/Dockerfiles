yum update -y

tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

yum install docker-engine -y
systemctl enable docker
systemctl start docker

curl -L https://github.com/docker/compose/releases/download/1.8.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

curl -L https://github.com/docker/machine/releases/download/v0.8.2/docker-machine-`uname -s`-`uname -m` > /usr/local/bin/docker-machine && \
chmod +x /usr/local/bin/docker-machine

docker-compose --version
docker-machine version

yum install git nano -y

systemctl stop firewalld
systemctl disable firewalld

git clone https://github.com/iaingblack/Dockerfiles.git
cd Dockerfiles
git pull


#IF THERE IS A PROXY, DO THIS - https://docs.docker.com/engine/admin/systemd/#http-proxy
mkdir /etc/systemd/system/docker.service.d
nano /etc/systemd/system/docker.service.d/http-proxy.conf

[Service]
Environment="HTTP_PROXY=http://myproxy:80"

systemctl daemon-reload
systemctl show --property=Environment docker
systemctl restart docker

mount -t vmhgfs .host:/ /home/iain/Documents/share/
