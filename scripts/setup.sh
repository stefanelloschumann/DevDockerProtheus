#!/bin/bash

# Script de criação do ambiente protheus 12.1.27, criação de base teste empresa 99
# Setando diretório raiz e base do protheus
TOTVS_PATH=/srv/totvs
PROTHEUS_PATH=/srv/totvs/protheus

# Baixando Appserver, Licenserver, DBAccess, RPO, Dicionários, Helps, Menus e Smartclient
cd /tmp && curl https://www.dropbox.com/s/zfmqd6xhhjf27dk/protheus.zip?dl=0 -o protheus.zip -J -L -k && unzip protheus.zip

# Criando diretórios do ambiente protheus
mkdir -p ${PROTHEUS_PATH}
mkdir ${TOTVS_PATH}/dbaccess
mkdir ${TOTVS_PATH}/licenserver
mkdir ${TOTVS_PATH}/protheus_data
mkdir ${TOTVS_PATH}/protheus_data/data
mkdir ${TOTVS_PATH}/protheus_data/system
mkdir ${TOTVS_PATH}/protheus_data/systemload
mkdir ${PROTHEUS_PATH}/apo
mkdir ${PROTHEUS_PATH}/bin
mkdir ${PROTHEUS_PATH}/bin/appserver
mkdir ${PROTHEUS_PATH}/bin/smartclient

# Copiando binários para diratórios
cp -r /tmp/protheus/dbaccess/* ${TOTVS_PATH}/dbaccess
cp -r /tmp/protheus/licenserver/* ${TOTVS_PATH}/licenserver
cp -r /tmp/protheus/smartclient/* ${PROTHEUS_PATH}/bin/smartclient
cp -r /tmp/protheus/appserver/* ${PROTHEUS_PATH}/bin/appserver
cp /tmp/protheus/dicionarios/* ${TOTVS_PATH}/protheus_data/systemload
cp /tmp/protheus/helps/* ${TOTVS_PATH}/protheus_data/systemload
cp /tmp/protheus/menus/* ${TOTVS_PATH}/protheus_data/system
cp /tmp/protheus/tttp120.rpo ${PROTHEUS_PATH}/apo

# Copiando arquivos de configuração
cp /tmp/odbc.ini /etc
cp /tmp/odbcinst.ini /etc
cp /tmp/dbaccess.ini ${TOTVS_PATH}/dbaccess/multi
cp /tmp/appserver.ini ${PROTHEUS_PATH}/bin/appserver

# Removendo arquivos copiados para criação do setup
rm -rf /tmp/*