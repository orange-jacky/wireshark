pcap=$1

outline=`tshark -nr $pcap -q -z conv,tcp 2>/dev/null | wc -l`
convline=`expr $outline - 6`
i=0
while [ $i -lt $convline ]
do
	tshark -nr $pcap  -q -z "follow,tcp,ascii,`echo $i`"  >>  `echo $1 | awk -F . '{print $1}'`.txt  2>&1
	i=`expr $i + 1`
done
