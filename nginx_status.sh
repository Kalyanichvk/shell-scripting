#!/bin/bash
systemctl status nginx --no-pager >/tmp/kalyani
if [ $? -eq 0 ]; then
    echo "The Application Nginx Is Already Running...!!"
else
    echo "Nginx is not running. Lets restart it...."
    systemctl start nginx >/dev/null
    systemctl status nginx --no-pager >/dev/null
fi
