@ECHO OFF

IF EXIST bin (
	goto :choice 
) ELSE (
	goto :end
)

:choice
set /P c=bin/ already exists. Do you wish to delete it and reinstall[Y/N]?
if /I "%c%" EQU "Y" goto :somewhere
if /I "%c%" EQU "N" goto :end
goto :choice

:install
mkdir bin
cd bin
mkdir services
cd services
git clone https://github.com/intellead/intellead-connector.git
git clone https://github.com/intellead/intellead-security.git
git clone https://github.com/intellead/intellead-data.git
git clone https://github.com/intellead/intellead-enrich.git
git clone https://github.com/intellead/receitaws-data.git
git clone https://github.com/intellead/qcnpj-crawler.git
git clone https://github.com/intellead/intellead-classification.git
cd ..
mkdir tests
cd tests
git clone https://github.com/intellead/intellead-integration-tests.git
cd ..
cp -R ../databases databases
cp ../docker-compose/docker-compose.yml docker-compose.yml

:end
pause 
exit
