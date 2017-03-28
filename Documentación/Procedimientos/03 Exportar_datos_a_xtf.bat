REM
REM     export to XTF
REM 
@echo off
set /p host="Ingrese la ruta del servidor (localhost): "
set /p usuario="Usuario (postgres): "
set /p pwrd="clave: "

java -jar ../../Software/ili2pg-3.6.1/ili2pg.jar --export --modeldir ../Modelos/ --models Catastro_COL_V1_2_ES --dbhost %host% --dbport 5432 --dbdatabase curso_interlis_2017 --dbusr %usuario% --dbpwd %pwrd% --log log/export_ladm_co.log datos_exportados.xtf
pause