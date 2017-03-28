REM
REM     Export to XTF
REM 
@echo off
echo  Procedimiento para crear una nueva base de datos de acuerdo al modelo LADM
set /p host="Ingrese la ruta del servidor (localhost): "
set /p usuario="Usuario (postgres): "
set /p pwrd="clave: "

SET PGPASSWORD=%pwrd%

C:\"Program Files"\PostgreSQL\9.5\bin\psql -h %host% -U %usuario% -d postgres -c "DROP DATABASE curso_interlis_2017"
C:\"Program Files"\PostgreSQL\9.5\bin\createdb.exe -h %host% -U %usuario% curso_interlis_2017
C:\"Program Files"\PostgreSQL\9.5\bin\psql -h %host% -U %usuario% -d curso_interlis_2017 -c "CREATE EXTENSION postgis;"

java -jar ../../Software/ili2pg-3.6.1/ili2pg.jar --dbhost %host% --dbport 5432 --dbdatabase curso_interlis_2017 --dbusr %usuario% --dbpwd %pwrd% --dbschema public --defaultSrsAuth EPSG --defaultSrsCode 3116  --smart2Inheritance --createGeomIdx --coalesceMultiSurface --coalesceCatalogueRef --createStdCols --createEnumTabs --createFk --createNumChecks --schemaimport --log log/01_creacion_bd.log ../Modelos/Catastro_COL_V1_2_ES.ili
pause