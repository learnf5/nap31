# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update lab environment
cd /tmp
git clone https://github.com/learnf5/nap31.git nap_files
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
sudo ssh nginx mkdir --parents /home/student/Desktop/Lab_Files

sudo scp /tmp/nap_files/lab02/nginx.orig                                    nginx:/etc/nginx/
sudo scp /tmp/nap_files/lab02/nap.orig                                      nginx:/etc/nginx/conf.d/

sudo scp /tmp/nap_files/lab06/simplify_requests.json                        nginx:/etc/app_protect/conf/nap.d/

sudo scp /tmp/nap_files/lab07/my-default-policy.json                        nginx:/tmp/my-default-policy.json
sudo scp /tmp/nap_files/lab07/policy_{transparent,viol_{http,evasion}}.json nginx:/etc/app_protect/conf/nap.d

sudo scp /tmp/nap_files/lab08/policy_viol_filetype.json                     nginx:/etc/app_protect/conf/nap.d
sudo scp /tmp/nap_files/lab08/my-filetypes.txt                              nginx:/etc/app_protect/conf/
sudo scp /tmp/nap_files/lab08/local-policy.json                             nginx:/etc/app_protect/conf/nap.d/

sudo scp /tmp/nap_files/lab10/app-protect-security-updates.key              nginx:/home/student/
sudo scp /tmp/nap_files/lab10/uds.json                                      nginx:/etc/app_protect/conf/nap.d/
sudo scp /tmp/nap_files/lab10/user_sig_policy.json                          nginx:/etc/app_protect/conf/nap.d/

sudo scp /tmp/nap_files/lab10/nginx.conf                                    nginx:/etc/nginx/
sudo scp /tmp/nap_files/lab10/nap.conf                                      nginx:/etc/nginx/conf.d/
sudo scp /tmp/nap_files/lab10/policy_data_guard.json                        nginx:/etc/app_protect/conf/nap.d/
sudo scp /tmp/nap_files/lab10/nginx.WAF                                     nginx:/etc/nginx/nginx.conf
sudo scp /tmp/nap_files/lab10/nap.WAF                                       nginx:/etc/nginx/conf.d/nap.conf

curl --silent --remote-name-all --output-dir /tmp https://raw.githubusercontent.com/learnf5/nap31/main/lab01/hosts
sudo scp /tmp/hosts nginx:/etc/hosts
