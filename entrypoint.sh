#!/bin/bash
apache2ctl start
named -4 -L /var/log/named.log
/bin/bash
