# Adicionando configurações aos arquivos .ini
/bin/sed 's/{{HOSTNAME}}/'"${HOSTNAME}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{TOPDATABASE}}/'"${TOPDATABASE}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{TOPALIAS}}/'"${TOPALIAS}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{MSSQL}}/'"${TOPALIAS}"'/' -i /etc/odbc.ini
/bin/sed 's/{{MSSQL}}/'"${TOPALIAS}"'/' -i /srv/totvs/dbaccess/multi/dbaccess.ini

# Iniciando serviços mssql, licenserver, dbaccess e appserver
/opt/mssql/db_mssql.sh & /opt/mssql/bin/sqlservr & cd /srv/totvs/licenserver/bin/appserver && ./appsrvlinux & cd /srv/totvs/dbaccess/multi && ./dbaccess64 & cd /srv/totvs/protheus/bin/appserver && ./appsrvlinux