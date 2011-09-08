#!/bin/sh

export SAMPLEBASEDIR
export LIBDIR
export AXIS_JAR
export SUN_JAR
export XMLPARSER_JAR
export CLASSPATH

SAMPLEBASEDIR=`pwd`
LIBDIR=$SAMPLEBASEDIR/lib
AXIS_JAR=$LIBDIR/axis.jar:$LIBDIR/commons-discovery.jar:$LIBDIR/commons-logging.jar:$LIBDIR/jaxrpc.jar:$LIBDIR/log4j-1.2.4.jar:$LIBDIR/wsdl4j.jar
SUN_JAR=$LIBDIR/activation.jar:$LIBDIR/mail.jar:$LIBDIR/saaj.jar
XMLPARSER_JAR=$LIBDIR/xercesImpl.jar:$LIBDIR/xmlParserAPIs.jar
CLASSPATH=.:$AXIS_JAR:$SUN_JAR:$SAMPLEBASEDIR/build:$SAMPLEBASEDIR/source:$XMLPARSER_JAR:$LIBDIR/servlet.jar

