#!/bin/bash

echo 'sudo apt-get update'
sudo apt-get update > /dev/null

echo 'sudo apt install python3-pip -y'
sudo apt install python3-pip -y > /dev/null

echo 'pip3 install jupyter'
pip3 install jupyter > /dev/null

echo 'sudo apt-get install default-jre -y'
sudo apt-get install default-jre -y > /dev/null

echo 'sudo apt-get install scala -y'
sudo apt-get install scala -y > /dev/null

echo 'pip3 install py4j'
pip3 install py4j > /dev/null

echo 'wget http://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz'
wget http://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz > /dev/null

echo 'sudo tar -zxvf spark-2.4.5-bin-hadoop2.7.tgz'
sudo tar -zxvf spark-2.4.5-bin-hadoop2.7.tgz > /dev/null

echo 'sudo rm -r spark-2.4.5-bin-hadoop2.7.tgz'
sudo rm -r spark-2.4.5-bin-hadoop2.7.tgz > /dev/null
 
cd ~

echo 'pip3 install findspark'
pip3 install findspark > /dev/null

cd ~

echo 'jupyter notebook --generate-config'
jupyter notebook --generate-config > /dev/null

cd ~

echo "sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem -subj '/C=DE/ST=Munich'"
mkdir certs
cd certs

sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem -subj '/C=DE/ST=Munich' > /dev/null
sudo chmod 777 mycert.pem

cd ~

echo 'jupyter echos'
echo "c = get_config()" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.certfile = u'/home/ubuntu/certs/mycert.pem'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.ip = '0.0.0.0'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.allow_origin = '*'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.port = 8888" >> ~/.jupyter/jupyter_notebook_config.py
cd ~
jupyter notebook
