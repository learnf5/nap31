# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update lab environment
sudo ssh nginx rm /etc/nginx/conf.d/default.conf

sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab10/nginx.WAF
sudo scp /tmp/nginx.WAF                                    nginx:/etc/nginx/nginx.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab11/nap.conf
sudo scp /tmp/nap.conf                                      nginx:/etc/nginx/conf.d/nap.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab02/{nginx,nap}.orig
sudo scp /tmp/nginx.orig                                    nginx:/etc/nginx/
sudo scp /tmp/nap.orig                                      nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab06/simplify_requests.json
sudo scp /tmp/simplify_requests.json                        nginx:/etc/app_protect/conf/nap.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab07/my-default-policy.json
sudo scp /tmp/my-default-policy.json                        nginx:/tmp/my-default-policy.json

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab07/policy_{transparent,viol_{http,evasion}}.json
sudo scp /tmp/policy_{transparent,viol_{http,evasion}}.json nginx:/etc/app_protect/conf/nap.d

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab08/{policy_viol_filetype.json,my-filetypes.txt,local-policy.json}
sudo scp /tmp/policy_viol_filetype.json                     nginx:/etc/app_protect/conf/nap.d
sudo scp /tmp/my-filetypes.txt                              nginx:/etc/app_protect/conf/
sudo scp /tmp/local-policy.json                             nginx:/etc/app_protect/conf/nap.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab09/{uds.json,user_sig_policy.json}
sudo ssh nginx mkdir --parents /home/student/Desktop/Lab_Files/
sudo scp /tmp/uds.json                                      nginx:/etc/app_protect/conf/nap.d/
sudo scp /tmp/user_sig_policy.json                          nginx:/etc/app_protect/conf/nap.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab10/policy_data_guard.json
sudo scp /tmp/policy_data_guard.json              nginx://etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab01/hosts
sudo scp /tmp/hosts nginx:/etc/hosts



# update lab environment THIS was an alternate way of downloading files using git clone - but it downloads 17 mb of stuff...
# better to do individual file downloads with curl and then scp
# cd /tmp
# NOT sure we need the git clone - just download & copy via github directly
#git clone https://github.com/learnf5/nap31.git nap_files


