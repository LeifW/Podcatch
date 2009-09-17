#!/bin/sh
if [ $1 ]; then
	params="--stringparam program $1"
fi
if [ $2 ]; then
	wget `xsltproc $params --param episode $2 podcatch.xsl podcasts.xml`
else
	xsltproc $params podcatch.xsl podcasts.xml
fi
