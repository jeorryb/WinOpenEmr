FROM microsoft/windowsservercore

LABEL Description="openemr" Version="5.0.0-4"

RUN powershell -Command \
    $ErrorActionPreference = 'Stop'; \
    Invoke-WebRequest -Method Get -Uri http://downloads.sourceforge.net/openemr/xampp-openemr-5.0.0-4.zip -Outfile c:\openemr.zip ; \
    Expand-Archive -Path c:\openemr.zip -DestinationPath c:\ ; \
    Remove-Item c:\openemr.zip -Force

RUN powershell -Command \
    $ErrorActionPreference = 'Stop'; \
    C:\xampp\apache\apache_installservice.bat ; \
    C:\xampp\mysql\mysql_installservice.bat
