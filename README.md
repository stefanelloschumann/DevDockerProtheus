# Dockerizando ambiente Protheus para devs

Projeto consiste na criação de dois container Docker um do Appserver do Protheus 12.1.27 e do Licenserver e o segundo com Banco de dados (Postgres ou MSSQL) e DBAccess com dicioário de dados no banco de dados. A ideia é levantar um ambiente de testes do ERP e para desenvolvimento e estudo, rápido e prático para desenvolvedores e analistas que não tenham conhecimento aprofundado da infra do Protheus, redes e ate mesmo do próprio Docker.

>OBS: Este senário em hipótese nenhuma deve ser utilizado em ambientes de produção, pois a finalidade do Docker e termos processos únicos por containers, podendo ter exeções em alguns casos. Para hambientes de produção o indicado e usar o **Docker Compose** com Swarm**, criando um Cluster Swarm.

## Versões dos binários utilizados

20-10-16-BRA-MENUS_12_1_27

20-10-16-BRA-HELPS_COMPL_12_1_27

20-10-16-BRA-DICIONARIOS_COMPL_12_1_27

20-11-13-DBACCESS_LINUX_X64_BUILD-20200606.TAR

20-12-14-P12_APPSERVER_BUILD-19.3.1.4_LINUX_X64.TAR

20-10-16-REPOSITORIO_DE_OBJETOS_BRASIL_12_1_27_TTTP120.RPO

## 1. Build do projeto

### BANCO DE DADOS
`Dentro do arquivo docker-compose.yml você deve verificar o bando de dados de sua escolha deixando descomentado.`

### ARQUIVO .env 
`Neste arquivo na seção APPSERVER você deve especificar o banco de dados utilizado na variável TOPDATABASE=SEU_BANCO. E também dar um nome para o driver ODBC e para o ambiente Protheus.`

## 2. Levantando container
`docker compose up - O comomado irá realizar o build e subir os containers.`

## 3. Configurando smartclient
Após levantar os containers devemos configurar nosso smartclient local para acesso. Editando o arquivo smartclient.ini, deixeo dessa forma ou edite o seu criando parametrização adicionais.

```
[config]
lastmainprog=sigamdi,sigacfg,mpsdu
envserver=docker

[drivers]
active=tcp

[tcp]
server=localhost
port=2345
```

Porta | Descrição
:------: | :---------------:
80 | Servidor HTTP http://localhost
2345 | Appserver
4321 | WebApp http://localhost:4321

# Resultado

<p align="center">
    <img width="800" height="500" src="build/animation.gif">
</p>