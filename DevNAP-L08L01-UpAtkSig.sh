# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update lab environment
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab08/{nginx,nap}.conf
sudo scp /tmp/nginx.conf                                    nginx:/etc/nginx/
sudo scp /tmp/nap.conf                                      nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab02/{nginx,nap}.orig
sudo scp /tmp/nginx.orig                                    nginx:/etc/nginx/
sudo scp /tmp/nap.orig                                      nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab06/simplify_requests.json
sudo scp /tmp/simplify_requests.json                        nginx:/etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab07/my-default-policy.json
sudo scp /tmp/my-default-policy.json                        nginx:/tmp/my-default-policy.json
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab07/policy_{transparent,viol_{http,evasion}}.json
sudo scp /tmp/policy_{transparent,viol_{http,evasion}}.json nginx:/etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab08/{policy_viol_filetype.json,my-filetypes.txt,local-policy.json}
sudo scp /tmp/policy_viol_filetype.json                     nginx:/etc/app_protect/conf/nap.d
sudo scp /tmp/my-filetypes.txt                              nginx:/etc/app_protect/conf/
sudo scp /tmp/local-policy.json                             nginx:/etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/devnap/main/lab08/{nginx.conf.UDS,uds.json,user_defined_signature_policy.json}
sudo ssh nginx mkdir --parents /home/student/Desktop/Lab_Files/
sudo scp /tmp/nginx.conf.UDS                                nginx:/home/student/Desktop/Lab_Files/
sudo scp /tmp/uds.json                                      nginx:/home/student/Desktop/Lab_Files/
sudo scp /tmp/user_defined_signature_policy.json            nginx:/home/student/Desktop/Lab_Files/
