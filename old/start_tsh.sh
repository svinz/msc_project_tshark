timestamp="$(date +"%Y-%m-%d_%H-%M-%S")"
echo $timestamp

echo "Pcap files is logged to: captures/${timestamp}.pcap"
elastic="elastic_packets/${timestamp}.json"
echo "Elastic files is logged to: ${elastic}"

tshark -w "captures/${timestamp}.pcap" -t a -T ek -i wlan0 -f "not port 22 and not arp and not udp dst port 5353" > /dev/null #${elastic}
#Filter: drop SSH packages on port 22, drop ARP and drop MDNS-protocole