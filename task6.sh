#!/bin/bash
logsize=$(wc -c "/var/log/nginx/sumlog.log" | awk '{print $1}')

while true
do
        if [ $logsize -lt 300000 ]
        then
                cat /var/log/nginx/access.log /var/log/nginx/error.log >> /var/log/nginx/sumlog.log
                logsize=$(wc -c "/var/log/nginx/sumlog.log" | awk '{print $1}')
                awk '$14 == 400 { print $0 }' /var/log/nginx/access.log > /var/log/nginx/400.log
                awk '$14 == 500 { print $0 }' /var/log/nginx/access.log > /var/log/nginx/500.log
                echo $logsize
                sleep 5
        else
                var=$(date)
                cat /dev/null > /var/log/nginx/sumlog.log
                echo "Log cleared $var " >> /var/log/nginx/cleaning.log
                echo Cleaning
                logsize=$(wc -c "/var/log/nginx/sumlog.log" | awk '{print $1}')
        fi
done
