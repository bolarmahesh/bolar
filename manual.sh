ngsh -c "set d;date;qos statistics volume latency show -vserver svm1 -volume vol1 -iterations 30" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-qos-latency.txt &
ngsh -c "set d;date;qos statistics volume performance show -vserver svm1 -volume vol1 -iterations 30" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-qos-performance.txt &

ngsh -c "set d; statistics show-periodic -interval 1 -iterations 30 -object workload_volume -instance vol1-* -counter write_ops|write_data|ops|write_latency|latency|other_ops|read_ops|read_data|read_latency|total_data" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-workload_volume.txt &
ngsh -c "set d; statistics show-periodic -interval 1 -iterations 30 -object volume -instance vol1 -counter write_ops|write_data|ops|write_latency|latency|other_ops|read_ops|read_data|read_latency|total_data" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-volume.txt &

ngsh -c "set d;date;qos statistics workload resource cpu show -node * -iterations 30" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-qos.resource.txt &
ngsh -c "set d;date;qos statistics volume resource cpu show -node * -iterations 30" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-qos.vol-resource.txt &

ngsh -c "set d;date;node run -node * -command sysstat -c 30 1" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-sysstat_1.txt &
ngsh -c "set d;date;node run -node * -command sysstat -c 30 -M 1" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-sysstat_M_1.txt &

ngsh -c "set d;date;node run -node * -command options stats.wafltop.config volume,message,process" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-wafltop.txt &
ngsh -c "set d;date;node run -node * -command wafltop show -v cpu,io -i 3 -n 10" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-wafltop.txt &

ngsh -c "set d;date;node run -node * -command wafl_susp -w;node run -node * -command wafl_susp -z;sleep 30;node run -node * -command wafl_susp -w" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-waflsusp.txt &
ngsh -c "set d;date;node run -node * -command waffinity_stats;node run -node * -command waffinity_stats -z;sleep 30;node run -node * -command waffinity_stats" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-waffinity.txt &
ngsh -c "set d;date;node run -node * -command ps;node run -node * -command ps -z;sleep 30;node run -node * -command ps -c 5" >> /mroot/etc/crash/"$(date +"%Y_%m_%d_%I_%M_%p")"-ps.txt &
