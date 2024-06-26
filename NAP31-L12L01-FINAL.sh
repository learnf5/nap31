# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update lab environment
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab10/{nginx,nap}.WAF
sudo scp /tmp/nginx.WAF                                    nginx:/etc/nginx/nginx.conf
sudo scp /tmp/nap.WAF                                      nginx:/etc/nginx/conf.d/nap.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab11/{nginx,nap}.DoS
sudo scp /tmp/nginx.DoS                                    nginx:/etc/nginx/
sudo scp /tmp/nap.DoS                                      nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab02/{nginx,nap}.orig
sudo scp /tmp/nginx.orig                                    nginx:/etc/nginx/
sudo scp /tmp/nap.orig                                      nginx:/etc/nginx/conf.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab06/simplify_requests.json
sudo scp /tmp/simplify_requests.json                        nginx:/etc/app_protect/conf/nap.d/
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab07/my-default-policy.json
sudo scp /tmp/my-default-policy.json                        nginx:/tmp/my-default-policy.json
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab07/policy_{transparent,viol_{http,evasion}}.json
sudo scp /tmp/policy_{transparent,viol_{http,evasion}}.json nginx:/etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab07/policy_viol_filetype.json
sudo scp /tmp/policy_viol_filetype.json                     nginx:/etc/app_protect/conf/nap.d
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab09/{my-filetypes.txt,local-policy.json}
curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab09/{{,new-}signature-report.json,app-protect-security-updates.key,{nginx,nap}.WAF}
sudo scp /tmp/my-filetypes.txt                              nginx:/etc/app_protect/conf/
sudo scp /tmp/local-policy.json                             nginx:/etc/app_protect/conf/nap.d/
sudo scp /tmp/{,new-}signature-report.json                  nginx:/tmp/
sudo scp /tmp/app-protect-security-updates.key              nginx:/home/student/
sudo scp /tmp/nginx.WAF                                     nginx:/etc/nginx/
sudo scp /tmp/nap.WAF                                       nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp -H "Authorization: token $lic_token" https://raw.githubusercontent.com/learnf5/nap31/main/lab11/{nginx,nap}.DoS
sudo scp /tmp/nginx.DoS                                     nginx:/etc/nginx/
sudo scp /tmp/nap.DoS                                       nginx:/etc/nginx/conf.d/

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab01/hosts
sudo scp /tmp/hosts nginx:/etc/hosts

# ADDED for new v4.8 course labs
sudo scp /tmp/nap_files/lab12/customStrict.json                           nginx:/home/student/Desktop/Lab_Files/customStrict.json
