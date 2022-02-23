FROM ubuntu:20.04
MAINTAINER shubham pawar

ARG DEBIAN_FRONTEND=noninteractive
RUN mkdir /root/workspace
WORKDIR /root/workspace
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx vim curl git htop wget -y

RUN apt-get update -y
RUN apt-get install -y php7.4 
RUN apt-get install -y mysql-client
RUN apt install -y php7.4-fpm php7.4-common php7.4-mysql php7.4-gmp  php7.4-soap php7.4-curl php7.4-intl php7.4-mbstring php7.4-xmlrpc php7.4-gd php7.4-xml php7.4-cli php7.4-zip php7.4-bcmath
RUN apt-get install -y git curl software-properties-common

# Adding config Files

RUN apt install certbot python3-certbot-nginx -y
RUN apt install composer -y
#ADD ./nginx/default /etc/nginx/sites-available/
ADD env /root/


#Elastic serch 

RUN apt install apt-transport-https ca-certificates gnupg2 -y
RUN wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | apt-key add -
RUN sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
RUN apt update -y ; apt install elasticsearch -y


ADD ./init.sh /root/workspace
RUN chmod +x /root/workspace/init.sh
EXPOSE 80 443
CMD [ "bash" , "init.sh" ]
