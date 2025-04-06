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
	function goBack()
	{
		window.history.go(-1);
	}
	</script>
</head>

<body>
<!-- content -->
<form name=ConfigForm method="post" action="/cgi-bin/true-page/service/mac-based.asp"> 
	<div class="container-full container-resize-height">
		<div class="title-text">Port-Based Filter</div>        
		<div class="row p-1">
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">LAN_1</label>
			</div>
			
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">LAN_2</label>
			</div>
		</div>
<% if tcwebApi_get("Vid_Common","skyvid","h") <> "10" then %>
		<div class="row p-1">
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">LAN_3</label>
			</div>
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">LAN_4</label>
			</div>
		</div>
<% end if %>
		<div class="row p-1">
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">WLAN0-SSID1</label>
			</div>
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">WLAN0-SSID2</label>
			</div>
		</div>
		<div class="row p-1">
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">WLAN0-SSID3</label>
			</div>
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">WLAN0-SSID4</label>
			</div>
		</div>
		<div class="row p-1">
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">WLAN1-SSID1</label>
			</div>
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">WLAN1-SSID2</label>
			</div>
		</div>
		<div class="row p-1">
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">WLAN1-SSID3</label>
			</div>
			<div class="col-md-6 col-sx-12 pl60">
				<input type="checkbox" value="1" name="enabled" disabled>
				<label class="input-radio">WLAN1-SSID4</label>
			</div>
		</div>
		<div class="mt-2 center">
			<button type="button" class="btn-dashboard" onclick="Apply()">Apply Changes</button>
			<button id="goback" name="goback" type="button" class="btn-dashboard" onclick="goBack();">Close</button>
		</div>
		<hr>
	</div>
</form>
<!-- content -->
</body>

</html>
