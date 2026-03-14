<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Samba</title>
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
                        <a class="nav-link menu-link text-light" href="../wlan/wlan-1-basic.html">WLAN</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../wan/wan.html">WAN</a>
                    </li>
                    <li class="nav-item menu-item menu-active">
                        <a class="nav-link menu-link " href="service-dhcp.html">Service</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../vo-ip/port1.html">VoIP</a>
                    </li>
                    <li class="nav-item menu-item ">
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
                    <a href="service-dhcp.html" class="list-group-item list-group-item-action slide-menu-item">DHCP</a>
                    <a href="Dynamic-DNS-Configuration.html" class="list-group-item list-group-item-action slide-menu-item">Dynamic DNS</a>
                    <a href="IGMP-Proxy-Configuration.html" class="list-group-item list-group-item-action slide-menu-item">IGMP Proxy</a>
                    <a href="UPnP-Cinfiguration.html" class="list-group-item list-group-item-action slide-menu-item">UPnP</a>
                    <a href="RIP-Configuration.html" class="list-group-item list-group-item-action slide-menu-item">RIP</a>
                    <a href="Samba.html" class="list-group-item list-group-item-action slide-menu-item  slide-menu-active">Samba</a>

                </div>
            </div>
            <div class="col-md-9 col-sm-12">
                <div class="container-full">
                    <div class="title-text">Samba</div>
                    <div class="title-description-text">This page is used to configure Samba.</div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Samba:</div>
                        </div>
                        <div class="col-6">
                            <input type="radio" value="Enable" name="radio1" checked="checked">
                            <label class="input-radio">Enable</label>
                            <input type="radio" value="Disable" name="radio1">
                            <label class="input-radio">Disable</label>

                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Server String:</div>
                        </div>
                        <div class="col-6">
                            <select class="form-control input-select">
                                <option value="1">Samba Server</option>
                            </select>
                        </div>
                    </div><br>
                    <div class="mt-2 center">
                        <button class="btn-dashboard">Apply Changes</button>
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
                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M0 0h24v24H0z" fill="none"/></svg>
                </span>
            </span>
        </a>
    </div>
    <!-- footer -->

    <script src="../../asset/js/script.js"></script>
</body>

</html>