dnf update -y 
dnf install vim  bash-completion tmux -y 
dnf -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
dnf config-manager --set-enabled powertools
yum install git vim bash-completion -y
git clone https://github.com/ceph/ceph-ansible.git
cd ceph-ansible
git checkout stable-5.0
yum install python3-pip -y 
pip3 install --upgrade pip
pip3 install -r requirements.txt
echo "PATH=\$PATH:/usr/local/bin" >>~/.bashrc
source ~/.bashrc
cp group_vars/all.yml.sample  group_vars/all.yml
cp group_vars/osds.yml.sample  group_vars/osds.yml
cp site.yml.sample  site.yml



