/usr/bin/nc -uz -w1 $1 $2 | grep succeeded >/dev/null
exit $?