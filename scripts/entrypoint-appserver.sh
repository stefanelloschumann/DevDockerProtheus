# Adicionando configurações aos arquivos .ini
/bin/sed 's/{{HOSTNAME}}/'"${HOSTNAME}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{TOPDATABASE}}/'"${TOPDATABASE}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{TOPALIAS}}/'"${TOPALIAS}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{IP_DATABASE}}/'"${IP_DATABASE}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini
/bin/sed 's/{{AMBIENTE}}/'"${AMBIENTE}"'/' -i /srv/totvs/protheus/bin/appserver/appserver.ini

# Iniciando serviços licenserver e appserver
cd /srv/totvs/licenserver/bin/appserver && ./appsrvlinux & cd /srv/totvs/protheus/bin/appserver && ./appsrvlinux