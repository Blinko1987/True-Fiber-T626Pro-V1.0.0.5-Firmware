<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Advance - Band Steering</title>
    <!-- style -->
    <link rel="stylesheet" href="../../asset/bootstrap-4.1.3/css/bootstrap.css">
    <link rel="stylesheet" href="../../asset/bootstrap-4.1.3/css/bootstrap.min.css">
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
                        <a class="nav-link menu-link text-light" href="../wan/wan.html">WAN</a>
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
                    <li class="nav-item menu-item menu-active">
                        <a class="nav-link menu-link" href="advance-arp-table.html#collapseAdvance">Advance</a>
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
                    <a href="#collapseAdvance" class="list-group-item list-group-item-action slide-menu-item slide-menu-active" data-toggle="collapse" role="button" aria-expanded="false" aria-controls="collapseAdvance">
                        Advance
                    </a>
                    <div class="collapse" id="collapseAdvance">
                        <a href="advance-arp-table.html#collapseAdvance" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-arp-table.html#collapseAdvance" role="button" aria-expanded="true" aria-controls="col-wan-service">
                            ARP Table
                        </a>
                        <a href="./advance-bridging.html#collapseAdvance" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="#" role="button" aria-expanded="true" aria-controls="col-wan-service">
                            Bridging
                        </a>
                        <a href="advance-routing.html#collapseAdvance" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-routing.html#collapseAdvance" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            Routing
                        </a>
                        <a href="./advance-fast-roaming.html#collapseAdvance" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-routing.html#collapseAdvance" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            Fast Roaming
                        </a>
                        <a href="#" class="list-group-item list-group-item-action slide-menu-l-item slide-menu-ll-active" data-toggle="" href="advance-routing.html#collapseAdvance" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            Band Steering
                        </a>
                        <a href="advance-easymash.html#collapseAdvance" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="#" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            Easy Mesh
                        </a>
                    </div>
                    <a class="list-group-item list-group-item-action slide-menu-item" data-toggle="collapse" href="#collapseAdvance-QoS" role="button" aria-expanded="false" aria-controls="collapseAdvance-QoS">
                        IP QoS
                    </a>
                    <div class="collapse" id="collapseAdvance-QoS">
                        <a href="advance-ip-qos-policy.html#collapseAdvance-QoS" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ip-qos-policy.html#collapseAdvance-QoS" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            QoS Policy
                        </a>
                        <a href="advance-ip-qos-classification.html#collapseAdvance-QoS" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ip-qos-classification.html#collapseAdvance-QoS" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            QoS Classification

                        </a>
                        <a href="advance-ip-qos-traffic-shaping.html#collapseAdvance-QoS" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ip-qos-traffic-shaping.html#collapseAdvance-QoS" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            Traffic Shaping

                        </a>
                    </div>
                    <a class="list-group-item list-group-item-action slide-menu-item" data-toggle="collapse" href="#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="collapseAdvance-IPv6">
                        IPv6
                    </a>
                    <div class="collapse" id="collapseAdvance-IPv6">
                        <a href="#col-wan-service" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="#col-wan-service" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            IPv6 Enable/Disable

                        </a>
                        <a href="advance-ipv6-radvd.html#collapseAdvance-IPv6" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ipv6-radvd.html#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            RADVD
                        </a>
                        <a href="advance-ipv6-dhcpv6.html#collapseAdvance-IPv6" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ipv6-dhcpv6.html#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            DHCPv6
                        </a>
                        <a href="advance-ipv6-mld-proxy.html#collapseAdvance-IPv6" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ipv6-mld-proxy.html#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            MLD Proxy
                        </a>
                        <a href="advance-ipv6-mld-snoopping.html#collapseAdvance-IPv6" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ipv6-mld-snoopping.html#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            MLD Snooping
                        </a>
                        <a href="advance-ipv6-routing.html#collapseAdvance-IPv6" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ipv6-routing.html#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            IPv6 Routing
                        </a>
                        <a href="advance-ipv6-ipport-filtering.html#collapseAdvance-IPv6" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ipv6-ipport-filtering.html#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            IP/Port Filtering

                        </a>
                    </div>
                    <a class="list-group-item list-group-item-action slide-menu-item" data-toggle="collapse" href="#collapseAdvance-Wlan" role="button" aria-expanded="false" aria-controls="collapseAdvance-IPv6">
                        WLAN
                    </a>
                    <div class="collapse" id="collapseAdvance-Wlan">
                        <a href="advance-wlan-fast-roaming.html" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="#col-wan-service" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            Fast Roaming
                        </a>
                        <a href="advance-wlan-band-steering.html" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ipv6-radvd.html#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            Band Steering 
                        </a>
                        <a href="advance-wlan-easymash.html" class="list-group-item list-group-item-action slide-menu-l-item" data-toggle="" href="advance-ipv6-dhcpv6.html#collapseAdvance-IPv6" role="button" aria-expanded="false" aria-controls="col-wan-service">
                            Easy Mesh 
                        </a>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-12">
                <div class="container-full">
                    <div class="title-text">Band Steering</div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Band Steering</div>
                        </div>
                        <div class="col-6">
                            <div class="row">
                                <label for="" class="text-content col-auto mr-1">5GHz RSSI </label>
                                <input class="input-textfield-auto col-2" type="text" value="-60">
                                <label for="" class="text-content col-auto"> dBm</label>
                            </div>
                            <hr>
                            <div class="row">
                                <label for="" class="text-content col-auto mr-1">Precent of clients on 5GHz radio </label>
                                <input class="input-textfield-auto col-2" type="text" value="75">
                                <label for="" class="text-content col-auto"> %</label>
                            </div>
                            <p class="text-content"><span class="text-danger">NOTE: </span> In Order for Band Steering function to work properly, both 2.4 GHz and 5GHz SSID and Security Settings must be the same</p>
                        </div>
                        <hr>
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

    <script src="../../asset/js/script.js"></script>
</body>

</html>