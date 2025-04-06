var curUserName = parent.curUser;
if (typeof(curUserName) == "undefined")
	curUserName = '0';
var sysUserName = '1';
var sptUserName = '0';
var ctcqdUserName = 'ctcqd';
var bandRegName = 'regAcc';
var usrUserName = 0;

function autoRefreshMainTable(tab_id)
{
	var tableParent, tableChildren, tableLine;
	var i, tbodyNode, totalCnt = 0, delCnt = 0;
	var delArray = new Array();

	tableParent = getElById (tab_id);
	if ( null == tableParent )
		return;
	tableChildren = tableParent.childNodes;
	if ( null == tableChildren )
		return;
		
	for (i = 0; i < tableChildren.length; i ++ )
	{
		if ('TBODY' == 	tableChildren[i].tagName )
		{
			tbodyNode = tableChildren = tableChildren[i];
			break;	
		}
	}

	tableChildren = tableChildren.childNodes;
	if ( null == tableChildren )
		return;

	for ( i = 0; i < tableChildren.length; i ++ )
	{
			tableLine = tableChildren[i];
			if ( null == tableLine
			|| 'TR' != tableLine.tagName)
				continue;
			totalCnt ++;
			if ( 'none' != tableLine.style.display )
				continue;

			delArray[delCnt ++] = tableLine;
	}

	if ( delCnt > 0 )
	{
		for ( i = 0; i < delArray.length; i ++)
			tbodyNode.removeChild(delArray[i]);
		getElById('TRSpan').rowSpan = ( totalCnt - delCnt );
	}
}

/*start of modify by j00127542 for A36D07611 wps pin 20090815*/
function isSafeStringIn(compareStr, UnsafeStr)
{
	for (var i = 0; i < compareStr.length; i++)
	{
		var c = compareStr.charAt(i);
		if (isValidAscii(c) != '')
		{
			 return false;
	    }
		else
		{
			if (UnsafeStr.indexOf(c) == -1)
			{
				return false;
			}
		}
	}
    return true;
}
/*end of modify by j00127542 for A36D07611 wps pin 20090815*/

/*adjust data type*/
function isValidAscii(val)
{
    for ( var i = 0 ; i < val.length ; i++ )
    {
        var ch = val.charAt(i);
        if ( ch < ' ' || ch > '~' )
        {
            return ch;
        }
    }
    return '';
}

function hasForbiddenChar(val)
{
    var ForbiddenString = '\\\'"=<>/&';

    if ( isValidAscii(val) != '' )
    {
        return isValidAscii(val);
    }

    for ( var i = 0 ; i < val.length ; i++ )
    {
        if ( ForbiddenString.indexOf(val.charAt(i)) != -1 )
        {
            return val.charAt(i);
        }
    }
    return '';
}

//����WLANУ���ܳ�
function isHexaDigit(digit) {
   var hexVals = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
                           "A", "B", "C", "D", "E", "F", "a", "b", "c", "d", "e", "f");
   var len = hexVals.length;
   var i = 0;
   var ret = false;

   for ( i = 0; i < len; i++ )
      if ( digit == hexVals[i] ) break;

   if ( i < len )
      ret = true;

   return ret;
}


//����WLANУ���ܳ�
function isValidKey(val, size) {
   var ret = false;
   var len = val.length;
   var dbSize = size * 2;

   if ( len == size )
   {
   	if(val.match(/[^\x00-\xff]/g))
   	{
   	     return ret;
   	} else {
   	   for ( i = 0; i < size; i++)
   	     if (val.charAt(i) == ','){
   	        break;
   	     }
   	   if ( i == size)
   	   	ret = true;
   	}
   }else if ( len == dbSize ) {
      for ( i = 0; i < dbSize; i++ )
         if ( isHexaDigit(val.charAt(i)) == false )
            break;
      if ( i == dbSize )
         ret = true;
   } else
      ret = false;

   return ret;
}

function isNameUnsafe(compareChar)
{
   var unsafeString = "\"<>%\\^[]`\+\$\,='#&: \t";
    	
   if ( unsafeString.indexOf(compareChar) == -1 
		&& compareChar.charCodeAt(0) > 32
        && compareChar.charCodeAt(0) < 123 )
      return false; // found no unsafe chars, return false
   else
      return true;
}  
// Check if a name valid
function isValidName(name) {
   var i = 0;	
   
   for ( i = 0; i < name.length; i++ ) {
      if ( isNameUnsafe(name.charAt(i)) == true )
         return false;
   }

   return true;
}

function isNameUnsafeEx(compareChar)
{
   
    	
   if ( compareChar.charCodeAt(0) > 32
        && compareChar.charCodeAt(0) < 127)
      return false; // found no unsafe chars, return false
   else
      return true;
}  
// Check if a name valid
function isValidNameEx(name) {
   var i = 0;	
   
   for ( i = 0; i < name.length; i++ ) {
      if ( isNameUnsafeEx(name.charAt(i)) == true )
         return false;
   }

   return true;
}

// same as is isNameUnsafe but allow spaces
function isCharUnsafe(compareChar) {
   var unsafeString = "\"<>%\\^[]`\+\$\,='#&.:\t";
	
   if ( unsafeString.indexOf(compareChar) == -1 && compareChar.charCodeAt(0) >= 32
        && compareChar.charCodeAt(0) < 123 )
      return false; // found no unsafe chars, return false
   else
      return true;
}   
//same as is isValidName but allow spaces
function isValidNameWSpace(name) {
   var i = 0;	
   
   for ( i = 0; i < name.length; i++ ) {
      if ( isCharUnsafe(name.charAt(i)) == true )
         return false;
   }

   return true;
}

//����isValidString�ڲ�����

function isStringUnsafe(compareChar) {
   var unsafeString = "\"";
	
   if ( unsafeString.indexOf(compareChar) == -1 && compareChar.charCodeAt(0) > 31
        && compareChar.charCodeAt(0) < 127 )
      return false; // found no unsafe chars, return false
   else
      return true;
}   

// Check if a string valid ����tr069
//a valid string do not contain '"' and each char is validAscII
function isValidString(name) {
   var i = 0;	
   
   for ( i = 0; i < name.length; i++ ) {
      if ( isStringUnsafe(name.charAt(i)) == true )
         return false;
   }

   return true;
}

function isInteger(value)
{   	
	if (/^(\+|-)?\d+$/.test(value)) 
	{
	   return true;
	} 
	else 
	{
	    return false;
	}
}

function isPlusInteger(value)
{
	if (isInteger(value) && parseInt(value) >= 0)
	{
		return true;
	}
	else
	{
		return false;
	}
}

function isFloat(value)
{   	
	if (/^(\+|-)?\d+($|\.\d+$)/.test(value))
	{
	   return true;
	} 
	else 
	{
	   return false;
	}
}

function isPlusFloat(value)
{
	if (isFloat(value) && parseFloat(value) >= 0.000001)
	{
		return true;
	}
	else
	{
		return false;
	}
}

function isNetIpAddress(address)
{
    if (isValidIpAddress(address) == false)
    {
        return false;
    }
	
    var addrParts = address.split('.');
    var num = 0;
 
    num = parseInt(addrParts[3]);
    if (num == 0)
    {
        return false;
    }
   
    return true;
}

/*adjust the data of network format*/
function isValidIpAddress(address) {
   var i = 0;

   if ( address == '0.0.0.0' ||
        address == '255.255.255.255' )
      return false;

   var addrParts = address.split('.');
   if ( addrParts.length != 4 ) return false;
   for (i = 0; i < 4; i++) {
      if (isNaN(addrParts[i]) || addrParts[i] ==""
          || addrParts[i].charAt(0) == '+' ||  addrParts[i].charAt(0) == '-' )
         return false;
      if (addrParts[i].length > 3 || addrParts[i].length < 1)
      {
          return false;
      }
      if (!isInteger(addrParts[i]) || addrParts[i] < 0)
      {
          return false;
      }
      num = parseInt(addrParts[i]);
      if (i == 0 && num == 0)
      {
          return false;
      }
      if ( num < 0 || num > 255 )
         return false;
   }
   return true;
}
function isValidIpAddr(ip1,ip2,ip3,ip4)
{
	if(ip1==0 || ip4==0 || ip4==255 || ip1==127 )		
		return false;	
	
	return true;	
}
function inValidIPAddr(Address)
{
  var address = Address.match("^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$");
  var digits;
  var i;

  if(address == null) { 
  	alert('Invalid IP address ' + Address);
  	return true;
  }
  
  digits = address[0].split(".");
  for(i=0; i < 4; i++)
  {
  	if((Number(digits[i]) > 255 ) || (Number(digits[i]) < 0 ) || (Number(digits[0]) > 223) || (digits[i] == null))
  	{ 
  		alert('Invalid IP address ' + Address);
  		return true;
  	}
  }
  if(!isValidIpAddr(digits[0],digits[1],digits[2],digits[3],false))
  {
    	alert("Invalid IP address " + Address);
  	return true;
  }
  return false;
}
function trim(s)
{
    var l=0; var r=s.length -1;
    while(l < s.length && s[l] == ' ')
    {     l++; }
    while(r > l && s[r] == ' ')
    {     r-=1;     }
    return s.substring(l, r+1);
} 
function inValidIPv6Addr(Address1)
{
	var regExp = /^\s*((([0-9A-Fa-f]{1,4}:){7}([0-9A-Fa-f]{1,4}|:))|(([0-9A-Fa-f]{1,4}:){6}(:[0-9A-Fa-f]{1,4}|((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){5}(((:[0-9A-Fa-f]{1,4}){1,2})|:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3})|:))|(([0-9A-Fa-f]{1,4}:){4}(((:[0-9A-Fa-f]{1,4}){1,3})|((:[0-9A-Fa-f]{1,4})?:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){3}(((:[0-9A-Fa-f]{1,4}){1,4})|((:[0-9A-Fa-f]{1,4}){0,2}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){2}(((:[0-9A-Fa-f]{1,4}){1,5})|((:[0-9A-Fa-f]{1,4}){0,3}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(([0-9A-Fa-f]{1,4}:){1}(((:[0-9A-Fa-f]{1,4}){1,6})|((:[0-9A-Fa-f]{1,4}){0,4}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:))|(:(((:[0-9A-Fa-f]{1,4}){1,7})|((:[0-9A-Fa-f]{1,4}){0,5}:((25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)(\.(25[0-5]|2[0-4]\d|1\d\d|[1-9]?\d)){3}))|:)))(%.+)?\s*$/;
	
	var Address = trim(Address1);
	var address = Address.match(regExp);
	if(address == null){		
		alert('Invalid IPv6 Address: ' + Address);
 		return true;
	}	
	return false;
}
function isBroadcastIp(ipAddress, subnetMask)
{
     var maskLenNum = 0;
     tmpMask = subnetMask.split('.');
     tmpIp = ipAddress.split('.');

     if((parseInt(tmpIp[0]) > 223) || ( 127 == parseInt(tmpIp[0])))
     {
         return true;
     }

     for(maskLenNum = 0; maskLenNum < 4; maskLenNum++)
     {
         if(parseInt(tmpMask[maskLenNum]) < 255)
            break;         
     }

     tmpNum0 = parseInt(tmpIp[maskLenNum]);
     tmpNum1 = 255 - parseInt(tmpMask[maskLenNum]);
     tmpNum2 = tmpNum0 & tmpNum1;
     if((tmpNum2 != 0) && (tmpNum2 != tmpNum1))
     {
         return false;
     }

     if(maskLenNum == 3)//�������һλ������255: 255.255.255.xxx
     {
         return true;
     }
     else if(maskLenNum == 2)//255.255.xxx.xxx
     {
         if(((tmpIp[3] == 0)&&(tmpNum2 == 0))||
             ((tmpIp[3] == 255)&&(tmpNum2 == tmpNum1)))
         {
             return true;
         }
     }
     else if(maskLenNum == 1)//255.xxx.xxx.xxx
     {
         if(((tmpNum2 == 0)&&(tmpIp[3] == 0)&&(tmpIp[2] == 0)) ||
             ((tmpNum2 == tmpNum1)&&(tmpIp[3] == 255)&&(tmpIp[2] == 255)))
         {
             return true;
         }
     }
     else if(maskLenNum == 0)//xxx.xxx.xxx.xxx
     {
         if(((tmpNum2 == 0)&&(tmpIp[3] == 0)&&(tmpIp[2] == 0)&&(tmpIp[1] == 0)) ||
             ((tmpNum2 == tmpNum1)&&(tmpIp[3] == 255)&&(tmpIp[2] == 255) &&(tmpIp[1] == 255)))
         {
             return true;
         }
     }

     return false;
     
}

function isAbcIpAddress(address)
{
    if (isValidIpAddress(address) == false)
    {
        return false;
    }
	
	var addrParts = address.split('.');
    var num = 0;
 
    num = parseInt(addrParts[0]);
    if (num < 1 || num >= 224 || num == 127)
    {
        return false;
    }
/* start of HG_Maintenance 2007.10.24 ATPV100R001C01B011 AU4D00155
    num = parseInt(addrParts[3]);
    if (num == 255)
    {
        return false;
    }
   end of HG_Maintenance 2007.10.24 ATPV100R001C01B011 AU4D00155 */	
   
    return true;
}


/* start of HG_Maintenance 2007.10.24 ATPV100R001C01B011 AU4D00155 */
function isHostIpWithSubnetMask(address, subnet)
{
    if (isAbcIpAddress(address) == false)
    {
        return false;
    }
    if (isValidSubnetMask(subnet) == false)
    {
    	return false;
    }
	
	var addr = IpAddress2DecNum(address);
    var mask = IpAddress2DecNum(subnet);
 
    /* �����Ip */
    if (0 == (addr & (~mask)))
    {
        return false;
    }
    
    /* �ǹ㲥Ip */
    if (isBroadcastIp(address,subnet) == true)
    {
       return false;
    }
   
    return true;
}
/* end of HG_Maintenance 2007.10.24 ATPV100R001C01B011 AU4D00155 */

function isDeIpAddress(address)
{
    if (isValidIpAddress(address) == false)
    {
        return false;
    }
    
    var num = 0;
    var addrParts = address.split('.');
    if (addrParts.length != 4)
    {
        return false;
    }
    
    if (!isInteger(addrParts[0]) || addrParts[0] < 0 )
    {
        return false;
    }
    num = parseInt(addrParts[0]);
    if (!(num >= 224 && num <= 247))
    {
        return false;
    }

    for (var i = 1; i <= 3; i++)
    {
        if (!isInteger(addrParts[i]) || addrParts[i] < 0)
        {
            return false;
        }
        num = parseInt(addrParts[i]);
        if (!(num >= 0 && num <= 255))
        {
            return false;
        }
    }

    return true;
}

function isBroadcastIpAddress(address)
{
    if (isValidIpAddress(address) == false)
    {
        return false;
    }
    
    var addrParts = address.split('.');
    if (addrParts[3] == '255')
    {
        return true;
    }
    return false;
}

function isNtwkSgmtIpAddress(address)
{
    if (isValidIpAddress(address) == false)
    {
        return false;
    }
    
    var addrParts = address.split('.');
    if (addrParts[3] == '0')
    {
        return true;
    }
    return false;
}

function isLoopIpAddress(address)
{
    if (isValidIpAddress(address) == false)
    {
        return false;
    }
    
    var addrParts = address.split('.');
    if (addrParts[0] == '127')
    {
        return true;
    }
    return false;
}

function getLeftMostZeroBitPos(num) {
   var i = 0;
   var numArr = [128, 64, 32, 16, 8, 4, 2, 1];

   for ( i = 0; i < numArr.length; i++ )
      if ( (num & numArr[i]) == 0 )
      { 
      	  return i;
      }

   return numArr.length;
}
function getRightMostOneBitPos(num) {
   var i = 0;
   var numArr = [1, 2, 4, 8, 16, 32, 64, 128];

   for ( i = 0; i < numArr.length; i++ )
      if ( ((num & numArr[i]) >> i) == 1 )
	  {
	  	 return (numArr.length - i - 1);
      }

   return -1;
}
function isValidSubnetMask(mask) 
{
   var i = 0, num = 0;
   var zeroBitPos = 0, oneBitPos = 0;
   var zeroBitExisted = false;

   if ( mask == '0.0.0.0' )
      return false;

   var maskParts = mask.split('.');
   if ( maskParts.length != 4 ) return false;

   for (i = 0; i < 4; i++) 
   {
      if ( isNaN(maskParts[i]) == true || maskParts[i] == "" || maskParts[i].charAt(0) == '+' ||  maskParts[i].charAt(0) == '-')
      {
      	  return false;
      }
	  if (!isInteger(maskParts[i]) || maskParts[i] < 0)
      {
          return false;
      }
      num = parseInt(maskParts[i]);
      if ( num < 0 || num > 255 )
      {
         return false;
      }
	  if ( zeroBitExisted == true && num != 0 )
      {
      	 return false;
	  }
      zeroBitPos = getLeftMostZeroBitPos(num);
      oneBitPos = getRightMostOneBitPos(num);
      if ( zeroBitPos < oneBitPos )
      {
         return false;
      }
      if ( zeroBitPos < 8 )
         zeroBitExisted = true;
   }

   return true;
}

function isValidPort(port) 
{ 
   if (!isInteger(port) || port < 1 || port > 65535)
   {
       return false;
   }
   
   return true;
}


function isValidPortPair(StartPort,EndPort)
{
   if (!isValidPort(StartPort) || !isValidPort(EndPort))
   {
       return false;
   }

   if (parseInt(StartPort) <= parseInt(EndPort) )
           return false;      
   
   return true;
}

function isValidMacAddress(address) {
   var c = '';
   var i = 0, j = 0;

   if ( address.toLowerCase() == 'ff:ff:ff:ff:ff:ff' )
   {
       return false;
   }

   addrParts = address.split(':');
   if ( addrParts.length != 6 ) return false;

   for (i = 0; i < 6; i++) {
      if ( addrParts[i] == '' )
         return false;

      if ( addrParts[i].length != 2)
      {
        return false;
      }

      if ( addrParts[i].length != 2)
      {
         return false;
      }

      for ( j = 0; j < addrParts[i].length; j++ ) {
         c = addrParts[i].toLowerCase().charAt(j);
         if ( (c >= '0' && c <= '9') ||
              (c >= 'a' && c <= 'f') )
            continue;
         else
            return false;
      }
   }

   return true;
}

function isNtwkSgmtIpAddress(address)
{
    if (isValidIpAddress(address) == false)
    {
        return false;
    }
    
    var addrParts = address.split('.');
    if (addrParts[3] == '0')
    {
        return true;
    }
    return false;
}

function isSameSubNet(Ip1, Mask1, Ip2, Mask2) 
{
   var count = 0;
   //alert('isSameSubNet');
   lan1a = Ip1.split('.');
   lan1m = Mask1.split('.');
   lan2a = Ip2.split('.');
   lan2m = Mask2.split('.');

   for (i = 0; i < 4; i++) 
   {
      l1a_n = parseInt(lan1a[i]);
      l1m_n = parseInt(lan1m[i]);
      l2a_n = parseInt(lan2a[i]);
      l2m_n = parseInt(lan2m[i]);
      if ((l1a_n & l1m_n) == (l2a_n & l2m_n))
         count++;
   }
   if (count == 4)
      return true;
   else
      return false;
}

/////////////////////////////////////////////////

//��IP��ַת��Ϊʮ��������
function IpAddress2DecNum(address)
{
    if (isValidIpAddress(address) == false)
    {
        return -1;
    }
    var addrParts = address.split('.');
    var num = 0;
    for (i = 0; i < 4; i++)
    {
        num += parseInt(addrParts[i]) * Math.pow(256, 3 - i);
    }
    return num;
}

/*
function port_check(start, end) {
   if ( (start <= 21) && (end >= 21) )
   {
       return 21;
   }

   if ( (start <= 6667) && (end >= 6667) )
   {
       return 6667;
   }

   if ( (start <= 69) && (end >= 69) )
   {
       return 69;
   }

   if ( (start <= 161) && (end >= 161) )
   {
       return 161;
   }

   if ( (start <= 162) && (end >= 162) )
   {
       return 162;
   }

   if ( (start <= 517) && (end >= 517) )
   {
       return 517;
   }

   if ( (start <= 518) && (end >= 518) )
   {
       return 518;
   }

   if ( (start <= 1720) && (end >= 1720) )
   {
       return 1720;
   }

   if ( (start <= 1723) && (end >= 1723) )
   {
       return 1723;
   }

   if ( (start <= 80) && (end >= 80) )
   {
       return 80;
   }
   
   return 0;
}
*/
//var hexVals = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9",
 //             "A", "B", "C", "D", "E", "F");

/*the change of data type*/
/*
function encodeUrl(val)
{
   var len     = val.length;
   var i       = 0;
   var newStr  = "";
   var original = val;

   for ( i = 0; i < len; i++ ) {
      if ( val.substring(i,i+1).charCodeAt(0) < 255 ) {
         // hack to eliminate the rest of unicode from this
         if (isUnsafe(val.substring(i,i+1)) == false)
            newStr = newStr + val.substring(i,i+1);
         else
            newStr = newStr + convert(val.substring(i,i+1));
      } else {
         // woopsie! restore.
         alert ("Found a non-ISO-8859-1 character at position: " + (i+1) + ",\nPlease eliminate before continuing.");
         newStr = original;
         // short-circuit the loop and exit
         i = len;
      }
   }

   return newStr;
}
*/

//web Element 
/*start of HGW 2008.1.10 For A36D04370 FireFox ��ʾ V100R001C02B013 by w00104696*/
/*get element by name or id*/
function getElById(sId)
{
	return getElement(sId);
}

function getElementById(sId)
{
	if (document.getElementById)
	{
		return document.getElementById(sId);	
	}
	else if (document.all)
	{
		// old IE
		return document.all(sId);
	}
	else if (document.layers)
	{
		// Netscape 4
		return document.layers[sId];
	}
	else
	{
		return null;
	}
}

/*getElByName*/
function getElementByName(sId)
{    // standard
	if (document.getElementsByName)
	{
		var element = document.getElementsByName(sId);
		
		if (element.length == 0)
		{
			return null;
		}
		else if (element.length == 1)
		{
			return 	element[0];
		}
		
		return element;		
	}
}

function getElement(sId)
{
	 var ele = getElementByName(sId); 
	 if (ele == null)
	 {
		 return getElementById(sId);
	 }
	 return ele;
}
/*end of HGW 2008.1.10 For A36D04370 FireFox ��ʾ V100R001C02B013 by w00104696*/

function getOptionIndex(sId,sValue)
{
	var selObj = getElById(sId);
	if (selObj == null)
	{
		return -1;
	}
	
	for (i = 0; i < selObj.length; i++)
	{
		if (selObj.options[i].value == sValue)
		{
			return i;
		}
	}
}

/*----------------getLength-----------------*/
function getTextLength(sId)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return -1;
	}
	
	return item.length;
}

function getSelectLength(sId)
{
	return getTextLength(sId);
}

function getValue(sId)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return -1;
	}
	
	return item.value;
}


/* Web page manipulation functions */
function setElementStyle(sId, sStyle, sVal)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return false;
	}
	
    if (document.getElementById)  // DOM3 = IE5, NS6
    {
        eval("document.getElementById(sId).style." + sStyle + "='" + sVal + "'");
    }
    else
    {
        if (document.layers == false) // IE4
        {
            eval("document.all[sId].style."+ sStyle + "='" + sVal + "'");
        }
        else
        {
      	    if (document.layers[sId]) //NS4
      	    {
      	        eval("document.layers[sId]."+ sStyle + "='" + sVal + "'");
      	    }
      	    else if(document.all != null)
      	    {
      	 	    eval("document.all[sId]."+ sStyle + "='" + sVal + "'");
      	    }
        }
    }
	
	return true;
}

/*start of HGW 2008.1.10 For A36D04370 FireFox ��ʾ V100R001C02B013 by w00104696*/
function setDisplay (sId, sh)
{
    var status;
    if (sh > 0) 
    {
        status = "";
    }
    else 
    {
        status = "none";
    }

    getElement(sId).style.display = status;
}
/*end of HGW 2008.1.10 For A36D04370 FireFox ��ʾ V100R001C02B013 by w00104696*/

function setVisible(sId, sh)
{
    var status;
    if (sh > 0) 
	{
        status = "visible";
    }
    else 
	{
        status = "hidden"
    }
    
	if (setElementStyle(sId,'visibility',status))
	   return true;
	else
	   return false;
}

function setSelect(sId, sValue)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return false;
	}
	
	for (var i = 0; i < item.options.length; i++) 
	{
        if (item.options[i].value == sValue)
		{

        	item.selectedIndex = i;
        	return true;
        }
    }

    alert("the option which value is " + sValue + " is not existed in " + sId);
    return false;
}

function setText (sId, sValue)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return false;
	}
    
	item.value = sValue;
	return true;
}


function setCheck(sId, value)
{
	var item;
	item = getElById(sId);
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return false;
	}
	
    if ( value == '1' ) 

	{    

         item.checked = true;
		// item.value = 1;
    }
	else
	{
         item.checked = false;
		// item.value = 0;
    }

    return true;
}

function setRadio(sId, sValue)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return false;
	}
	
	for (i=0; i<item.length; i++)
	{
		if (item[i].value == sValue) 
		{
			item[i].checked = true;
			return true;
		}
    }

    alert("the option which value is " + sValue + " is not existed in " + sId);
    return false;
}

function setDisable(sId, flag)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return false;
	}
	
    if ( flag == 1 || flag == '1' ) 
	{
         item.disabled = true;
    }
	else
	{
         item.disabled = false;
    }     

    return true;
}


/*-----select------*/
function addOption(sId,OptionName,OptionValue,OptionText)
{	
	var Param = document.createElement("option");
	Param.name =  OptionName;
	Param.value = OptionValue;
	Param.innerText = OptionText;
	
	var selItem;
    if ((selItem = getElById(sId)) != null)
	{			
		selItem.appendChild(Param);		
		return true;
	}
	else
	{
        alert(sId + " is not existed" );
		return false;
	}
}

function removeOption(sId,sValue)
{
	var selItem;
	if ((selItem = getElById(sId)) != null)
	{
		var index = getOptionIndex(sId,sValue);
		if (index >= 0)
		{

			selItem.removeChild(selItem.options[index]);
			return true;
		}
        else
        {
            alert("the option which value is " + sValue + " is not existed" );
            return false;
        }
	}
	
	alert(sId + " is not existed" );
	return false;
}

function removeAllOption(sId)
{
	var selItem;
	if ((selItem = getElById(sId)) != null)
	{
		//var list =selItem.childNodes;
		//for( var i in list)
	//	{
	//	    selItem.removeChild(selItem.options[0]);
	//	}
	//alert(selItem.length)
			selItem.length = 0;	
			//alert(selItem.length)
		return true;
	}
 
	alert(sId + " is not existed" );
	return false;
}

/////////////////////////////////////////////////////
// Load / submit functions
/*
function getSelect(item)
{
	var idx;
	if (item.options.length > 0) 
	{
	    idx = item.selectedIndex;
	    return item.options[idx].value;
	}
	else 
	{
		return '';
    }
}
*/
/*
//��ȡList�б����ж����ѡ�У�����ѡ�еĸ���
function getListSelectedCount(List)
{
    //����Ƕ����б�
    if (List.length > 0)
    {
        var SelectedCount = 0;
        
        //ͳ��ѡ�����
        for (i = 0; i < List.length; i++)
        {
            if (List[i].checked == true)
            {
                SelectedCount++;
            }
        }
        
        return SelectedCount;
    }
    //����ǵ����б�
    else
    {
        if (List.checked == true)
        {
            return 1;
        }
        
        return 0;
    }
}
*/
//the functions for the internal call


/*
var unsafeString = "\"<>%\\^[]`\+\$\,'#&/";
// deleted these chars from the include list ";", "/", "?", ":", "@", "=", "&" and #
// so that we could analyze actual URLs
function isUnsafe(compareChar)
// this function checks to see if a char is URL unsafe.
// Returns bool result. True = unsafe, False = safe
{
   if ( unsafeString.indexOf(compareChar) == -1 && compareChar.charCodeAt(0) > 32
        && compareChar.charCodeAt(0) < 123 )
      return false; // found no unsafe chars, return false
   else
      return true;
}

var markStrChars = "\"'";
// Checks to see if a char is used to mark begining and ending of string.
// Returns bool result. True = special, False = not special
function isMarkStrChar(compareChar)
{
   if ( markStrChars.indexOf(compareChar) == -1 )
      return false; // found no marked string chars, return false
   else
      return true;
}*/

/*
function decToHex(num, radix)
// part of the hex-ifying functionality
{
   var hexString = "";
   while ( num >= radix ) 
   {
      temp = num % radix;
      num = Math.floor(num / radix);
      hexString += hexVals[temp];
   }
   hexString += hexVals[num];
   return reversal(hexString);
}

function reversal(s)
// part of the hex-ifying functionality
{
   var len = s.length;
   var trans = "";
   for (i = 0; i < len; i++)
      trans = trans + s.substring(len-i-1, len-i);
   s = trans;
   return s;
}
function convert(val)
// this converts a given char to url hex form
{
   return  "%" + decToHex(val.charCodeAt(0), 16);
}*/
/////////////////////////////////////////////////////
/*
/*
//no using
// use backslash in front one of the escape codes to process
// marked string characters.
// Returns new process string
function processMarkStrChars(str) 
{
   var i = 0;
   var retStr = '';

   for ( i = 0; i < str.length; i++ ) {
      if ( isMarkStrChar(str.charAt(i)) == true )
         retStr += '\\';
      retStr += str.charAt(i);
   }

   return retStr;
}
*/

////////////////////////////////////////////////////////�ύ
function webSubmitForm(sFormName, DomainNamePrefix)
{
    /*-----------------------internal method------------------------*/
    this.setPrefix = function(Prefix)
    {
		if (Prefix == null)
		{
			this.DomainNamePrefix = '.';
		}
		else
		{
			this.DomainNamePrefix = Prefix + '.';
		}
	}
	
	this.getDomainName = function(sName){
		if (this.DomainNamePrefix == '.')
		{
		    return sName;
		}
		else
		{
		    return this.DomainNamePrefix + sName;
		}
	}
	
    this.getNewSubmitForm = function()
	{
		var submitForm = document.createElement("FORM");
		document.body.appendChild(submitForm);
		submitForm.method = "POST";
		return submitForm;
	}

/*start of HGW 2008.1.10 For A36D04370 FireFox ��ʾ V100R001C02B013 by w00104696*/	
	this.createNewFormElement = function (elementName, elementValue){
	    var newElement = document.createElement('INPUT');
		newElement.setAttribute('name',elementName);
		newElement.setAttribute('value',elementValue);
		newElement.setAttribute('type','hidden');
		return newElement;
	}
	
	/*---------------------------external method----------------------------*/
	this.addForm = function(sFormName,DomainNamePrefix)
	{
	    this.setPrefix(DomainNamePrefix);
	    var srcForm = getElement(sFormName);
		if (srcForm != null && srcForm.length > 0 && this.oForm != null 
			&& srcForm.style.display != 'none')
		{
			MakeCheckBoxValue(srcForm);
			
			for(i=0; i < srcForm.elements.length; i++)
			{  
			     var type = srcForm.elements[i].type;
			     if (type != 'button' && srcForm.elements[i].disabled == false)
				 {				
					 if (this.DomainNamePrefix != '.')
					 {
						 var ele = this.createNewFormElement(this.DomainNamePrefix 
												              + srcForm.elements[i].name,
												              srcForm.elements[i].value);	
						 this.oForm.appendChild(ele);
					 }	   
					 else
					 {
						var ele = this.createNewFormElement(srcForm.elements[i].name,
												             srcForm.elements[i].value
															  );
						this.oForm.appendChild(ele);
					 }	 
				 }
			 }
		}
		else
		{
			this.status = false;
		}
		
		this.DomainNamePrefix = '.';
	}
/*end of HGW 2008.1.10 For A36D04370 FireFox ��ʾ V100R001C02B013 by w00104696*/
    
	this.addDiv = function(sDivName,Prefix)
	{
		// this.setPrefix(DomainNamePrefix);
		if (Prefix == null)
		{
			Prefix = '';
		}
		else
		{
			Prefix += '.';
		}
		
		var srcDiv = getElement(sDivName);	
		if (srcDiv == null)
		{
			alert(sDivName + ' is not existed!')
			return;
		}
		if (srcDiv.style.display == 'none')
		{
			return;
		}
		//alert(srcDiv)
		var eleSelect = srcDiv.getElementsByTagName("select");
		if (eleSelect != null)
	    {
			for (k = 0; k < eleSelect.length; k++)
			{
				if (eleSelect[k].disabled == false)
				{
					this.addParameter(Prefix+eleSelect[k].name,eleSelect[k].value)
				}
			}
		}
		
		MakeCheckBoxValue(srcDiv);
		var eleInput = srcDiv.getElementsByTagName("input");
		if (eleInput != null)
	    {
			for (k = 0; k < eleInput.length; k++)
			{
				if (eleInput[k].type != 'button' && eleInput[k].disabled == false)
				{
				    this.addParameter(Prefix+eleInput[k].name,eleInput[k].value)
				}
			}	
		}
	}
	
	this.addParameter = function(sName, sValue)
	{
		//����Ƿ�������Ԫ��
		var DomainName = this.getDomainName(sName);
		
		for(i=0; i < this.oForm.elements.length; i++) 
		{
			if(this.oForm.elements[i].name == DomainName)
			{
				this.oForm.elements[i].value = sValue;
				this.oForm.elements[i].disabled = false;
				return;
			}
		}
	
		//û�з������Ԫ��
		if(i == this.oForm.elements.length) 
		{	
			var ele = this.createNewFormElement(DomainName,sValue);	
			this.oForm.appendChild(ele);
		}
	}
	
    this.disableElement = function(sName){	
	    var DomainName = this.getDomainName(sName);		
		for(i=0; i < this.oForm.elements.length; i++) 
		{
			if(this.oForm.elements[i].name == DomainName)
			{
				this.oForm.elements[i].disabled = true;
				return;
			}
		}
	}
	
    this.usingPrefix = function(Prefix){
	     this.DomainNamePrefix = Prefix + '.';
	}
	
    this.endPrefix = function(){
	     this.DomainNamePrefix = '.';
	}
	
	this.setMethod = function(sMethod) {
		if(sMethod.toUpperCase() == "GET")
			this.oForm.method = "GET";
		else
			this.oForm.method = "POST";
	};

	this.setAction = function(sUrl) {
		this.oForm.action = sUrl;
		var findlog =  sUrl.indexOf('login');
		if( findlog == -1)
		{
			var temp = sUrl.lastIndexOf('/') + 1;
			top.g_url = sUrl.substr(temp);
		}
	}

	this.setTarget = function(sTarget) {
		this.oForm.target = sTarget;
	};

	this.submit = function(sURL, sMethod) {
		if( sURL != null && sURL != "" ) this.setAction(sURL);
		if( sMethod != null && sMethod!= "" ) this.setMethod(sMethod);
		
		if (this.status == true)
		    this.oForm.submit();
	};
	
	this.status = true;
	/*--------------------------------excute by internal-------------------------*/
	this.setPrefix(DomainNamePrefix);
	this.oForm = this.getNewSubmitForm();
	if (sFormName != null && sFormName != '')
	{
		this.addForm(sFormName,this.DomainNamePrefix);
		//this.DomainNamePrefix = '.';
	}
}


function MakeCheckBoxValue(srcForm)
{
	var Inputs = srcForm.getElementsByTagName("input");
	for (var i = 0; i < Inputs.length; i++) 
	{
		if (Inputs[i].type == "checkbox")
		{
			var CheckBox = getElById(Inputs[i].name);
//alert(Inputs[i].name)
			if (CheckBox.checked == true)
			{
				CheckBox.value = 1;
			}
			else
			{
				CheckBox.value = 0;
			}
		}
		else if (Inputs[i].type == "radio")
		{
			var radio = getElById(Inputs[i].name);
	        for (k = 0; k < radio.length; k++)
			{
				if (radio[k].checked == false)
				{
				    radio[k].disabled = true;
				}				
			}
		}
	}
}


function Submit(type)
{
    if (CheckForm(type) == true)
	{
	    var Form = new webSubmitForm();
	    AddSubmitParam(Form,type);		
		Form.submit();
		showLoading();
	}
}

////////////////////////////////////////////////////
function FinishLoad()
{
//	alert("FinishLoad");
}

function DoUnload()
{/*
	if (typeof(event) != 'undefined' && event != null)
    {
		if (event.clientY < 0||event.altKey)
		{//alert(2)
			//top.location.replace("/logout.cgi"); 
		}
	}
	*/
}

function DoLogout()
{
	//document.cookie = 'Cookie=default;path=/';
}

//����XMLHttp����
function CreateXMLHttp()
{	
     var xmlhttp = null;
     var aVersions = ["MSXML2.XMLHttp.5.0","MSXML2.XMLHttp.4.0","MSXML2.XMLHttp.3.0",      
                      "MSXML2.XMLHttp","Microsoft.XMLHttp"];

     if(window.XMLHttpRequest)
     { 
         try 
         {
             xmlhttp = new XMLHttpRequest();
         }
         catch (e)
         {
         }
     }
     else 
     {
         if(window.ActiveXObject)//IE6��IE5
         {     
             for (var i=0; i<5; i++)   
             {
                  try
                  {          
                       xmlhttp = new ActiveXObject(aVersions[i]);
                       return xmlhttp;
                  }
                  catch (e)
                  {
                  }
             }
          }
     } 


     return xmlhttp;
}


/////////////////////////////////////
function AssociateParam(dest,src,name)
{
   var DestObj = eval(dest);
   var SrcObj = eval(src);
   var NameArray = name.split('|');
   
   for (j = 0; j < DestObj.length; j++)
   {
	  if (DestObj[j] == null)
	     break;
	  for (i = 0; i < SrcObj.length; i++)
	  {
		if (SrcObj[i] == null)
	        break;
		if (DestObj[j].key.indexOf(SrcObj[i].key) > -1)
		{
			try 
		    {
				eval(dest + '[' + j + ']' + '.' + 'Relating' + '='
		             + src + '[' + i + ']');
			}
			catch (e)
			{
			}
			 for (k = 0; k < NameArray.length; k++)
            {   
			     if (NameArray[k] == '')
				 {
					 continue;
				 }
				 
	        	 try
				 {
					 eval(dest + '[' + j + ']' + '.' + NameArray[k] + '='
			           + src + '[' + i + ']' + '.' + NameArray[k]);
				 }
				 catch (e)
				 {
				 }
		    }
			break;
	 	}
	  }
   }
 
}


function getBoolValue(param)
{
    var value = parseInt(param);
    if (isNaN(value) == true )
    {
       var LowerParam = param.toLowerCase();
       if (LowerParam == 'enable')
       {
          return 1;
       }
       else
       {
          return 0;
       }
    }
    else
    {
       return value;
    }
}

function getCheckVal(sId)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return -1;
	}
	if (item.checked == true)
	{
		return 1;
	}

	else
	{
		return 0;
	}
}

function getRadioVal(sId)
{
	var item;
	if (null == (item = getElById(sId)))
	{
		alert(sId + " is not existed" );
		return -1;
	}
	for (i = 0; i < item.length; i++)
	{//alert(item[i].checked)
		if (item[i].checked == true)
		{
		   return item[i].value;
		}
	}
	
	return -1;
}

function getSelectVal(sId)
{
   return getValue(sId);
}

/*start of HGW 2008.1.10 For A36D04370 FireFox ��ʾ V100R001C02B013 by w00104696*/
function getDisplayText(val,lineLength)
{
   if (lineLength == null)
      lineLength = 20;
   var content = '';
   var index = 0;
   var len = val.length;
   
   while (len > lineLength)
   {
	  content += val.substr(index,lineLength);   
	  len -= lineLength;
	  index += lineLength;
   }
   content += val.substr(index);    
   
   return content; 
}
/*end of HGW 2008.1.10 For A36D04370 FireFox ��ʾ V100R001C02B013 by w00104696*/

//IPv6
function ParseIpv6Array(str)
{
    var Num;
    var i,j;
    var finalAddrArray = new Array();
    var falseAddrArray = new Array();
    
    var addrArray = str.split(':');
    Num = addrArray.length;
    if (Num > 8)
    {
        return falseAddrArray;
    }

    for (i = 0; i < Num; i++)
    {
        if ((addrArray[i].length > 4) 
            || (addrArray[i].length < 1))
        {
            return falseAddrArray;
        }
        for (j = 0; j < addrArray[i].length; j++)
        {
            if ((addrArray[i].charAt(j) < '0')
                || (addrArray[i].charAt(j) > 'f')
                || ((addrArray[i].charAt(j) > '9') && 
                (addrArray[i].charAt(j) < 'a')))
            {
                return falseAddrArray;
            }
        }

        finalAddrArray[i] = '';
        for (j = 0; j < (4 - addrArray[i].length); j++)
        {
            finalAddrArray[i] += '0';
        }
        finalAddrArray[i] += addrArray[i];
    }

    return finalAddrArray;
}

function getFullIpv6Address(address)
{
    var c = '';
    var i = 0, j = 0, k = 0, n = 0;
    var startAddress = new Array();
    var endAddress = new Array();
    var finalAddress = '';
    var startNum = 0;
    var endNum = 0;
    var lowerAddress;
    var totalNum = 0;

    lowerAddress = address.toLowerCase();
 
    var addrParts = lowerAddress.split('::');
    if (addrParts.length == 2)
    {
        if (addrParts[0] != '')
        {
            startAddress = ParseIpv6Array(addrParts[0]);
            if (startAddress.length == 0)
            {
                return '';
            }
        }
        if (addrParts[1] != '')
        {
            endAddress = ParseIpv6Array(addrParts[1]);
            if (endAddress.length == 0)
            {
               return '';
            }
        }

        if (startAddress.length +  endAddress.length >= 8)
        {
            return '';
        }
    }
    else if (addrParts.length == 1)
    {
        startAddress = ParseIpv6Array(addrParts[0]);
        if (startAddress.length != 8)
        {
            return '';
        }
    }
    else
    {
        return '';
    }

    for (i = 0; i < startAddress.length; i++)
    {
        finalAddress += startAddress[i];
        if (i != 7)
        {
            finalAddress += ':';
        }
    }
    for (; i < 8 - endAddress.length; i++)
    {
        finalAddress += '0000';
        if (i != 7)
        {
            finalAddress += ':';
        }
    }
    for (; i < 8; i++)
    {
        finalAddress += endAddress[i - (8 - endAddress.length)];
        if (i != 7)
        {
            finalAddress += ':';
        }
    }

    return finalAddress;
    
}

function isIpv6Address(address)
{
    if (getFullIpv6Address(address) == '')
    {
        return false;
    }
    
    return true;
}

function isUnicastIpv6Address(address)
{
    var tempAddress = getFullIpv6Address(address);
    
    if ((tempAddress == '')
        || (tempAddress == '0000:0000:0000:0000:0000:0000:0000:0000')
        || (tempAddress == '0000:0000:0000:0000:0000:0000:0000:0001')
        || (tempAddress.substring(0, 2) == 'ff'))
    {
        return false;
    }
    
    return true;
}

function isGlobalIpv6Address(address)
{
    var tempAddress = getFullIpv6Address(address);
    
    if ((tempAddress == '')
        || (tempAddress == '0000:0000:0000:0000:0000:0000:0000:0000')
        || (tempAddress == '0000:0000:0000:0000:0000:0000:0000:0001')
        || (tempAddress.substring(0, 3) == 'fe8')
        || (tempAddress.substring(0, 3) == 'fe9')
        || (tempAddress.substring(0, 3) == 'fea')
        || (tempAddress.substring(0, 3) == 'feb')
        || (tempAddress.substring(0, 3) == 'fec')
        || (tempAddress.substring(0, 2) == 'ff'))
    {
        return false;
    }
    
    return true;
}


/* �ж�������ַ�Ƿ���ȣ������Ȼ��ߵ�ַ���󷵻�false�����򷵻�true
 * ������������ getFullIpv6Address
 */
function CompareTwoAddress(addr1, plen1, addr2, plen2)
{
	var x = 0;
	var j = 0;
	var i = 0;

	var addr1Tmp = getFullIpv6Address(addr1);
	var addr2Tmp = getFullIpv6Address(addr2);

	if ((addr1Tmp == '') || (addr2Tmp == ''))
	{
		return false;
	}

	/* ����ַת��Ϊ8������ÿһ����ŵ���16bit���ַ� */
	var addr1Comp = addr1Tmp.split(':');
	var addr2Comp = addr2Tmp.split(':');

	//alert('addr1: ' + addr1Comp + ' plen1: ' + plen1
	//	+ ' addr2: ' + addr2Comp + ' plen2: ' + plen2);
	
	if (plen1 != plen2)
	{
		return false;
	}
	
	x = (plen1 / 16);
	/* ��x������£ */
	for (i = 0; i < 8; i++)
	{
		if ((i <= x) && ((i + 1) >= x))
		{
			x = i;
			break;
		}
	}

	/* �ȱȽϿ������16bit���ַ��� */
	for (i = 0; i < x; i++)
	{
		if (addr1Comp[i] != addr2Comp[i])
		{
			return false;
		}
	}
	
	j = plen1 % 16;
	if (0 == j)    /* ���ǰ׺��16��������ô����ַƥ�� */
	{
		return true;
	}

	//alert('addr ' + x + ' ' + addr1Comp[x] + ' ' + addr2Comp[x] + ' j ' + j);

	/* С��16bit����ת��Ϊ������ʽ�Ƚ� */
	x1 = parseHex(addr1Comp[x], 16);
	x2 = parseHex(addr2Comp[x], 16);

	if ((x1 ^ x2) >= (1 << (16 - j)))
	{
		return false;
	}

	return true;
}

function cmpIpv6Address(minAddr, maxAddr)
{
	var fullMinAddr = getFullIpv6Address(minAddr);
	var fullMaxAddr = getFullIpv6Address(maxAddr);

	var minParts = fullMinAddr.split(':');
	var maxParts = fullMaxAddr.split(':');

	var retVal = false;

	if ((minParts.length != 8) || (maxParts.length != 8))
	{
		return retVal;
	}

	for (var i = 0; i < 8; i++)
	{
		if (minParts[i] > maxParts[i])
		{
			retVal = false;
			break;
		}
		else if (minParts[i] < maxParts[i])
		{
			retVal = true;
			break;
		}
	}

	if (i == 8)
	{
		retVal = true;
	}

	return retVal;
}
function RefreshPage()
{
	location.href = document.location.href;
}

function isValidCfgStr(cfgName, val, len)
{
	if (isValidAscii(val) != '')         
	{            
		alert(cfgName + ' has invalid character "' + isValidAscii(val) + '".')          
		return false;       
    }
   if (val.length > len)
   {
	   alert(cfgName + ' has up to ' + len  + ' characters.');
	   return false;
   }		
}

function isSafeStringExc(compareStr, UnsafeStr)
{
	for (var i = 0; i < compareStr.length; i++)
	{
		var c = compareStr.charAt(i);
		if (isValidAscii(c) != '')
		{
			 return false;
	    }
		else
		{
			if (UnsafeStr.indexOf(c) > -1)
			{
				return false;
			}
		}
	}
    return true;
}

function isValidCfgInteger(cfgName, val, start, end)
{
	   if (isInteger(val) == false)
	   {
	       alert(cfgName + ' is invalid, it must be digist.');
		   return false;
	   }
	   var temp = parseInt(val);
	   if (temp < start || temp > end)
	   {
	       alert(cfgName + ' must be greater than ' + start.toString()
		         + ' and less than ' + end.toString() + '.');
		   return false;
	   }	
}

//��subnet��ַת��Ϊʮ��������
function SubnetAddress2DecNum(address)
{
    if (isValidSubnetMask(address) == false)
    {
        return -1;
    }
    var addrParts = address.split('.');
    var num = 0;
    for (i = 0; i < 4; i++)
    {
        num += parseInt(addrParts[i]) * Math.pow(256, 3 - i);
    }
    return num;
}

function getDivInnerId(divID)
{
    var nameStartPos = -1;
    var nameEndPos = -1;
    var ele;

    divHTML = getElement(divID).innerHTML;
    nameStartPos = divHTML.indexOf("name=");
    nameEndPos   = divHTML.indexOf(' ', nameStartPos);
    if(nameEndPos <= 0)
    {
        nameEndPos = divHTML.indexOf(">", nameStartPos);
    }
    
    try
    {
        ele = eval(divHTML.substring(nameStartPos+3, nameEndPos));
    }
    catch (e)
    {
        ele = divHTML.substring(nameStartPos+3, nameEndPos);
    }
    return ele;
}

function toBreakWord(val,lineLength)
{
   var content = '';
   var index = 0;
   var len = val.length;
   
   while (len > lineLength)
   {
	  content += val.substr(index,lineLength) + '<br>';   
	  len -= lineLength;
	  index += lineLength;
   }
   content += val.substr(index);    
   
   return content; 
}

function isMaskOf24BitOrMore(mask)
{
    var i = 0, num = 0;
    if(false == isValidSubnetMask(mask))
    {
        return false;
    }
    var maskParts = mask.split('.');
    for(i = 0;i < 3;i++)
    {
        num = parseInt(maskParts[i]);
        if(num != 255)
            return false;
    }
    return true;
}

function ipInSubnet(ip,subnetStart,subnetEnd)
{
    var ipDec;
    var subnetStartDec;
    var subnetEndDec;
   
    ipDec = IpAddress2DecNum(ip);
    /* BEGIN: Added by c00147909, 2009/2/6  PN: AI8D02757*/
    subnetStartDec = SubnetAddress2DecNum(subnetStart);
    subnetEndDec = SubnetAddress2DecNum(subnetEnd);
    /* END:   Added by c00147909, 2009/2/6 */
   if((ipDec >= subnetStartDec) && (ipDec <= subnetEndDec )) 
    {
        return true;
    }

    return false;
}
function netmaskIsContinue(Mask)
{
    var ulmask;
    var i;
    var ulTmp = 0xffffffff;
    /* BEGIN: Added by c00147909, 2009/2/6  PN: AI8D02757 */
    ulmask = SubnetAddress2DecNum(Mask);
    /* END:   Added by c00147909, 2009/2/6 */
    for (i = 0; i < 32; i++)
    {
        if (ulTmp == ulmask)
        {
            return 0;
        }
        
        ulTmp <<= 1 ;
    }
    
    return 1;
}

function getmaskLength(Mask)
{

    var ulTmp;
    var ulCount = 0;
    var ulmask;
    ulTmp = IP_NetmaskIsContinue(Mask);
    /* BEGIN: Added by c00147909, 2009/2/6  PN: AI8D02757 */
    ulmask = SubnetAddress2DecNum(Mask);
    /* END:   Added by c00147909, 2009/2/6 */
    if (ulTmp)
    {
        return 0;    /* ���벻���� */
    }
    
    while (ulmask != 0)
    {
        ulmask = ulmask << 1;
        ulCount++;
    }
    return ulCount;
}

function removeSpaceTrim(inputStr)
{
   var inputStrTemp;
   var i,j = 0;

   if(inputStr == "")
   {
      return "";
   }
   
   for(i=0;i<inputStr.length;i++)
   	{
   	   if(inputStr.charAt(i) == ' ')
   	   {
   	   	   continue;
   	   }
	   else
	   {
	       break;
	   }
   	}

    inputStrTemp = inputStr.substr(i,inputStr.length-i);

	if(inputStrTemp == "")
	{
	   return "";
	}

	for(i=inputStrTemp.length-1;i>=0;i--)
	{
		if(inputStrTemp.charAt(i) == ' ')
		{
		    j++;
			continue;
		}
		else
		{
			break;
		}
	}

	inputStrTemp = inputStrTemp.substr(0,inputStrTemp.length-j);

	return inputStrTemp;
	
}

// JavaScript Document
function writeFile(str)
{
	var fso, ctf;
	try
	{
		if(window.ActiveXObject) {
			fso = new ActiveXObject("Scripting.FileSystemObject");
			ctf = fso.CreateTextFile("c:\\test.txt", true);
			ctf.Write (str);
			ctf.Close();
		}
	}
	catch (e) {
	}
}


function selectLine(id)
{
	var objTR = getElement(id);

	if (objTR != null)
	{
		var temp = objTR.id.split('_')[1];
		if (temp == 'null')
		{
		    setControl(-1);	
			setLineHighLight(objTR);		
		}
        else if (temp == 'no')
        {   
            setControl(-2);
        }
		else
		{
			var index = parseInt(temp);
			setControl(index);
			setLineHighLight(objTR);				
		}	
	}	 
}

function clickAdd(tabTitle)
{
	var tab = document.getElementById(tabTitle).getElementsByTagName('table');

	var row,col;
	var rowLen = tab[0].rows.length;
	var firstRow = tab[0].rows[0];
	var lastRow = tab[0].rows[rowLen - 1];
	
	if (lastRow.id == 'record_null')
	{
		selectLine("record_null");
		return;
	}
    else if (lastRow.id == 'record_no')
    {
        tab[0].deleteRow(rowLen-1);
        rowLen = tab[0].rows.length;
    }
	
	row = tab[0].insertRow(rowLen);	

	var appName = navigator.appName;
	if(appName == 'Microsoft Internet Explorer')
	{
		g_browserVersion = 1; /* IE */
		row.className = 'trTabContent';
		row.id = 'record_null';
		row.attachEvent("onclick", function(){selectLine("record_null");});
	}
	else
	{
		g_browserVersion = 2; /* firefox */
		row.setAttribute('class','trTabContent');
		row.setAttribute('id','record_null');
		row.setAttribute('onclick','selectLine(this.id);');
	}
	
	for (var i = 0; i < firstRow.cells.length; i++)
	{
        col = row.insertCell(i);
	 	col.innerHTML = '----';
	} 
	selectLine("record_null");
}

function addNullInst(tabTitle)
{
    var tab = document.getElementById(tabTitle).getElementsByTagName('table');
	var row,col;
	var rowLen = tab[0].rows.length;
	var firstRow = tab[0].rows[0];
	var lastRow = tab[0].rows[rowLen - 1];
    
    tab[0].deleteRow(rowLen-1);
    rowLen = tab[0].rows.length;
    row = tab[0].insertRow(rowLen);

	var appName = navigator.appName;
	if (appName == 'Microsoft Internet Explorer')
	{
		g_browserVersion = 1; /* IE */
		row.className = 'trTabContent';
		row.id = 'record_no';
		row.attachEvent("onclick", function(){selectLine("record_no");});
	}
	else
	{
		g_browserVersion = 2; /* firefox */
		row.setAttribute('class','trTabContent');
		row.setAttribute('id','record_no');
		row.setAttribute('onclick','selectLine(this.id);');
	}
	
	for (var i = 0; i < firstRow.cells.length; i++)
	{
        col = row.insertCell(i);
	 	col.innerHTML = '----';
	} 
	selectLine("record_no");
}

function removeInst(url)
{
   var rml = getElement('rml');
    if (rml == null)
	   return;
	   
	   
    var SubmitForm = new webSubmitForm();	  
	var cnt = 0;  
    with (document.forms[0])
    {
        if (rml.length > 0)
        {
            for (var i = 0; i < rml.length; i++)
            {
                if (rml[i].checked == true)
                {
                    SubmitForm.addParameter(rml[i].value,'');
					cnt++;
                }
            }
        }
        else if (rml.checked == true)
        {
             SubmitForm.addParameter(rml.value,'');
			 cnt++;
        }
    }

   SubmitForm.setAction('del.cgi?RequestFile=' + url);   
   SubmitForm.submit();	
   showLoading();
}

function writeTabHeader(tabTitle, width, titleWidth, type)
{
	var labelNew = "Add";
	
	if (tabTitle == 'Wan Connection')
	{
		labelNew = "Add";
	}

	if (width == null)
	    width = "70%";
		
	if (titleWidth == null)
	   titleWidth = "120";
			
	var html = 
			"<table width=\"" + width + "\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">"
			+ "<tr>"
			+ "<td>"
			+ "<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">"
			+ "<tr>"
			+ " <td width=\"7\" height=\"22\"> <\/td>"
			+ "<td valign=\"bottom\" align=\"center\" width=\"" + titleWidth + "\" >"
			+ "<\/td>"
			+ "<td width=\"7\"><\/td>"
			+ "<td align=\"right\">"
			+ "<table border=\"0\" cellpadding=\"1\" cellspacing=\"0\">"
			+ "<tr>";
	
	if ('info' == type)
	{
		 
	}
	else if ('cfg' == type)
	{
		html +=  '<td><input id = "newWanBtnID" class="submit" type="button" value="'+ labelNew +'" '
		         + 'onclick="clickAdd(\''
		         + tabTitle + '\');"></td>'
				 
				 + '<td><input id="removeWanBtnID" class="submit" type="button" value="Delete" '
				 + 'onclick="clickRemove(\''
			     + tabTitle + '\');"></td>'
				 + '<td width="3"></td>';
	}
	
	html += "<\/tr>"
			+ "<\/table>"
			+ "<\/td>"
			+ "<\/tr>"
			+ "<\/table>"
			+ "<\/td>"
			+ "<\/tr>"
			+ "<tr>"
			+ "<td id=\"" + tabTitle + "\">";

	document.write(html);		
}

function writeTabInfoHeader(tabTitle, tabWidth, titleWidth)
{
	writeTabHeader(tabTitle,tabWidth,titleWidth,'info');
}

function writeTabCfgHeader(tabTitle, tabWidth,titleWidth)
{
	writeTabHeader(tabTitle,tabWidth,titleWidth,'cfg');
}

function writeTabTail()
{
    document.write("<\/td><\/tr><\/table>");
}



var previousTR = null;
function setLineHighLight(objTR)
{
	console.log("util_skyw");
	if (previousTR != null)
	{
		previousTR.style.border = '1px solid #E3E7E7';
		for (var i = 0; i < previousTR.cells.length; i++)
		{
			previousTR.cells[i].style.color = '#5D646E';
		}
	}
	
	objTR.style.border = '1px solid #D1D1D1';
	for (var i = 0; i < objTR.cells.length; i++)
	{
		objTR.cells[i].style.color = '#0068FD';
	}
	previousTR = objTR;
}

function WanNameSort(a, b)
{
	var a_dig = a.IfaceName.split('_');
	var b_dig = b.IfaceName.split('_');
	var a_v = 0, b_v = 0;

	if ( a_dig.length < 1 || b_dig.length < 1 )
		return -1;

	if ( isPlusInteger(a_dig[0]) )
		a_v = parseInt(a_dig[0]);

	if ( isPlusInteger(b_dig[0]) )
		b_v = parseInt(b_dig[0]);
		
	return (a_v - b_v);
}

function SortObject(IfaceName, RecordIdx)
{
	this.IfaceName = IfaceName;
	this.RecordIdx = RecordIdx;
}

function SortWanNameInterface()
{
	this.SortObjList = null;
	this.SortObjLen = 0;
	this.Repflag = 0;
	this.SetReplaceStrflag = SetReplaceStrflag;
	this.UpdateWanIFName = UpdateWanIFName;
	this.SortMyArray = SortMyArray;
	
	function SetReplaceStrflag( flag )
	{
		this.Repflag = flag;
	}

	function UpdateWanIFName( sortArray, len )
	{
		var i = 0;
		this.SortObjList = new Array(len);
		this.SortObjLen = len;

		for( i = 0; i < len; i++)
		{
			this.SortObjList[i] = new SortObject(sortArray[i], i);
		}
		this.SortObjList.sort(WanNameSort);
		
		return this.SortMyArray( sortArray );
	}
	
	function SortMyArray(myArray)
	{
		var oldArray = myArray;
		var i = 0;
		var arrLen = this.SortObjLen;
		var newArray = new Array(arrLen);

		for( i = 0; i < arrLen; i++)
		{
			newArray[i] = oldArray[this.SortObjList[i].RecordIdx];
			if ( this.Repflag && null != newArray[i] )
			{
				newArray[i] = newArray[i].replace(/N\/A/g,"-");
				if(newArray[i] == "")
					newArray[i] = "-";
			}
		}
		
		return newArray;
	}
}

var SortUtil = new SortWanNameInterface();

function GetQueryString(name)
{
	var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	var r = window.location.search.substr(1).match(reg);
	if (r!=null) return unescape(r[2]); return null;
}
function showProgressTip(allTime){
	var setRemainTime=allTime;
	document.getElementById("second").innerHTML=setRemainTime;
	var showProgress={
		run:function(){
			clearTimeout(setWANTimeoutID);
			setRemainTime--;
			if(setRemainTime > 0){
				document.getElementById("second").innerHTML=setRemainTime;
				setWANTimeoutID=setTimeout(function(){showProgress.run()},1000);
				if(setRemainTime == 25){
					document.getElementById("tip").innerHTML="Rebooting,please waiting...";
				}
			}else if(setRemainTime == 0){
				document.getElementById("second").innerHTML=setRemainTime;
				clearTimeout(setWANTimeoutID);
				if(allTime==115){
					window.top.location.href = "../";	
				}
			}else{
				clearTimeout(setWANTimeoutID);
				return;
			}
		}
	};		
	setWANTimeoutID=setTimeout(function(){showProgress.run()},1000);
}
/*
 * isEqualSegment (addr1,addr1,mask)
 * ���� :����IP��ַaddr1��addr2 ��������mask
 * ��֤����IP�Ƿ���ͬһ���
 */
function isEqualSegment (addr1,addr2,mask){ 
	if(addr2=="" || isValidIpAddress(addr2) == false){
		return true;
	}
	var res1 = []; 
	var res2 = []; 
	addr1 = addr1.split("."); 
	addr2 = addr2.split("."); 
	mask = mask.split("."); 

	for(var i = 0,ilen = addr1.length; i < ilen ; i += 1){ 
		res1.push(parseInt(addr1[i]) & parseInt(mask[i])); 
		res2.push(parseInt(addr2[i]) & parseInt(mask[i])); 
	}
	if(res1.join(".") == res2.join(".")){ 
		return false; 
	}
	else{ 
		return true; 
	}
}

function rootShowLoading(loadingText){
  var contentText=loadingText!=undefined?loadingText:"Waiting";
  var loadingEl = '<div class="modal fade" id="loadingModal" tabindex="-1" role="dialog" aria-labelledby="loadingModal" aria-hidden="true">';
  loadingEl += '<div style="width: 200px;height:20px; z-index: 20000; position: absolute; text-align: center; left: 50%; top: 50%;margin-left:-100px;margin-top:-10px">';  
  loadingEl += '<div class="progress">';
  loadingEl += '<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="margin-bottom: 0px; transition: width 3s ease;">';
  loadingEl += '</div>';
    loadingEl += '</div>';
  loadingEl += '<h5 id="loadText">'+ contentText +'</h5>';
  loadingEl += '</div>';
  loadingEl += '</div>';
  loadingEl += '<div id="showHideModal" class="modal-backdrop fade show" style="display:none;"></div>';
  $("body").append(loadingEl);

  return;
}

function showLoading(loadingText){
	var contentText=loadingText!=undefined?loadingText:"Waiting";
	// new Dialog("<span class='loading_ico'></span><span style='line-height:32px;'>"+contentText+"</span>",{id:'dialog1'}).show();
	var loadingEl = '<div class="modal fade" id="loadingModal" tabindex="-1" role="dialog" aria-labelledby="loadingModal" aria-hidden="true">';
	loadingEl += '<div style="width: 200px;height:20px; z-index: 20000; position: absolute; text-align: center; left: 50%; top: 50%;margin-left:-100px;margin-top:-10px">';  
	loadingEl += '<div class="progress">';
	loadingEl += '<div class="progress-bar progress-bar-striped progress-bar-animated" role="progressbar" style="margin-bottom: 0px; transition: width 3s ease;">';
	loadingEl += '</div>';
  loadingEl += '</div>';
	loadingEl += '<h5 id="loadText">'+ contentText +'</h5>';
	loadingEl += '</div>';
	loadingEl += '</div>';
	$("body").append(loadingEl);
	$('#loadingModal').modal({backdrop: 'static', keyboard: false});
	$('#loadingModal .progress-bar').css({width: "0%"});
	var timeoutId = setTimeout(function() {
		$('#loadingModal .progress-bar').css({width: "100%"});
	}, 200);

	return timeoutId;
}

function hiddenLoading(timeoutId){
	// 根据bootstrap api隐藏方式调用不成功，只能选择手动移除DOM元素
	$('#loadingModal').modal("hide");
	$('#loadingModal').remove();
	$('.modal-backdrop.fade').remove();
	clearTimeout(timeoutId);
}

function showOrHiddenPwd(pwdId){
	if(getElById(pwdId+"_text").style.display=="none"){
		getElById(pwdId+"_img").src='/img/eye_active.png';
		getElById(pwdId).style.display="none";
		getElById(pwdId+"_text").style.display="";
		getElById(pwdId+"_text").value=getElById(pwdId).value;
	}else{
		getElById(pwdId+"_img").src='/img/eye_inactive.png';
		getElById(pwdId).style.display="";
		getElById(pwdId+"_text").style.display="none";
		getElById(pwdId).value=getElById(pwdId+"_text").value;
	}
}
function setShowOrHiddenPwd(pwdId){
	if(getElById(pwdId+"_text").style.display=="none"){
		getElById(pwdId+"_text").value=getElById(pwdId).value;
	}else{
		getElById(pwdId).value=getElById(pwdId+"_text").value;
	}
}
function changeTypetoText(id){
	var userAgent = navigator.userAgent; //userAgent
	var isOpera = userAgent.indexOf("Opera") > -1;
	if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
		// IE
	} else {
		// No IE	
		document.getElementById(id).type = "text";
	}
}
function changeTypetoPassword(id){
	var userAgent = navigator.userAgent; //userAgent
	var isOpera = userAgent.indexOf("Opera") > -1;
	if (userAgent.indexOf("compatible") > -1 && userAgent.indexOf("MSIE") > -1 && !isOpera) {
		// IE
	} else {
		// No IE
		document.getElementById(id).type = "password";
	}
}
function checkeURL(URL){
	var strRegex = '^((https|http|ftp|rtsp|mms)?://)'
					+ '?(([0-9a-z_!~*\'().&=+$%-]+: )?[0-9a-z_!~*\'().&=+$%-]+@)?' //ftp的user@ 
					+ '(([0-9]{1,3}.){3}[0-9]{1,3}' // IP形式的URL- 199.194.52.184 
					+ '|' // 允许IP和DOMAIN（域名） 
					+ '([0-9A-Za-z_!~*\'()-]+.)*' // 域名- www. 
					+ '([0-9A-Za-z][0-9A-Za-z-]{0,61})?[0-9A-Za-z].' // 二级域名 
					+ '[A-Za-z]{2,6})' // first level domain- .com or .museum 
					+ '(:[0-9]{1,4})?' // 端口- :80 
					+ '((/?)|' // a slash isn't required if there is no file name 
					+ '(/[0-9A-Za-z_!~*\'().;?:@&=+$,%#-]+)+/?)$'; 
	var re=new RegExp(strRegex); 
	if (re.test(URL)) { 
		return (true); 
	} else { 
		return (false); 
	} 
}

function isNumeric(s)
{
  var len = s.length;
  var ch;
  if(len==0)
    return false;
  for( i=0; i< len; i++)
  {
    ch= s.charAt(i);
    if( ch > '9' || ch < '0')
    {
      return false;
    }
  }
  return true;
}

function checkMacAddr(field,msg)
{
	return (checkMacAddr_is_legal(field) && checkMacAddr_is_zero(field) && checkMacAddr_is_broadcast(field) && checkMacAddr_is_muticast(field));
}

function checkMacAddr_is_legal(field)
{
	var reg = /[0-9a-fA-F]{12}/;
	if(!field) return false;
	if(!reg.exec(field.value))
	{
		field.focus();
		field.select();
		alert('Invalid MAC address. It should be in hex numbers (0-9 or a-f).');
		return false;
	}
	return true;
}

function checkMacAddr_is_zero(field)
{
	if(!field) return false;
	if(field.value == "000000000000")
	{
		field.focus();
		field.select();
		alert('Invalid MAC address. It should not be 00:00:00:00:00:00 or 000000000000');
		return false;
	}
	return true;
}

function checkMacAddr_is_broadcast(field)
{
	if(!field) return false;
	if(field.value == "ffffffffffff")
	{
		field.focus();
		field.select();
		alert('Invalid MAC address. It should not be ff:ff:ff:ff:ff:ff or ffffffffffff');
		return false;
	}
	return true;
}

function checkMacAddr_is_muticast(field)
{
	//var reg = /01005[eE][0-7][0-9a-fA-F]{5}/;
	//if(reg.exec(field.value))
	if(parseInt(field.value.substr(0, 2), 16) & 0x01 != 0)
	{
		field.focus();
		field.select();
		alert('Invalid MAC address. It should not be multicast mac address 01:xx:xx:xx:xx:xx or 01xxxxxxxxxx');
		return false;
	}
	return true;
}

function checkIpAddress(field, ismask)
{
	if (ismask) {
		if (field.value == "") {
			alert('Subnet mask cannot be empty! It should be filled with 4 digit numbers as xxx.xxx.xxx.xxx');
			field.value = field.defaultValue;
			field.focus();
			return false;
		}
		
		if ( validateKey(field.value) == 0) {
			alert('Invalid subnet mask! It should be the decimal number (0-9) and shoud be filled with 4 digit numbers as xxx.xxx.xxx.xxx');
			field.value = field.defaultValue;
			field.focus();
			return false;
		}
		
		if ( field.value == "0.0.0.0") {
			alert('Invalid subnet mask! It can not be 0.0.0.0');
			field.value = field.defaultValue;
			field.focus();
			return false;
		}
		if ((!checkRange(field.value, 1, 0, 255)) ||
			(!checkRange(field.value, 2, 0, 255)) ||
			(!checkRange(field.value, 3, 0, 255)) ||
			(!checkRange(field.value, 4, 0, 255)))
		{
			alert("Invalid subnet mask!");
			field.value = field.defaultValue;
			field.focus();
			return false;
		}
	}
	else {
		return checkIpAddr(field, 'Invalid IP address! ');
	}
	return true;
}
function checkRange(str, num, min, max)
{
        d = atoi(str, num);
        if (d > max || d < min)
                return false;
        return true;
}
function atoi(str, num)
{
        i = 1;
        if (num != 1) {
                while (i != num && str.length != 0) {
                        if (str.charAt(0) == '.') {
                                i++;
                        }
                        str = str.substring(1);
                }
                if (i != num)
                        return -1;
        }

        for (i=0; i<str.length; i++) {
                if (str.charAt(i) == '.') {
                        str = str.substring(0, i);
                        break;
                }
        }
        if (str.length == 0)
                return -1;
        return parseInt(str, 10);
}
function checkIpAddr(field, msg)
{
  if (field.value=="") {
	alert('IP address cannot be empty! It should be filled with 4 digit numbers as xxx.xxx.xxx.xxx');
	field.value = field.defaultValue;
	field.focus();
	return false;
  }
   if ( validateKey(field.value) == 0) {
      alert(msg + 'It should be the decimal number (0-9) and shoud be filled with 4 digit numbers as xxx.xxx.xxx.xxx');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   if ( !checkDigitRange(field.value,1,1,223) ) {
      alert(msg + 'range in 1st digit. It should be 1-223.');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   if(getDigit(field.value,1)==127){
      alert(msg + 'range in 1st digit. It should not be 127.');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   if ( !checkDigitRange(field.value,2,0,255) ) {
      alert(msg + 'range in 2nd digit. It should be 0-255.');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   if ( !checkDigitRange(field.value,3,0,255) ) {
      alert(msg + 'range in 3rd digit. It should be 0-255.');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   
   if ( !checkDigitRange(field.value,4,1,254) ) {
      alert(msg + 'range in 4th digit. It should be 1-254.');
      field.value = field.defaultValue;
      field.focus();
      return false;
   }
   
   return true;
}

function checkDigitRange(str, num, min, max)
{
  var d = getDigit(str,num);
  if ( d > max || d < min )
      	return false;
  return true;
}

function getDigit(str, num)
{
  var i=1;
  if ( num != 1 ) {
  	while (i!=num && str.length!=0) {
		if ( str.charAt(0) == '.' ) {
			i++;
		}
		str = str.substring(1);
  	}
  	if ( i!=num )
  		return -1;
  }
  for (i=0; i<str.length; i++) {
	if ( str.charAt(i) == '.' ) {
		str = str.substring(0, i);
		break;
	}
}
  if ( str.length == 0)
  	return -1;
  var d = parseInt(str, 10);
  return d;
}

function validateKey(str)
{
	var pointCount = 0;

	for (var i=0; i<str.length; i++) {
		if ( (str.charAt(i) >= '0' && str.charAt(i) <= '9') || (str.charAt(i) == '.' ) ){
			if(str.charAt(i) == '.')
				pointCount++;
			continue;
		}
		return 0;
	}
	if(pointCount > 3)
		return 0;

  return 1;
}

/**
 * 正则表达式判定Url
 * @param url
 * @returns {Boolean}
 */
function Check_URL(url){
  //url= 协议://(ftp的登录信息)[IP|域名](:端口号)(/或?请求参数)
  var strRegex = '^((https|http|ftp)://)?'//(https或http或ftp):// 可有可无
    + '(([\\w_!~*\'()\\.&=+$%-]+: )?[\\w_!~*\'()\\.&=+$%-]+@)?' //ftp的user@  可有可无
    + '(([0-9]{1,3}\\.){3}[0-9]{1,3}' // IP形式的URL- 3位数字.3位数字.3位数字.3位数字
    + '|' // 允许IP和DOMAIN（域名） 
    + '(localhost)|'	//匹配localhost
    + '([\\w_!~*\'()-]+\\.)*' // 域名- 至少一个[英文或数字_!~*\'()-]加上.
    + '\\w+\\.' // 一级域名 -英文或数字  加上.
    + '[a-zA-Z]{1,6})' // 顶级域名- 1-6位英文 
    + '(:[0-9]{1,5})?' // 端口- :80 ,1-5位数字
    + '((/?)|' // url无参数结尾 - 斜杆或没有
    + '(/[\\w_!~*\'()\\.;?:@&=+$,%#-]+)+/?)$';//请求参数结尾- 英文或数字和[]内的各种字符
      
  var strRegex1 = '^(?=^.{3,255}$)((http|https|ftp)?:\/\/)?(www\.)?[a-zA-Z0-9][-a-zA-Z0-9]{0,62}(\.[a-zA-Z0-9][-a-zA-Z0-9]{0,62})+(:\d+)*(\/)?(?:\/(.+)\/?$)?(\/\w+\.\w+)*([\?&]\w+=\w*|[\u4e00-\u9fa5]+)*$';
  var re=new RegExp(strRegex,'i');//i不区分大小写
  //console.log(re);
  //将url做uri转码后再匹配，解除请求参数中的中文和空字符影响
  if (re.test(encodeURI(url))) {
    return (true);
  } else {
    return (false);
  }
}

/* 用于获取object长度 */
function objectLength(o){
  var t = typeof o;
  if(t == 'string'){
    return o.length;
  }else if(t == 'object'){
    var n = 0;
    for(var i in o){
      n++;
    }
    return n;
  }
  return false;
}

var deferAjax = function(formName, data){
  var defer = $.Deferred();
  $.ajax({
    type:"POST",
    url:formName,
    data:data,
    dataType:"html",
    processData:false,
    success:function(res){
      defer.resolve(res);
    },
    error:function(res){
      defer.reject(res);
    }
  });
  return defer;
}

var deferAjaxForUpload = function(formName, data){
  var defer = $.Deferred();
  $.ajax({
    type:"POST",
    url:formName,
    data:data,
    dataType:"html",
    contentType : false,
    processData:false,
    success:function(res){
      defer.resolve(res);
    },
    error:function(res){
      defer.reject(res);
    }
  });
  return defer;
}

var simpleAlert = function (opts) {
  //设置默认参数
  var opt = {
    "closeAll": false,
    "content": "",
    "buttons": {},
    "autoClose": 0,//seconds
    "IPchange": ""
  }
  //合并参数
  var option = $.extend(opt, opts);
  //事件
  var dialog = {}
  var $simpleAlert = $('<div class="simpleAlert">');
  var $shelter = $('<div class="simpleAlertShelter">');
  var $simpleAlertBody = $('<div class="simpleAlertBody">');
  var $simpleAlertBodyClose = $('<img class="simpleAlertBodyClose" src="image/alertClose.png" height="24" width="24"/>');
  var $simpleAlertBodyContent = $('<p class="simpleAlertBodyContent">' + option.content + '</p>');
  dialog.init = function () {
    $simpleAlertBody.append($simpleAlertBodyClose).append($simpleAlertBodyContent);
    var num = 0;
    var only = false;
    var onlyArr = [];
    for (var i = 0; i < 2; i++) {
      for (var key in option.buttons) {
        switch (i) {
          case 0:
            onlyArr.push(key);
            break;
          case 1:
            if (onlyArr.length <= 1) {
              only = true;
            } else {
              only = false;
            }
            num++;
            var $btn = $('<button class="simpleAlertBtn simpleAlertBtn' + num + '">' + key + '</button>')
            $btn.bind("click", option.buttons[key]);
            if (only) {
              $btn.addClass("onlyOne")
            }
            $simpleAlertBody.append($btn);
            break;
        }
      }
    }
    $simpleAlert.append($shelter).append($simpleAlertBody);
    top.$("body").append($simpleAlert);
    $simpleAlertBody.show().animate({"marginTop":"-128px","opacity":"1"},300);
    //添加倒计时自动关闭
    if(option.autoClose > 0){
      var $simpleAlertBodyWait = $('<p id="simpleAlertBodyWait" class="simpleAlertBodyWait">Please wait: '+ option.autoClose +'S</p>');
      $simpleAlertBody.append($simpleAlertBodyWait);
      setTimeout(function () {dialog.run(option.autoClose);}, 1000);
      if(option.autoClose >= 60)
      {
        if(option.IPchange == "")
        {
          setTimeout(function(){top.location.href="/cgi-bin/logout.cgi";}, option.autoClose*1000);
        }
        else
        {
          setTimeout(function(){top.location.href=option.IPchange+"/cgi-bin/logout.cgi";}, option.autoClose*1000);
        }
      }
      else
      {
        setTimeout(function(){top.location.href="/";}, option.autoClose*1000);
      }
    }
  }
  dialog.run = function(sec){
    if(sec < 1)
      return true;
    else{
      sec = sec - 1;
      top.$('#simpleAlertBodyWait').text('Please wait: '+ sec +'S');
      setTimeout(function () {dialog.run(sec);}, 1000)
    }
  }
  //右上角关闭按键事件
  $simpleAlertBodyClose.bind("click", function () {
    option.closeAll=false;
    dialog.close();
  })
  dialog.close = function () {
    if(option.closeAll){
      top.$(".simpleAlert").remove()
    }else {
      $simpleAlertBody.animate({"marginTop": "-188px", "opacity": "0"}, 200, function () {
        top.$(".simpleAlert").last().remove()
      });
    }
  }
  dialog.init();
  return dialog;
}

var applyAlert = function (opts)
{
  //设置默认参数
  var opt =
  {
    "closeAll": false,
    "content": "",
    "buttons": {},
    "autoClose": 0//seconds
  }
  //合并参数
  var option = $.extend(opt, opts);
  //事件
  var dialog = {}
  var $simpleAlert = $('<div class="simpleAlert">');
  var $shelter = $('<div class="simpleAlertShelter">');
  var $simpleAlertBody = $('<div class="applyAlertBody">');
  var $simpleAlertBodyClose = $('<img class="simpleAlertBodyClose" src="image/alertClose.png" height="24" width="24"/>');
  var $simpleAlertBodyContent = $('<p class="applyAlertBodyContent">' + option.content + '</p>');
  dialog.init = function () {
    $simpleAlertBody.append($simpleAlertBodyClose).append($simpleAlertBodyContent);
    var num = 0;
    var only = false;
    var onlyArr = [];
    for (var i = 0; i < 2; i++) {
      for (var key in option.buttons) {
        switch (i) {
          case 0:
            onlyArr.push(key);
            break;
          case 1:
            if (onlyArr.length <= 1) {
              only = true;
            } else {
              only = false;
            }
            num++;
            var $btn = $('<button class="simpleAlertBtn simpleAlertBtn' + num + '">' + key + '</button>')
            $btn.bind("click", option.buttons[key]);
            if (only) {
              $btn.addClass("onlyOne")
            }
            $simpleAlertBody.append($btn);
            break;
        }
      }
    }
    $simpleAlert.append($shelter).append($simpleAlertBody);
    top.$("body").append($simpleAlert);
    $simpleAlertBody.show().animate({"marginTop":"-128px","opacity":"1"},300);
    //添加倒计时自动关闭
    if(option.autoClose > 0){
      var $simpleAlertBodyWait = $('<p id="simpleAlertBodyWait" class="simpleAlertBodyWait"></p>');
      $simpleAlertBody.append($simpleAlertBodyWait);
      setTimeout(function () {dialog.run(option.autoClose);}, 1000);
      if(option.autoClose >= 60)
        setTimeout(function(){top.location.href="/cgi-bin/logout.cgi";}, option.autoClose*1000);
      else
        ;//setTimeout(function(){top.location.href="/";}, option.autoClose*1000);
    }
  }
  dialog.run = function(sec)
  {
    if(sec < 1)
    {
      dialog.close();
      return true;
    }
    else
    {
      sec = sec - 1;
      //top.$('#simpleAlertBodyWait').text('Please wait: '+ sec +'S');
      setTimeout(function () {dialog.run(sec);}, 1000)
    }
  }
  //右上角关闭按键事件
  $simpleAlertBodyClose.bind("click", function () {
    option.closeAll=false;
    dialog.close();
  })
  dialog.close = function () {
    if(option.closeAll){
      top.$(".simpleAlert").remove()
    }else {
      $simpleAlertBody.animate({"marginTop": "-188px", "opacity": "0"}, 200, function () {
        top.$(".simpleAlert").last().remove()
      });
    }
  }
  dialog.init();
  return dialog;
}



