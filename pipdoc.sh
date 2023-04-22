#!/bin/bash

###############################################################################################
# Define a função para converter um arquivo ODT em PDF
###############################################################################################

function convert_to_pdf {
    # Verifica se o nome do arquivo ODT foi fornecido como argumento
    if [ $# -eq 0 ]
    then
        echo "Erro: o nome do arquivo ODT não foi fornecido"
        return 1
    fi

    odt_file="$1"
    #cria o novo nome do arquivo incluindo o caminho
    pdf_file="$(dirname "$odt_file")/$(basename "${odt_file%.*}").pdf"

    # Verifica se o arquivo ODT existe
    if [ ! -f "$odt_file" ]
    then
        echo "Erro: arquivo ODT não encontrado"
        return 1
    fi

    # Converte o arquivo ODT em PDF
    # Esse $pdf_file é o arquivo de saída da primeira função que será enviado para add_license
    ###############################################################################################

    libreoffice --convert-to pdf "$odt_file" --outdir "$(dirname "$pdf_file")"
   
    # Retorna o nome do arquivo PDF criado
    echo "$pdf_file convertido a partir do odt"
}
###############################################################################################
# Define a função para adicionar atribuição de licença a um arquivo PDF
###############################################################################################

function add_license {
    xml_file="/home/peixoto/bin/CustomLicense2.xmp"
    metadata_name="XMP-cc:CustomLicense"
   
    # Verifica se o arquivo PDF existe
    if [ ! -f "$pdf_file" ]
    then
        echo "Erro: arquivo PDF não encontrado para incluir metadados"
        return 1
    fi
   
    # Verifica se o arquivo XML de licença existe
    if [ ! -f "$xml_file" ]
    then
        echo "Erro: arquivo XML de licença não encontrado"
        return 1
    fi
   
    cc_pdf_file="$(dirname "$pdf_file")/$(basename "${pdf_file%.*}")_atribcc.pdf"
   
    exiftool -overwrite_original -tagsFromFile "$pdf_file" \
    -XMP-xmpRights:Marked=True \
    -XMP-xmpRights:UsageTerms='This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/4.0/">Creative Commons Attribution 4.0 International License</a>.' \
    -XMP-cc:license='http://creativecommons.org/licenses/by/4.0/' \
    -XMP-dc:creator='Luiz Peixoto de Siqueira Filho' \
    -XMP-dc:publisher='luiz@peixoto.cc' \
    "$pdf_file" -o "$cc_pdf_file"
}

############################################################################################### 
# Função que insere o hash 256 nos metadados do arquivo PDF
# Uso: inserir_hash_256 arquivo.pdf
###############################################################################################

function inserir_hash_256() {

# Verifica se o arquivo PDF com atribuição cc existe
    if [ ! -f "$cc_pdf_file" ]
    then
        echo "Arquivo PDF com atribuição CC encontrado! Iniciando calculo do hash..."
        return
    fi

pdf_hash="$(dirname "$cc_pdf_file")/$(basename "${cc_file%.*}")_atribscc.pdf"

# Verifica se o arquivo de configuração existe
    if [ ! -f "/home/peixoto/bin/exiftool_config.txt" ]; 
    then
        echo "Arquivo de configuração do exiftool não encontrado"
        exit 1
    fi

# Insere o hash 256 nos metadados do arquivo
    hash=$(sha256sum "$pdf_hash" | cut -d ' ' -f 1)

# salva os metadados renomeando o novo arquivo
   exiftool -overwrite_original -Title="$hash" \
   -o "$cc_pdf_file" \
   "$pdf_hash"
}

###############################################################################################
# Chama a função para converter o arquivo ODT em PDF e adiciona a atribuição de licença
###############################################################################################

converted_pdf=$(convert_to_pdf "$odt_file")
echo("ARQUIVO ODT CONVERTIDO PARA PDF")

# Chama a função para adicionar a licença CC
pdf_cc_licence=$(add_license "$converted_pdf")
echo("Licença CC inserida com sucesso!")

# Chama a função para Calcular e inserir os dados do Hash nos Metadados
pdf_hash=$(inserir_hash_256"$pdf_cc_licence")
echo("Hash 256 inserida nos Metadados com sucesso!")

exiftool -a "$pdfhash"

echo "Arquivo convertido e atribuição de licença adicionada em: $pdfhash_pdf"

