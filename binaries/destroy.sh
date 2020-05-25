#!/bin/bash 

################################################################################
#Script Name    :destroy.sh                                                    #                                       
#Description    :Allows to destroy the jenkins instance on AWS                 #
#Author         :Ghassen CHARNI                                                # 
#Email          :ghassen.cherni@gmail.com                                      #
#Client         :Artifakt (DevOps Assesment Test)                              #
################################################################################


terraform init

terraform plan -destroy -out=tfdestroyplan -input=false

terraform apply -lock=false -input=false tfdestroyplan

echo "Removing all certificates .."
rm -f etcd_tls_certs/{*pem,*.csr,*.crt}
rm -f mykveks_jenkins/files/{*pem,*.csr,*.crt}
