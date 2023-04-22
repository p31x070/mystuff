#!/bin/bash

# para usar basta copiar o texto para área de trasferência, depois executar ./exclui.sh, depois colar o texto sem as trocas de linha para o documento que está sendo redigido.

###

xclip -o > texto.txt # insere o conteúdo da área de transferência no arquivo texto.txt

tr "\n" " " < texto.txt > resultado.txt # exclui as trocas de linha do arquivo texto.txt

tr -s " " <resultado.txt> resultados.txt # depois os espaços repetidos e armazena em resultadoss.txt

cat resultados.txt | xclip -i -selection clipboard # lê o arquivo resultadoss.txt e armazena na área de transferência.

rm texto.txt && rm resultado.txt && rm resultados.txt # apaga os arquivos temporários

###
