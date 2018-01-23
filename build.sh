
if [ -f Makefile ]
then                
	echo "Makefile exist"			
	make clean     
else                
	echo "configure first"              
	./configure             
fi

make



