<%
if Request_Form("IPv6_Flag") = "1" then
    TCWebApi_set("WebCurSet_Entry","route6_id","curSetIdx")
    
    TCWebApi_set("Route6_Entry","Active","hEnableflag")
    TCWebApi_set("Route6_Entry","DST_IP","DestIPAddress")
    TCWebApi_set("Route6_Entry","Prefix_len","PrefixLen")
    if Request_Form("gwEnableflag") = "Yes" then
        TCWebApi_set("Route6_Entry","Gateway","GatewayIPAddress")
    end if
    TCWebApi_set("Route6_Entry","Device","WanInterfaceFlag")
    
    TCWebApi_set("Route6_Entry","metric","metricFlag")
    
    TCWebApi_commit("WebCurSet_Entry")
    TCWebApi_commit("Route6_Entry")
    TCWebApi_save()
end if

if Request_Form("route6flag") = "2" then
    if Request_Form("route6delflag0") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag0")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag1") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag1")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag2") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag2")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag3") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag3")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag4") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag4")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag5") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag5")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag6") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag6")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag7") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag7")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag8") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag8")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag9") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag9")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag10") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag10")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag11") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag11")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag12") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag12")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag13") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag13")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag14") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag14")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag15") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag15")
        TCWebApi_unset("Route6_Entry")
    end if
    
    if Request_Form("route6delflag16") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag16")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag17") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag17")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag18") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag18")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag19") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag19")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag20") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag20")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag21") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag21")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag22") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag22")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag23") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag23")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag24") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag24")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag25") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag25")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag26") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag26")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag27") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag27")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag28") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag28")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag29") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag29")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag30") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag30")
        TCWebApi_unset("Route6_Entry")
    end if
    if Request_Form("route6delflag31") <> "33" then 
        TCWebApi_set("WebCurSet_Entry","route6_id","route6delflag31")
        TCWebApi_unset("Route6_Entry")
    end if
    TCWebApi_commit("Route6_Entry")
    TCWebApi_save()
end if
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html lang="en" style="overflow: hidden;">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - IPv6 Static Routing</title>
    <!-- style -->
    <link rel="stylesheet" href="/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- style -->
    
    <!-- script -->
    <script src="/scripts/lib/jquery.min.js"></script>
    <script src="/scripts/lib/bootstrap.min.js"></script>
    <script src="/scripts/lib/bootstrap.bundle.min.js"></script>
    <!-- script --> 
    
    <!-- self sript -->
    <script src="/scripts/utils/util_skyw.js"></script>
    
    <script language=JavaScript type=text/javascript>
    
    var nEntryNum = <% tcWebApi_get("WanInfo_Common","CycleNum","s") %>;
    // num 0
    var vArrayStr = "<% tcWebApi_get("WanInfo_Common","WanName","s") %>";
    var vEntryName = vArrayStr.split(',');
    // num 1
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_WanValue","s") %>";
    var vEntryValue = vArrayStr.split(',');
    // num 2~5
/* Add by wenxudong for ipv6 route wan ip can't be use,2023.3.30 */
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IP6","s") %>";
    var Wan_IP6 = vArrayStr.split(',');
    var WanBrIP6 = ""; 
    var BrIP6 = "<% tcWebApi_get("Radvd_Entry", "Br0Addr","s") %>"; 
/* Add end */
    // num 6
    vArrayStr = "<% tcWebApi_get("WanInfo_Common","Wan_IPVERSION","s") %>";
    var Wan_IPVERSION = vArrayStr.split(',');
    
    vEntryName = SortUtil.UpdateWanIFName( vEntryName, nEntryNum );
    vEntryValue = SortUtil.SortMyArray( vEntryValue );
/* Add by wenxudong for ipv6 route wan ip can't be use,2023.3.30 */
    Wan_IP6 = SortUtil.SortMyArray( Wan_IP6 );
/* Add end */
    Wan_IPVERSION = SortUtil.SortMyArray( Wan_IPVERSION );
    
    function WriteWanNameSelected()
    {
        for (var i = 0; i < nEntryNum; i++)
        {
            
            if((vEntryName[i].indexOf('_INTERNET_')<0) || (vEntryName[i].indexOf('_B_')>-1)
            || 'IPv4' == Wan_IPVERSION[i] )
                continue;
            document.writeln('<option value=' + vEntryValue[i] + ' ipAddress=' + Wan_IP6[i]  + '>' + vEntryValue[i] + '</option>');
        }
    }
    
    //add ipv6 route
    var route6count = 32;
    function stStaticRoute6(Domain, DestIPAddress, PrefixLength, GatewayIPAddress, Interface)
    {
        this.Domain = Domain;
        this.DestIPAddress = DestIPAddress;
        this.PrefixLength = PrefixLength;
        this.GatewayIPAddress = GatewayIPAddress;
        this.Interface = Interface;
    }
    
    function getStaticRoute6Info()
    {
        var	nCurTemp = 0;
        var	vDestIPAddress = new Array(route6count);
        var	vPrefixLength = new Array(route6count);
        var	vcurLinks = new Array(route6count);
        
        vDestIPAddress[0] = "<% tcWebApi_get("Route6_Entry0","DST_IP","s") %>";
        vDestIPAddress[1] = "<% tcWebApi_get("Route6_Entry1","DST_IP","s") %>";
        vDestIPAddress[2] = "<% tcWebApi_get("Route6_Entry2","DST_IP","s") %>";
        vDestIPAddress[3] = "<% tcWebApi_get("Route6_Entry3","DST_IP","s") %>";
        vDestIPAddress[4] = "<% tcWebApi_get("Route6_Entry4","DST_IP","s") %>";
        vDestIPAddress[5] = "<% tcWebApi_get("Route6_Entry5","DST_IP","s") %>";
        vDestIPAddress[6] = "<% tcWebApi_get("Route6_Entry6","DST_IP","s") %>";
        vDestIPAddress[7] = "<% tcWebApi_get("Route6_Entry7","DST_IP","s") %>";
        vDestIPAddress[8] = "<% tcWebApi_get("Route6_Entry8","DST_IP","s") %>";
        vDestIPAddress[9] = "<% tcWebApi_get("Route6_Entry9","DST_IP","s") %>";
        vDestIPAddress[10] = "<% tcWebApi_get("Route6_Entry10","DST_IP","s") %>";
        vDestIPAddress[11] = "<% tcWebApi_get("Route6_Entry11","DST_IP","s") %>";
        vDestIPAddress[12] = "<% tcWebApi_get("Route6_Entry12","DST_IP","s") %>";
        vDestIPAddress[13] = "<% tcWebApi_get("Route6_Entry13","DST_IP","s") %>";
        vDestIPAddress[14] = "<% tcWebApi_get("Route6_Entry14","DST_IP","s") %>";
        vDestIPAddress[15] = "<% tcWebApi_get("Route6_Entry15","DST_IP","s") %>";
        vDestIPAddress[16] = "<% tcWebApi_get("Route6_Entry16","DST_IP","s") %>";
        vDestIPAddress[17] = "<% tcWebApi_get("Route6_Entry17","DST_IP","s") %>";
        vDestIPAddress[18] = "<% tcWebApi_get("Route6_Entry18","DST_IP","s") %>";
        vDestIPAddress[19] = "<% tcWebApi_get("Route6_Entry19","DST_IP","s") %>";
        vDestIPAddress[20] = "<% tcWebApi_get("Route6_Entry20","DST_IP","s") %>";
        vDestIPAddress[21] = "<% tcWebApi_get("Route6_Entry21","DST_IP","s") %>";
        vDestIPAddress[22] = "<% tcWebApi_get("Route6_Entry22","DST_IP","s") %>";
        vDestIPAddress[23] = "<% tcWebApi_get("Route6_Entry23","DST_IP","s") %>";
        vDestIPAddress[24] = "<% tcWebApi_get("Route6_Entry24","DST_IP","s") %>";
        vDestIPAddress[25] = "<% tcWebApi_get("Route6_Entry25","DST_IP","s") %>";
        vDestIPAddress[26] = "<% tcWebApi_get("Route6_Entry26","DST_IP","s") %>";
        vDestIPAddress[27] = "<% tcWebApi_get("Route6_Entry27","DST_IP","s") %>";
        vDestIPAddress[28] = "<% tcWebApi_get("Route6_Entry28","DST_IP","s") %>";
        vDestIPAddress[29] = "<% tcWebApi_get("Route6_Entry29","DST_IP","s") %>";
        vDestIPAddress[30] = "<% tcWebApi_get("Route6_Entry30","DST_IP","s") %>";
        vDestIPAddress[31] = "<% tcWebApi_get("Route6_Entry31","DST_IP","s") %>";
        
        vPrefixLength[0] = "<% tcWebApi_get("Route6_Entry0","Prefix_len","s") %>";
        vPrefixLength[1] = "<% tcWebApi_get("Route6_Entry1","Prefix_len","s") %>";
        vPrefixLength[2] = "<% tcWebApi_get("Route6_Entry2","Prefix_len","s") %>";
        vPrefixLength[3] = "<% tcWebApi_get("Route6_Entry3","Prefix_len","s") %>";
        vPrefixLength[4] = "<% tcWebApi_get("Route6_Entry4","Prefix_len","s") %>";
        vPrefixLength[5] = "<% tcWebApi_get("Route6_Entry5","Prefix_len","s") %>";
        vPrefixLength[6] = "<% tcWebApi_get("Route6_Entry6","Prefix_len","s") %>";
        vPrefixLength[7] = "<% tcWebApi_get("Route6_Entry7","Prefix_len","s") %>";
        vPrefixLength[8] = "<% tcWebApi_get("Route6_Entry8","Prefix_len","s") %>";
        vPrefixLength[9] = "<% tcWebApi_get("Route6_Entry9","Prefix_len","s") %>";
        vPrefixLength[10] = "<% tcWebApi_get("Route6_Entry10","Prefix_len","s") %>";
        vPrefixLength[11] = "<% tcWebApi_get("Route6_Entry11","Prefix_len","s") %>";
        vPrefixLength[12] = "<% tcWebApi_get("Route6_Entry12","Prefix_len","s") %>";
        vPrefixLength[13] = "<% tcWebApi_get("Route6_Entry13","Prefix_len","s") %>";
        vPrefixLength[14] = "<% tcWebApi_get("Route6_Entry14","Prefix_len","s") %>";
        vPrefixLength[15] = "<% tcWebApi_get("Route6_Entry15","Prefix_len","s") %>";
        vPrefixLength[16] = "<% tcWebApi_get("Route6_Entry16","Prefix_len","s") %>";
        vPrefixLength[17] = "<% tcWebApi_get("Route6_Entry17","Prefix_len","s") %>";
        vPrefixLength[18] = "<% tcWebApi_get("Route6_Entry18","Prefix_len","s") %>";
        vPrefixLength[19] = "<% tcWebApi_get("Route6_Entry19","Prefix_len","s") %>";
        vPrefixLength[20] = "<% tcWebApi_get("Route6_Entry20","Prefix_len","s") %>";
        vPrefixLength[21] = "<% tcWebApi_get("Route6_Entry21","Prefix_len","s") %>";
        vPrefixLength[22] = "<% tcWebApi_get("Route6_Entry22","Prefix_len","s") %>";
        vPrefixLength[23] = "<% tcWebApi_get("Route6_Entry23","Prefix_len","s") %>";
        vPrefixLength[24] = "<% tcWebApi_get("Route6_Entry24","Prefix_len","s") %>";
        vPrefixLength[25] = "<% tcWebApi_get("Route6_Entry25","Prefix_len","s") %>";
        vPrefixLength[26] = "<% tcWebApi_get("Route6_Entry26","Prefix_len","s") %>";
        vPrefixLength[27] = "<% tcWebApi_get("Route6_Entry27","Prefix_len","s") %>";
        vPrefixLength[28] = "<% tcWebApi_get("Route6_Entry28","Prefix_len","s") %>";
        vPrefixLength[29] = "<% tcWebApi_get("Route6_Entry29","Prefix_len","s") %>";
        vPrefixLength[30] = "<% tcWebApi_get("Route6_Entry30","Prefix_len","s") %>";
        vPrefixLength[31] = "<% tcWebApi_get("Route6_Entry31","Prefix_len","s") %>";
        
        for(var i=0; i<route6count; i++)
        {
            if(vDestIPAddress[i] != "N/A")
                vcurLinks[nCurTemp++] = new stStaticRoute6(i, vDestIPAddress[i], vPrefixLength[i], "", "");
        }
        var	vObjRet = new Array(nCurTemp+1);
        for(var m=0; m<nCurTemp; m++)
        {
            vObjRet[m] = vcurLinks[m];
        }
        vObjRet[nCurTemp] = null;
        return vObjRet;
    }
    var StaticRoute = getStaticRoute6Info();
    //end add
    
    //show ipv6 table
    function stStaticRoute(Domain, Enable, DestIPAddress, PrefixLength, GatewayIPAddress, Interface, Status)
    {
        this.Domain = Domain;
        this.enable = Enable;
        this.DestIPAddress = DestIPAddress;
        this.PrefixLength = PrefixLength;
        this.GatewayIPAddress = GatewayIPAddress;
        this.Interface = Interface;
        this.Status = Status;
    }
    
    function GetRoute6Info()
    {
        var ncount6 = 32;
        var	nCurTemp = 0;
        var	vRoute6Actives = new Array(ncount6);
        var	vDestIPAddress = new Array(ncount6);
        var	vPrefixLength = new Array(ncount6);
        var	vGatewayIPAddress = new Array(ncount6);
        var	vInterface = new Array(ncount6);
        
        var	vcurLinks = new Array(ncount6);
        var	vTemp;
        var	Route6NameTemp;
        vRoute6Actives[0] = "<% tcWebApi_get("Route6_Entry0","Active","s") %>";
        vRoute6Actives[1] = "<% tcWebApi_get("Route6_Entry1","Active","s") %>";
        vRoute6Actives[2] = "<% tcWebApi_get("Route6_Entry2","Active","s") %>";
        vRoute6Actives[3] = "<% tcWebApi_get("Route6_Entry3","Active","s") %>";
        vRoute6Actives[4] = "<% tcWebApi_get("Route6_Entry4","Active","s") %>";
        vRoute6Actives[5] = "<% tcWebApi_get("Route6_Entry5","Active","s") %>";
        vRoute6Actives[6] = "<% tcWebApi_get("Route6_Entry6","Active","s") %>";
        vRoute6Actives[7] = "<% tcWebApi_get("Route6_Entry7","Active","s") %>";
        vRoute6Actives[8] = "<% tcWebApi_get("Route6_Entry8","Active","s") %>";
        vRoute6Actives[9] = "<% tcWebApi_get("Route6_Entry9","Active","s") %>";
        vRoute6Actives[10] = "<% tcWebApi_get("Route6_Entry10","Active","s") %>";
        vRoute6Actives[11] = "<% tcWebApi_get("Route6_Entry11","Active","s") %>";
        vRoute6Actives[12] = "<% tcWebApi_get("Route6_Entry12","Active","s") %>";
        vRoute6Actives[13] = "<% tcWebApi_get("Route6_Entry13","Active","s") %>";
        vRoute6Actives[14] = "<% tcWebApi_get("Route6_Entry14","Active","s") %>";
        vRoute6Actives[15] = "<% tcWebApi_get("Route6_Entry15","Active","s") %>";
        vRoute6Actives[16] = "<% tcWebApi_get("Route6_Entry16","Active","s") %>";
        vRoute6Actives[17] = "<% tcWebApi_get("Route6_Entry17","Active","s") %>";
        vRoute6Actives[18] = "<% tcWebApi_get("Route6_Entry18","Active","s") %>";
        vRoute6Actives[19] = "<% tcWebApi_get("Route6_Entry19","Active","s") %>";
        vRoute6Actives[20] = "<% tcWebApi_get("Route6_Entry20","Active","s") %>";
        vRoute6Actives[21] = "<% tcWebApi_get("Route6_Entry21","Active","s") %>";
        vRoute6Actives[22] = "<% tcWebApi_get("Route6_Entry22","Active","s") %>";
        vRoute6Actives[23] = "<% tcWebApi_get("Route6_Entry23","Active","s") %>";
        vRoute6Actives[24] = "<% tcWebApi_get("Route6_Entry24","Active","s") %>";
        vRoute6Actives[25] = "<% tcWebApi_get("Route6_Entry25","Active","s") %>";
        vRoute6Actives[26] = "<% tcWebApi_get("Route6_Entry26","Active","s") %>";
        vRoute6Actives[27] = "<% tcWebApi_get("Route6_Entry27","Active","s") %>";
        vRoute6Actives[28] = "<% tcWebApi_get("Route6_Entry28","Active","s") %>";
        vRoute6Actives[29] = "<% tcWebApi_get("Route6_Entry29","Active","s") %>";
        vRoute6Actives[30] = "<% tcWebApi_get("Route6_Entry30","Active","s") %>";
        vRoute6Actives[31] = "<% tcWebApi_get("Route6_Entry31","Active","s") %>";
        
        
        vDestIPAddress[0] = "<% tcWebApi_get("Route6_Entry0","DST_IP","s") %>";
        vDestIPAddress[1] = "<% tcWebApi_get("Route6_Entry1","DST_IP","s") %>";
        vDestIPAddress[2] = "<% tcWebApi_get("Route6_Entry2","DST_IP","s") %>";
        vDestIPAddress[3] = "<% tcWebApi_get("Route6_Entry3","DST_IP","s") %>";
        vDestIPAddress[4] = "<% tcWebApi_get("Route6_Entry4","DST_IP","s") %>";
        vDestIPAddress[5] = "<% tcWebApi_get("Route6_Entry5","DST_IP","s") %>";
        vDestIPAddress[6] = "<% tcWebApi_get("Route6_Entry6","DST_IP","s") %>";
        vDestIPAddress[7] = "<% tcWebApi_get("Route6_Entry7","DST_IP","s") %>";
        vDestIPAddress[8] = "<% tcWebApi_get("Route6_Entry8","DST_IP","s") %>";
        vDestIPAddress[9] = "<% tcWebApi_get("Route6_Entry9","DST_IP","s") %>";
        vDestIPAddress[10] = "<% tcWebApi_get("Route6_Entry10","DST_IP","s") %>";
        vDestIPAddress[11] = "<% tcWebApi_get("Route6_Entry11","DST_IP","s") %>";
        vDestIPAddress[12] = "<% tcWebApi_get("Route6_Entry12","DST_IP","s") %>";
        vDestIPAddress[13] = "<% tcWebApi_get("Route6_Entry13","DST_IP","s") %>";
        vDestIPAddress[14] = "<% tcWebApi_get("Route6_Entry14","DST_IP","s") %>";
        vDestIPAddress[15] = "<% tcWebApi_get("Route6_Entry15","DST_IP","s") %>";
        vDestIPAddress[16] = "<% tcWebApi_get("Route6_Entry16","DST_IP","s") %>";
        vDestIPAddress[17] = "<% tcWebApi_get("Route6_Entry17","DST_IP","s") %>";
        vDestIPAddress[18] = "<% tcWebApi_get("Route6_Entry18","DST_IP","s") %>";
        vDestIPAddress[19] = "<% tcWebApi_get("Route6_Entry19","DST_IP","s") %>";
        vDestIPAddress[20] = "<% tcWebApi_get("Route6_Entry20","DST_IP","s") %>";
        vDestIPAddress[21] = "<% tcWebApi_get("Route6_Entry21","DST_IP","s") %>";
        vDestIPAddress[22] = "<% tcWebApi_get("Route6_Entry22","DST_IP","s") %>";
        vDestIPAddress[23] = "<% tcWebApi_get("Route6_Entry23","DST_IP","s") %>";
        vDestIPAddress[24] = "<% tcWebApi_get("Route6_Entry24","DST_IP","s") %>";
        vDestIPAddress[25] = "<% tcWebApi_get("Route6_Entry25","DST_IP","s") %>";
        vDestIPAddress[26] = "<% tcWebApi_get("Route6_Entry26","DST_IP","s") %>";
        vDestIPAddress[27] = "<% tcWebApi_get("Route6_Entry27","DST_IP","s") %>";
        vDestIPAddress[28] = "<% tcWebApi_get("Route6_Entry28","DST_IP","s") %>";
        vDestIPAddress[29] = "<% tcWebApi_get("Route6_Entry29","DST_IP","s") %>";
        vDestIPAddress[30] = "<% tcWebApi_get("Route6_Entry30","DST_IP","s") %>";
        vDestIPAddress[31] = "<% tcWebApi_get("Route6_Entry31","DST_IP","s") %>";
        
        vPrefixLength[0] = "<% tcWebApi_get("Route6_Entry0","Prefix_len","s") %>";
        vPrefixLength[1] = "<% tcWebApi_get("Route6_Entry1","Prefix_len","s") %>";
        vPrefixLength[2] = "<% tcWebApi_get("Route6_Entry2","Prefix_len","s") %>";
        vPrefixLength[3] = "<% tcWebApi_get("Route6_Entry3","Prefix_len","s") %>";
        vPrefixLength[4] = "<% tcWebApi_get("Route6_Entry4","Prefix_len","s") %>";
        vPrefixLength[5] = "<% tcWebApi_get("Route6_Entry5","Prefix_len","s") %>";
        vPrefixLength[6] = "<% tcWebApi_get("Route6_Entry6","Prefix_len","s") %>";
        vPrefixLength[7] = "<% tcWebApi_get("Route6_Entry7","Prefix_len","s") %>";
        vPrefixLength[8] = "<% tcWebApi_get("Route6_Entry8","Prefix_len","s") %>";
        vPrefixLength[9] = "<% tcWebApi_get("Route6_Entry9","Prefix_len","s") %>";
        vPrefixLength[10] = "<% tcWebApi_get("Route6_Entry10","Prefix_len","s") %>";
        vPrefixLength[11] = "<% tcWebApi_get("Route6_Entry11","Prefix_len","s") %>";
        vPrefixLength[12] = "<% tcWebApi_get("Route6_Entry12","Prefix_len","s") %>";
        vPrefixLength[13] = "<% tcWebApi_get("Route6_Entry13","Prefix_len","s") %>";
        vPrefixLength[14] = "<% tcWebApi_get("Route6_Entry14","Prefix_len","s") %>";
        vPrefixLength[15] = "<% tcWebApi_get("Route6_Entry15","Prefix_len","s") %>";
        vPrefixLength[16] = "<% tcWebApi_get("Route6_Entry16","Prefix_len","s") %>";
        vPrefixLength[17] = "<% tcWebApi_get("Route6_Entry17","Prefix_len","s") %>";
        vPrefixLength[18] = "<% tcWebApi_get("Route6_Entry18","Prefix_len","s") %>";
        vPrefixLength[19] = "<% tcWebApi_get("Route6_Entry19","Prefix_len","s") %>";
        vPrefixLength[20] = "<% tcWebApi_get("Route6_Entry20","Prefix_len","s") %>";
        vPrefixLength[21] = "<% tcWebApi_get("Route6_Entry21","Prefix_len","s") %>";
        vPrefixLength[22] = "<% tcWebApi_get("Route6_Entry22","Prefix_len","s") %>";
        vPrefixLength[23] = "<% tcWebApi_get("Route6_Entry23","Prefix_len","s") %>";
        vPrefixLength[24] = "<% tcWebApi_get("Route6_Entry24","Prefix_len","s") %>";
        vPrefixLength[25] = "<% tcWebApi_get("Route6_Entry25","Prefix_len","s") %>";
        vPrefixLength[26] = "<% tcWebApi_get("Route6_Entry26","Prefix_len","s") %>";
        vPrefixLength[27] = "<% tcWebApi_get("Route6_Entry27","Prefix_len","s") %>";
        vPrefixLength[28] = "<% tcWebApi_get("Route6_Entry28","Prefix_len","s") %>";
        vPrefixLength[29] = "<% tcWebApi_get("Route6_Entry29","Prefix_len","s") %>";
        vPrefixLength[30] = "<% tcWebApi_get("Route6_Entry30","Prefix_len","s") %>";
        vPrefixLength[31] = "<% tcWebApi_get("Route6_Entry31","Prefix_len","s") %>";
        
        vGatewayIPAddress[0] = "<% tcWebApi_get("Route6_Entry0","Gateway","s") %>";
        vGatewayIPAddress[1] = "<% tcWebApi_get("Route6_Entry1","Gateway","s") %>";
        vGatewayIPAddress[2] = "<% tcWebApi_get("Route6_Entry2","Gateway","s") %>";
        vGatewayIPAddress[3] = "<% tcWebApi_get("Route6_Entry3","Gateway","s") %>";
        vGatewayIPAddress[4] = "<% tcWebApi_get("Route6_Entry4","Gateway","s") %>";
        vGatewayIPAddress[5] = "<% tcWebApi_get("Route6_Entry5","Gateway","s") %>";
        vGatewayIPAddress[6] = "<% tcWebApi_get("Route6_Entry6","Gateway","s") %>";
        vGatewayIPAddress[7] = "<% tcWebApi_get("Route6_Entry7","Gateway","s") %>";
        vGatewayIPAddress[8] = "<% tcWebApi_get("Route6_Entry8","Gateway","s") %>";
        vGatewayIPAddress[9] = "<% tcWebApi_get("Route6_Entry9","Gateway","s") %>";
        vGatewayIPAddress[10] = "<% tcWebApi_get("Route6_Entry10","Gateway","s") %>";
        vGatewayIPAddress[11] = "<% tcWebApi_get("Route6_Entry11","Gateway","s") %>";
        vGatewayIPAddress[12] = "<% tcWebApi_get("Route6_Entry12","Gateway","s") %>";
        vGatewayIPAddress[13] = "<% tcWebApi_get("Route6_Entry13","Gateway","s") %>";
        vGatewayIPAddress[14] = "<% tcWebApi_get("Route6_Entry14","Gateway","s") %>";
        vGatewayIPAddress[15] = "<% tcWebApi_get("Route6_Entry15","Gateway","s") %>";
        vGatewayIPAddress[16] = "<% tcWebApi_get("Route6_Entry16","Gateway","s") %>";
        vGatewayIPAddress[17] = "<% tcWebApi_get("Route6_Entry17","Gateway","s") %>";
        vGatewayIPAddress[18] = "<% tcWebApi_get("Route6_Entry18","Gateway","s") %>";
        vGatewayIPAddress[19] = "<% tcWebApi_get("Route6_Entry19","Gateway","s") %>";
        vGatewayIPAddress[20] = "<% tcWebApi_get("Route6_Entry20","Gateway","s") %>";
        vGatewayIPAddress[21] = "<% tcWebApi_get("Route6_Entry21","Gateway","s") %>";
        vGatewayIPAddress[22] = "<% tcWebApi_get("Route6_Entry22","Gateway","s") %>";
        vGatewayIPAddress[23] = "<% tcWebApi_get("Route6_Entry23","Gateway","s") %>";
        vGatewayIPAddress[24] = "<% tcWebApi_get("Route6_Entry24","Gateway","s") %>";
        vGatewayIPAddress[25] = "<% tcWebApi_get("Route6_Entry25","Gateway","s") %>";
        vGatewayIPAddress[26] = "<% tcWebApi_get("Route6_Entry26","Gateway","s") %>";
        vGatewayIPAddress[27] = "<% tcWebApi_get("Route6_Entry27","Gateway","s") %>";
        vGatewayIPAddress[28] = "<% tcWebApi_get("Route6_Entry28","Gateway","s") %>";
        vGatewayIPAddress[29] = "<% tcWebApi_get("Route6_Entry29","Gateway","s") %>";
        vGatewayIPAddress[30] = "<% tcWebApi_get("Route6_Entry30","Gateway","s") %>";
        vGatewayIPAddress[31] = "<% tcWebApi_get("Route6_Entry31","Gateway","s") %>";
        
        vInterface[0] = "<% tcWebApi_get("Route6_Entry0","Device","s") %>";
        vInterface[1] = "<% tcWebApi_get("Route6_Entry1","Device","s") %>";
        vInterface[2] = "<% tcWebApi_get("Route6_Entry2","Device","s") %>";
        vInterface[3] = "<% tcWebApi_get("Route6_Entry3","Device","s") %>";
        vInterface[4] = "<% tcWebApi_get("Route6_Entry4","Device","s") %>";
        vInterface[5] = "<% tcWebApi_get("Route6_Entry5","Device","s") %>";
        vInterface[6] = "<% tcWebApi_get("Route6_Entry6","Device","s") %>";
        vInterface[7] = "<% tcWebApi_get("Route6_Entry7","Device","s") %>";
        vInterface[8] = "<% tcWebApi_get("Route6_Entry8","Device","s") %>";
        vInterface[9] = "<% tcWebApi_get("Route6_Entry9","Device","s") %>";
        vInterface[10] = "<% tcWebApi_get("Route6_Entry10","Device","s") %>";
        vInterface[11] = "<% tcWebApi_get("Route6_Entry11","Device","s") %>";
        vInterface[12] = "<% tcWebApi_get("Route6_Entry12","Device","s") %>";
        vInterface[13] = "<% tcWebApi_get("Route6_Entry13","Device","s") %>";
        vInterface[14] = "<% tcWebApi_get("Route6_Entry14","Device","s") %>";
        vInterface[15] = "<% tcWebApi_get("Route6_Entry15","Device","s") %>";
        vInterface[16] = "<% tcWebApi_get("Route6_Entry16","Device","s") %>";
        vInterface[17] = "<% tcWebApi_get("Route6_Entry17","Device","s") %>";
        vInterface[18] = "<% tcWebApi_get("Route6_Entry18","Device","s") %>";
        vInterface[19] = "<% tcWebApi_get("Route6_Entry19","Device","s") %>";
        vInterface[20] = "<% tcWebApi_get("Route6_Entry20","Device","s") %>";
        vInterface[21] = "<% tcWebApi_get("Route6_Entry21","Device","s") %>";
        vInterface[22] = "<% tcWebApi_get("Route6_Entry22","Device","s") %>";
        vInterface[23] = "<% tcWebApi_get("Route6_Entry23","Device","s") %>";
        vInterface[24] = "<% tcWebApi_get("Route6_Entry24","Device","s") %>";
        vInterface[25] = "<% tcWebApi_get("Route6_Entry25","Device","s") %>";
        vInterface[26] = "<% tcWebApi_get("Route6_Entry26","Device","s") %>";
        vInterface[27] = "<% tcWebApi_get("Route6_Entry27","Device","s") %>";
        vInterface[28] = "<% tcWebApi_get("Route6_Entry28","Device","s") %>";
        vInterface[29] = "<% tcWebApi_get("Route6_Entry29","Device","s") %>";
        vInterface[30] = "<% tcWebApi_get("Route6_Entry30","Device","s") %>";
        vInterface[31] = "<% tcWebApi_get("Route6_Entry31","Device","s") %>";
        
        //......
        for(var i=0; i<ncount6; i++)
        {
            if(vRoute6Actives[i] != "N/A")
            {
                vcurLinks[nCurTemp++] = new stStaticRoute(i, vRoute6Actives[i], vDestIPAddress[i], vPrefixLength[i], vGatewayIPAddress[i], vInterface[i], 0);
            }
        }
        var	vObjRet = new Array(nCurTemp+1);
        for(var m=0; m<nCurTemp; m++)
        {
            vObjRet[m] = vcurLinks[m];
        }
        vObjRet[nCurTemp] = null;
        return vObjRet;
    }
    
    var StaticRoute6 = GetRoute6Info();
    //end table
    </script>
</head>

<body>
<!-- content -->
<form name=ConfigForm method="post" action="/cgi-bin/true-page/advance/advance-ipv6-routing.asp">
    <input type="hidden" name="IPv6_Flag" value="0">
    <input type="hidden" name="curSetIdx" value="<% tcWebApi_get("Route6","add_num","s") %>">
    <input type="hidden" name="WanInterfaceFlag" value="nas0_0">
    <input type="hidden" name="metricFlag" value="0">
    <input type="hidden" name="hEnableflag" value="No">
    <input type="hidden" name="gwEnableflag" value="No">

    <div class="container-full container-resize-height">
        <div class="title-text">IPv6 Static Routing Configuration</div>
        <div class="title-description-text">This page is used to configure the IPv6 static routing information. Here you can add/delete static IP routes.</div>
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Enable:</div>
            </div>
            <div class="col-6">
                <input type="checkbox" value="Yes" name="gEnable" id="gEnable">
            </div>
            <div class="col-2"></div>
        </div>
        
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Destination Address:</div>
            </div>
            <div class="col-6">
                <input class="input-textfield" type="text" name="DestIPAddress" id="DestIPAddress" maxlength='64'>
            </div>
        </div>
        
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Prefix Length:</div>
            </div>
            <div class="col-6">
                <input class="input-textfield" type="text" name="PrefixLen" id="PrefixLen" maxlength="64" ><strong style="color:#FF0033">*</strong>
            </div>
        </div>
        
        <div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Gateway:</div>
            </div>
            <div class="col-6">
                <input type="checkbox" name="gwStr" id="gwStr" checked style="display:none;">
                <input class="input-textfield" type='text' maxlength='64' name="GatewayIPAddress" id="GatewayIPAddress">
            </div>
        </div>
        
        <div id="waninterface" class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Interface:</div>
            </div>
            <div class="col-6">
                <select class="form-control input-select" name="Interface" id="Interface">
                    <script language="javascript">
                        WriteWanNameSelected();
                        document.writeln("<option value='br0'> LAN/br0");
                    </script>
                </select>
                
            </div>
            <div class="col-2"></div>
        </div>
        
        <!--div class="row p-1">
            <div class="col-6">
                <div class="title-text-left">Interface:</div>
            </div>
            <div class="col-6">
                <select class="form-control input-select">
                    <option value="1">Any</option>
                </select>
            </div>
            <div class="col-2"></div>
        </div-->
        
        <div class="mt-2 center">
            <button type="button" class="btn-dashboard" onclick="AddSubmit()">Add Route</button>
        </div>
        <hr>
        
        <!-- ipv6 table -->
        <input type="hidden" name="route6flag" value="0">
        <input type="hidden" name="route6delflag0" value="33">
        <input type="hidden" name="route6delflag1" value="33">
        <input type="hidden" name="route6delflag2" value="33">
        <input type="hidden" name="route6delflag3" value="33">
        <input type="hidden" name="route6delflag4" value="33">
        <input type="hidden" name="route6delflag5" value="33">
        <input type="hidden" name="route6delflag6" value="33">
        <input type="hidden" name="route6delflag7" value="33">
        <input type="hidden" name="route6delflag8" value="33">
        <input type="hidden" name="route6delflag9" value="33">
        <input type="hidden" name="route6delflag10" value="33">
        <input type="hidden" name="route6delflag11" value="33">
        <input type="hidden" name="route6delflag12" value="33">
        <input type="hidden" name="route6delflag13" value="33">
        <input type="hidden" name="route6delflag14" value="33">
        <input type="hidden" name="route6delflag15" value="33">
        <input type="hidden" name="route6delflag16" value="33">
        <input type="hidden" name="route6delflag17" value="33">
        <input type="hidden" name="route6delflag18" value="33">
        <input type="hidden" name="route6delflag19" value="33">
        <input type="hidden" name="route6delflag20" value="33">
        <input type="hidden" name="route6delflag21" value="33">
        <input type="hidden" name="route6delflag22" value="33">
        <input type="hidden" name="route6delflag23" value="33">
        <input type="hidden" name="route6delflag24" value="33">
        <input type="hidden" name="route6delflag25" value="33">
        <input type="hidden" name="route6delflag26" value="33">
        <input type="hidden" name="route6delflag27" value="33">
        <input type="hidden" name="route6delflag28" value="33">
        <input type="hidden" name="route6delflag29" value="33">
        <input type="hidden" name="route6delflag30" value="33">
        <input type="hidden" name="route6delflag31" value="33">
        
        <div class="card-table-content">
            <div class="table-header">Static Route Table</div>
            <table style="width:100%">
                <tr class="table-header center">
                    <th style="width: 10%;" class="p-1">Select</th>
                    <th style="width: 18%;">State</th>
                    <th style="width: 18%;">Destination Address</th>
                    <th style="width: 18%;">Prefix Length</th>
                    <th style="width: 18%;">Gateway</th>
                    <th style="width: 18%;">Interface</th>
                </tr>
                    <script language=JavaScript type=text/javascript>
                    for (i = 0; i < StaticRoute6.length-1; i++)
                    {
                        if(i%2==0)
                            document.writeln('<tr class="table-content-fist center">');
                        else
                            document.writeln('<tr class="table-content-second center">');
                        document.writeln('<td>' + '<input type="checkbox" name="rml"'  + ' value="'+ StaticRoute6[i].Domain + '">' + '</td>');
                        document.writeln('<td>' + StaticRoute6[i].enable + '</td>');
                        document.writeln('<td>' + StaticRoute6[i].DestIPAddress + '</td>');
                        document.writeln('<td>' + StaticRoute6[i].PrefixLength + '</td>');
                        document.writeln('<td>' + StaticRoute6[i].GatewayIPAddress + '</td>');
                        document.writeln('<td>' + StaticRoute6[i].Interface + '</td>');
                        document.writeln('</tr>');
                    }
                    </script>
            </table>
        </div>
        <div class="mt-2 center">
            <button type="button" class="btn-dashboard" onclick="removeClick(this.form.rml)">Delete Selected</button>
            <button type="button" class="btn-dashboard" onclick="removeallClick(this.form.rml)">Delete All</button>
        </div>
    </div>
</form>
<!-- content -->
<script language=JavaScript type=text/javascript>
    function getbr0Result()
    {
        url = "/webapi/gatewayIPAddress";
        $.ajax({
            url: url, 
            type: 'get',
            success: function(data){
                WanBrIP6 = data.data.ipv6;
            }
        });
    }

    //add route
    function LoadFrame()
    {
        document.ConfigForm.IPv6_Flag.value = "0";
        document.ConfigForm.route6flag.value = "0";
        getbr0Result();
    }
    function SetCtlValue()
    {	
        with ( document.forms[0])
        {
            if(gEnable.checked == true) {
                $("input[name='hEnableflag']").val("Yes");}
            else{
                $("input[name='hEnableflag']").val("No");}
                
            if(document.ConfigForm.gwStr.checked)
                document.ConfigForm.gwEnableflag.value = "Yes";
            else 
                document.ConfigForm.gwEnableflag.value = "No";
        }
    }
    
    function CheckForm(Form)
    {
        with ( document.forms[0] )
        {
            for (i = 0; i < StaticRoute.length - 1; i++)
            {
                if ((StaticRoute[i].DestIPAddress == getValue('DestIPAddress'))
                && (StaticRoute[i].PrefixLength == getValue('PrefixLen')))
                {
                    alert('Destination IP is same with others.');
                    return false;
                }
            }
            var DestIp = DestIPAddress.value;
            if (DestIp == '')
            {
                alert('Destination IP is invalid.');
                return false;
            }
            if (isIpv6Address(DestIp) == false)
            {
                alert('Destination IP is invalid.');
                return false;
            }
            if ((PrefixLen.value == '')
                || (!isInteger(PrefixLen.value))
                || (parseInt(PrefixLen.value) > 128)
                || (parseInt(PrefixLen.value) < 0))
            {
                alert('Profix length is invalid.');
                return false;
            }
            var addrTmp = getValue('DestIPAddress');
            var plen1 = getValue('PrefixLen');
            var plen2 = 0;
            if (gwStr.checked == true)
            {
                if (isIpv6Address(GatewayIPAddress.value) == false)
                {
                    alert("Gateway IP is invalid.");
                    return false;
                }
                if (isUnicastIpv6Address(GatewayIPAddress.value) == false)
                {
                    alert("Gateway IP is invalid.");
                    return false;
                }
            }
            if ('' == getSelectVal('Interface'))
            {
                alert('Interface is invalid.');
                return false;
            }
            
            /* Add by wenxudong for ipv6 route wan ip can't be use,2023.3.30 */
            var idx = Interface.selectedIndex;
            var selectIdxValue = Interface.options[idx].getAttribute("value");
            var addrTmp1 = getFullIpv6Address(GatewayIPAddress.value);
            var interfaceIp = "";
            var addrTmp2 = "";
            
            for (var i = 0; i < nEntryNum; i++) {
                if(Wan_IP6[i] == "N/A")
                    continue;
                addrTmp2 = getFullIpv6Address(Wan_IP6[i]);
                if (addrTmp1 == addrTmp2) {
                    alert("The gateway ip address cannot be the same as the local ip address.");
                    return false;
                }
            }
            
            var ipArrayNum = WanBrIP6.length;
            for (var i = 0; i < ipArrayNum; i++) {
                addrTmp2 = getFullIpv6Address(WanBrIP6[i]);
                if (addrTmp1 == addrTmp2) {
                    alert("The gateway ip address cannot be the same as the local ip address.");
                    return false;
                }
            }
            /* Add end */
            
            var selectobj = getSelectVal('Interface');
        }
        return true;
    }
    
    function AddSubmit()
    {
        var Form = document.ConfigForm;
        if (true == CheckForm(Form))
        {
            Form.WanInterfaceFlag.value = Form.Interface.value;	
            SetCtlValue();
            Form.IPv6_Flag.value = "1";
            Form.submit();
            showLoading();
        }
    }
    //add end
    
    //Update summbit
    function UpdateSubmit()
    {
        location.reload();
    }
    //end Update
    
    //del select ipv6
    function removeClick(rml)
    {
        with(getElById('ConfigForm'))
        {
            if (rml == null)
            {
                return;
            }
            var Form = document.ConfigForm;
            var k;
            if (rml.length > 0)
            {
                for (k = 0; k < rml.length; k++)
                {
                    var strindex = "route6delflag" + rml[k].value;
                    if ( rml[k].checked == true )
                    {
                        setText(strindex, rml[k].value);
                    }
                    else
                        setText(strindex, "17");
                }
            }
            else if ( rml.checked == true )
            {
                var strindex = "route6delflag" + rml.value;
                setText(strindex, rml.value);
                
            }
            Form.route6flag.value = "2";
            Form.submit();
            showLoading();
        }
    }
    //end del
    
    //delete all ipv6
    function removeallClick(rml)
    {
        with(getElById('ConfigForm'))
        {
            if (rml == null)
            {
                return;
            }
            var Form = document.ConfigForm;
            var k;
            if (rml.length > 0)
            {
                for (k = 0; k < rml.length; k++)
                {
                    var strindex = "route6delflag" + rml[k].value;
                    setText(strindex, rml[k].value);
                }
            }
            else
            {
                var strindex = "route6delflag" + rml.value;
                setText(strindex, rml.value);
            }
            Form.route6flag.value = "2";
            Form.submit();
            showLoading();
        }
    }
    //end del
    

    $(document).ready(function(){
        LoadFrame();
    });
    
</script>
</body>

</html>