lsb=`lsb_release -a 2> /dev/null`
coden=`echo $lsb|sed 's/.\+Codename: //g'`
echo "Your Ubuntu Version Codename: " $coden
sudo cp /etc/apt/sources.list /etc/apt/sources.list-backup
sudo sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"' main restricted universe multiverse" > /etc/apt/sources.list'
sudo sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-backports main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb http://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo apt update
sudo apt install ca-certificates -y
echo "Now it's time to check new repositories."
sudo sh -c 'echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"' main restricted universe multiverse" > /etc/apt/sources.list'
sudo sh -c 'echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"' main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-updates main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-backports main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-backports main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo sh -c 'echo "# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ '"$coden"'-security main restricted universe multiverse" >> /etc/apt/sources.list'
sudo apt update
sudo apt upgrade
sudo apt install curl wget zip gcc g++ gdb clang vim ssh nmap python3 -y
curl -OL https://dev.mysql.com/get/mysql-apt-config_0.8.20-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.20-1_all.deb
sudo apt update
sudo apt install mysql-server -y
wget https://hub.fastgit.org/AllenClain/Trashbin/raw/main/mysql.server.sh
sudo mv mysql.server.sh /etc/init.d/mysql
sudo chmod +x /etc/init.d/mysql
sudo service mysql start
echo "Now you can use mysql. Enjoy it"