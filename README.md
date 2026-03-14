# True Fiber T626Pro V1.0.0.5 Firmware

Modified/extracted firmware for True Fiber T626Pro ONT.

## Accessing Superadmin via UART
This is necessary as all GPONS have different Superadmin passwords and telnet is not usually enabled. Alternatively you send me your backup config which you can get from your admin credentials and I'll get it for you.

1. Connect UART (soldering required) 
   - GND → board GND  
   - TX (adapter) → RX (board)  
   - RX (adapter) → TX (board)  
   Baud: 115200 8N1

2. Open serial terminal (PuTTY, minicom, screen, etc.) at 115200 bps

3. Power on device → let it fully boot to login prompt

4. Login  
   Username: ```admin```
   Password: ```$!%^kyw0rth```

Get superadmin credentials
```cat /var/romfile.cfg | grep -i superadmin```

5. Enable Telnet (persistent)
```
tcapi set Account_TelnetEntry Active Yes
tcapi set Account_TelnetEntry telnet_passwd <yourpass>
tcapi set Account_TelnetEntry telnet_port 23
tcapi commit Account_TelnetEntry
tcapi save
```



