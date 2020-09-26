@echo off
rem START or STOP Services
rem ----------------------------------
rem Check if argument is STOP or START

if not ""%1"" == ""START"" goto stop

if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\hypersonic\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\server\hsql-sample-database\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\ingres\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\ingres\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\mysql\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\mysql\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\postgresql\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\postgresql\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\apache\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\apache\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\openoffice\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\openoffice\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\apache-tomcat\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\apache-tomcat\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\resin\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\resin\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\jetty\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\jetty\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\subversion\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\subversion\scripts\ctl.bat START)
rem RUBY_APPLICATION_START
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\lucene\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\lucene\scripts\ctl.bat START)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\third_application\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\third_application\scripts\ctl.bat START)
goto end

:stop
echo "Stopping services ..."
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\third_application\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\third_application\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\lucene\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\lucene\scripts\ctl.bat STOP)
rem RUBY_APPLICATION_STOP
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\subversion\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\subversion\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\jetty\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\jetty\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\hypersonic\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\server\hsql-sample-database\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\resin\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\resin\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\apache-tomcat\scripts\ctl.bat (start /MIN /B /WAIT C:\Users\HP\Documents\GitHub\alfa-y-omega\apache-tomcat\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\openoffice\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\openoffice\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\apache\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\apache\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\ingres\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\ingres\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\mysql\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\mysql\scripts\ctl.bat STOP)
if exist C:\Users\HP\Documents\GitHub\alfa-y-omega\postgresql\scripts\ctl.bat (start /MIN /B C:\Users\HP\Documents\GitHub\alfa-y-omega\postgresql\scripts\ctl.bat STOP)

:end

