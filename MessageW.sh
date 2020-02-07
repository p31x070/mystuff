#!/bin/bash

# Criar um arquivo de mensagem com data atualizada
# Inserir o cálculo da hora marcada com os fusos horários
# Copiar para área de trasferência para mensagem
# Verificar se é possívle atribuir uma variável em um bash
# para depois recuperar em outro
# usar o comando curl -L | bash para chamar várias sequencias de scripts

caminho = $"https://raw.githubusercontent.com/p31x070/mystuff/master/passw.sh"

date | xclip -i -selection clipboard

curl -L $caminho | bash
