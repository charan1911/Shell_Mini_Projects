echo ''
echo '--------------------'
echo "System Resource Monitor"
echo "--------------------"
echo "$(date '+%Y-%m-%d %H:%M:%S') ----------------------------------------------------------------" >> SRM_Logs.txt
echo "...................................... "

echo "CPU Usage"

CPU_Usage=$( top -bn1 | grep "Cpu(s)" | awk '{print 100-$8}' )

echo "CPU-Usage: $CPU_Usage"

if (( $(echo "$CPU_Usage > 1.25" | bc -l) )); then
    echo "CPU Crossed ❌"
    Diff=$(echo "$CPU_Usage - 1.25" | bc -l)
    echo "$(date '+%Y-%m-%d %H:%M:%S') - CPU Crossed: ${CPU_Usage}% (Over by ${Diff}%)" >> /mnt/c/Users/DELL/Desktop/SMP/SystemMonitorANDManagement/SRM_Logs.txt
else
    echo "CPU Safe ✅"
fi

# top -bn1 | grep "Cpu(s)" | awk '{printf"%.2f%%\n",100-$8}'

echo '....................................... '

echo '.......................................'
echo "Memory Usage"
Mem_Usage=$( free | awk 'NR==2{print ($3/$2)*100}' )
echo $Mem_Usage
if (( $(echo "$Mem_Usage > 6.4" | bc -l) ));then
       echo "Memory Exceeded ⭕"
       Diff=$(echo "$Mem_Usage - 6.4" | bc -l)
       echo "$(date '+%Y-%m-%d %H:%M:%S') - Memory-Crossed: ${Mem_Usage}% (Over by ${Diff}%)" >> /mnt/c/Users/DELL/Desktop/SMP/SystemMonitorANDManagement/SRM_Logs.txt
else
	echo "Memory Safe ✅"
fi
echo "........................................"
echo "........................................"
echo "Disk Usage"
Disk_Usage=$(df / | awk 'NR==2 {printf "%.2f", ($3/$2)*100}')
if (( $(echo "$Disk_Usage>0.25" | bc -l) ));then
	echo "Disk USgae Crossed ❌"
	Diff=$(echo "$Disk_Usage-0.25" | bc -l)
	echo "$(date '+%Y-%m-%d %H:%M:%S') - Disk-Usage-Crossed: ${Disk_Usage}% (Over by ${Diff}%)" >> /mnt/c/Users/DELL/Desktop/SMP/SystemMonitorANDManagement/SRM_Logs.txt
else
	echo "Disk Usage Safe ✅"
fi
echo '........................................'
