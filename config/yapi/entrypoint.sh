#! /bin/sh
cd ${VENDORS}
if [ ! -e "init.lock" ]
then
	cd ${VENDORS}
	yapi install -v ${YAPI_VERSION}
	touch init.lock
fi

cd ${VENDORS}
# 先判断有没有CMD指定路径
if [ $1 ]
then
	node $i
else
	node server/app.js
fi