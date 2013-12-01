<!DOCTYPE html>
<?php
	$position			= $this->config->get('position');
	$navbar				= $this->config->get('navbar');
	$google_api_code	= $this->config->get('google_api_code');
	$Body_font			= $this->config->get('Body_font');
	$Body_font_size		= $this->config->get('Body_font_size');
	$customskinop		= $this->config->get('customskinop');
	$google_profile_id	= $this->config->get('google_profile_id');
	$adminlogo	= $this->config->get('adminlogo');
	$custom_logo	= $this->config->get('custom_logo');
?>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
   <head>
      <meta charset="UTF-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
      <meta name="apple-mobile-web-app-capable" content="yes" />
      <meta name="apple-mobile-web-app-status-bar-style" content="black-translucent" />
      <meta name="apple-mobile-web-app-title" content="OpenCart"/>
      <!-- touch icons -->
      <link rel="apple-touch-icon-precomposed" href="view/image/opencart.jpg" />
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="view/image/opencart_72.jpg" />
      <link rel="apple-touch-icon-precomposed" sizes="114x114" href="view/image/opencart_114.jpg" />
      <link rel="apple-touch-icon-precomposed" sizes="144x144" href="view/image/opencart_144.jpg" />
      <title><?php echo $title; ?></title>
      <base href="<?php echo $base; ?>" />
      <link rel="icon" 
         type="image/jpg" 
         href="view/image/opencart.jpg">
      <meta http-equiv="x-dns-prefetch-control" content="on"/>
      <link rel="dns-prefetch" href="http://netdna.bootstrapcdn.com"/>
      <link rel="dns-prefetch" href="http://ajax.googleapis.com"/>
      <?php if ($description) { ?>
      <meta name="description" content="<?php echo $description; ?>" />
      <?php } ?>
      <?php if ($keywords) { ?>
      <meta name="keywords" content="<?php echo $keywords; ?>" />
      <?php } ?>
      <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
      <?php
         $style = array(
         "0" => "//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css",
         "1" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/amelia/bootstrap.min.css",
         "2" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/cerulean/bootstrap.min.css",
         "3" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/cosmo/bootstrap.min.css",
         "4" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/cyborg/bootstrap.min.css",
         "5" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/flatly/bootstrap.min.css",
         "6" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/journal/bootstrap.min.css",
         "7" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/readable/bootstrap.min.css",
         "8" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/simplex/bootstrap.min.css",
         "9" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/slate/bootstrap.min.css",
         "10" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/spacelab/bootstrap.min.css",
         "11" => "//netdna.bootstrapcdn.com/bootswatch/3.0.0/united/bootstrap.min.css",
         "12" => "view/stylesheet/12.css",
         "13" => "view/stylesheet/13.css",
         "14" => "view/stylesheet/14.css",
         "15" => "view/stylesheet/15.css",
         "16" => "view/stylesheet/16.css",
         "17" => "view/stylesheet/17.css",
         "18" => "view/stylesheet/18.css",
         "19" => "view/stylesheet/19.css",
         "20" => "view/stylesheet/20.css",
         "21" => "view/stylesheet/21.css",
         "22" => "view/stylesheet/22.css",
         "23" => "view/stylesheet/23.css",
         "24" => "view/stylesheet/24.css",
         "25" => "view/stylesheet/25.css",
		 "26" => "view/stylesheet/26.css"
         );
         
         if ($this->config->get('adminstyle') != null) {
         	$admin_style = $this->config->get('adminstyle');
         } else {
         	$admin_style = '0';
         }
         foreach ($style as $style_key => $style_name) {
         	if ($style_key == $admin_style) echo '<link href="'. $style_name .'" rel="stylesheet  prefetch prerender" />';
         }
         if (($customskinop == 1) && file_exists(DIR_APPLICATION . 'view/stylesheet/custom.css')) {
         	echo '<link href="view/stylesheet/custom.css" rel="stylesheet" rel="prefetch prerender"/>';
         }
         ?>
      <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
      <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.0/css/font-awesome.min.css" rel="stylesheet prefetch prerender" />
      <style>
body {background-color: #fff}
#content {margin-top: 71px}
.breadcrumb {
  padding: 8px 0;
  background-color: transparent;
  border-bottom: 1px solid #ecf0f1;
  border-radius: 0;
}
.breadcrumb > li a {color: #a0a8b0}
.page-header h1 {
  margin: 0;
  font-size: 2em;
  font-weight: bold;
  text-transform: uppercase;
}
a {color: #2c3e50}
.nav-tabs > li.active > a, .nav-tabs > li.active > a:hover, .nav-tabs > li.active > a:focus {background-color: #fff}
.table thead:first-child tr:first-child td {
  background: #18bc9c;
  color: #fff;
  white-space: nowrap;
}
.table thead:first-child tr:first-child td a {
  color: #fff;
  text-shadow: 0 1px rgba(0,0,0,.15);
}
.table thead:first-child tr:first-child td a:after {color: rgba(255,255,255,.7);}
.table tbody>tr>td {background:#f8fafa; border-bottom: 1px solid #ecf0f1; border-top: none}
.table-hover>tbody>tr:hover>td {background-color: #fff}

.results{margin: 20px 0; color: #cbcfd4}
@media all and (max-width:768px){
#content{padding-left:3px;padding-right:3px}
}
footer{margin-bottom:80px}
@media all and (min-width:768px){
.fc-header-right{margin-top:15px;float:right}.fc-event-time{margin-right:10px}
}
         <?php 
            if (!$this->user->isLogged()){ ?>.jumbotron{padding:30px 10px}.navbar {margin-bottom: 0;}body{overflow-x:hidden;}<?php } else { ?>
	.panel-title{white-space: nowrap;overflow:hidden;width:auto;text-overflow: ellipsis;}
         .dropdown-submenu{position:relative}
         .dropdown-submenu>.dropdown-menu:before{border:0}
         .dropdown-submenu>.dropdown-menu{top:0;left:100%;margin-top:-6px;margin-left:-1px;-webkit-border-radius:0 6px 6px 6px;-moz-border-radius:0 6px 6px 6px;border-radius:0 6px 6px 6px}
         .dropdown-submenu:hover>.dropdown-menu{display:block}
         .dropdown-submenu>a:after{display:block;content:" ";float:right;width:0;height:0;border-color:transparent;border-style:solid;border-width:5px 0 5px 5px;border-left-color:#ccc;margin-top:5px;margin-right:-10px}
         .dropdown-submenu:hover>a:after{border-left-color:#fff}
         .dropdown-submenu.pull-left{float:none}
         .dropdown-submenu.pull-left>.dropdown-menu{left:-100%;margin-left:10px;-webkit-border-radius:6px 0 6px 6px;-moz-border-radius:6px 0 6px 6px;border-radius:6px 0 6px 6px}
         .tab-pane{padding-top:15px}
         .help{font-size:80%;color:#ccc;font-weight:normal;line-height:60%}
         .modal-dialog{width:80%;height:560px}
         @media all and (min-width:1024px){ul.nav li.dropdown:hover>ul.dropdown-menu{display:block}}
         @media all and (max-width:480px){.dropdown-submenu>.dropdown-menu{display:block}}
         .btn-file{position:relative;overflow:hidden}
         .btn-file input[type=file]{position:absolute;top:0;right:0;min-width:100%;min-height:100%;font-size:999px;text-align:right;filter:alpha(opacity=0);opacity:0;background:red;cursor:inherit;display:block}
         .links a{display:inline-block;position:relative;padding:3px 6px;text-decoration:none;border:1px solid #ddd;border-radius:4px}
         .table{border-radius:7px}
         .table thead td{font-weight:bold}
         .table thead a:after{content:"  \f0dc";font-family:FontAwesome;font-size:14px;color:#ccc}
         .table thead a:hover{text-decoration:none}
         .table thead a.asc:after{content:"  \f106";font-family:FontAwesome;font-size:14px}
         .table thead a.desc:after{content:"  \f107";font-family:FontAwesome;font-size:14px}
         .width-10{width:10%}
         .width-20{width:20%}
         .width-30{width:30%}
         .width-40{width:40%}
         .width-50{width:50%}
		 .breadcrumb>li+li:before{padding:0 5px;content:"\f105";font-family: FontAwesome;}
		<?php if (($position != null) && ($position !== '2')){ ?>
         #toTop{text-align:center;padding:15px;position:fixed;bottom:5px;right:5px;cursor:pointer;display:none}
		<?php } else { ?>
         #toTop{text-align:center;padding:15px;position:fixed;bottom:45px;right:5px;cursor:pointer;display:none}
		<?php } ?>
         <?php if (($position != null) && ($position == '1')){ ?>
         #wrapper{padding-left:200px;transition:all .4s ease 0}
         #sidebar-wrapper{margin-left:-200px;left:200px;width:200px;position:fixed;height:100%;overflow-x:hidden;overflow-y:inherit;z-index:1000;transition:all .4s ease 0}
         #sidebar-wrapper::-webkit-scrollbar{width:10px}
         #sidebar-wrapper::-webkit-scrollbar-track{-webkit-box-shadow:inset 0 0 6px rgba(0,0,0,0.3);border-radius:0}
         #sidebar-wrapper::-webkit-scrollbar-thumb{border-radius:0;-webkit-box-shadow:inset 0 0 6px rgba(0,0,0,0.5)}
         #page-content-wrapper{width:100%}
         .sidebar-nav{position:absolute;top:0;width:200px;list-style:none;margin:0;padding:0}
         .sidebar-nav ul{width:auto;list-style:none;margin:0;padding:0}
         .sidebar-nav li{line-height:40px;text-indent:10px}
         .sidebar-nav li a{display:block;text-decoration:none}
         .navbar-inverse > .sidebar-nav li a.top{color:#fff;}
         .navbar-default > .sidebar-nav li a.top{color:#000;}
         li a.active,.sidebar-nav li.active{background:rgba(255,255,255,0.2);text-decoration:none}
         .sidebar-nav li a.top{border-top: 1px solid rgba(0, 0, 0, 0.1);border-bottom: 1px solid rgba(255, 255, 255, 0.3)}
         @media all and (min-width:900px){.sidebar-nav li a:hover{color:#ccc;background:rgba(255,255,255,0.2);text-decoration:none}
         .sidebar-nav li a:active,.sidebar-nav li a:focus{text-decoration:none}
         .sidebar-nav>.sidebar-brand a:hover{color:#fff;background:#000}
         }
         .sidebar-nav>.sidebar-brand{height:50px;line-height:50px;font-size:18px;background:rgba(255,255,255,0.2)}
         .sidebar-nav>.sidebar-brand a{color:#999}
         .content-header{height:65px;line-height:65px}
         .content-header h1{margin:0;margin-left:20px;line-height:65px;display:inline-block}
         #menu-toggle{display:none}
         @media(max-width:768px){body{font-family:-apple-system-font,"Helvetica Neue",Helvetica,Arial,"Droid Sans",sans-serif;color:#5a5a5a;font-size:16px;font-weight:200;font-style:"Light"}
         #wrapper{padding-left:0}
         #sidebar-wrapper{left:0}
         #wrapper.active{position:relative;left:200px}
         #wrapper.active #sidebar-wrapper{left:200px;width:200px;transition:all .4s ease 0}
         #menu-toggle{display:inline-block;margin-left:25px}
         .inset{padding:10px 0px}.container{padding:5px}
         }
         .sidebar-nav li i{right:40px;padding-top:10px;position:absolute}
         .sidebar-nav li ul li a:before{content:"\f138";padding-right:15px;font-family:FontAwesome;color:#ccc}
         .sidebar-nav li ul li ul li a:before{content:"\f138";padding-right:15px;font-family:FontAwesome;color:#000}
         .sidebar-nav li ul li a.sub:before{content:"\f054";padding-right:15px;font-family:FontAwesome;color:#999;font-color:#999}
         .sidebar-nav li ul li a{color:#fff;border-bottom:solid 1px #272727;background:#0d0d0d;text-decoration:none}
         .icn{height:50px;margin-left:10px;margin-top:15px}
         <?php } // position 

	} // user logged ?>
      </style>
      <?php if ( isset($this->request->get['route']) && strpos($this->request->get['route'], 'module/' ) !== false ) { ?>
      <!--<link href="view/stylesheet/stylesheet1.5.6.css" rel="stylesheet"  />-->
      <?php } ?>
      <?php foreach ($styles as $style) { ?>
      <link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
      <?php } ?>
      <?php foreach ($links as $link) { ?>
      <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
      <?php } ?>
      <script type="text/javascript" src="view/javascript/common.js?<?php echo time();?>"></script>
      <script type="text/javascript">
         $(document).ready(function(){
             if (("standalone" in window.navigator) && window.navigator.standalone) {
				$(".navbar-fixed-top").css('padding-top','15px');
				$(".navbar-static-top").css('padding-top','15px');
			<?php if ($logged){ ?>
				$("#content").css('margin-top','30px');
				$(".sidebar-brand").css('margin-top','20px');
			<?php } ?>


               // For iOS Apps
               $('a').on('click', function(e){
                 e.preventDefault();
                 var new_location = $(this).attr('href');
                 if (new_location != undefined && new_location.substr(0, 1) != '#' && $(this).attr('data-method') == undefined){
                   window.location = new_location;
                 }
               });
             }
           });
      </script>
      <?php foreach ($scripts as $script) { ?>
      <script type="text/javascript" src="<?php echo $script; ?>"></script>
      <?php } ?>

      <?php if ($Body_font != null && $Body_font !='0') { ?>
      <link href='//fonts.googleapis.com/css?family=<?php echo $Body_font; ?>&amp;v1' rel='stylesheet' type='text/css'>
      <style type="text/css">
        body{font-family: <?php echo str_replace('+', ' ', $Body_font); ?>;
         <?php if ($Body_font_size != null && $Body_font_size !='0') { ?>
         font-size:<?php echo $Body_font_size; ?>;
         <?php } ?>
         font-weight:normal;}
      </style>
      <?php } ?>
   </head>
   <body>
      <div id="container">
      <?php /* if (!$logged || ($position == null) || ($position == '0') || ($position == '2') ){ ?>
      <header class="navbar navbar-static-top<?php if (($navbar != null) && ($navbar == 1)){ echo ' navbar-default';}else{echo ' navbar-inverse';} ?>">
         <div class="container">
           <?php if (!$logged) { ?>
            <div class="navbar-header">
               <a href="<?php echo $home; ?>" class="navbar-brand">
							<?php if (($adminlogo != null && $adminlogo == '1') && $this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo')) ){ ?>
						<img src="<?php echo HTTP_CATALOG .'image/' . $this->config->get('config_logo'); ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" height="30" />
					<?php } elseif (($custom_logo != null) && file_exists(DIR_IMAGE . $custom_logo)){ ?>
						<img src="<?php echo HTTP_CATALOG .'image/' . $custom_logo; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" height="30" />
					<?php } else { ?>
						<img src="view/image/logo.png" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" />
					<?php } ?>
		</a>
            </div>
           <?php } else { ?>
			<div class="navbar-header">
			<?php if (($position != null) && ($position == '2')){ ?>
				<a href="<?php echo HTTP_CATALOG; ?>" class="navbar-brand"><i class="fa fa-shopping-cart fa-border"></i> <?php echo $this->config->get('config_name'); ?></a>
			<?php } ?>
            </div>
			<?php if (($position != null) && ($position == '2')){ ?>
            <ul class="nav navbar-nav navbar-right visible-lg visible-md visible-sm">
               <li class="dropdown">
                  <a href="#" data-toggle="dropdown"><?php echo $logged; ?> <i class="fa fa-caret-down"></i></a>
                  <ul class="dropdown-menu">
                     <li role="presentation" class="dropdown-header"><?php echo $text_help; ?> <i class="fa fa-question"></i></li>
                     <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_opencart; ?></a></li>
                     <li><a href="http://docs.opencart.com" target="_blank"><?php echo $text_documentation; ?></a></li>
                     <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
                     <li class="divider"></li>
                     <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
                     <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                  </ul>
               </li>
               <li><a href="<?php echo $logout; ?>"><span class="visible-lg visible-md"><i class="fa fa-power-off fa-lg"></i></span><span class="hidden-lg hidden-md"> <?php echo $text_logout; ?></span></a></li>
            </ul>
		<?php  } 

			} ?>
         </div>
      </header>
      <?php } */?>
      <?php if ($logged) { ?>
      <?php if (($position != null) && ($position == '1')){ ?>
      <div id="wrapper">
      <!-- Sidebar -->
      <div id="sidebar-wrapper" class="<?php if (($navbar != null) && ($navbar == 1)){ echo ' navbar-default';}else{echo ' navbar-inverse';} ?>">
         <ul class="sidebar-nav">
         <li class="sidebar-brand"><a href="<?php echo $home; ?>"><?php echo $heading_title; ?></a></li>
         <div class="icn">
            <div class="btn-group btn-group-sm">
               <button type="button" class="btn btn-success" onclick='javascript:window.location.href="<?php echo $customer; ?>"' data-toggle="tooltip" title="<?php echo $text_customer; ?>"><span class="fa fa-user"></span></button>
               <button type="button" class="btn btn-warning" onclick='javascript:window.location.href="<?php echo $order; ?>"' data-toggle="tooltip" title="<?php echo $text_order; ?>"><span class="fa fa-shopping-cart"></span></button>
               <button type="button" class="btn btn-default" onclick='javascript:window.location.href="<?php echo $report_sale_order; ?>"' data-toggle="tooltip" title="<?php echo $text_reports; ?>"><span class="fa fa-bar-chart-o"></span></button>
               <button type="button" class="btn btn-info" onclick='javascript:window.location.href="<?php echo $setting; ?>"' data-toggle="tooltip" title="<?php echo $text_setting; ?>"><span class="fa fa-gear"></span></button>
               <button type="button" class="btn btn-danger" onclick='javascript:window.location.href="<?php echo $logout; ?>"' data-toggle="tooltip" title="<?php echo $text_logout; ?>"><span class="fa fa-power-off"></span></button>
            </div>
         </div>
         <li id="dashboard"><a href="<?php echo $home; ?>" class="top"><?php echo $text_dashboard; ?></a></li>
         <li id="catalog">
            <a data-toggle="collapse" href="#collapse1" class="top"><?php echo $text_catalog; ?><i class="fa fa-angle-down"></i></a>
            <ul id="collapse1" class="collapse">
               <li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
               <li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>
               <li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li>
               <li>
                  <a data-toggle="collapse" href="#collapse2" class="sub"><?php echo $text_attribute; ?></a>
                  <ul id="collapse2" class="collapse">
                     <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
                     <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
                  </ul>
               </li>
               <li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
               <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
               <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
               <li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
               <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
            </ul>
         </li>
         <li id="extension">
            <a data-toggle="collapse" href="#collapse3" class="top"><?php echo $text_extension; ?> <i class="fa fa-angle-down"></i></a>
            <ul id="collapse3" class="collapse panel-inverse">
               <?php /*Quick Link for Proof of Delivery Module */ if ($this->user->hasPermission('access', 'module/recipient')) { ?>
               <li><a href="index.php?route=module/recipient&token=<?php echo $this->session->data['token']; ?>">Proof of Delivery</a></li>
               <?php } ?>
               <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
               <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
               <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
               <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
               <li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
          <li><a href="<?php echo $vqmod_manager; ?>"><?php echo $text_vqmod_manager; ?></a></li>
               <li>
                  <a data-toggle="collapse" href="#collapse4" class="sub"><?php echo $text_openbay_extension; ?></a>
                  <ul id="collapse4" class="collapse panel-inverse">
                     <li><a href="<?php echo $openbay_link_extension; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
                     <li><a href="<?php echo $openbay_link_orders; ?>"><?php echo $text_openbay_orders; ?></a></li>
                     <li><a href="<?php echo $openbay_link_items; ?>"><?php echo $text_openbay_items; ?></a></li>
                     <?php if($openbay_markets['ebay'] == 1){ ?>
                     <li role="presentation" class="divider"></li>
                     <li role="presentation" class="dropdown-header"><?php echo $text_openbay_ebay; ?></li>
                     <li><a href="<?php echo $openbay_link_ebay_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                     <li><a href="<?php echo $openbay_link_ebay_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                     <li><a href="<?php echo $openbay_link_ebay_orderimport; ?>"><?php echo $text_openbay_order_import; ?></a></li>
                     <?php } ?>
                     <?php if($openbay_markets['amazon'] == 1){ ?>
                     <li role="presentation" class="divider"></li>
                     <li role="presentation" class="dropdown-header" href="<?php echo $openbay_link_amazon; ?>"><?php echo $text_openbay_amazon; ?></li>
                     <li><a href="<?php echo $openbay_link_amazon_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                     <li><a href="<?php echo $openbay_link_amazon_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                     <?php } ?>
                     <?php if($openbay_markets['amazonus'] == 1){ ?>
                     <li role="presentation" class="divider"></li>
                     <li role="presentation" class="dropdown-header" href="<?php echo $openbay_link_amazonus; ?>"><?php echo $text_openbay_amazonus; ?></li>
                     <li><a href="<?php echo $openbay_link_amazonus_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                     <li><a href="<?php echo $openbay_link_amazonus_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                     <?php } ?>
                     <?php if($openbay_markets['play'] == 1){ ?>
                     <li role="presentation" class="divider"></li>
                     <li role="presentation" class="dropdown-header" href="<?php echo $openbay_link_play; ?>"><?php echo $text_openbay_play; ?></li>
                     <li><a href="<?php echo $openbay_link_play_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                     <li><a href="<?php echo $openbay_link_play_report_price; ?>"><?php echo $text_openbay_report_price; ?></a></li>
                     <?php } ?>
                  </ul>
               </li>
            </ul>
         </li>
         <li id="sale">
            <a data-toggle="collapse" href="#collapse5" class="top"><?php echo $text_sale; ?> <i class="fa fa-angle-down"></i></a>
            <ul id="collapse5" class="collapse panel-inverse">
               <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
               <li><a href="<?php echo $recurring_profile; ?>"><?php echo $text_recurring_profile; ?></a></li>
               <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
               <li>
                  <a data-toggle="collapse" href="#collapse6" class="sub"><?php echo $text_customer; ?></a>
                  <ul id="collapse6" class="collapse panel-inverse">
                     <li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
                     <li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
                     <li><a href="<?php echo $customer_ban_ip; ?>"><?php echo $text_customer_ban_ip; ?></a></li>
                  </ul>
               </li>
               <li>
                  <a data-toggle="collapse" href="#collapse7" class="sub"><?php echo $text_voucher; ?></a>
                  <ul id="collapse7" class="collapse panel-inverse">
                     <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                     <li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
                  </ul>
               </li>
               <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
               <li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
               <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
               <!-- PAYPAL MANAGE NAVIGATION LINK -->
               <?php if ($pp_express_status) { ?>
               <li>
                  <a data-toggle="collapse" href="#collapse8" class="sub" href="<?php echo $paypal_express; ?>"><?php echo $text_paypal_express; ?></a>
                  <ul id="collapse8" class="collapse panel-inverse">
                     <li><a href="<?php echo $paypal_express_search; ?>"><?php echo $text_paypal_express_search; ?></a></li>
                  </ul>
               </li>
               <?php } ?>
               <!-- PAYPAL MANAGE NAVIGATION LINK END -->
            </ul>
         </li>
         <li id="system">
            <a data-toggle="collapse" href="#collapse9" class="top"><?php echo $text_system; ?> <i class="fa fa-angle-down"></i></a>
            <ul id="collapse9" class="collapse panel-inverse">
               <li><a href="<?php echo $setting; ?>"><span class=""></span> <?php echo $text_setting; ?></a></li>
               <li class="dropdown-submenu">
                  <a data-toggle="collapse" href="#collapse31" class="sub"><?php echo $text_design; ?></a>
                  <ul id="collapse31" class="collapse panel-inverse">
                     <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
                     <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
                  </ul>
               </li>
               <li class="dropdown-submenu">
                  <a data-toggle="collapse" href="#collapse10" class="sub"><?php echo $text_users; ?></a>
                  <ul id="collapse10" class="collapse panel-inverse">
                     <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
                     <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
                  </ul>
               </li>
               <li>
                  <a data-toggle="collapse" href="#collapse11" class="sub"><?php echo $text_localisation; ?></a>
                  <ul id="collapse11" class="collapse panel-inverse">
                     <li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
                     <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
                     <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
                     <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
                     <li role="presentation" class="divider"></li>
                     <li role="presentation" class="dropdown-header"><?php echo $text_return; ?></li>
                     <li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
                     <li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
                     <li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
                     <li role="presentation" class="divider"></li>
                     <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
                     <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
                     <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
                     <li role="presentation" class="divider"></li>
                     <li role="presentation" class="dropdown-header"><?php echo $text_geo_zone; ?></li>
                     <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
                     <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
                     <li role="presentation" class="divider"></li>
                     <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
                     <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
                  </ul>
               </li>
               <li class="divider"></li>
               <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
               <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
            </ul>
         </li>
         <li id="reports">
            <a data-toggle="collapse" href="#collapse12" class="top"><?php echo $text_reports; ?> <i class="fa fa-angle-down"></i></a>
            <ul id="collapse12" class="collapse panel-inverse">
               <li>
                  <a data-toggle="collapse" href="#collapse13" class="sub"><?php echo $text_sale; ?></a>
                  <ul id="collapse13" class="collapse panel-inverse">
                     <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
                     <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
                     <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
                     <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
                     <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
                  </ul>
               </li>
               <li>
                  <a data-toggle="collapse" href="#collapse14" class="sub"><?php echo $text_product; ?></a>
                  <ul id="collapse14" class="collapse panel-inverse">
                     <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
                     <li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
                  </ul>
               </li>
               <li>
                  <a data-toggle="collapse" href="#collapse15" class="sub"><?php echo $text_customer; ?></a>
                  <ul id="collapse15" class="collapse panel-inverse">
                     <li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
                     <li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
                     <li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
                     <li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
                  </ul>
               </li>
               <li>
                  <a data-toggle="collapse" href="#collapse16" class="sub"><?php echo $text_affiliate; ?></a>
                  <ul id="collapse16" class="collapse panel-inverse">
                     <li><a href="<?php echo $report_affiliate_commission; ?>"><?php echo $text_report_affiliate_commission; ?></a></li>
                  </ul>
               </li>
            </ul>
         <li id="last"></li>
      </div>
      <!-- Page content -->
      <div class="content-header">
         <header class="navbar navbar-static-top<?php if (($navbar != null) && ($navbar == 1)){ echo ' navbar-default';}else{echo ' navbar-inverse';} ?>">
            <div class="container">
               <div class="navbar-header">
                  <a id="menu-toggle" href="#" class="btn btn-default"><i class="fa fa-gear"></i> <?php echo $heading_title; ?></a>
               </div>
            </div>
            <ul class="nav navbar-nav visible-lg visible-md">
               <li class="dropdown">
                  <a href="<?php echo $store; ?>" class="navbar-brand"><i class="fa fa-home fa-lg"></i> <?php echo $text_front; ?></a>
                  <?php if ($stores) { ?>
                  <ul class="dropdown-menu">
                     <li><a href="<?php echo $store; ?>" target="_blank"><?php echo $text_front; ?></a></li>
                     <?php foreach ($stores as $store) { ?>
                     <li><a href="<?php echo $store['href']; ?>" target="_blank"><?php echo $store['name']; ?></a></li>
                     <?php } ?>
                  </ul>
                  <?php } ?>
               </li>
            </ul>
            <ul class="nav navbar-nav navbar-right visible-lg visible-md visible-sm">
               <li class="dropdown">
                  <a href="#" data-toggle="dropdown"><?php echo $logged; ?> <i class="fa fa-caret-down"></i></a>
                  <ul class="dropdown-menu">
                     <li role="presentation" class="dropdown-header"><?php echo $text_help; ?> <i class="fa fa-question"></i></li>
                     <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_opencart; ?></a></li>
                     <li><a href="http://docs.opencart.com" target="_blank"><?php echo $text_documentation; ?></a></li>
                     <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
                     <li class="divider"></li>
                     <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
                     <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                  </ul>
               </li>
               <li><a href="<?php echo $logout; ?>"><span class="visible-lg visible-md"><i class="fa fa-power-off fa-lg"></i></span><span class="hidden-lg hidden-md"> <?php echo $text_logout; ?></span></a></li>
            </ul>
         </header>
      </div>
      <!-- Keep all page content within the page-content inset div! -->
      <div class="page-content inset">
      <!--<div class="alert alert-info" style="margin:20px">Welcome to Bootstrap 3 Admin Theme demo site. To play Bootstrap 3 Admin Theme, please go Extensions -> Bootstrap Skin to setup new theme.(This Bootstrap 3 Admin Theme Version9.0)</div>-->
      <?php } else { ?>
      <header class="navbar navbar-fixed-<?php echo ($position =='2') ? "bottom": "top"; ?><?php if (($navbar != null) && ($navbar == 1)){ echo ' navbar-default';} else { echo ' navbar-inverse';} ?>">
         <div class="container">
            <div class="navbar-header">
				<?php //if (($position != null) && ($position == '2')){ ?>
              <a href="<?php echo $store; ?>" class="navbar-brand<?php echo(($position != null) && ($position == '2'))?' hidden-md hidden-lg':'';?>"><span class="visible-lg visible-md"><i class="fa fa-toggle-left fa-lg"></i></span><span class="hidden-lg hidden-md"> <?php echo $text_front; ?></span></a>
				<?php //} else { ?>
				<?php //} ?>
              <button class="navbar-toggle" type="button" data-toggle="collapse" data-target="#navbar-main">
                <span class="fa fa-reorder fa-lg fa-inverse"></span>
              </button>
            </div>
            <div class="navbar-collapse collapse" id="navbar-main">
               <ul class="nav navbar-nav">
                  <li id="dashboard"><a href="<?php echo $home; ?>" title="<?php echo $text_dashboard; ?>"><?php echo $text_dashboard; ?></a></li>
                  <li id="catalog" class="dropdown">
                     <a href="#" data-toggle="dropdown"><?php echo $text_catalog; ?> <i class="fa fa-caret-down"></i></a>
                     <ul class="dropdown-menu">
                        <li><a href="<?php echo $category; ?>"><?php echo $text_category; ?></a></li>
                        <li><a href="<?php echo $product; ?>"><?php echo $text_product; ?></a></li>
                        <li><a href="<?php echo $filter; ?>"><?php echo $text_filter; ?></a></li>
                        <li class="dropdown-submenu">
                           <a><?php echo $text_attribute; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $attribute; ?>"><?php echo $text_attribute; ?></a></li>
                              <li><a href="<?php echo $attribute_group; ?>"><?php echo $text_attribute_group; ?></a></li>
                           </ul>
                        </li>
                        <li><a href="<?php echo $option; ?>"><?php echo $text_option; ?></a></li>
                        <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                        <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
                        <li><a href="<?php echo $review; ?>"><?php echo $text_review; ?></a></li>
                        <li><a href="<?php echo $information; ?>"><?php echo $text_information; ?></a></li>
                     </ul>
                  </li>
                  <li id="extension" class="dropdown">
                     <a href="#" data-toggle="dropdown"><?php echo $text_extension; ?> <i class="fa fa-caret-down"></i></a>
                     <ul class="dropdown-menu">
                        <?php /*Quick Link for Proof of Delivery Module */ if ($this->user->hasPermission('access', 'module/recipient')) { ?>
                        <li><a href="index.php?route=module/recipient&token=<?php echo $this->session->data['token']; ?>">Proof of Delivery</a></li>
                        <?php } ?>
                        <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
                        <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
                        <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
                        <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
                        <li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
          <li><a href="<?php echo $vqmod_manager; ?>"><?php echo $text_vqmod_manager; ?></a></li>
                        <?php /*
                        <li class="dropdown-submenu">
                           <a><?php echo $text_openbay_extension; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $openbay_link_extension; ?>"><?php echo $text_openbay_dashboard; ?></a></li>
                              <li><a href="<?php echo $openbay_link_orders; ?>"><?php echo $text_openbay_orders; ?></a></li>
                              <li><a href="<?php echo $openbay_link_items; ?>"><?php echo $text_openbay_items; ?></a></li>
                              <?php if($openbay_markets['ebay'] == 1){ ?>
                              <li role="presentation" class="divider"></li>
                              <li role="presentation" class="dropdown-header"><?php echo $text_openbay_ebay; ?></li>
                              <li><a href="<?php echo $openbay_link_ebay_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                              <li><a href="<?php echo $openbay_link_ebay_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                              <li><a href="<?php echo $openbay_link_ebay_orderimport; ?>"><?php echo $text_openbay_order_import; ?></a></li>
                              <?php } ?>
                              <?php if($openbay_markets['amazon'] == 1){ ?>
                              <li role="presentation" class="divider"></li>
                              <li role="presentation" class="dropdown-header" href="<?php echo $openbay_link_amazon; ?>"><?php echo $text_openbay_amazon; ?></li>
                              <li><a href="<?php echo $openbay_link_amazon_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                              <li><a href="<?php echo $openbay_link_amazon_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                              <?php } ?>
                              <?php if($openbay_markets['amazonus'] == 1){ ?>
                              <li role="presentation" class="divider"></li>
                              <li role="presentation" class="dropdown-header" href="<?php echo $openbay_link_amazonus; ?>"><?php echo $text_openbay_amazonus; ?></li>
                              <li><a href="<?php echo $openbay_link_amazonus_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                              <li><a href="<?php echo $openbay_link_amazonus_links; ?>"><?php echo $text_openbay_links; ?></a></li>
                              <?php } ?>
                              <?php if($openbay_markets['play'] == 1){ ?>
                              <li role="presentation" class="divider"></li>
                              <li role="presentation" class="dropdown-header" href="<?php echo $openbay_link_play; ?>"><?php echo $text_openbay_play; ?></li>
                              <li><a href="<?php echo $openbay_link_play_settings; ?>"><?php echo $text_openbay_settings; ?></a></li>
                              <li><a href="<?php echo $openbay_link_play_report_price; ?>"><?php echo $text_openbay_report_price; ?></a></li>
                              <?php } ?>
                           </ul>
                        </li>*/?>
                     </ul>
                  </li>
                  <li id="sale" class="dropdown">
                     <a href="#" data-toggle="dropdown"><?php echo $text_sale; ?> <i class="fa fa-caret-down"></i></a>
                     <ul class="dropdown-menu">
                        <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                        <li><a href="<?php echo $recurring_profile; ?>"><?php echo $text_recurring_profile; ?></a></li>
                        <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_customer; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $customer; ?>"><?php echo $text_customer; ?></a></li>
                              <li><a href="<?php echo $customer_group; ?>"><?php echo $text_customer_group; ?></a></li>
                              <!--<li><a href="<?php echo $custom_field; ?>"><?php echo $text_custom_field; ?></a></li>-->
                              <li><a href="<?php echo $customer_ban_ip; ?>"><?php echo $text_customer_ban_ip; ?></a></li>
                           </ul>
                        </li>
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_voucher; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                              <li><a href="<?php echo $voucher_theme; ?>"><?php echo $text_voucher_theme; ?></a></li>
                           </ul>
                        </li>
                        <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                        <li><a href="<?php echo $coupon; ?>"><?php echo $text_coupon; ?></a></li>
                        <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                        <!-- PAYPAL MANAGE NAVIGATION LINK -->
                        <?php if ($pp_express_status) { ?>
                        <li class="dropdown-submenu">
                           <a data-toggle="dropdown" href="<?php echo $paypal_express; ?>"><?php echo $text_paypal_express; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $paypal_express_search; ?>"><?php echo $text_paypal_express_search; ?></a></li>
                           </ul>
                        </li>
                        <?php } ?>
                        <!-- PAYPAL MANAGE NAVIGATION LINK END -->
                     </ul>
                  </li>
                  <li id="system" class="dropdown">
                     <a href="#" data-toggle="dropdown"><?php echo $text_system; ?> <i class="fa fa-caret-down"></i></a>
                     <ul class="dropdown-menu">
                        <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_design; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $layout; ?>"><?php echo $text_layout; ?></a></li>
                              <li><a href="<?php echo $banner; ?>"><?php echo $text_banner; ?></a></li>
                           </ul>
                        </li>
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_users; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $user; ?>"><?php echo $text_user; ?></a></li>
                              <li><a href="<?php echo $user_group; ?>"><?php echo $text_user_group; ?></a></li>
                           </ul>
                        </li>
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_localisation; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $language; ?>"><?php echo $text_language; ?></a></li>
                              <li><a href="<?php echo $currency; ?>"><?php echo $text_currency; ?></a></li>
                              <li><a href="<?php echo $stock_status; ?>"><?php echo $text_stock_status; ?></a></li>
                              <li><a href="<?php echo $order_status; ?>"><?php echo $text_order_status; ?></a></li>
                              <li role="presentation" class="divider"></li>
                              <li role="presentation" class="dropdown-header"><?php echo $text_return; ?></li>
                              <li><a href="<?php echo $return_status; ?>"><?php echo $text_return_status; ?></a></li>
                              <li><a href="<?php echo $return_action; ?>"><?php echo $text_return_action; ?></a></li>
                              <li><a href="<?php echo $return_reason; ?>"><?php echo $text_return_reason; ?></a></li>
                              <li role="presentation" class="divider"></li>
                              <li><a href="<?php echo $country; ?>"><?php echo $text_country; ?></a></li>
                              <li><a href="<?php echo $zone; ?>"><?php echo $text_zone; ?></a></li>
                              <li><a href="<?php echo $geo_zone; ?>"><?php echo $text_geo_zone; ?></a></li>
                              <li role="presentation" class="divider"></li>
                              <li role="presentation" class="dropdown-header"><?php echo $text_geo_zone; ?></li>
                              <li><a href="<?php echo $tax_class; ?>"><?php echo $text_tax_class; ?></a></li>
                              <li><a href="<?php echo $tax_rate; ?>"><?php echo $text_tax_rate; ?></a></li>
                              <li role="presentation" class="divider"></li>
                              <li><a href="<?php echo $length_class; ?>"><?php echo $text_length_class; ?></a></li>
                              <li><a href="<?php echo $weight_class; ?>"><?php echo $text_weight_class; ?></a></li>
                           </ul>
                        </li>
                        <li class="divider"></li>
                        <li><a href="<?php echo $error_log; ?>"><?php echo $text_error_log; ?></a></li>
                        <li><a href="<?php echo $backup; ?>"><?php echo $text_backup; ?></a></li>
                     </ul>
                  </li>
                  <li id="reports" class="dropdown">
                     <a href="#" data-toggle="dropdown"><?php echo $text_reports; ?> <i class="fa fa-caret-down"></i></a>
                     <ul class="dropdown-menu">
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_sale; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $report_sale_order; ?>"><?php echo $text_report_sale_order; ?></a></li>
                              <li><a href="<?php echo $report_sale_tax; ?>"><?php echo $text_report_sale_tax; ?></a></li>
                              <li><a href="<?php echo $report_sale_shipping; ?>"><?php echo $text_report_sale_shipping; ?></a></li>
                              <li><a href="<?php echo $report_sale_return; ?>"><?php echo $text_report_sale_return; ?></a></li>
                              <li><a href="<?php echo $report_sale_coupon; ?>"><?php echo $text_report_sale_coupon; ?></a></li>
                           </ul>
                        </li>
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_product; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $report_product_viewed; ?>"><?php echo $text_report_product_viewed; ?></a></li>
                              <li><a href="<?php echo $report_product_purchased; ?>"><?php echo $text_report_product_purchased; ?></a></li>
                           </ul>
                        </li>
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_customer; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $report_customer_online; ?>"><?php echo $text_report_customer_online; ?></a></li>
                              <li><a href="<?php echo $report_customer_order; ?>"><?php echo $text_report_customer_order; ?></a></li>
                              <li><a href="<?php echo $report_customer_reward; ?>"><?php echo $text_report_customer_reward; ?></a></li>
                              <li><a href="<?php echo $report_customer_credit; ?>"><?php echo $text_report_customer_credit; ?></a></li>
                           </ul>
                        </li>
                        <li class="dropdown-submenu">
                           <a href="#" data-toggle="dropdown"><?php echo $text_affiliate; ?></a>
                           <ul class="dropdown-menu">
                              <li><a href="<?php echo $report_affiliate_commission; ?>"><?php echo $text_report_affiliate_commission; ?></a></li>
                           </ul>
                        </li>
                     </ul>
                  </li>
                  <!--<li class="dropdown "><a href="#" data-toggle="dropdown"><?php echo $text_help; ?> <i class="fa fa-caret-down"></i></a>
                     <ul class="dropdown-menu">
                       <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_opencart; ?></a></li>
                       <li><a href="http://docs.opencart.com" target="_blank"><?php echo $text_documentation; ?></a></li>
                       <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
                     </ul>
                     </li>-->
               </ul>
		      <?php if (($position != null) && ($position !== '2')){ ?>
               <ul class="nav navbar-nav navbar-right">
                  <li class="dropdown ">
                     <a href="#" data-toggle="dropdown"><?php echo $logged; ?> <i class="fa fa-caret-down"></i></a>
                     <ul class="dropdown-menu">
                        <?php if ($stores) { ?>
                        <li><a href="<?php echo $store; ?>" target="_blank"><?php echo $text_front; ?></a></li>
                        <?php foreach ($stores as $store) { ?>
                        <li><a href="<?php echo $store['href']; ?>" target="_blank"><?php echo $store['name']; ?></a></li>
                        <?php } ?>
                        <li class="divider"></li>
                        <?php } ?>
                        <li role="presentation" class="dropdown-header"><?php echo $text_help; ?> <i class="fa fa-question"></i></li>
                        <li><a href="http://www.opencart.com" target="_blank"><?php echo $text_opencart; ?></a></li>
                        <li><a href="http://docs.opencart.com" target="_blank"><?php echo $text_documentation; ?></a></li>
                        <li><a href="http://forum.opencart.com" target="_blank"><?php echo $text_support; ?></a></li>
                        <li class="divider"></li>
                        <li><a href="<?php echo $setting; ?>"><?php echo $text_setting; ?></a></li>
                        <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
                     </ul>
                  </li>
                  <li><a href="<?php echo $logout; ?>"><span class="visible-lg visible-md"><i class="fa fa-power-off fa-lg"></i></span><span class="hidden-lg hidden-md"> <?php echo $text_logout; ?></span></a></li>
               </ul>
			<?php } ?>
            </div>
         </div>
      </header>
      <?php } //check sidebar ?>
      <?php } // isLogged ?>