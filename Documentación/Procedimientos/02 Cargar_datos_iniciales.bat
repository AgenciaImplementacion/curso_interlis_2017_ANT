REM
REM     Export to XTF
REM 
@echo off
set /p host="Ingrese la ruta del servidor (localhost): "
set /p usuario="Usuario (postgres): "
set /p pwrd="clave: "
set /p grupo="Gurpo Numero: "

SET PGPASSWORD=%pwrd%
C:\"Program Files"\PostgreSQL\9.5\bin\psql -h %host% -U %usuario% -d curso_interlis_2017 -f ../Datos/datos_iniciales_grupo(%grupo%).sql
pause
