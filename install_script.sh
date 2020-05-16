#Install nginx , varnish, certbot, php\php-fpm , mysql , magento

apt -y update
apt -y upgrade # here are 2 dialog windows , press "Keep local files"
apt install -y nginx
systemctl enable nginx
apt install -y varnish

#Change nginx-varnish connection:
nano etc/nginx/sites-available/default  

"listen 8080 default_server;
listen [::]:8080 default_server;"


wget https://dl.eff.org/certbot-auto
chmod a+x certbot-auto
./certbot-auto --nginx --non-interactive --agree-tos --domains varnish2020.ml --email some_mail_2020@gmail.com
./certbot-auto certificates
#Users can now get error -   https://github.com/certbot/certbot/issues/6797   Still unfixed on May 2020


#HTTP to HTTPS 301 redirect -
#add it inside the http block in file  /etc/nginx/nginx.conf

    server {
    listen 80 default_server;
    listen [::]:80 default_server;
    server_name varnish2020.ml www.varnish2020.ml;
    return 301 https://$host$request_uri;
}

#Magento install
adduser magento_user
passwd magento_user  #Strong passsword required

usermod -a -G www-data magento_user
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer


#Php install
apt install -y php7.2 php7.2-cli php7.2-fpm php7.2-opcache php7.2-curl php7.2-mbstring php7.2-zip php7.2-xml php7.2-mysql
apt install -y php7.2-gd php7.2-xsl php7.2-json php7.2-intl php-pear php7.2-dev php7.2-common php7.2-mbstring php7.2-zip php-soap libcurl4 -y
apt install -y php7.2-bcmath 

enable (uncomment) opcache.save_comments=1 in /etc/php/7.2/fpm/php.ini and /etc/php/7.2/cli/php.ini    #required for Magento 2.1 and later

enable opcache
[opcache]
; Determines if Zend OPCache is enabled
opcache.enable=1


#Mysql
apt -y install -y mysql-server mysql-client
mysql -p -uroot
CREATE DATABASE magento;
CREATE USER 'magento_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON magento.* TO 'magento_user'@'localhost';
FLUSH PRIVILEGES;



systemctl restart varnish
systemctl restart nginx
systemctl restart mysql


