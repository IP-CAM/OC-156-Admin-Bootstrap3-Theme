<?php
    if (!isset($this->request->get['route'])) {
        $this->request->get['route']='common/home';
    }
    $search_bar = '';
    $search_bar_3 = '';
    $search_bar_dark = '';
    $search_bar_none = '';
    if ($this->request->get['route']=='common/home') {
        if ($this->config->get('itembridge_header_style') == '1') {
            $search_bar = '';
        }
        if ($this->config->get('itembridge_header_style') == '2') {
            $search_bar = ' header-two-menu';
        }
        if ($this->config->get('itembridge_header_style') == '3') {
            $search_bar_3 = ' header-third-menu';
        }
        if ($this->config->get('itembridge_header_style') == '4') {
            $search_bar_dark = ' id="dark-menu"';
        }
        if ($this->config->get('itembridge_header_style') == '5') {
            $search_bar = '';
        }
        if ($this->config->get('itembridge_header_style') == '6') {
            $search_bar = '';
        }
        if ($this->config->get('itembridge_header_style') == '7') {
            $search_bar = '';
        }
        if ($this->config->get('itembridge_header_style') == '8') {
            $search_bar_none = 'style="display: none!important;"';
        }
        if ($this->config->get('itembridge_header_style') == '9') {
            $search_bar_none = 'style="display: none!important;"';
        }
    } else {
        $search_bar = '';
    }
?>

<!DOCTYPE html>
<html  dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
    <head>
        <meta charset="UTF-8" />
        <title><?php echo $title; ?></title>
        <base href="<?php echo $base; ?>" />
        <?php if ($description) { ?>
          <meta name="description" content="<?php echo $description; ?>" />
        <?php } ?>
        <?php if ($keywords) { ?>
          <meta name="keywords" content="<?php echo $keywords; ?>" />
        <?php } ?>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <?php if ($icon) { ?>
          <link href="<?php echo $icon; ?>" rel="icon" />
        <?php } ?>
        <?php foreach ($links as $link) { ?>
          <link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
        <?php } ?>
        <?php foreach ($styles as $style) { ?>
          <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
        <?php } ?>
        <link href="http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,700,300italic&subset=latin,cyrillic-ext" rel="stylesheet" media="all">
        <link rel="stylesheet" href="catalog/view/theme/precise/css/buttons/social-icons.css">
        <link rel="stylesheet" href="catalog/view/theme/precise/css/buttons/animation.css"><!--[if IE 7]>
        <link rel="stylesheet" href="catalog/view/theme/precise/css/buttons/social-icons-ie7.css"><![endif]-->
        <link rel="stylesheet" href="catalog/view/theme/precise/css/buttons/itembridge-icon-set.css">
        <!-- Bootstrap -->
        <link href="catalog/view/theme/precise/css/bootstrap.css" rel="stylesheet" media="screen">
        <link href="catalog/view/theme/precise/css/style.css" rel="stylesheet">
        <link href="catalog/view/theme/precise/css/media.css" rel="stylesheet">
        <script src="http://code.jquery.com/jquery.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
        <script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
        <script src="catalog/view/theme/precise/js/bootstrap.js"></script>
        <script src="catalog/view/theme/precise/js/jquery.formstyler.js"></script>
        <script src="catalog/view/theme/precise/js/jquery.carouFredSel-6.2.0-packed.js"></script>
        <script src="catalog/view/theme/precise/js/jquery.touchSwipe.min.js"></script>
        <script src="catalog/view/theme/precise/js/jquery.cookie.js"></script>
        <script src="catalog/view/theme/precise/js/jquery.minicolors.js"></script>
        <script type="text/javascript" src="catalog/view/javascript/common.js"></script>
        <?php foreach ($scripts as $script) { ?>
        <script type="text/javascript" src="<?php echo $script; ?>"></script>
        <?php } ?>
        <!--[if lt IE 9]>
        <script src="catalog/view/theme/precise/js/html5shiv.js"></script>
        <![endif]-->
        <!--[if (gte IE 6)&(lte IE 8)]>
            <script type="text/javascript" src="catalog/view/theme/precise/js/selectivizr-min.js"></script>
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="catalog/view/theme/precise/css/jquery-ui-1.10.3.custom.css" />
        <script src="catalog/view/theme/precise/js/script.js"></script>


        <?php if ($this->config->get('itembridge_enabled_setting') == 1) { ?>
        <script type="text/javascript">

            $(document).ready(function(){
                $(".minicolors").minicolors({
                    defaultValue: "#fdf651",
                    change: function(hex){
                        $.cookie("color", "#222222");
                        $.cookie("cart_button", "#222222");
                        $.cookie("wishlist", "url('catalog/view/theme/precise/img/black-wishlist-icon.png') no-repeat left 50%");
                        $.cookie("compare", "url('catalog/view/theme/precise/img/black-compare-icon.png') no-repeat left 50%");
                        $.cookie("search_button", "rgba(0, 0, 0, .7)");
                        $.cookie("border-color", "rgba(0, 0, 0, .3)");
                        $.cookie("link-color", hex);
                        changeColor(hex);
                    }
                });

                $("#options-panel .button").click(function(){
                    if ($("#options-panel").hasClass("open")) {
                        $("#options-panel").animate({left: -360}, 300, function(){
                            $(this).removeClass("open");
                        });
                    } else {
                        $("#options-panel").animate({left: 0}, 300, function(){
                            $(this).addClass("open");
                        });
                    }
                });
               
                var style = $('<style type="text/css" id="theme_color" />').appendTo('head');

                $(".color-scheme").click(function(){
                    $.cookie("search_button", "rgba(0, 0, 0, .7)");
                    $.cookie("border-color", "rgba(0, 0, 0, .3)");
                    $.cookie("color", "#222222");
                    $.cookie("cart_button", "#222222");
                    $.cookie("wishlist", "url('catalog/view/theme/precise/img/black-wishlist-icon.png') no-repeat left 50%");
                    $.cookie("compare", "url('catalog/view/theme/precise/img/black-compare-icon.png') no-repeat left 50%");
                    $.cookie("button_color", $(this)[0]['attributes']['data-color']['value']);
                    $.cookie("link-color", $(this)[0]['attributes']['data-color']['value']);
                    changeColor($(this)[0]['attributes']['data-color']['value']);
                });

                $(".reset-theme-color").click(function(){
                    $.cookie("color", "#ffffff");
                    $.cookie("button_color", "#ad8020");
                    $.cookie("search_button", "#504f3b");
                    $.cookie("border-color", "#a29f43");
                    $.cookie("theme_color_hex", "#fdf651");
                    $.cookie("cart_button", "#77743a");
                    $.cookie("wishlist", "url('catalog/view/theme/precise/img/yellow-wishlist-icon.png') no-repeat left 50%");
                    $.cookie("compare", "url('catalog/view/theme/precise/img/yellow-compaire-icon.png') no-repeat left 50%");
                    $.cookie("link-color", "#ad8020");
                    $(".minicolors")[1]['value'] = $.cookie("theme_color_hex");
                    $(".minicolors-swatch span").css("background-color", "#fdf651");
                    changeColor($.cookie("theme_color_hex"));
                    return false;
                });

                if ($.cookie("theme_color_hex")){
                    $(".minicolors")[0]['value'] = $.cookie("theme_color_hex");
                    changeColor($.cookie("theme_color_hex"));
                }

                function changeColor(hex) {
                    $.cookie("theme_color_hex", hex, { expires: 7 });
                    var search_button = $.cookie("search_button");
                    var border_color = $.cookie("border-color");
                    var color = $.cookie("color");
                    var button_color = $.cookie("button_color");
                    var cart_button = $.cookie("cart_button");
                    var wishlist = $.cookie("wishlist");
                    var compare = $.cookie("compare");
                    var link_color = $.cookie("link-color");
                    var rgba = parseInt(hex.substring(1), 16);
                    var r = (rgba & 0xff0000) >> 16;
                    var g = (rgba & 0x00ff00) >> 8;
                    var b = rgba & 0x0000ff;
                    style.html(
                        '.main-menu .navbar, #options-panel .button, .product-grid .product-caption .inner, \n\
                        .header-two-next:hover, .header-two-box-next:hover ~ .header-two-next, \n\
                        .header-two-prev:hover, .header-two-box-prev:hover ~ .header-two-prev, .carousel-pager.one a:hover, \n\
                        .carousel-next:hover, .carousel-prev:hover, .product-grid .product-caption .price, \n\
                        .header-two-box .header-two-pager a.selected, .package .label, \n\
                        .services .small .icon, .carousel-grid.brands.services li .icon, .portfolio .image .hover, \n\
                        .container.newsletter-bottom-block .image, .baner-new-next:hover, .baner-new-prev:hover, #baner-new-pager > a.selected, \n\
                        #sidebar-baners-pager > a.selected, .header-third-box .header-third-pager a.selected, \n\
                        .header-third-prev:hover, .header-third-next:hover, \n\
                        .header-third-box-next:hover ~ .header-third-next, .header-third-box-prev:hover ~ .header-third-prev, \n\
                        #header-third .nested-header-box .slider-header .right a:hover, \n\
                        .btn-ads, \n\
                        .newsletter .info .item .label, .header-block.plan .image-label.mac, .price-package .label, \n\
                        .toolbar .view-mode a.list:hover, .toolbar .view-mode a.grid:hover, .pagination ul li a:hover, \n\
                        .about-us-page .about-us-page-slider .carousel-prev:hover, .about-us-page .about-us-page-slider .carousel-next:hover, \n\
                        .progress .bar, .team-list .item .static-hover .description, .portfolio .portfolio-one .carousel-prev:hover, .portfolio .portfolio-one .carousel-next:hover, \n\
                        .portfolio .item .carousel-pager a.selected, .portfolio .item .carousel-grid .carousel-prev:hover, .portfolio .item .carousel-grid .carousel-next:hover, \n\
                        .portfolio .page-title .left:hover, .portfolio .page-title .right:hover, .portfolio .page-title .remove:hover, \n\
                        .gallery-carousel .carousel-next:hover, .gallery-carousel .carousel-prev:hover, .services .large .icon, \n\
                        #options-panel .layout a.active, #options-panel .layout a:hover, .mpc_ls .mpc_ls_ui .mpc_ls_timer, \n\
                        .read_more, .mpc_ls_slides_thumbs.style01 .mpc_ls_thumb.active .mpc_ls_thumb_inside, \n\
                        .mpc_ls_thumb:hover.active .mpc_ls_thumb_inside, .mpc_ls_image_thumb, .btn-ads span{background-color: ' + hex + '!important;}' + 

                        '.navbar .nav .dropdown.open .dropdown-section a:hover, .county-days, .county-hours, .county-minutes, .county-seconds, \n\
                        .navbar .nav li.dropdown.open .dropdown-menu.one a:hover{color: ' + hex + ';}' + 

                        '.product-grid .product-caption .inner, .product-grid .product-caption .price, \n\
                        .portfolio .image .hover, .team-list .item .static-hover .description, \n\
                        .mpc_ls_slides_thumbs.style01 .mpc_ls_thumb.active .mpc_ls_thumb_inside, \n\
                        .mpc_ls_slides_thumbs.style01 .mpc_ls_thumb:hover.active .mpc_ls_thumb_inside{background-color: rgba(' + r + ', ' + g + ', ' + b + ', 0.9)!important;}' + 

                        '#header-third .nested-header-box .slider-header .right a.selected:hover, \n\
                        .carousel-pager.one a.selected:hover{background-color: #444444!important;}' + 
                        '.search-button{background-color: ' + search_button + '}' + 
                        '.main-menu .navbar .nav, #header-two .title .slider-button, #header-one .title .slider-button, \n\
                        #header-third .title .slider-button, .header-four-box .image-box .main-img .title .slider-button, \n\
                        .header-seven-box .image-box .main-img .title .slider-button, .btn-ads span, \n\
                        .main-menu .navbar .btn-navbar, .read_more span{border-color: ' + border_color + '!important;}' + 
                        'a, a:hover, a:focus{color: ' + link_color + '}' + 

                        '.navbar .nav li.dropdown.open a.btn-info, .btn-info{background-color: ' + button_color + '; color: ' + color + ';}' + 
                        '.navbar .nav li.dropdown.open a.btn-info:hover, .btn-info:hover{border-color: ' + button_color + '}' + 
                        '.product-grid .product-caption .cart-button .compaire-link, .product-grid .product-caption .cart-button .wishlist-link{color: ' + cart_button + '}' + 
                        '.product-grid .product-caption .cart-button .wishlist-link{background: ' + wishlist + ';}' + 
                        '.product-grid .product-caption .cart-button .compaire-link{background: ' + compare + ';}');
                }


                if ($.cookie("layout") == "wide") {
                    changeLayout($.cookie("layout"));
                } else if ($.cookie("layout") == "boxed") {
                    changeLayout($.cookie("layout"));
                } else if ($.cookie("layout") == "standart") {
                    changeLayout($.cookie("layout"));
                }

                function changeLayout(layout){
                    item_visible = 0;
                    if (layout == "wide") {
                     $("body").removeClass("boxed");
                        $(".options a").removeClass("active");
                        $(".options .wide").addClass("active");
                        $(".navbar-static-top, .second-top-box, .header-one-box, .header-two-box, .header-third-box, .header-four-box, .header-five-box, .header-six-box, .header-seven-box, .header-eight-box, .header-nine-box, .site-container").removeClass("boxed");
                        $(".site-container").addClass("wide");
                        $('#header-two, #header-third').trigger("configuration", ["items.visible", item_visible, true]);
                    } else if (layout == "standart") {
                     $("body").removeClass("boxed");
                        $(".options a").removeClass("active");
                        $(".options .standart").addClass("active");
                        $(".navbar-static-top, .second-top-box, .header-one-box, .header-two-box, .header-third-box, .header-four-box, .header-five-box, .header-six-box, .header-seven-box, .header-eight-box, .header-nine-box, .site-container").removeClass("boxed wide");
                        $('#header-two, #header-third').trigger("configuration", ["items.visible", item_visible, true]);
                    } else if (layout == "boxed") {
                     $("body").addClass("boxed");
                        $(".options a").removeClass("active");
                        $(".options .boxed").addClass("active");
                        $(".navbar-static-top, .second-top-box, .header-one-box, .header-two-box, .header-third-box, .header-four-box, .header-five-box, .header-six-box, .header-seven-box, .header-eight-box, .header-nine-box, .site-container").removeClass("boxed wide");
                        $(".navbar-static-top, .second-top-box, .header-one-box, .header-two-box, .header-third-box, .header-four-box, .header-five-box, .header-six-box, .header-seven-box, .header-eight-box, .header-nine-box, .site-container").addClass("boxed");
                        $('#header-two, #header-third').trigger("configuration", ["items.visible", item_visible, true]);
                    }
                }

                $("a.wide").click(function(){
                    $.cookie("layout", "wide");
                    changeLayout("wide");
                    $(".wide .header-four-box").css("background", "url('" + $.cookie("pattern") + "')");
                    return false;
                });

                $("a.standart").click(function(){
                    $.cookie("layout", "standart");
                    changeLayout("standart");
                    return false;
                });

                $("a.boxed").click(function(){
                    $.cookie("layout", "boxed");
                    changeLayout("boxed");
                    return false;
                });

                if ($.cookie("pattern")) {
                    $("body").css("background", "url('" + $.cookie("pattern") + "')");
                    $(".wide .header-four-box").css("background", "url('" + $.cookie("pattern") + "')");
                }

                $(".pattern-scheme").click(function(){
                    $.cookie("pattern", $(this)[0]["attributes"]["data-pattern"]["value"]);
                    $("body").css("background", "url('" + $.cookie("pattern") + "')");
                    $(".wide .header-four-box").css("background", "url('" + $.cookie("pattern") + "')");
                });

                $(".images-bg").click(function(){
                    $.cookie("pattern", $(this)[0]["attributes"]["data-image"]["value"]);
                    $("body").css("background", $.cookie("pattern"));
                    //$(".wide .header-four-box").css("background", "url('img/bg.png')");
                });

                if ($.cookie("pattern")) {
                    $("body").css("background", $.cookie("pattern"));
                }

                $(".reset-theme-pattern").click(function(){
                    $.cookie("pattern", "catalog/view/theme/precise/img/bg.png");
                    $("body").css("background", "url('" + $.cookie("pattern") + "')");
                    $(".wide .header-four-box").css("background", "url('" + $.cookie("pattern") + "')");
                    return false;
                });
            });
        </script>
        <?php } ?>
        <?php
            // color change
            $hex_defaut = $this->config->get('itembridge_main_color_default');
            $hex = trim($this->config->get('itembridge_main_color'));
            $pattern = $this->config->get('itembridge_main_pattern');
            $layout = $this->config->get('itembridge_main_layout');
            if ($hex_defaut == $hex) {
                $search_button = '#504f3b';
                $border_color = '#a29f43';
                $link_color = '#ad8020';
                $color = '#ffffff';
                $button_color = '#ad8020';
                $wishlist_color = 'url("catalog/view/theme/precise/img/yellow-wishlist-icon.png") no-repeat left 50%';
                $compare_color = 'url("catalog/view/theme/precise/img/yellow-compaire-icon.png") no-repeat left 50%';
                $cart_button = '#77743a';
            } else {
                $search_button = 'rgba(0, 0, 0, .7)';
                $border_color = 'rgba(0, 0, 0, .3)';
                $link_color = $hex;
                $color = '#222222';
                $button_color = $hex;
                $wishlist_color = 'url("catalog/view/theme/precise/img/black-wishlist-icon.png") no-repeat left 50%';
                $compare_color = 'url("catalog/view/theme/precise/img/black-compare-icon.png") no-repeat left 50%';
                $cart_button = '#222222';
            }
            $r = hexdec($hex[1].$hex[2]);
            $g = hexdec($hex[3].$hex[4]);
            $b = hexdec($hex[5].$hex[6]);
            echo ('<style type="text/css" id="theme_color" />
                .main-menu .navbar,
                #options-panel .button,
                .product-grid .product-caption .inner,
                .header-two-next:hover,
                .header-two-box-next:hover ~ .header-two-next,
                .header-two-prev:hover,
                .header-two-box-prev:hover ~ .header-two-prev,
                .carousel-pager.one a:hover,
                .carousel-next:hover,
                .carousel-prev:hover,
                .product-grid .product-caption .price,
                .header-two-box .header-two-pager a.selected,
                .package .label,
                .services .small .icon,
                .carousel-grid.brands.services li .icon,
                .portfolio .image .hover,
                .container.newsletter-bottom-block .image,
                .baner-new-next:hover,
                .baner-new-prev:hover,
                #baner-new-pager > a.selected,
                #sidebar-baners-pager > a.selected,
                .header-third-box .header-third-pager a.selected,
                .header-third-prev:hover,
                .header-third-next:hover,
                .header-third-box-next:hover ~ .header-third-next,
                .header-third-box-prev:hover ~ .header-third-prev,
                #header-third .nested-header-box .slider-header .right a:hover,
                .btn-ads,
                .newsletter .info .item .label,
                .header-block.plan .image-label.mac,
                .price-package .label,
                .toolbar .view-mode a.list:hover,
                .toolbar .view-mode a.grid:hover,
                .pagination ul li a:hover,
                .about-us-page .about-us-page-slider .carousel-prev:hover,
                .about-us-page .about-us-page-slider .carousel-next:hover,
                .progress .bar, .team-list .item .static-hover .description,
                .portfolio .portfolio-one .carousel-prev:hover,
                .portfolio .portfolio-one .carousel-next:hover,
                .portfolio .item .carousel-pager a.selected,
                .portfolio .item .carousel-grid .carousel-prev:hover,
                .portfolio .item .carousel-grid .carousel-next:hover,
                .portfolio .page-title .left:hover,
                .portfolio .page-title .right:hover,
                .portfolio .page-title .remove:hover,
                .gallery-carousel .carousel-next:hover,
                .gallery-carousel .carousel-prev:hover,
                .services .large .icon,
                #options-panel .layout a.active,
                #options-panel .layout a:hover,
                .mpc_ls .mpc_ls_ui .mpc_ls_timer,
                .read_more,
                .mpc_ls_slides_thumbs.style01 .mpc_ls_thumb.active .mpc_ls_thumb_inside,
                .mpc_ls_thumb:hover.active .mpc_ls_thumb_inside,
                .mpc_ls_image_thumb,
                .btn-ads span{background-color: '.$hex.'!important;}

                .navbar .nav .dropdown.open .dropdown-section a:hover,
                .county-days,
                .county-hours,
                .county-minutes,
                .county-seconds,
                .navbar .nav li.dropdown.open .dropdown-menu.one a:hover{color: '.$hex.';} 

                .product-grid .product-caption .inner,
                .product-grid .product-caption .price,
                .portfolio .image .hover,
                .team-list .item .static-hover .description,
                .mpc_ls_slides_thumbs.style01 .mpc_ls_thumb.active .mpc_ls_thumb_inside,
                .mpc_ls_slides_thumbs.style01 .mpc_ls_thumb:hover.active .mpc_ls_thumb_inside{background-color: rgba('.$r.', '.$g.', '.$b.', 0.9)!important;} 

                #header-third .nested-header-box .slider-header .right a.selected:hover,
                .carousel-pager.one a.selected:hover{background-color: #444444!important;}

                .search-button{background-color: '.$search_button.'}

                .main-menu .navbar .nav,
                #header-two .title .slider-button,
                #header-one .title .slider-button,
                #header-third .title .slider-button,
                .header-four-box .image-box .main-img .title .slider-button,
                .header-seven-box .image-box .main-img .title .slider-button,
                .btn-ads span,
                .main-menu .navbar .btn-navbar,
                .read_more span{border-color: '.$border_color.'!important;}

                a, a:hover, a:focus{color: '.$link_color.'}

                .navbar .nav li.dropdown.open a.btn-info,
                .btn-info{background-color: '.$button_color.'; color: '.$color.';}

                .navbar .nav li.dropdown.open a.btn-info:hover,
                .btn-info:hover{border-color: '.$button_color.'}

                .product-grid .product-caption .cart-button .compaire-link,
                .product-grid .product-caption .cart-button .wishlist-link{color: '.$cart_button.'}

                .product-grid .product-caption .cart-button .wishlist-link{background: '.$wishlist_color.';}

                .product-grid .product-caption .cart-button .compaire-link{background: '.$compare_color.';}

                body {background: url('.$pattern.');}
                .wide .header-four-box {background: url('.$pattern.');}
            </style>');
        ?>
        <?php echo $google_analytics; ?>
    </head>
    <body <?php if ($layout=='Boxed') echo 'class="boxed"';?>>
        
        <?php if ($this->config->get('itembridge_enabled_setting') == 1) { ?>
            <div id="options-panel">
                <div class="options">
                    <div class="center layout">
                        <label>Layout</label><br><br>
                        <a href="#" class="standart active">standart</a>
                        <a href="#" class="boxed">boxed</a>
                        <a href="#" class="wide">wide</a>
                        <div class="clearfix"></div>
                        <hr>
                    </div>
                    <div class="left">
                        <label>Color</label>
                        <input class="minicolors" type="text" value="#fff84b" data-default-value="#fff84b"><br>
                        <br>
                        <div class="color-box">
                            <div class="color-scheme" style="background-color: #e1ff69;" data-color="#e1ff69"></div>
                            <div class="color-scheme" style="background-color: #93ff4b;" data-color="#93ff4b"></div>
                            <div class="color-scheme" style="background-color: #4bff5c;" data-color="#4bff5c"></div>
                            <div class="color-scheme" style="background-color: #4bffa8;" data-color="#4bffa8"></div>
                            <div class="color-scheme" style="background-color: #97feff;" data-color="#97feff"></div>
                            <div class="color-scheme" style="background-color: #4bffd7;" data-color="#4bffd7"></div>
                            <div class="color-scheme" style="background-color: #4bfff0;" data-color="#4bfff0"></div>
                            <div class="color-scheme" style="background-color: #4bdbff;" data-color="#4bdbff"></div>
                            <div class="color-scheme" style="background-color: #5eb5ff;" data-color="#5eb5ff"></div>
                            <div class="color-scheme" style="background-color: #a4b3ff;" data-color="#a4b3ff"></div>
                            <div class="color-scheme" style="background-color: #cd62ff;" data-color="#cd62ff"></div>
                            <div class="color-scheme" style="background-color: #ff67ab;" data-color="#ff67ab"></div>
                            <div class="color-scheme" style="background-color: #ff819f;" data-color="#ff819f"></div>
                            <div class="color-scheme" style="background-color: #ff97f6;" data-color="#ff97f6"></div>
                            <div class="color-scheme" style="background-color: #ffba69;" data-color="#ffba69"></div>
                            <div class="color-scheme" style="background-color: #ff865c;" data-color="#ff865c"></div>
                        </div>
                        <div class="clearfix"></div>
                        <a href="#" class="reset-theme-color">Default Color</a>
                        <div class="clearfix"></div>
                    </div>
                    <div class="right">
                        <label>Patterns</label>
                        <div class="clearfix"></div>
                        <div class="patterns-box" style="background: red;">
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/bgnoise_lg.png');" data-pattern="catalog/view/theme/precise/img/patterns/bgnoise_lg.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/black_linen_v2.png');" data-pattern="catalog/view/theme/precise/img/patterns/black_linen_v2.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/black_scales.png');" data-pattern="catalog/view/theme/precise/img/patterns/black_scales.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/carbon_fibre_v2.png');" data-pattern="catalog/view/theme/precise/img/patterns/carbon_fibre_v2.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/cardboard.png');" data-pattern="catalog/view/theme/precise/img/patterns/cardboard.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/circles.png');" data-pattern="catalog/view/theme/precise/img/patterns/circles.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/crissXcross.png');" data-pattern="catalog/view/theme/precise/img/patterns/crissXcross.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/crosses.png');" data-pattern="catalog/view/theme/precise/img/patterns/crosses.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/cubes.png');" data-pattern="catalog/view/theme/precise/img/patterns/cubes.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/dark_brick_wall.png');" data-pattern="catalog/view/theme/precise/img/patterns/dark_brick_wall.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/dark_circles.png');" data-pattern="catalog/view/theme/precise/img/patterns/dark_circles.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/dark_leather.png');" data-pattern="catalog/view/theme/precise/img/patterns/dark_leather.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/dark_mosaic.png');" data-pattern="catalog/view/theme/precise/img/patterns/dark_mosaic.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/diagonal-noise.png');" data-pattern="catalog/view/theme/precise/img/patterns/diagonal-noise.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/diamonds.png');" data-pattern="catalog/view/theme/precise/img/patterns/diamonds.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/elastoplast.png');" data-pattern="catalog/view/theme/precise/img/patterns/elastoplast.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/elegant_grid.png');" data-pattern="catalog/view/theme/precise/img/patterns/elegant_grid.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/fancy_deboss.png');" data-pattern="catalog/view/theme/precise/img/patterns/fancy_deboss.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/felt.png');" data-pattern="catalog/view/theme/precise/img/patterns/felt.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/flowers.png');" data-pattern="catalog/view/theme/precise/img/patterns/flowers.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/gold_scale.png');" data-pattern="catalog/view/theme/precise/img/patterns/gold_scale.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/green_dust_scratch.png');" data-pattern="catalog/view/theme/precise/img/patterns/green_dust_scratch.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/inflicted.png');" data-pattern="catalog/view/theme/precise/img/patterns/inflicted.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/light_alu.png');" data-pattern="catalog/view/theme/precise/img/patterns/light_alu.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/light_checkered_tiles.png');" data-pattern="catalog/view/theme/precise/img/patterns/light_checkered_tiles.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/littleknobs.png');" data-pattern="catalog/view/theme/precise/img/patterns/littleknobs.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/mirrored_squares.png');" data-pattern="catalog/view/theme/precise/img/patterns/mirrored_squares.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/noise_pattern_with_crosslines.png');" data-pattern="catalog/view/theme/precise/img/patterns/noise_pattern_with_crosslines.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/paven.png');" data-pattern="catalog/view/theme/precise/img/patterns/paven.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/polaroid.png');" data-pattern="catalog/view/theme/precise/img/patterns/polaroid.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/pool_table.png');" data-pattern="catalog/view/theme/precise/img/patterns/pool_table.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/project_papper.png');" data-pattern="catalog/view/theme/precise/img/patterns/project_papper.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/real_cf.png');" data-pattern="catalog/view/theme/precise/img/patterns/real_cf.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/rip_jobs.png');" data-pattern="catalog/view/theme/precise/img/patterns/rip_jobs.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/robots.png');" data-pattern="catalog/view/theme/precise/img/patterns/robots.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/roughcloth.png');" data-pattern="catalog/view/theme/precise/img/patterns/roughcloth.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/rubber_grip.png');" data-pattern="catalog/view/theme/precise/img/patterns/rubber_grip.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/silver_scales.png');" data-pattern="catalog/view/theme/precise/img/patterns/silver_scales.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/small_tiles.png');" data-pattern="catalog/view/theme/precise/img/patterns/small_tiles.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/soft_circle_scales.png');" data-pattern="catalog/view/theme/precise/img/patterns/soft_circle_scales.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/square_bg.png');" data-pattern="catalog/view/theme/precise/img/patterns/square_bg.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/squares.png');" data-pattern="catalog/view/theme/precise/img/patterns/squares.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/stucco.png');" data-pattern="catalog/view/theme/precise/img/patterns/stucco.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/triangles.png');" data-pattern="catalog/view/theme/precise/img/patterns/triangles.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/type.png');" data-pattern="catalog/view/theme/precise/img/patterns/type.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/washi.png');" data-pattern="catalog/view/theme/precise/img/patterns/washi.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/white_texture.png');" data-pattern="catalog/view/theme/precise/img/patterns/white_texture.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/whitey.png');" data-pattern="catalog/view/theme/precise/img/patterns/whitey.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/woven.png');" data-pattern="catalog/view/theme/precise/img/patterns/woven.png"></div>
                            <div class="pattern-scheme" style="background: url('catalog/view/theme/precise/img/patterns/xv.png');" data-pattern="catalog/view/theme/precise/img/patterns/xv.png"></div>
                        </div>
                        <div class="clearfix"></div>
                        <a href="#" class="reset-theme-pattern">Default Pattern</a>
                    </div>
                </div>
                <div class="button">&nbsp;</div>
            </div>
        <?php } ?>
        
        <div class="navbar-static-top <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?> navbar">
            <div class="container-box top-box">
                <?php if ($logo) { ?>
                    <a href="<?php echo $home; ?>" class="brand"><img src="<?php echo $logo; ?>" alt="<?php echo $name; ?>"></a>
                <?php } ?>
                <a class="btn btn-navbar collapsed" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                    <div class="icon-container">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </div>
                    <div class="title-menu">Меню</div>
                </a>
                <?php echo str_replace('&nbsp;', '', get_ibi18n_conf('header_menu')) ?>
                <ul class="nav pull-right nav-top-right">
                    <?php //echo $language; ?>
                    <?php echo $currency; ?>
                    <?php echo $cart; ?>
                </ul>
            </div>
        </div>
        <div class="second-top-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>">
            <div class="container-box">
                <span class="welcome-msg pull-left">
                    <?php if (!$logged) { ?>
                        <?php echo $text_welcome; ?>
                    <?php } else { ?>
                        <?php echo $text_logged; ?>
                    <?php } ?>
                </span>
                <ul class="pull-right">
                    <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                    <li><a href="<?php echo $wishlist; ?>" id="wishlist-total"><?php echo $text_wishlist; ?></li>
                    <li><a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></li>
                </ul>
            </div>
        </div>
        <div class="container-box <?php echo $search_bar; ?>" <?php echo $search_bar_none; ?>>
            <div class="container main-menu <?php echo $search_bar_3; ?>">
                <div <?php echo $search_bar_dark; ?> class="navbar">
                    <a class="btn btn-navbar collapsed" data-toggle="collapse" data-target=".navbar-main">
                        <div class="icon-container">
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </div>
                        <div class="title-menu">Рубрики</div>
                    </a>
                    <?php if ($categories) { ?>
                        <div class="nav-collapse navbar-main collapse">
                            <ul class="nav">
                                <?php foreach ($categories as $category) { ?>
                                    <?php if ($category['children']) { ?>
                                        <li class="dropdown"><a href="<?php echo $category['href']; ?>" data-toggle="dropdown"><?php echo $category['name']; ?></a>
                                            <ul class="dropdown-menu one">
                                                <?php for ($i = 0; $i < count($category['children']); $i++) { ?>
                                                    <?php if (isset($category['children'][$i])) { ?>
                                                        <li><a href="<?php echo $category['children'][$i]['href']; ?>"><?php echo $category['children'][$i]['name']; ?></a></li>
                                                    <?php } ?>
                                                <?php } ?>
                                            </ul>
                                        </li>
                                    <?php } else { ?>
                                        <li><a href="<?php echo $category['href']; ?>" data-toggle="dropdown"><?php echo $category['name']; ?></a></li>
                                    <?php } ?>
                                <?php } ?>
                            </ul>
                        </div>
                    <?php } ?>
                    <form id="searchform" class="navbar-search pull-right">
                        <input type="text" value="1" name="searchhide" style="display: none;" disabled />
                        <input class="search-query" type="search" name="search" value="<?php echo $search; ?>">
                        <button type="button" class="search-button">&nbsp;</button>
                    </form>
                </div>
            </div>
        </div>