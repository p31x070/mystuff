#!/bin/bash

#cp /media/peixoto/Documentos/KeepPass/Bancos\ de\ Dados/Lovemenow.kdbx /home/peixoto/Documentos
##thunderbird --compose "to=luizpeixoto.adv@gmail.com", "subject=Atualização de Senha", "attachment=/home/peixoto/Documentos/Lovemenow.kdbx"
#
#
#to=$"to=luizpeixoto.adv@gmail.com"
#subject=$"subject=Atualização de Senha"
#attachment=$"attchment=/peixoto/Documentos/Lovemenow.kdbx"
#
#print $attachment
#
##thunderbird --compose $to,$subject,$subject,$attachment
#thunderbird --compose $attachment

att=$"attachment=/media/peixoto/Documentos/KeepPass/Bancos de Dados/Lovemenow.kdbx"
#msg=$"caminho para o arquivo txt"
sub=$"subject=Atualização de Senha"
to=$"to=luizpeixoto.adv@gmail.com"

thunderbird --compose $to,$sub,$att
