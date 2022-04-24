#!/bin/bash

####################################
#
#
#Aplicação: mover quantidade grande de arquivos de um único diretório
#para vários outros diretórios.
#
#Nome: separador
#Autor: Mario Medeiros
#Data: 2022-04-24
#Versão: 0.1
#
#
####################################


#cria diretório de destino onde estarão os subdiretórios que receberão os
#arquivos em blocos de 1000 arquivos.
mkdir /home/$USER/arquivos-movidos/ &&

#As três variáveis que devem ser declaradas para que o script possa executar
#são, nome do diretório (que terá o sufixo numérico sequencial da quantidade),
#o número de diretórios que receberão os arquivos como 10 mil arquivos, terá 
#10 diretórios sendo mil arquivos em cada.
#terceira varíavel, extensão do tipo de arquivo utilizando a sintaxe de *.pdf 
#por exemplo.  
echo "Digite o nome: "
read nome

echo "digite o numero de diretorios: "
read dirs

echo "digite a extensão dos arquivo "
echo "exemplos: *.png ou *.pdf"
read tipo

#Gera um arquivo texto com os números sequenciais que será o sufixo do nome dos
#diretórios como também a quantidade.
seq -w $dirs >> dirs-lista.txt &&

#As próximas três linhas faz um loop de leitura da variável nome junto com a 
#variável de números de diretórios, juntando os dois e gravando no arquivo
#chamado nomes-dirrs.txt
while read linha; do

echo $nome-${linha} >> nomes-dirs.txt

done < dirs-lista.txt

#Este comando lê o arquivo gerado anteriormente, concatena para o comando xargs,
#repassando os valores para o mkdir gerar os diretórios com nomes -e números,
#por exemplo arquivos-01. Os diretórios são gerados no local onde este script
#está localizado e em sequida o comando mv move os diretórios para o diretório
#criado no início do script.
cat nomes-dirs.txt | xargs mkdir && mv $nome* /home/$USER/arquivos-movidos/

#O comando abaixo cria agora o script com base nas variáveis de extensão de
#arquivo e o local que os arquivos devem ser movidos.
while read Linha; do

echo 'find . -type f -iname' "'$tipo'" ' | head -1000 | while read arq; do mv -v "$arq" /home/$USER/arquivos-movidos/'${Linha}'; done &&' >> movendo-arquivos.txt

done < nomes-dirs.txt

#a linha abaixo executa a seguinte rotina:
#wc lê quantas linhas tem o arquivo gerado resultado-pesquisa.txt
#concatena para o awk que pega a coluna aproveitavel, que no caso é a coluna 1
#o resultado é passado para o sed retirar da última linha os caracteres &&
#Uma vez que a quantidade de linhas serem variáveis,foi necessário colocar no sed a variável de saída do awk.
#essa linha é a linha Mario-VooDoo-GOD
#isso tira a necessidade de abrir o arquivo manualmente e retirar os caracteres
#&& da última linha, independente de qual seja o número da linha, tanto faz se é 
#a linha 1 ou a linha buzilhão.


wc -l movendo-arquivos.txt | awk '{print $1}' | sed -e '$s/&&//' -i movendo-arquivos.txt &&

#renomeia o arquivo para ser um arquivo shell 
cp movendo-arquivos.txt movendo-arquivos.sh 

#muda as permissoes do arquivo e deixa o mesmo executavel
chmod +x movendo-arquivos.sh

#executa o arquivo movendo-arquivos.sh e começa a mover os arquivos para seus
#diretorios, seguindo a sequência de 1000 por diretorios até final
./movendo-arquivos.sh
