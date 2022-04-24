# Separador
Shell Script que move N arquivos de um diretório para subdiretórios

Problema inicial:
Ter milhares de arquivos (algo como 50 mil arquivos) em um único diretório e ter a necessidade de mover/separar em subdiretórios com quantidades menores, por exemplo, mil arquivos em cada diretório.

Uma solução que encontrei foi gerar um shell script que gere os subdiretorios e mova os arquivos com limites de mil arquivos em cada diretório destino.

Obs 0: O script deve estar no mesmo diretório dos N arquivos que serão movidos.
Obs 1: O diretório de destino onde serão criados os subdiretórios deve estar fora da estrutura onde estão os arquivos originais, parar não haver erros nas buscas do comando find ou outros erros.

Link para o vídeo descritivo: https://youtu.be/Gv8KV6ImYf0

Link para o artigo descritivo: https://www.mariomedeiros.eti.br/artigos/index.php?article50/shell-script-separador-mover-n-arquivos-para-subdiretorios-linux
