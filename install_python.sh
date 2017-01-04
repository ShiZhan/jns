#!/bin/bash
# script name:     install_python.sh
# last modified:   2015/12/14
# sudo:            yes
#
# see: http://sowingseasons.com/blog/building-python-3-4-on-raspberry-pi-2.html

if ! [ $(id -u) = 0 ]; then
   echo "to be run with sudo"
   exit 1
fi

#Python 3 version to install
version="3.6.0"

#------------------------------------------------------
apt-get install -y build-essential libncursesw5-dev libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev libssl-dev openssl wget
#------------------------------------------------------

wget "https://www.python.org/ftp/python/$version/Python-$version.tgz"
tar zxvf "Python-$version.tgz"
cd "Python-$version"
./configure
make
make install
pip3 install pip --upgrade

# soft link to make pip3 default
ln -s /usr/local/bin/pip3 /usr/local/bin/pip

# clean up

cd ..

rm -rf "./Python-$version"
rm "./Python-$version.tgz"
