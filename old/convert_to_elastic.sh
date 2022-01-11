#timestamp="$(date +"%T")"
filename=${1}
echo $filename
output=${filename##*/}
output=${output%.pcap}
echo $output.json
tshark -r $filename -T ek > $output.json