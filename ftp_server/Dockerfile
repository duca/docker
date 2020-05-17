##########################################################
#
# Projeto Saber M200 - montagem do ambiente de compilacao
#
##########################################################

# https://www.digitalocean.com/community/tutorials/docker-explained-using-dockerfiles-to-automate-building-of-images

FROM ubuntu:16.04
MAINTAINER Eduardo Lopes

# aqui iriam as instrucoes para copiar o arquivo sources.list do apt.bradar.com.br e o comando de adicionar as chaves
# poderia fazer o download da rede, mas ainda nem temos CURL ou WGET!!! 

# # preparacao para adicionar o ppa que contem os compiladores mais novos (pedir para o Silveira hospedar em nosso apt)
ADD ./ubuntu-16.04.txt /etc/apt/sources.list
RUN cp /etc/resolv.conf.bradar /etc/resolv.conf && apt-get -y update 
RUN cp /etc/resolv.conf.bradar /etc/resolv.conf && apt-get -y upgrade
# # instalacao dos pacotes do ambiente de compilacao
ADD lista_de_pacotes.dat /lista_de_pacotes.dat
ADD instalar_pacotes.sh /instalar_pacotes.sh
# neste ponto o ambiente ja esta montado
###################################################################################

# # preparacao para adicionar o ppa que contem os compiladores mais novos (pedir para o Silveira hospedar em nosso apt)
# RUN apt-get -y update 
# RUN apt-get -y upgrade
# # # instalacao dos pacotes do ambiente de compilacao
# ADD lista_de_pacotes.dat /lista_de_pacotes.dat
# ADD instalar_pacotes.sh /instalar_pacotes.sh
# RUN ./instalar_pacotes.sh
# RUN apt-get -y install vsftpd

#######################################
# EXPOSE
#######################################
EXPOSE 21800-21930
EXPOSE 21
EXPOSE 22

# comandos para copiar as credenciais do host para usar svn

# !!!!!!!!!!!!!!  AVISO !!!!!!!!!!!
# vou tentar usar a instrucao de montagem no docker compose para proteger o acesso ao svn.
# Se funcionar no compose, posso recobrar o uso do jenkins ou outra tool de CI/CD
ADD ./vsftpd.conf /etc/vsftpd.conf
ADD ./entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
