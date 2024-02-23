# update lab environment
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap/main/lab05/nginx.conf
sudo scp /tmp/nginx.conf nginx:/etc/nginx/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap/main/lab01/nap.conf
sudo scp /tmp/nap.conf   nginx:/etc/nginx/conf.d/ 
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap/main/lab02/{nginx,nap}.orig
sudo scp /tmp/nginx.orig nginx:/etc/nginx/
sudo scp /tmp/nap.orig   nginx:/etc/nginx/conf.d/
