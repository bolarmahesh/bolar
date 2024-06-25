ngsh -c "set d;date;node run -node cluster1-01 -command wafl_susp -w;sleep 60;\
node run -node aff200-rtp-8a -command wafl_susp -w;sleep 60;\
node run -node aff200-rtp-8a -command wafl_susp -w" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-waflsusp.txt & \
\
