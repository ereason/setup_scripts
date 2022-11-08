#!/bin/bash

sudo apt-get update

yes Y | sudo apt-get install postgresql postgresql-contrib

sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" /etc/postgresql/12/main/postgresql.conf
sed -i 'N; s/# IPv4 local connections:\n.*/# IPv4 local connections:\nhost    all             all             0.0.0.0\/0            md5/' /etc/postgresql/12/main/pg_hba.conf

sudo ufw allow 5432/tcp

sudo -u postgres psql --command '\password postgres'


sudo systemctl restart postgresql

