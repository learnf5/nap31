# enable debugging
set -x
PS4='+$(date +"%T.%3N"): '

# update lab environment
cd /tmp
git clone https://github.com/learnf5/devnap.git nap_files
sudo ssh nginx rm /etc/nginx/conf.d/default.conf
sudo ssh nginx mkdir --parents /etc/app_protect/conf/nap.d
sudo ssh nginx mkdir --parents /home/student/Desktop/Lab_Files

sudo scp /tmp/nap_files/lab02/nginx.orig                                    nginx:/etc/nginx/
sudo scp /tmp/nap_files/lab02/nap.orig                                      nginx:/etc/nginx/conf.d/

sudo scp /tmp/nap_files/lab06/simplify_requests.json                        nginx:/etc/app_protect/conf/nap.d/

sudo scp /tmp/nap_files/lab07/my-default-policy.json                        nginx:/tmp/my-default-policy.json
sudo scp /tmp/nap_files/lab07/policy_{transparent,viol_{http,evasion}}.json nginx:/etc/app_protect/conf/nap.d
sudo scp /tmp/nap_files/lab07/policy_viol_filetype.json                     nginx:/etc/app_protect/conf/nap.d

sudo scp /tmp/nap_files/lab09/my-filetypes.txt                              nginx:/etc/app_protect/conf/
sudo scp /tmp/nap_files/lab09/local-policy.json                             nginx:/etc/app_protect/conf/nap.d/
sudo scp /tmp/nap_files/lab09/{,new-}signature-report.json                  nginx:/tmp/
sudo scp /tmp/nap_files/lab09/app-protect-security-updates.key              nginx:/home/student/
sudo scp /tmp/nap_files/lab09/nginx.WAF                                     nginx:/etc/nginx/
sudo scp /tmp/nap_files/lab09/nap.WAF                                       nginx:/etc/nginx/conf.d/

sudo scp /tmp/nap_files/lab10/nginx.DoS                                     nginx:/etc/nginx/
sudo scp /tmp/nap_files/lab10/nap.DoS                                       nginx:/etc/nginx/conf.d/
sudo scp /tmp/nap_files/lab10/nginx.conf                                    nginx:/etc/nginx/
sudo scp /tmp/nap_files/lab10/nap.conf                                      nginx:/etc/nginx/conf.d/

sudo scp /tmp/nap_files/lab11/nginx.conf                                    nginx:/etc/nginx/
sudo scp /tmp/nap_files/lab11/current_app_protect.txt                       nginx:/tmp/current_app_protect.txt
sudo scp /tmp/nap_files/lab11/tmp/current_nginx.txt                         nginx:/tmp/current_nginx.txt
sudo scp /tmp/nap_files/lab11/tmp/updated_app_protect.txt                   nginx:/tmp/updated_app_protect.txt
sudo scp /tmp/nap_files/lab11/tmp/updated_nginx_plus.txt                    nginx:/tmp/updated_nginx_plus.txt
sudo scp /tmp/nap_files/lab11/tmp/package_versions.txt                      nginx:/tmp/package_versions.txt
sudo scp /tmp/nap_files/lab11/tmp/system_version.txt                        nginx:/tmp/system_version.txt
sudo scp /tmp/nap_files/lab11/tmp/napd_shmem.txt                            nginx:/tmp/napd_shmem.txt
sudo scp /tmp/nap_files/lab11/tmp/linux_shmem.txt                           nginx:/tmp/linux_shmem.txt
sudo scp /tmp/nap_files/lab11/tmp/logs.txt                                  nginx:/tmp/logs.txt
sudo scp /tmp/nap_files/lab11/tmp/logs.tgz                                  nginx:/tmp/logs.tgz
# WHEN get verified copy of file uncomment next line
# sudo scp /tmp/nap_files/lab11/customStrict.json                           nginx:/home/student/Desktop/Lab_Files/customStrict.json
