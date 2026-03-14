# True Fiber T626Pro V1.0.0.5 Firmware

Above is extracted firmware for True Fiber T626Pro GPON from Thailand. 

## Accessing Superadmin via UART
Doing this over UART is necessary as all GPONS have different Superadmin passwords and telnet is not usually enabled. Alternatively you can send me your backup config which you should be able to get from your admin(non superadmin) credentials and I will extract your superadmin.

1. Connect UART (soldering required) 
   - GND → board GND  
   - TX (adapter) → RX (board)  
   - RX (adapter) → TX (board)  
   Baud: 115200 

2. Open serial terminal (PuTTY, minicom, picocom, screen, etc.) at 115200

3. Power on device → let it fully boot to login prompt and press enter. You will
   have a login screen.

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



