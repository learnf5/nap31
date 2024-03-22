# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update lab environment
sudo ssh nginx test -e /etc/nginx/conf.d/default.conf && sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab06/{nginx,nap}.conf
sudo scp /tmp/nginx.conf nginx:/etc/nginx/
sudo scp /tmp/nap.conf   nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab02/{nginx,nap}.orig
sudo scp /tmp/nginx.orig nginx:/etc/nginx/
sudo scp /tmp/nap.orig   nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab06/simplify_requests.json
sudo scp /tmp/simplify_requests.json nginx:/etc/app_protect/conf/nap.d/
