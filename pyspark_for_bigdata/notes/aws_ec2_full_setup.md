## AWS EC2 PySpark Setup PLAN

1. Create EC2 instance on AWS
2. Use SSH to connect to EC2 over internet (for Mac)
3. Set-up Spark and Jupyter on EC2 instance

So, let's get started.

### 1. Create EC2 instance on AWS

* Login to AWS Console --> go to ec2 --> create instance
    * __OS__: select machine image (Ubuntu)
    * __CPU__: select instance type (free version with 1 2.5 GHz Intel Xeon CPU and 1GB memory)
    * __NUMBER OF INSTANCES__: select default instance details (i.e number of instance = 1, for free version)
    * __HARD-DISK__: select default storage (8GB SSD)
    * __TAG INSTANCE__: basically name of the instance
    * __CREATE SECURITY__: from dropdown select ALL TRAFFIC
    * __LAUNCH INSTANCE__: create KEY-VALUE PAIR and download the PRIVATE RSA key

That's it for STEP 1. 

All we had to do was create an instance and download the `private RSA key`.

### 2. SSH to connect to connect to EC2

* Change mode of downloaded RSA key to read mode

    `chmod 400 download_rsa_filename`
* Use ssh command to connect to the EC2 instance using the public DNS of your instance given in AWS console

    `ssh -i downloaded_rsa_filename ubuntu@DNS_ADDRESS`

> _Change downloaded_rsa_filename and DNS_ADDRESS with the right values_.

That's it for STEP 2.

### 3. Set-up Spark and Jupyter on EC2 instance

    3.1 Download and install Spark
    3.2 Install Jupyter notebook
    3.3 Connect with PySpark
    3.4 Access EC2 Jupyter notebook in our local browser

Below is a bash script that I used to achieve the above goal -
```bash
#!/bin/bash

echo 'sudo apt-get update'
sudo apt-get update &> /dev/null

echo 'sudo apt install python3-pip -y'
sudo apt install python3-pip -y &> /dev/null

echo 'pip3 install jupyter'
pip3 install jupyter &> /dev/null

echo 'sudo apt-get install default-jre -y'
sudo apt-get install default-jre -y &> /dev/null

echo 'sudo apt-get install scala -y'
sudo apt-get install scala -y &> /dev/null

echo 'pip3 install py4j'
pip3 install py4j &> /dev/null

echo 'wget http://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz'
wget http://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz &> /dev/null

echo 'sudo tar -zxvf spark-2.4.5-bin-hadoop2.7.tgz'
sudo tar -zxvf spark-2.4.5-bin-hadoop2.7.tgz &> /dev/null

echo 'sudo rm -r spark-2.4.5-bin-hadoop2.7.tgz'
sudo rm -r spark-2.4.5-bin-hadoop2.7.tgz &> /dev/null
 
cd ~

echo 'pip3 install findspark'
pip3 install findspark &> /dev/null

cd ~

echo 'export PATH=$PATH:~/.local/bin'
export PATH=$PATH:~/.local/bin

echo 'jupyter notebook --generate-config'
jupyter notebook --generate-config &> /dev/null

cd ~

echo "sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem -subj '/C=DE/ST=Munich'"
mkdir certs
cd certs
# touch ~/.rnd
sudo openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout mycert.pem -out mycert.pem -subj '/C=DE/ST=Munich' &> /dev/null
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
``` 

You can adapt the above script for your settings such as the `spark version` as well as the `location (/C=DE/ST=Munich)`

Now, we just need to change the localhost of jupyter notebook opened in the local browser to public dns of the EC2 instance and we are done.

