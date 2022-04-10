#!/bin/bash

if [ -d "~/webtest" ]
then
    rm -r webtest
fi
#put everything into own app folders
mkdir webtest && cd webtest

mkdir lb && cd lb
echo "<html><body><h1>ayo if you're seeing this no tf you're not</h1></body></html>" > index.htm
echo "<?php phpinfo(); ?>" > index.php
echo -e "FROM nginx:alpine \nCOPY /index.htm /usr/share/nginx/html/index.html \nCOPY /index.php /usr/share/nginx/html/index.php" > Dockerfile
#docker build -f Dockerfile.lb -t load_balancer .
docker build -t load_balancer .

cd .. && mkdir w1 && cd w1
echo "<html><body><h1>Worker1</h1></body></html>" > index.htm
echo "<?php phpinfo(); ?>" > index.php
echo -e "FROM nginx:alpine \nCOPY /index.htm /usr/share/nginx/html/index.html \nCOPY /index.php /usr/share/nginx/html/index.php" > Dockerfile
# docker build -f Dockerfile.w1 -t web1 .
docker build -t web1 .

cd .. && mkdir w2 && cd w2
echo "<html><body><h1>Worker2</h1></body></html>" > index.htm
echo "<?php phpinfo(); ?>" > index.php
echo -e "FROM nginx:alpine \nCOPY /index.htm /usr/share/nginx/html/index.html \nCOPY /index.php /usr/share/nginx/html/index.php" > Dockerfile
# docker build -f Dockerfile.w2 -t web2 .
docker build -t web2 .

cd .. && mkdir w3 && cd w3
echo "<html><body><h1>Worker3</h1></body></html>" > index.htm
echo "<?php phpinfo(); ?>" > index.php
echo -e "FROM nginx:alpine \nCOPY /index.htm /usr/share/nginx/html/index.html \nCOPY /index.php /usr/share/nginx/html/index.php" > Dockerfile
# docker build -f Dockerfile.w3 -t web3 .
docker build -t web3 .


# systemctl restart nginx
# systemctl restart docker

# cd ~
# #docker-compose up