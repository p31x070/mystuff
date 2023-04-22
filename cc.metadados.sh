#!/bin/bash

if [ $# -ne 1 ]; then
  echo "Por favor, forneça o nome do arquivo PDF como argumento."
  exit 1
fi

pdf_file=$1
xml_file="/home/peixoto/bin/CC.xmp"
metadata_name="CustomMetadataName"

if [ ! -f "$pdf_file" ]; then
  echo "Arquivo $pdf_file não encontrado."
  exit 1
fi

if [ ! -f "$xml_file" ]; then
  echo "Arquivo $xml_file não encontrado."
  exit 1
fi

exiftool -overwrite_original -tagsFromFile "$pdf_file" -XMP:"$metadata_name"=@"$xml_file" "$pdf_file"

