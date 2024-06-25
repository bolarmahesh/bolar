ngsh -c "set d;date;node run -node * -command wafl_susp -w;sleep 10;\
node run -node * -command wafl_susp -w;sleep 10;\
node run -node * -command wafl_susp -w" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-waflsusp.txt & \
\
