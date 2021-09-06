# Adicionando configurações aos arquivos .ini
/bin/sed 's/{{DATABASE}}/'"${DATABASE}"'/' -i /etc/odbc.ini
/bin/sed 's/{{MSSQL}}/'"${TOPALIAS}"'/' -i /etc/odbc.ini
#/bin/sed 's/{{DB_USER}}/'"${DB_USER}"'/' -i /etc/odbc.ini
#/bin/sed 's/{{DB_PASSWORD}}/'"${DB_PASSWORD}"'/' -i /etc/odbc.ini
/bin/sed 's/{{MSSQL}}/'"${TOPALIAS}"'/' -i /srv/totvs/dbaccess/dbaccess.ini
/bin/sed 's/{{IP_APPSERVER}}/'"${IP_APPSERVER}"'/' -i /srv/totvs/dbaccess/dbaccess.ini

./dbaccesscfg -u ${DB_USER} -p ${DB_PASSWORD} -d ${DATABASE} -a ${TOPALIAS}

# Iniciando serviço mssql e dbaccess
/opt/mssql/db_mssql.sh & /opt/mssql/bin/sqlservr & ./dbaccess64