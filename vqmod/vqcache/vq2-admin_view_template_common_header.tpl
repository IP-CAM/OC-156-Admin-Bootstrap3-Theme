<!DOCTYPE html>
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
  <title><?php echo $title; ?></title>
  <base href="<?php echo $base; ?>">
  <meta http-equiv="x-dns-prefetch-control" content="on">
  <link rel="dns-prefetch" href="http://netdna.bootstrapcdn.com">
  <link rel="dns-prefetch" href="http://ajax.googleapis.com">
  <?php if ($description) { ?>
  <meta name="description" content="<?php echo $description; ?>">
  <?php } ?>
  <?php if ($keywords) { ?>
  <meta name="keywords" content="<?php echo $keywords; ?>">
  <?php } ?>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
  <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
  <link href="//netdna.bootstrapcdn.com/bootswatch/3.0.2/flatly/bootstrap.min.css" rel="stylesheet">
  <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet">
  <link href="view/stylesheet/custom.css" rel="stylesheet">
  <?php foreach ($styles as $style) { ?>
  <link type="text/css" href="<?php echo $style['href']; ?>" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>">
  <?php } ?>
  <?php foreach ($links as $link) { ?>
  <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>">
  <?php } ?>
  <script type="text/javascript" src="view/javascript/tableedit.js"></script>
  <script type="text/javascript" src="view/javascript/common.js"></script>
  <script type="text/javascript">
    $(document).ready(function(){
      if (("standalone" in window.navigator) && window.navigator.standalone) {
        // For iOS Apps
        $('a').on('click', function(e){
          e.preventDefault();
          var new_location = $(this).attr('href');
          if (new_location != undefined && new_location.substr(0, 1) != '#' && $(this).attr('data-method') == undefined) {
            window.location = new_location;
          }
        });
      }
    });
  </script>
  <?php foreach ($scripts as $script) { ?>
  <script type="text/javascript" src="<?php echo $script; ?>"></script>
  <?php } ?>
</head>
<body>
  <div id="container">
  <?php if($logged): ?>
    <header class="navbar navbar-fixed-top navbar-default">
      <div class="container">
        <div class="navbar-header">
          <a href="<?php echo $store; ?>" class="navbar-brand"><i class="fa fa-rub fa-lg"></i></a>
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
<li class="dropdown-submenu"><a data-toggle="dropdown" href="#">SEO</a>
			<ul class="dropdown-menu">			
			<li><a href="<?php echo $seopack; ?>"><?php echo $text_seopack; ?></a></li>
			<li><a href="<?php echo $seoimages; ?>"><?php echo $text_seoimages; ?></a></li>
			<li>
				<?php if (file_exists(DIR_APPLICATION.'controller/catalog/autolinks.php')) { ?>
				<a href="<?php echo $autolinks; ?>"><?php echo $text_autolinks; ?></a>
				<?php } else { ?>
				<a onclick="alert('Auto Internal Links is not installed!\nYou can purchase Auto Internal Links from\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=5650\nor you can purchase the whole Opencart SEO Pack PRO:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=6182');" class="btn btn-default btn-sm"><?php echo $text_autolinks; ?></a>
				<?php } ?>
			</li>
			<li>
				<?php if (file_exists(DIR_APPLICATION.'controller/catalog/seoeditor.php')) { ?>
				<a href="<?php echo $seoeditor; ?>"><?php echo $text_seoeditor; ?></a>
				<?php } else { ?>
				<a onclick="alert('Advanced SEO Editor is not installed!\nYou can purchase Advanced SEO Editor from\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=6183\nor you can purchase the whole Opencart SEO Pack PRO:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=6182');" class="btn btn-default btn-sm"><?php echo $text_seoeditor; ?></a>
				<?php } ?>
			</li>
			<li><a href="<?php echo $seoreport; ?>"><?php echo $text_seoreport; ?></a></li>
			</ul>
			</li>
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
                <li><a href="<?php echo $module; ?>"><?php echo $text_module; ?></a></li>
                <li><a href="<?php echo $shipping; ?>"><?php echo $text_shipping; ?></a></li>
                <li><a href="<?php echo $payment; ?>"><?php echo $text_payment; ?></a></li>
                <li><a href="<?php echo $total; ?>"><?php echo $text_total; ?></a></li>
                <li><a href="<?php echo $feed; ?>"><?php echo $text_feed; ?></a></li>
          <li><a href="<?php echo $vqmod_manager; ?>"><?php echo $text_vqmod_manager; ?></a></li>
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
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
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
        </div>
      </div>
    </header>
  <?php endif ?>