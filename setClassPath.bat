set SAMPLEBASEDIR=.
set LIBDIR=%SAMPLEBASEDIR%\lib
set AXIS_JAR=%LIBDIR%\axis.jar;%LIBDIR%\commons-discovery.jar;%LIBDIR%\commons-logging.jar;%LIBDIR%\jaxrpc.jar;%LIBDIR%\log4j-1.2.4.jar;%LIBDIR%\wsdl4j.jar
set SUN_JAR=%LIBDIR%\activation.jar;%LIBDIR%\mail.jar;%LIBDIR%\saaj.jar
set XMLPARSER_JAR=%LIBDIR%\xercesImpl.jar;%LIBDIR%\xmlParserAPIs.jar
set CLASSPATH=.;%AXIS_JAR%;%SUN_JAR%;%SAMPLEBASEDIR%\build;%SAMPLEBASEDIR%\source;%XMLPARSER_JAR%;%LIBDIR%\servlet.jar;
