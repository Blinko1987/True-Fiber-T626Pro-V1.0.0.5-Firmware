#!/bin/sh
echo -e "Content-Type: text/html\n"
echo -e "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0 Transitional//EN\">"
echo -e "<html lang=\"en\" style=\"overflow-x: hidden;\">"
echo -e "<head>"
echo -e "<meta charset=\"UTF-8\">"
echo -e "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">"
echo -e "<meta http-equiv=\"X-UA-Compatible\" content=\"ie=edge\">"
echo -e "<link rel=\"stylesheet\" href=\"/css/bootstrap.min.css\">"
echo -e "<link rel=\"stylesheet\" href=\"/css/style.css\">"
echo -e "<script src=\"/scripts/lib/jquery.min.js\"></script>"
echo -e "<script src=\"/scripts/lib/bootstrap.min.js\"></script>"
echo -e "<script src=\"/scripts/lib/bootstrap.bundle.min.js\"></script>"
echo -e "<script src=\"/scripts/utils/util_skyw.js\"></script>"
echo -e "</head>"
echo -e "<body style=\"background: #FFFFFF;\">"
echo -e "<div style=\" padding: 1rem;\">"
echo -e "<div class=\"title-dashboard\">Trace Route Result:</div>"
echo -e "<div class=\"row\">"
echo -e "<div class=\"col-12\">"

cat /tmp/traceOth | while read LINE
do
	echo -e "<div class=\"sub-title-dashboard-left\">$LINE</div>"
done

echo "<BR>"
echo -e "</div>"
echo -e "</div>"
echo -e "</body>"
echo -e "</html>"