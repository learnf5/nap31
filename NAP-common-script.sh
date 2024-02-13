# install student guide
cat <<'EOF' >/home/student/Desktop/Lab_Guide.desktop
[Desktop Entry]
Version=1.0
Name=Lab Guide
Exec=google-chrome --app=https://f5.bravais.com/s/dBQXllTOhYV9b1cGEUrH
Icon=document
Terminal=false
Type=Application
Categories=Application;
EOF
gio set /home/student/Desktop/Lab_Guide.desktop metadata::trusted true
chmod +x /home/student/Desktop/Lab_Guide.desktop

# install nginx license
###lic_token=github_pat_11AXYUQAY*
curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $lic_token" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/nginx-repo.{crt,key}
until sudo scp /tmp/nginx-repo.* nginx:/etc/ssl/nginx/ || (( count++ > 5 )); do sleep 5; done

# update lab environment
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap/main/lab06/{nginx,nap}.conf
sudo scp /tmp/nginx.conf nginx:/etc/nginx/
sudo scp /tmp/nap.conf   nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap/main/lab02/{nginx,nap}.orig
sudo scp /tmp/nginx.orig nginx:/etc/nginx/
sudo scp /tmp/nap.orig   nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap/main/lab06/simplify_requests.json
sudo scp /tmp/simplify_requests.json nginx:/etc/app_protect/conf/nap.d/

# restart NGINX
sudo ssh 10.10.1.61 systemctl stop nginx
sudo ssh 10.10.1.61 systemctl start nginx
