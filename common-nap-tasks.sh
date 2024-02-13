# get lab-info.md for student guide bravais id
curl --silent https://raw.githubusercontent.com/learnf5/nap-dev/main/lab-info.md --output /tmp/lab-info.md
brav_id=$(awk -F '|' "/$lab_id/"' {print $2}' /tmp/lab-info.md)

# install student guide
cat <<'EOF' >/home/student/Desktop/Lab_Guide.desktop
[Desktop Entry]
Version=1.0
Name=Lab Guide
Icon=document
Terminal=false
Type=Application
Categories=Application;
EOF
echo Exec=google-chrome --app=https://f5.bravais.com/s/$brav_id >>/home/student/Desktop/Lab_Guide.desktop
gio set /home/student/Desktop/Lab_Guide.desktop metadata::trusted true
chmod +x /home/student/Desktop/Lab_Guide.desktop

# install nginx license
curl --silent --remote-name-all --output-dir /tmp --header "Authorization: token $lic_token" https://raw.githubusercontent.com/learnf5/eval-reg-keys/main/nginx/nginx-repo.{crt,key}
until sudo scp /tmp/nginx-repo.* nginx:/etc/ssl/nginx/ || (( count++ > 5 )); do sleep 5; done

# run this lab's specific tasks saved on GitHub
curl --silent --output /tmp/lab-specific-tasks.sh https://raw.githubusercontent.com/learnf5/nap-dev/main/$lab_id.sh
bash -x /tmp/lab-specific-tasks.sh

# restart NGINX
sudo ssh 10.10.1.61 systemctl stop nginx
sudo ssh 10.10.1.61 systemctl start nginx
