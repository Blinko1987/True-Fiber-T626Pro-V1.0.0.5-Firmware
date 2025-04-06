#!/bin/sh
echo Content-type: text/html
echo

#paramIndex="1"

#CGIParam=`echo "$QUERY_STRING&" | cut -d '&' -f $paramIndex`
#while [ "$QUERY_STRING" != "" ]
 #       do
        par=`echo "$QUERY_STRING" | cut -d '=' -f 1`
        val=`echo "$QUERY_STRING" | cut -d '=' -f 2`
        if [ "$val" != "" ]; then
                case $par
                        in
                        "facmode")
                        type=$val
                        ;;
                        esac
        fi

#done
echo > /tmp/checkresult
#0仅显示相关的校验信息，1 显示信息并 关闭显示开关 2 重新进入产测模式
 case $type in
         "0")
           /usr/bin/prolinecmd facmode check > /tmp/checkresult
         ;;
         "1")
           /usr/bin/prolinecmd facmode check > /tmp/checkresult
		   /usr/bin/prolinecmd facmode set 0
         ;;
		 "2")
           /usr/bin/prolinecmd facmode set 0
		   /usr/bin/prolinecmd facmode set 1
         ;;
         *)
           echo "error input"
         ;;
 esac 

echo "<html><head></head><body>"
echo "</body></html>"
     if [ -f /tmp/checkresult ]; then
         echo "
        <textarea rows='50' cols='160' name='text'>"
                echo "----------------------------------------"
    while read line; do
        echo "${line}"
    done < /tmp/checkresult
fi
