FROM ubuntu:20.04
MAINTAINER shubham pawar

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install nginx 	-y

RUN apt-get update -y
RUN apt-get install -y php7.4 
RUN apt install -y php7.4-fpm php7.4-common php7.4-mysql php7.4-gmp php7.4-curl php7.4-intl php7.4-mbstring php7.4-xmlrpc php7.4-gd php7.4-xml php7.4-cli php7.4-zip php7.4-bcmath
RUN apt-get install -y git curl software-properties-common

# Adding config Files

ADD ./nginx/default /etc/nginx/sites-available/


EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
