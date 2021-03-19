
<?php

       ini_set('display_errors', 1);
       ini_set('display_startup_errors', 1);
      error_reporting(E_ALL);

require_once './class/DBase.php';
$caller =  Caller::Add('DB');
$mysql = Caller::get('DB');



$kt = $mysql->query("select * from kategoriler where ka_ref=0");



$kategoriler = $kt->fetchAll(PDO::FETCH_ASSOC);

?>


<!doctype html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width,initial-scale=1">
	<title>Özveri İmalat Çevresel Geri Dönüşüm Sistemleri Şehir Mobilyaları ve İç Mekan Üniteleri</title>
	<link href="./bundle.css" rel="stylesheet">
</head>

<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<p class="mb-0 phone pl-md-2"><a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span> +90 212 270 45 60</a> <a href="#"><span class="fa fa-paper-plane mr-1"></span> info@ozveriimalat.com</a></p>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media">
						<p class="mb-0 d-flex"><a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-facebook"><i class="sr-only">Facebook</i></span></a> <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-twitter"><i class="sr-only">Twitter</i></span></a> <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-instagram"><i class="sr-only">Instagram</i></span></a> <a href="#" class="d-flex align-items-center justify-content-center"><span class="fa fa-dribbble"><i class="sr-only">Dribbble</i></span></a></p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
		<div class="container"><a class="navbar-brand" href="index.html"><span class="flaticon-pawprint-1 mr-2"></span>Özveri İmalat Logo</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation"><span class="fa fa-bars"></span> Menu</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
                <?php foreach($kategoriler as  $k=>$v){ ?>
					<li class="nav-item <?=$k==0?'active':'';?>"><a href="index.html" class="nav-link"><?=$v['ka_ad']?></a></li>
                    <?php } ?>
			
				</ul>
			</div>
		</div>
	</nav>
	<script src="./js/app.07c9cdac.js"></script>
</body>

</html>