/userfs/bin/tcapi set WLan_Common WiFiEnhanceSet 1
/userfs/bin/tcapi set WLan11ac_Common ETxBfEnCond 0
/userfs/bin/tcapi set WLan11ac_Common ETxBfIncapable 1
/userfs/bin/tcapi set WLan11ac_Common BSSAifsn "3;7;2;2"
/userfs/bin/tcapi set WLan11ac_Common BSSCwmin "4;4;3;2"
/userfs/bin/tcapi set WLan11ac_Common BSSCwmax "10;10;4;3"
/userfs/bin/tcapi set WLan11ac_Common SHORTGIFLAG 0
/userfs/bin/tcapi set APWanInfo_Common FixedAPMode Bridge
/userfs/bin/tcapi set APCli_Common StartConn 0
/userfs/bin/tcapi save
/usr/bin/sys memwl bfb00240 4
/sbin/reboot
