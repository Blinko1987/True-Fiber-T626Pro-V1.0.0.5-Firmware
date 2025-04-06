#!/bin/sh

echo -e "Content-Type: text/html\n"
echo "<html><head><meta http-equiv=Content-Script-Type
content=text/javascript><meta http-equiv=Content-Style-Type
content=text/css><meta http-equiv=Content-Type content=\"text/html;
charset=gb2312\"><LINK href=\"/JS/stylemain_skyw.css?v=2\" type=\"text/css\"
rel=\"stylesheet\"></head><body>"

loglevel=`/userfs/bin/tcapi get SysLog_Entry DisplayLevel`
if [ "$loglevel" = "no attribute information" -o "$loglevel" = "no node information" ]
then
	loglevel="7"
fi


echo -e "<TEXTAREA id=\"AlphaLogDisplay\" STYLE=\"WIDTH:453px;HEIGHT:200px;\" WRAP=\"OFF\" EDIT=\"OFF\" READONLY>"
	case "$loglevel" in
	"0" )
		LogFileParser 0;;
	esac

	case "$loglevel" in
	"1" )
		LogFileParser 1;;
	esac

	case "$loglevel" in
	"2" )
		LogFileParser 2;;
	esac

	case "$loglevel" in
	"3" )
		LogFileParser 3;;
	esac

	case "$loglevel" in
	"4" )
		LogFileParser 4;;
	esac

	case "$loglevel" in
	"5" )
		LogFileParser 5;;
	esac

	case "$loglevel" in
	"6" )
		LogFileParser 6;;
	esac

	case "$loglevel" in
	"7" )
		LogFileParser 7;;
	esac


echo -e "</TEXTAREA>"
echo -e "<script language=\"JavaScript\">
parent.document.getElementById('syslogWrite').innerHTML = document.getElementById('AlphaLogDisplay').innerHTML.replace(/\&lt;/g, '<').replace(/\&gt;/g, '>');
</script>"
echo "</table></body></html>"

