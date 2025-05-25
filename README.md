# True-Fiber-T626Pro-V1.0.0.5-Firmware
Anaylzing this firmware out of a GPON device from Thailand.
If your just here for Passwords to get into the device here you go. You can try this Superadmin password but I believe it is different on every device. At least the two devices I had, both had different superadmin passwords. To get yours you need to Get a UART connection on the device using TX, RX, and Ground, power up the device and listen at baud rate 115200, once its finish log into the console using the console user and password below. Then read the contents of your ctromfile by cd /tmp and cat ctromfile.cfg | grep -i superadmin
```xml
<FtpEntry Active="No" ftp_username="admin" ftp_passwd="skyworth" ftp_port="21" />
<ConsoleEntry Active="Yes" console_username="admin" console_passwd="$!%^kyw0rth" />
<TR64Entry/>
<Entry0 Active="Yes" username="superadmin" web_passwd="72af*9F-_-Ck!c@" display_mask="FF FF FF FF FF BF FF FF FF" pwd_control="1" Logged="0" LoginIp="192.168.1.36" Logoff="1" />
<TelnetEntry Active="No" telnet_username="admin" telnet_passwd="$O(Li0_o)$!%^" telnet_port="22666" />
<FtpEntry Active="No" ftp_username="admin" ftp_passwd="skyworth" ftp_port="21" />
```
to permenatly set telnet so you no longer have to use a UART connection:
```tcapi set Account_TelnetEntry Active Yes
tcapi set Account_TelnetEntry telnet_passwd <your password>
tcapi set Account_TelnetEntry telnet_port 23
tcapi commit Account_TelnetEntry```
