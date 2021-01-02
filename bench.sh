foo=$(sysbench cpu --num-threads=1 run | grep "events per second" | grep -Eo '[0-9]+([.][0-9]+)?')
foo=${foo%.*}
if (( foo < 400 ))
then
    foo="failed singlecore"
else
    foo="passed singlecore"
fi
echo $foo >>  /home/zorin/Desktop/result.txt

foo=$(sysbench cpu --num-threads=36 run | grep "events per second" | grep -Eo '[0-9]+([.][0-9]+)?')
foo=${foo%.*}
if (( foo < 600 ))
then
    foo="failled multicore"
else
    foo="passed multicore"
fi
echo $foo >>  /home/zorin/Desktop/result.txt

foo=$(grep MemTotal /proc/meminfo | grep -Eo '[0-9]+([.][0-9]+)?')
foo=$(bc -l <<<"${foo}/1024/1024")
foo=${foo%.*}
if (( foo < 2 ))
then
    foo="failed ram"
else
    foo="passed ram"
fi
echo $foo >>  /home/zorin/Desktop/result.txt

foo=$(lsblk -o ROTA | grep -c 0)
if (( foo > 0 ))
then
    foo="ssd"
else
    foo="hdd"
fi
echo $foo >>  /home/zorin/Desktop/result.txt
su zorin -c "gsettings set org.gnome.desktop.session idle-delay 0" 
