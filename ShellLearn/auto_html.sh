#!/bin/bash
#auto create heml
#by Gazq

HTML=index.html
cat >$HTML <<EOF
<html>
<body>
<table border="1" width="1000" cellpadding="0" cellspacing="0">

EOF

while read line

do
	ID=`echo $line |awk '{print $1}'`
	URL=`echo $line |awk '{print $2}'`
	#界面显示
	echo $ID $URL
	sleep 1
	echo "<tr><td>$ID</td><td><a target="blank" href=$URL>$URL</a></td></tr>">>$HTML
done <./list.txt
cat >>$HTML <<EOF
</table>
</body>
</html>
EOF

