
# cat docker-ce-gpg | sudo apt-key add -
wget https://mirrors.tuna.tsinghua.edu.cn/docker-ce/linux/ubuntu/gpg -O docker-ce-gpg
wget https://mirrors.tuna.tsinghua.edu.cn/help/docker-ce/ -O docker-ce.html

# cat postgresql-ACCC4CF8.asc | sudo apt-key add -
wget https://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/README -O postgresql-README
wget https://mirrors.tuna.tsinghua.edu.cn/postgresql/repos/apt/ACCC4CF8.asc -O postgresql-ACCC4CF8.asc

# cat 314DF160.gpg | sudo apt-key add -
gpg --keyserver keyserver.ubuntu.com --recv 314DF160
gpg --export --armor 314DF160 >314DF160.gpg

BASE_PATH=`dirname $(readlink -f $0)`
cat $BASE_PATH/mirror-template.list | sed "s,BASE_PATH,$BASE_PATH,g" >$BASE_PATH/mirror.list
apt-mirror $BASE_PATH/mirror.list

