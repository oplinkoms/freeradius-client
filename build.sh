#!/bin/bash

####  check execute result
function return_val()
{
    val=`echo $?`
        if test $val -ne 0;then
        echo "#########  `pwd` is ERROR..."
        exit -1
    fi
}


if [ -f Makefile ]
then                
	echo "Makefile exist"			
	make clean     
else                
	echo "configure first"              
	./configure; return_val     
fi

make; return_val

sudo cp -f lib/.libs/libfreeradius-client.so* $INSTALL_PATH/lib; return_val
sudo cp -pdf radius/etc/* $INSTALL_PATH/etc/radiusclient; return_val

exit 0

