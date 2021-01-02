declare -a liste
foo=$(sysbench cpu --num-threads=1 run | grep "events per second" | grep -Eo '[0-9]+([.][0-9]+)?')
foo=${foo%.*}
if (( foo < 600 ))
then
    liste+="c"
else
    if (( foo < 900))
    then
        liste+="b"
    else
        liste+="a"
    fi
fi

foo=$(sysbench cpu --num-threads=36 run | grep "events per second" | grep -Eo '[0-9]+([.][0-9]+)?')
foo=${foo%.*}
if (( foo < 1800 ))
then
    liste+="c"
else
    if (( foo < 3000))
    then
        liste+="b"
    else
        liste+="a"
    fi
fi

foo=$(grep MemTotal /proc/meminfo | grep -Eo '[0-9]+([.][0-9]+)?')
foo=$(bc -l <<<"${foo}/1024/1024")
foo=${foo%.*}
if (( foo < 7 ))
then
    liste+="c"
else
    if (( foo < 15))
    then
        liste+="b"
    else
        liste+="a"
    fi
fi

foo=$(lsblk -o ROTA | grep -c 0)
if (( foo > 0 ))
then
    liste+="s"
else
    liste+="h"
fi
echo $liste
