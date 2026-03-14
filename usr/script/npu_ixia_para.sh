/userfs/bin/tcapi set WLan11ac_Common APAifsn "2;7;1;1"
/userfs/bin/tcapi set WLan11ac_Common APCwmin "1;4;3;2"
/userfs/bin/tcapi set WLan11ac_Common APCwmax "1;10;4;3"
/userfs/bin/tcapi set WLan11ac_Common BSSAifsn "2;7;2;2"
/userfs/bin/tcapi set WLan11ac_Common BSSCwmin "1;4;3;2"
/userfs/bin/tcapi set WLan11ac_Common BSSCwmax "1;10;4;3"
/userfs/bin/tcapi set WLan11ac_Common SHORTGIFLAG 1
/userfs/bin/tcapi set APWanInfo_Common FixedAPMode Bridge
/userfs/bin/tcapi set APCli_Common StartConn 0
/userfs/bin/tcapi save
/usr/bin/sys memwl bfb00240 4
/sbin/reboot
