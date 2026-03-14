/usr/bin/iptables -F macfilter_chain
/usr/bin/iptables -Z macfilter_chain
/usr/bin/ebtables -F ebmacfilter
/usr/bin/ebtables -Z ebmacfilter
/usr/bin/ebtables -F ebmacfwfilter
/usr/bin/ebtables -Z ebmacfwfilter
/usr/bin/ip6tables -F mac6filter_chain
