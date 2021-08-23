# Adicionando configurações aos arquivos .ini
/bin/sed 's/{{MSSQL}}/'"${TOPALIAS}"'/' -i /etc/odbc.ini
/bin/sed 's/{{MSSQL}}/'"${TOPALIAS}"'/' -i /srv/totvs/dbaccess/dbaccess.ini
/bin/sed 's/{{IP_APPSERVER}}/'"${IP_APPSERVER}"'/' -i /srv/totvs/dbaccess/dbaccess.ini

# Iniciando serviço mssql e dbaccess
/opt/mssql/db_mssql.sh & /opt/mssql/bin/sqlservr & ./dbaccess64