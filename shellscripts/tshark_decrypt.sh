sslkeylog=/sslkeylog/sslkey.log
echo $sslkeylog
cat $sslkeylog | awk '{print $1; exit}'
chmod 777 /data/
for i in /data/*; do
    echo $i
    tshark -o "tls.keylog_file: $sslkeylog"  -T ek -r $i > /elastic/${i##*/}.json
    mv $i /old_pcaps/
done
#tshark -o "tls.keylog_file: /home/pi/sslkey.log" -r captures/2021-07-12_07-59-22.pcap
# -e frame -e tcp -e mqtt