#!/usr/bin/env bash
ngsh -c "set d;date;node run -node aff200-rtp-8a -command wafl_susp -w;sleep 3;\
node run -node aff200-rtp-8a -command wafl_susp -w;sleep 3;\
node run -node aff200-rtp-8a -command wafl_susp -w" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-waflsusp.txt & \
\
