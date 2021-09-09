#!/bin/bash

# Obs:
# Você está no Windows CMD.EXE (na mensagem de erro). Ele usa uma sintaxe diferente para executar comandos. 
# Você precisará usar 'sh name.sh', supondo que você tenha o Cygwin ou similar instalado.
# Para esclarecer, o Windows não possui um utilitário interno para suportar arquivos .sh. 
# Para executar isso, você precisará instalar uma ferramenta de terceiros como o Cygwin .

# nao esqueca de habilidar permissoes para seu .sh com '$ chmod 777 my-script.sh'

# Ref https://www.shellscript.sh/hints.html
#     https://devdocs.io/bash/

echo -e "2. Modifique o Shell Script do exercício anterior para incluir uma variável. \nA variável deverá receber o conteúdo da mensagem: "Shell Script com variáveis é demais!";"
echo "Resposta:"

VARIAVEL="Shell Script com variáveis é demais!"
echo $VARIAVEL

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo -e "3. Escreva um Shell Script que guarde o resultado do comando hostname em uma variável.\nImprima na tela uma mensagem: "Este script está rodando no computador: _" em que "_" é o resultado do comando hostname que está na variável;"
echo "Resposta:"

HOSTNAME=`hostname`
echo "Este script está rodando no computador: $HOSTNAME"

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "4. Escreva um Shell Script que verifique se o caminho até um arquivo existe (“file path”). Se ele existir, imprima na tela a mensagem: "O caminho _ está habilitado!". Então, verifique se você tem permissão de escrita no arquivo. Se tiver, mostre a mensagem: "Você tem permissão para editar _". Caso contrário, mostre a mensagem: "Você NÃO foi autorizado a editar _". O _ nas mensagens deve ser substituído pelo (“file path”)."
echo "Resposta:"

echo "você informou: $CAMINHO ou $1" 

CAMINHO=/home/carlos/

if [ -e $CAMINHO ]
  then
    echo "O caminho $1 está habilitado!"
  else
    echo "O caminho nao doi autorizado"
  fi

if [ -w $CAMINHO ]
  then
    echo "Você tem permissão para editar $1"
  else
    echo "Você NÃO foi autorizado a editar"
fi
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "5. Escreva um Shell Script que imprima as palavras \n"shell", "script", "usando", "estrutura", "repetição", "for", "terminal" na tela, uma palavra por linha. \nTente fazer isso usando o menor número de comandos possível."
echo "Resposta:"

for PALAVRA in SHEL USUARIO ESTRUTURA REPETIÇÃO FOR TERMINAL
  do
    echo $PALAVRA
  done

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "6. Escreva um Shell Script que peça ao usuário um caminho de arquivo ou diretório e, \nem seguida, imprima na tela se ele é um arquivo comum, um diretório, ou outro tipo de arquivo. \nDepois, faça um comando de listagem no arquivo/diretório usando a opção de listagem detalhada."
echo "Resposta:"

read -p "Informe o caminho do Diretorio: " VARIAVEL

if [ -d $VARIAVEL ]
  then
    echo "Arquivo é valido como Diretorio"
elif [ -f $VARIAVEL]
  then
    echo "Arquivo é comum"
else 
    echo "outro tipo"
fi

ls $VARIAVEL -la


# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "6. Escreva um Shell Script que peça ao usuário um caminho de arquivo ou diretório e, \nem seguida, imprima na tela se ele é um arquivo comum, um diretório, ou outro tipo de arquivo. \nDepois, faça um comando de listagem no arquivo/diretório usando a opção de listagem detalhada."
echo "Resposta:"

read -p "Informe o caminho do Diretorio: " VARIAVEL

if [ -d $VARIAVEL ]
  then
    echo "Arquivo é valido como Diretorio"
elif [ -f $VARIAVEL]
  then
    echo "Arquivo é comum"
else 
    echo "outro tipo"
fi

ls $VARIAVEL -la

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "8. Modifique o Shell Script do exercício anterior para aceitar uma quantidade \nilimitada de arquivos ou diretórios como argumento (ou parâmetro)."
echo "Resposta:"

CAMINHO=$@

for NOME in $CAMINHO
do
    if [ -f $NOME ]
    then
        echo "Isto é um arquivo."
    elif [ -d $NOME ]
    then
        echo "Isto é um diretório."
    else
        echo "Isto é outro tipo de arquivo."
    fi
    ls -l $NOME
done

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "9. Escreva um Shell Script que receba um diretório como argumento (ou parâmetro). \nSe o argumento não for um diretório, mostre a mensagem: "O argumento _ não é um diretório!". Se o argumento for um diretório, \nconte quantos arquivos existem nele e mostre a seguinte mensagem: "O _ tem _ arquivos.", em que você deve substituir \nos "_" pelo diretório e a quantidade de arquivos nele, respectivamente."
echo "Resposta:"

DIRETORIO=$1

if [ -d $DIRETORIO ]
then
    QTDE=`ls -l $DIRETORIO | wc -l`
    echo "O $DIRETORIO tem $QTDE arquivos."
else
    echo "O argumento $DIRETORIO não é um diretório!"
fi

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "10. Escreva um Shell Script que renomeie todos os arquivos do diretório atual que terminam em ".png", de forma que o nome do arquivo comece com a data atual no formato "YYYY-MM-DD". Por exemplo, se tiver um arquivo com o nome "kitten.png" no diretório atual, e a data de hoje for 16/04/2020, o script deverá mudar o nome do arquivo para "2020-04-16-kitten.png"."
echo "Resposta:"

DAY=$(date +%F)

for FILE in `ls *.png`
do
    mv $FILE ${DAY}-${FILE}
done

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "11. Modifique o Shell Script do exercício anterior para receber o diretório onde estão os arquivos e a extensão dos arquivos que devem ser modificados como argumento (ou parâmetro). Adicione também um mensagem mostrando como eram o como vão ficar os nomes dos arquivos a serem modificados."
echo "Resposta:"

DIRETORIO=$1
EXTENSAO=$2

DAY=$(date +%F\ %T)

cd $DIRETORIO

for FILE in `ls *.$EXTENSAO`
do
    echo "Renomenado $FILE para ${DAY}-${FILE}"
    mv $FILE ${DAY}-${FILE}
done

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
echo -e "12. pegie o imput que o usuario escrever e verifique se ele e maior ou igual a 16"
echo "Resposta:"


echo "Qual sua idade?" #informar ao usuário que ele deve informar sua idade
read -p "Qual sua idade? : " IDADE 

if [ "$IDADE" -ge "16" ] #verifica se a idade é maior ou igual a 16
then 
echo "Você já pode votar!"
else 
echo "Você ainda não pode votar."
fi

# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "13. faca um script usando o DO while para tratar de tres casos especificos"
echo "Resposta:"

echo "Please talk to me ..."
while :
do
  read INPUT_STRING
  case $INPUT_STRING in
	hello)
		echo "Hello yourself!"
		;;
	bye)
		echo "See you again!"
		break
		;;
	*)
		echo "Sorry, I don't understand"
		;;
  esac
done
echo 
echo "That's all folks!"
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

echo -e "14. Defina um valor default para a variavel nome"
echo "Resposta:"

echo -en "What is your name [ `whoami` ] "
read myname
if [ -z "$myname" ]; then
  myname=`whoami`
fi
echo "Your name is : $myname"

# ou pode se fazer definindo um texto logico fisico.

echo -en "What is your name [ `whoami` ] "
read myname
if [ -z "$myname" ]; then
echo "Your name is : ${myname:=John Doe}"
fi
# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

# Para executar uma func com argumentos basta rodar da seguinte maneira '$ bash test.sh <buildDocker_func> <nome_img_arg>'

function showHelp() {
    echo "
    ./dockerw.sh (docker wrapper)
                --help      shows help
                --build     builds container
                --run       runs container
                --runbg     runs container in background
                --cli       runs container with interactive cli (bash)
                --push      pushes container to docker hub
                --pull      pulls container from docker hub
                --stop      stops running docker container
                --remove    removes container
                --list      shows available docker containers
                --ps        show running containers
    "
}

function buildDocker() {
    sudo docker build -t $IMAGE_NAME .
}

function runDocker() {
   sudo docker run -p $HOST:$PORT_IN:$PORT_OUT -t $IMAGE_NAME
}

function runDockerInBackground() {
   sudo docker run -p $HOST:$PORT_IN:$PORT_OUT -td $IMAGE_NAME
}

function runDockerCli() {
   sudo docker exec -it $IMAGE_NAME /bin/bash
}

function pushDocker() {
    sudo docker push $IMAGE_NAME
}

function pullDocker() {
    sudo docker pull $IMAGE_NAME
}

function stopDocker() {
   sudo docker stop $(sudo docker ps | grep $IMAGE_NAME | awk 'NF>1{print $NF}')
}

function removeDocker() {
   sudo docker rmi -f $(sudo docker images | grep $IMAGE_NAME | awk '{print $3}')
}

function listImages() {
   sudo docker images
}

function showRunningContainers() {
   sudo docker ps
}

done


# ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
# OUTROS COMANDOS COMUNS

echo "Criando um arquivo"
rm -rf hacking-a-news.txt

echo "Criando um arquivo"
mkdir hacking-a-news.txt

echo "Criando um arquivo"
touch hacking-a-news.txt

echo "escrevendo neste arquivo"
echo "texto teste" > hacking-a-news.txt

echo "criando um diretório"
mkdir pasta-hack-a-news

echo "copiando o arquivo"
cp hacking-a-news.txt pasta-hack-a-news

echo "movendo o arquivo"
mv hacking-a-news.txt pasta-hack-a-news

echo "indo para o novo diretório"
cd ~/Documents/unix_tests/pasta-hack-a-news

echo "verificando copia"
ls -la

echo "verificando conteúdo"
cat hacking-a-news.txt

echo "dando permissao para executar um script"
chmod a+x nome_do_arquivo.ext

