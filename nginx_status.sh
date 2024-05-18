#!/bin/bash
systemctl status nginx --no-pager
if [ $? -eq 0 ]; then
    echo "The Application Nginx Is Already Running...!!"
else
    echo "Nginx is not running. Lets restart it...."
    systemctl start nginx
    systemctl status nginx --no-pager
fi
