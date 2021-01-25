#!/bin/bash

# Executando script sql de criação da database protheus
/opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P ${SA_PASSWORD} -d master -i /opt/db_mssql.sql