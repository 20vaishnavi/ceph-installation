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
echo What is moniter_interface(like ens0/ens33)?
read $interface
echo What is public network(like 192.168.0.0/16)?
read $public_network
echo What is cluster network(like 192.168.0.0/16)?
read $cluster_network
echo Enter your devices to be used(like /dev/sdb):
read $device
echo Enter the hostname of first host
read $host1
echo Enter the hostname of second host
read $host2
cat /root/all.yml >> group_vars/all.yml
cat /root/osds.yml >> roup_vars/osds.yml
cat /root/hosts > hosts
ansible-playbook -i hosts site.yml


