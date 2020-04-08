#!/bin/bash


rsync -Cravzpt /media/Documentos/Advocacia /media/peixoto/drivmov/

echo /*****************************************
echo /*****************************************
echo /*****************************************
echo /*****************************************
echo
echo "Arquivos ADVOCACIA sincronizados para o SD CARD"
echo
echo /*****************************************
echo /*****************************************
echo /*****************************************
echo /*****************************************

rsync -Cravzpt /home/peixoto/Área\ de\ Trabalho/Quarentena /media/peixoto/drivmovQuarentena

echo "*****************************************"
echo "*****************************************"
echo "*****************************************"
echo "*****************************************"
echo
echo "Projeto RSG Sincronizado para o SD CARD"
echo
echo "*****************************************"
echo "*****************************************"
echo "*****************************************"
echo "*****************************************"
cd /home/peixoto/Área\ de\ Trabalho/Quarentena

sleep 30s

tar -cvzf Quarentenaar.gz /home/peixoto/Área\ de\ Trabalho/Quarentena &&\

echo "***********Quarentena*****************"&&\
echo "*****************************************"&&\
echo "*****************************************"&&\
echo "*****************************************"&&\
echo
echo "Criando arquivo de backup para transferência Remota" &&\
echo
echo "*****************************************"
echo "*****************************************"
echo "*****************************************"
echo "*****************************************" &&\

sleep 30s

hoje=$(date +'%d-%m-%Y') 

nomearquivo=Quarentena-$hoje.tar.gz &&\


mv Quarentena.tar.gz $nomearquivo && scp Quarentena-$hoje.tar.gz  pi@192.168.0.8:/media/pi/Transp/ && rm Quarentena-$hoje.tar.gz


echo "*****************************************"&&\
echo "*****************************************"&&\
echo "*****************************************"&&\
echo "*****************************************"&&\
echo
echo "Sincronizando ADV com pi@192.168.0.8" &&\
echo
echo "*****************************************"
echo "*****************************************"
echo "*****************************************"
echo "*****************************************" &&\

rsync -avzhe ssh /media/Documentos/Advocacia pi@192.168.0.8:/media/pi/Transp

rsync -avzhe ssh /home/peixoto/Documentos/Lovemenow.kdbx pi@192.168.0.8:/media/pi/Transp
