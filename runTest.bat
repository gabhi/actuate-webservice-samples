@if "%HOSTNAME%" == "" set HOSTNAME=localhost
@if "%PORT%" == "" set PORT=8000
@if not "%1" == "" set HOSTNAME=%1
@if not "%2" == "" set PORT=%2
@if "%VOLUME%" == "" set VOLUME=%HOSTNAME%
@if not "%3" == "" set VOLUME=%3
@set SERVERURL=http://%HOSTNAME%:%PORT%
call setClassPath.bat

rem Uncomment the following definition to see the SOAP request and response
rem set LOG4JCONFIGURATION="-Dlog4j.configuration=file:log4j.properties"

java %LOG4JCONFIGURATION% UploadFile -h %SERVERURL% -v %VOLUME% report\SampleReport.rox /report/SampleReport.rox
java %LOG4JCONFIGURATION% UploadFile -h %SERVERURL% -v %VOLUME% report\SampleBIRTReport.rptdesign /report/SampleBIRTReport.rptdesign
java %LOG4JCONFIGURATION% Administrate -h %SERVERURL% -v %VOLUME% 
java %LOG4JCONFIGURATION% SelectFiles -h %SERVERURL% -v %VOLUME% 
java %LOG4JCONFIGURATION% SubmitJob -h %SERVERURL% -v %VOLUME% 
java %LOG4JCONFIGURATION% UpdateJobSchedule -h %SERVERURL% -v %VOLUME% "Monthly Report"
java %LOG4JCONFIGURATION% Counter -h %SERVERURL% -v %VOLUME% 
java %LOG4JCONFIGURATION% DownloadFile -h %SERVERURL% -v %VOLUME% -e /report/SampleReport.rox download decompose
java %LOG4JCONFIGURATION% ExecuteReport -h %SERVERURL% -v %VOLUME% /report/SampleBIRTReport.rptdesign /output/SampleBIRTReport.rptdocument
java %LOG4JCONFIGURATION% GetFolderItems -h %SERVERURL% -v %VOLUME% /output
java %LOG4JCONFIGURATION% SelectPage -h %SERVERURL% -v %VOLUME% /output/SampleReport.roi 2
