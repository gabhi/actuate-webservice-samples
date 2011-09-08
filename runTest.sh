#!/bin/sh

if [ $# -gt 2 ]; then
	HOSTNAME=$1
	PORT=$2
	VOLUME=$3
elif [ $# -gt 1]; then
	HOSTNAME=$1
	PORT=$2
	VOLUME=$HOSTNAME
else
	HOSTNAME=`hostname`
	PORT=8000
	VOLUME=$HOSTNAME
fi

SERVERURL=http://$HOSTNAME:$PORT

. ./setClassPath.sh

# enable the following definition to see the SOAP request and response
# LOG4JCONFIGURATION="-Dlog4j.configuration=file:log4j.properties"
LOG4JCONFIGURATION=""

java $LOG4JCONFIGURATION UploadFile -h $SERVERURL -v $VOLUME $SAMPLEBASEDIR/report/SampleReport.rox /report/SampleReport.rox
java $LOG4JCONFIGURATION UploadFile -h $SERVERURL -v $VOLUME $SAMPLEBASEDIR/report/SampleBIRTReport.rptdesign /report/SampleBIRTReport.rptdesign
java $LOG4JCONFIGURATION Administrate -h $SERVERURL -v $VOLUME
java $LOG4JCONfIGURATION SelectFiles -h $SERVERURL -v $VOLUME
java $LOG4JCONFIGURATION SubmitJob -h $SERVERURL -v $VOLUME
java $LOG4JCONFIGURATION UpdateJobSchedule -h $SERVERURL -v $VOLUME "Monthly Report"
java $LOG4JCONFIGURATION Counter -h $SERVERURL -v $VOLUME
java $LOG4JCONFIGURATION DownloadFile -h $SERVERURL -v $VOLUME -e /report/SampleReport.rox download decompose
java $LOG4JCONFIGURATION ExecuteReport -h $SERVERURL -v $VOLUME /report/SampleBIRTReport.rptdesign /output/SampleBIRTReport.rptdocument
java $LOG4JCONFIGURATION GetFolderItems -h $SERVERURL -v $VOLUME /output
java $LOG4JCONFIGURATION SelectPage -h $SERVERURL -v $VOLUME /output/SampleReport.roi 2

