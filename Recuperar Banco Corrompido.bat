set nomebanco=NOVOBANCOTESTE

FOR /F "TOKENS=1,2,3,4 DELIMS=/ " %%a IN ('DATE /T') DO SET date=%%a-%%b-%%c
FOR /F "TOKENS=1,2,3 DELIMS=: " %%a IN ('TIME /T') DO SET time=%%a.%%b

echo off
Cls

if exist "%nomebanco%.FBK" (goto :apagafbk) else (goto :copiar)

:apagafbk  
echo.
echo.
echo.
echo ********************************
echo Apagando arquivo %nomebanco%.FBK 
echo ********************************
del %nomebanco%.FBK
if exist "%nomebanco%.FBK" (goto :erroapagafbk)

:copiar
echo.
echo.
echo.
echo *************************************************************************************************
echo Fazendo copia de seguranca do arquivo %nomebanco%.FDB para %nomebanco%_%Date%_%TIME%_ORIGINAL.FDB
echo *************************************************************************************************
copy %nomebanco%.FDB %nomebanco%_%Date%_%TIME%_ORIGINAL.FDB
if exist "%nomebanco%_%Date%_%TIME%_ORIGINAL.FDB" (goto :corrigir) else (goto :errocopia)

:corrigir 
set isc_user=SYSDBA
set isc_password=masterkey
echo.
echo.
echo.
echo **********************************
echo Corrigindo erros do Banco de Dados
echo **********************************
gfix -m -i %nomebanco%.FDB
echo.
echo Pressione alguma tecla para continuar para o proximo passo de backup do banco de dados
echo.
pause>nul
goto :backup

:backup
echo.
echo.
echo.
echo ****************************************************************
echo Executando Backup do Banco de Dados %nomebanco%.FDB corrompido
echo ****************************************************************
gbak -g -b -z -l -v %nomebanco%.FDB %nomebanco%.FBK
echo.
echo Pressione alguma tecla para continuar para o proximo passo de restore do banco de dados
pause>nul
goto :renomear

:renomear
echo.
echo.
echo.
echo *********************************************************************
echo Renomeando Arquivo %nomebanco%.FDB para %nomebanco%_%Date%_%TIME%.FDB  
echo *********************************************************************
rename %nomebanco%.FDB %nomebanco%_%Date%_%TIME%.FDB
if exist "%nomebanco%_%Date%_%TIME%.FDB" (goto :restore) else (goto :errorenomear)

:restore
echo.
echo.
echo.
echo **********************************************
echo Executando Restore do Arquivo %nomebanco%.FDB 
echo **********************************************
gbak -g -c -z -v %nomebanco%.FBK %nomebanco%.FDB
echo.
echo Pressine algo para retornar
pause>nul
goto :fim

:fim
exit

:errorenomear
msg * Nao foi possivel renomear o arquivo %nomebanco%.FDB o backup foi interrompido
exit

:errocopia
msg * Nao foi possivel copiar o arquivo %nomebanco%.FDB o backup foi interrompido
exit

:erroapagafbk
msg * Nao foi possivel apagar o arquivo %nomebanco%.FBK ja existente na pasta o backup foi interrompido!!!
exit

