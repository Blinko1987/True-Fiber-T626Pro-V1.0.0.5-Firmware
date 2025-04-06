<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Domain Blocking Configuration</title>
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
                        <a class="nav-link menu-link text-light" href="../wan/wan.html">WAN</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../service/service-dhcp.html">Service</a>
                    </li>
                    <li class="nav-item menu-item">
                        <a class="nav-link menu-link text-light" href="../vo-ip/port1.html">VoIP</a>
                    </li>
                    <li class="nav-item menu-item menu-active">
                        <a class="nav-link menu-link " href="ALG-Type.html">Firewall</a>
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
                    <a href="ALG-Type.html " class="list-group-item list-group-item-action slide-menu-item">ALG</a>
                    <a href="IP-Port-Filtering.html" class="list-group-item list-group-item-action slide-menu-item ">IP/Port
                        Filtering</a>
                    <a href="Firewall-MAC-Filtering.html" class="list-group-item list-group-item-action slide-menu-item">MAC Filtering</a>
                    <a href="Port-Forwarding.html" class="list-group-item list-group-item-action slide-menu-item ">Port
                        Forwarding</a>
                    <a href="URL-Blocking.html" class="list-group-item list-group-item-action slide-menu-item ">URL
                        Blocking</a>
                    <a href="Domain-Blocking-Configuration.html" class="list-group-item list-group-item-action slide-menu-item slide-menu-active">Domain
                        Blocking</a>
                    <a href="DMZ-Configuration.html" class="list-group-item list-group-item-action slide-menu-item">DMZ</a>
                    <a href="Filewall-Enable.html" class="list-group-item list-group-item-action slide-menu-item">Firewall
                        Enable</a>
                    <a href="Remote-Management.html" class="list-group-item list-group-item-action slide-menu-item">Remote
                        Management</a>
                    <a href="Remote-Access-Configuration.html" class="list-group-item list-group-item-action slide-menu-item">Remote Access</a>
                </div>
            </div>
            <div class="col-md-9 col-sm-12">
                <div class="container-full">
                    <div class="title-text">Domain Blocking Configuration</div>
                    <div class="title-description-text">This page is used to configure the Blocked domain. Here you can add/delete the blocked domain.</div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Domain Blocking:</div>
                        </div>
                        <div class="col-6">
                            <input type="radio" value="Enable" name="radio">
                            <label class="input-radio">Enable</label>
                            <input type="radio" value="Disable" name="radio" checked="checked">
                            <label class="input-radio">Disable</label>
                            <button class="btn-dashboard">Apply Changes</button>
                        </div>
                    </div>
                    <div class="row p-1">
                        <div class="col-6">
                            <div class="title-text-left">Domain:</div>
                        </div>
                        <div class="col-6">
                            <input class="form-control input-textfield col-9" type="text" name="" />
                        </div>

                    </div>
                    <div class="mt-2 center">
                        <button class="btn-file">Add</button>
                    </div>
                    <div class="card-table-content">
                        <table style="width:100%">
                            <tr class="table-header center">
                                <th style="width: 60%;" class="p-1">Domain Blocking Configuration</th>
                                <th style="width: 40%;"></th>
                            </tr>
                            <tr class="table-content-fist center">
                                <td class="p-1">Select</td>
                                <td class="p-1">Domain</td>
                            </tr>
                        </table>
                    </div>
                    <div class="mt-2 center">
                        <button class="btn-dashboard">Delete Selected</button>
                        <button class="btn-dashboard">Delete All</button>
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