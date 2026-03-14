#!/bin/sh
PROFILE_CFG=/userfs/profile.cfg
if [ -f $PROFILE_CFG ] ; then
    chmod 777 $PROFILE_CFG
    . $PROFILE_CFG
fi

if [ "$TCSUPPORT_USBHOST" != "" ] ;then
echo "TCSUPPORT_USBHOST"
#usb host
insmod /lib/modules/usbhost/scsi_mod.ko
insmod /lib/modules/usbhost/scsi_wait_scan.ko
insmod /lib/modules/usbhost/sd_mod.ko
insmod /lib/modules/usbhost/nls_base.ko
insmod /lib/modules/usbhost/nls_ascii.ko
insmod /lib/modules/usbhost/nls_cp437.ko
if [ "$TCSUPPORT_CT_FTP_DOWNLOADCLIENT" != "" ] ;then
insmod /lib/modules/usbhost/nls_cp936.ko
fi
if [ "$TCSUPPORT_CT_JOYME" != "" ] || [ "$TCSUPPORT_CT_JOYME2" != "" ] ;then
insmod /lib/modules/usbhost/nls_utf8.ko
fi
insmod /lib/modules/usbhost/fat.ko
#insmod /lib/modules/usbhost/msdos.ko
insmod /lib/modules/usbhost/vfat.ko
insmod /lib/modules/usbhost/usbcore.ko
if [ "$TCSUPPORT_MUH" != "" ] ;then
insmod /lib/modules/usbhost/xhci-hcd.ko
else
insmod /lib/modules/usbhost/ehci-hcd.ko
insmod /lib/modules/usbhost/ohci-hcd.ko
fi
insmod /lib/modules/usbhost/usb-storage.ko
if [ "$TCSUPPORT_USB_NTFS" != "" ] ;then
insmod lib/modules/usbhost/fuse.ko
fi
if [ "$TCSUPPORT_USB_3G_DONGLE" != "" ] ;then
insmod lib/modules/usbhost/usbserial.ko
insmod lib/modules/usbhost/option.ko

insmod $KERNEL_DIR/kernel/lib/crc-ccitt.ko
insmod lib/modules/ppp_async.ko
fi
if [ "$TCSUPPORT_USB_CAMERA" != "" ] ;then
insmod lib/modules/usbhost/v4l1-compat.ko
insmod lib/modules/usbhost/videodev.ko
insmod lib/modules/usbhost/usbvideo.ko
insmod lib/modules/usbhost/uvcvideo.ko
fi
if [ "$TCSUPPORT_USB_PRINTER_SERVER" != "" ] ;then
insmod lib/modules/usbhost/usblp.ko
fi	
fi

#AutoMount
if [ "$TCSUPPORT_USB_AUTOMOUNT" != "" ] ;then
/userfs/bin/usb_auto_mount &
fi

