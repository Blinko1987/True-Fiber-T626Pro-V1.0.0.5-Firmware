<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>WAN - PON WAN</title>
    <!-- style -->
    <link rel="stylesheet" href="../../asset/bootstrap-4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href=".././asset/bootstrap-4.1.3/css/bootstrap.min.css">
    <link rel="stylesheet" href="../../asset/css/style.css">
    <!-- style -->

    <!-- script -->
    <script src="../../asset/jquery-3.4.0/dist/jquery.js"></script>
    <script src="../../asset/jquery-3.4.0/dist/jquery.min.js"></script>
    <script src="../../asset/bootstrap-4.1.3/js/bootstrap.js"></script>
    <script src="../../asset/bootstrap-4.1.3/js/bootstrap.min.js"></script>
    <script src="../../asset/bootstrap-4.1.3/js/bootstrap.bundle.js"></script>
    <script src="../../asset/bootstrap-4.1.3/js/bootstrap.bundle.min.js"></script>
    <!-- script -->
</head>

<body>
    <!-- header -->
    <nav class="navbar navbar-light bg-light p-0">
        <!-- container -->
        <div class="container mt-2">
            <!-- row-1 -->
            <div class="row d-flex align-items-center">
                <div class="col-md-4">
                    <a class="navbar-brand" href="#">
                        <img src="../../asset/image/True-Gigatex 1.png" class="logo-header" alt="">
                    </a>
                </div>
                <div class="col-md-6 col-6">
                </div>
                <div class="col-md-2 col-4">
                    <div class="dropdown">
                        <a class="btn-admin dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Admin
                        </a>

                        <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                            <!-- <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Profile</a> -->
                            <a class="dropdown-item" href="../../index.html">Logout</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- row-1 -->
            <!-- row-2 -->
            <div class="row tap-menu">
                <ul class="nav nav-tabs menu-list pt-1">
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../dashboard.html">Home</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../status/status-device.html">Status</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../lan/lan-interface.html">LAN</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../wlan/wlan-0-basic.html">WLAN</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link menu-active" href="#">WAN</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../service/service-dhcp.html">Service</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../vo-ip/port1.html">VoIP</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../firewall/ALG-Type.html">Firewall</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../advance/advance-arp-table.html#collapseAdvance">Advance</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../diagnostics/ping.html">Diagnostics</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../admin/admin-gpon.html">Admin</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../static/statistics-interface.html">Statistics</a>
                    </li>
                </ul>
            </div>
            <!-- row-2 -->
        </div>
        <!-- container -->
    </nav>
    <!-- header -->

    <!-- content -->
    <div class="container mt-3 mb-4">
        <div class="row">
            <div class="col-md-3 col-sm-12">
                <div class="list-group slide-menu-list text-truncate">
                    <a href="wan.html" class="list-group-item list-group-item-action slide-menu-item">
                        WAN
                    </a>
                    <a href="#" class="list-group-item list-group-item-action slide-menu-item slide-menu-active">PON
                        WAN</a>
                </div>
            </div>
            <div class="col-md-9 col-sm-12">
                <div class="container-full">
                    <div class="title-text"> PON WAN</div>

                    <div class="row p-1">
                        <div class="col-3">
                            <div class="title-text-left">
                                <select class="form-control input-select" id="bridged" onchange="changeBridged()">
                                    <option value="0">new link</option>
                                    <option value="1">ppp0_nas0_0</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Enable VLAN:</div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="1" name="check1" checked>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">VLAN ID:</div>
                        </div>
                        <div class="col-6">
                            <input class="form-control input-textfield" type="text">
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">802.1p_Mark:</div>
                        </div>
                        <div class="col-6">
                            <select class="form-control input-select">
                                <option value="0">0</option>
                            </select>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Channel Mode:</div>
                        </div>
                        <div class="col-6">
                            <select class="form-control input-select">
                                <option value="Bridged">Bridged</option>
                            </select>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Enable NAT:</div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="1" name="check1" checked>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Enable QoS:</div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="1" name="check1">
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Admin Status:</div>
                        </div>
                        <div class="col-6">
                            <input type="radio" value="enabled" name="radio1" checked>
                            <label class="input-radio">Enabled</label>
                            <input type="radio" value="disabled" name="radio2">
                            <label class="input-radio">Disabled</label>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Connection Type:</div>
                        </div>
                        <div class="col-6">
                            <select class="form-control input-select">
                                <option value="Other">Other</option>
                            </select>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">MTU:</div>
                        </div>
                        <div class="col-6">
                            <input class="form-control input-textfield" value="1492" type="text">
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Enable IGMP-Proxy:</div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="1" name="check1">
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Enable MLD-Proxy:</div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="1" name="check1">
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">IP Protocol:</div>
                        </div>
                        <div class="col-6">
                            <select class="form-control input-select">
                                <option value="IPv4/IPv6">IPv4/IPv6</option>
                            </select>
                        </div>
                    </div>
                    <br>
                    <!-- ipv6 -->
                    <div id="ipv6">
                        <div class="title-text">IPv6 WAN Setting:</div>
                        <div class="row p-1">
                            <div class="col-6">
                                <div class="title-text-left">Address Mode:</div>
                            </div>
                            <div class="col-6">
                                <input type="checkbox" value="1" name="check1" checked>
                                <label class="input-radio">Slaac</label>
                                <input type="checkbox" value="1" name="check1">
                                <label class="input-radio">Static</label>
                            </div>
                        </div>
                        <div class="row p-1">
                            <div class="col-6">
                                <div class="title-text-left">Enable DHCPv6 Client:</div>
                            </div>
                            <div class="col-6">
                                <input type="checkbox" value="1" name="check1" checked>
                            </div>
                        </div>
                        <div class="row p-1">
                            <div class="col-6">
                                <div class="title-text-left">Request Options:</div>
                            </div>
                            <div class="col-6">
                                <input type="checkbox" value="1" name="check1">
                                <label class="input-radio">Request Address</label>
                                <input type="checkbox" value="1" name="check1" checked>
                                <label class="input-radio">Request Prefix</label>
                            </div>
                        </div>
                        <div class="row p-1">
                            <div class="col-6">
                                <div class="title-text-left">Request DNS:</div>
                            </div>
                            <div class="col-6">
                                <input type="radio" value="1" name="check1" checked>
                                <label class="input-radio">Enable</label>
                                <input type="radio" value="1" name="check1">
                                <label class="input-radio">Disable</label>
                            </div>
                        </div>
                        <div class="row p-1">
                            <div class="col-6">
                                <div class="title-text-left">Primary IPv6 DNS:</div>
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control input-textfield">
                            </div>
                        </div>
                        <div class="row p-1">
                            <div class="col-6">
                                <div class="title-text-left">Secondary IPv6 DNS:</div>
                            </div>
                            <div class="col-6">
                                <input type="text" class="form-control input-textfield">
                            </div>
                        </div>
                    </div>
                    <!-- ipv6 -->

                    <div class="title-text">Port Mapping</div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left"><input type="checkbox" value="check6" name="check6"> LAN_1:
                            </div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="check7" name="check7">
                            <label class="input-radio">LAN_2</label>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left"><input type="checkbox" value="check8" name="check8"> LAN_3:
                            </div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="check9" name="check9">
                            <label class="input-radio">LAN_4</label>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left"><input type="checkbox" value="check10" name="check10"> WLAN0:
                            </div>
                        </div>
                        <div class="col-6">
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left"><input type="checkbox" value="check12" name="check11"> WLAN0-AP1:
                            </div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="check12" name="check12">
                            <label class="input-radio">WLAN0-AP2</label>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left"><input type="checkbox" value="check13" name="check13"> WLAN0-AP3:
                            </div>
                        </div>
                        <div class="col-6">
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left"><input type="checkbox" value="check14" name="check14"> WLAN1:
                            </div>
                        </div>
                        <div class="col-6">
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left"><input type="checkbox" value="check15" name="check15"> WLAN1-AP1:
                            </div>
                        </div>
                        <div class="col-6">
                            <input type="checkbox" value="check16" name="check16">
                            <label class="input-radio">WLAN1-AP2</label>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left"><input type="checkbox" value="check17" name="check17"> WLAN1-AP3:
                            </div>
                        </div>
                        <div class="col-6">
                        </div>
                    </div>
                    <div class="mt-2 center">
                        <button class="btn-dashboard">Apply Changes</button>
                        <button class="btn-dashboard">Delete</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>
    </div>
    <!-- content -->
    <!-- footer -->
    <div class="footer font-weight-bold">
        <a href="tel:1242">
            <div class="mtp-lines-box txt-grey">
                <span class="txt-size-m">True Call Center</span>
            </div>
            <span class="txt-size-xxl txt-red">
                1242
                <span class="phone-cir-red-icon sprite-icons">
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                        <path d="M0 0h24v24H0z" fill="none" /></svg>
                </span>
            </span>
        </a>
    </div>
    <!-- footer -->
    <script>
        // bridged
        // ipv6
        function changeBridged() {
            console.log('changeBridged');
            var bridged = document.getElementById("bridged").value
            console.log('bridged', bridged);
            if (bridged == 0) {
                document.getElementById("ipv6").style.display = "none";
            } else {
                document.getElementById("ipv6").style.display = "block";
            }
        }
        $(document).ready(function() {
            changeBridged();
        });
    </script>

    <script src="../../asset/js/script.js"></script>
</body>

</html>