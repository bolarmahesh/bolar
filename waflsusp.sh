ngsh -c "set d;date;node run -node * -command wafl_susp -w;sleep 60;\
node run -node * -command wafl_susp -w;sleep 60;\
node run -node * -command wafl_susp -w;sleep 60;\
node run -node * -command wafl_susp -w;sleep 60;\
node run -node * -command wafl_susp -w" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-waflsusp.txt & \
\
ngsh -c "set d;date;echo "collecting 5 minute data.....Wait untill script collection is complete....Do not pres any keys";sleep 300;date"
