# Adicionando configurações aos arquivos .ini
/bin/sed 's/{{HOSTNAME}}/'"${HOSTNAME}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{TOPDATABASE}}/'"${TOPDATABASE}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{TOPALIAS}}/'"${TOPALIAS}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{POSTGRES}}/'"${TOPALIAS}"'/' -i /etc/odbc.ini
/bin/sed 's/{{POSTGRES}}/'"${TOPALIAS}"'/' -i /srv/totvs/dbaccess/multi/dbaccess.ini

# Iniciando serviços postgres, licenserver, dbaccess e appserver
/docker-entrypoint.sh postgres & cd /srv/totvs/licenserver/bin/appserver && ./appsrvlinux & cd /srv/totvs/dbaccess/multi && ./dbaccess64 & cd /srv/totvs/protheus/bin/appserver && ./appsrvlinux