<?php

class ControllerModuleItemBridge extends Controller
{
	protected $error;

	public function index()
	{
		$this->load->language('module/itembridge');

		$this->load->model('setting/setting');

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			$this->model_setting_setting->editSetting('itembridge', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['error_warning'] = isset($this->error) ? $this->error : '';
		$this->document->setTitle($this->language->get('heading_title'));
		$this->assignTextStringsTo($this->data, array(
			'heading_title',
			'button_save',
			'button_cancel',
			'text_default',

			'home_banners',
			'home_banners_2',
			'home_about',
			'home_latest_news',
			'home_social',

			'footer_payments',
			'footer_social',
			
			'contact_map',

			'newsletter_title',
			'newsletter_description',

			'header_menu',

			'text_enabled_setting',
			'enabled_setting',
						
			'main_color',
			'main_pattern',
			'main_color_default',
			'main_pattern_default',
			'main_layout',

			'text_standart',
			'text_boxed',
			'text_wide',

			'footer_style',
			'text_footer_style_normal',
			'text_footer_style_dark',

			'grid_style',
			'text_grid_style_normal',
			'text_grid_style_two',
			'grid_style_normal',
			'grid_style_two',

			'header_style',
			'header_style_1',
			'header_style_2',
			'header_style_3',
			'header_style_4',
			'header_style_5',
			'header_style_6',
			'header_style_7',
			'header_style_8',
			'header_style_9',
			'text_header_style_1',
			'text_header_style_2',
			'text_header_style_3',
			'text_header_style_4',
			'text_header_style_5',
			'text_header_style_6',
			'text_header_style_7',
			'text_header_style_8',
			'text_header_style_9',

			'headerstyle_1',
			'headerstyle_2',
			
		));

		$this->data['breadcrumbs'] = $this->getBaseBreadcrumbs();
		$this->data['action'] = $this->url->link('module/itembridge', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

		$this->assignConfigTo($this->data, array(

			'itembridge_enabled_setting'		=> '1',

			'itembridge_main_color_default'		=>	'#fdf651',
			'itembridge_main_color'				=>	'#fdf651',
			'itembridge_main_layout'			=>	'Standart',
			'itembridge_main_layout_default'	=>	'Standart',
			'itembridge_main_pattern_default'	=>	'catalog/view/theme/precise/img/bg.png',
			'itembridge_main_pattern'			=>	'catalog/view/theme/precise/img/bg.png',
			'itembridge_main_pattern_array'		=> array(
				'catalog/view/theme/precise/img/patterns/bgnoise_lg.png',
				'catalog/view/theme/precise/img/patterns/black_linen_v2.png',
				'catalog/view/theme/precise/img/patterns/black_scales.png',
				'catalog/view/theme/precise/img/patterns/carbon_fibre_v2.png',
				'catalog/view/theme/precise/img/patterns/cardboard.png',
				'catalog/view/theme/precise/img/patterns/circles.png',
				'catalog/view/theme/precise/img/patterns/crissXcross.png',
				'catalog/view/theme/precise/img/patterns/crosses.png',
				'catalog/view/theme/precise/img/patterns/cubes.png',
				'catalog/view/theme/precise/img/patterns/dark_brick_wall.png',
				'catalog/view/theme/precise/img/patterns/dark_circles.png',
				'catalog/view/theme/precise/img/patterns/dark_leather.png',
				'catalog/view/theme/precise/img/patterns/dark_mosaic.png',
				'catalog/view/theme/precise/img/patterns/diagonal-noise.png',
				'catalog/view/theme/precise/img/patterns/diamonds.png',
				'catalog/view/theme/precise/img/patterns/elastoplast.png',
				'catalog/view/theme/precise/img/patterns/elegant_grid.png',
				'catalog/view/theme/precise/img/patterns/fancy_deboss.png',
				'catalog/view/theme/precise/img/patterns/felt.png',
				'catalog/view/theme/precise/img/patterns/flowers.png',
				'catalog/view/theme/precise/img/patterns/gold_scale.png',
				'catalog/view/theme/precise/img/patterns/green_dust_scratch.png',
				'catalog/view/theme/precise/img/patterns/inflicted.png',
				'catalog/view/theme/precise/img/patterns/light_alu.png',
				'catalog/view/theme/precise/img/patterns/light_checkered_tiles.png',
				'catalog/view/theme/precise/img/patterns/littleknobs.png',
				'catalog/view/theme/precise/img/patterns/mirrored_squares.png',
				'catalog/view/theme/precise/img/patterns/noise_pattern_with_crosslines.png',
				'catalog/view/theme/precise/img/patterns/paven.png',
				'catalog/view/theme/precise/img/patterns/polaroid.png',
				'catalog/view/theme/precise/img/patterns/pool_table.png',
				'catalog/view/theme/precise/img/patterns/project_papper.png',
				'catalog/view/theme/precise/img/patterns/real_cf.png',
				'catalog/view/theme/precise/img/patterns/rip_jobs.png',
				'catalog/view/theme/precise/img/patterns/robots.png',
				'catalog/view/theme/precise/img/patterns/roughcloth.png',
				'catalog/view/theme/precise/img/patterns/rubber_grip.png',
				'catalog/view/theme/precise/img/patterns/silver_scales.png',
				'catalog/view/theme/precise/img/patterns/small_tiles.png',
				'catalog/view/theme/precise/img/patterns/soft_circle_scales.png',
				'catalog/view/theme/precise/img/patterns/square_bg.png',
				'catalog/view/theme/precise/img/patterns/squares.png',
				'catalog/view/theme/precise/img/patterns/stucco.png',
				'catalog/view/theme/precise/img/patterns/triangles.png',
				'catalog/view/theme/precise/img/patterns/type.png',
				'catalog/view/theme/precise/img/patterns/washi.png',
				'catalog/view/theme/precise/img/patterns/white_texture.png',
				'catalog/view/theme/precise/img/patterns/whitey.png',
				'catalog/view/theme/precise/img/patterns/woven.png',
				'catalog/view/theme/precise/img/patterns/xv.png'
			),
			'itembridge_footer_style'			=>	'Normal',
			'itembridge_footer_style_default'	=>	'Normal',
			'itembridge_grid_style'				=>	'variant_1',
			'itembridge_grid_style_default'		=>	'variant_1',

			'itembridge_header_style_default'		=>	'2',
			'itembridge_header_style'				=>	'2',

		));

		$this->assignI18nConfigTo($this->data, $this->data['languages'], array(
			'itembridge_home_banners' => '<div class="row home-banner"><a class="span4 banner" href="#"><img alt="" src="catalog/view/theme/precise/content/sample-benner-1.png" /></a> <a class="span4 banner" href="#"><img alt="" src="catalog/view/theme/precise/content/sample-benner-2.png" /></a> <a class="span4 banner" href="#"><img alt="" src="catalog/view/theme/precise/content/sample-benner-3.png" /></a></div>
',
			
			'itembridge_home_banners_2' => '<a href="#" class="banner large-banner span12"><img src="catalog/view/theme/precise/content/banner-full-width.png" alt="Full-width banner"></a>',
			
	
			'itembridge_home_social' => '<div class="title">Follow Us</div>
                        <iframe src="//www.facebook.com/plugins/likebox.php?href=http%3A%2F%2Fwww.facebook.com%2FItemBridge&amp;width=292&amp;height=258&amp;show_faces=true&amp;colorscheme=light&amp;stream=false&amp;border_color=bbbbbb&amp;header=false" scrolling="no" frameborder="0" allowTransparency="true"></iframe>',


			'itembridge_home_about' => '<div class="title">About Us</div>
<div class="page-description">In congue nisl varius quis aliqut lentesque a tellus quam variu. VelL varius lobortis gravida.</div>
<p>Lorem ipsum, libero et luctus molestie, turpis mi sagittis nisl, a scelerisque leo nulla et lectus pendis dictum posuere elit, in congue nisl varius lentesque a tellus eget quam varius aliquet.</p>
<p>Pellentesque tristique, libero et luctus molestie, a scelerisque leo nulla et lectus pendisse dictum posuere elit. It is a long established fact that a reade will be distracted by the readable content of a page when looking at its layout.</p>
<p><a class="btn btn-link btn-mini" href="#">More</a></p>
',


			'itembridge_home_latest_news' => '<div class="title">News</div>

<ul>
	<li>
	<div class="img"><a href="#"><img alt="" src="catalog/view/theme/precise/content/news-img-4.png" /></a></div>

	<div class="content"><time datetime="2013-10-03">3 january 2013</time>

	<p><a href="#">Fermentum parturient lacus tristique habit nullam morbi mus dictum.</a></p>
	</div>
	</li>
	<li>
	<div class="img"><a href="#"><img alt="" src="catalog/view/theme/precise/content/news-img-3.png" /></a></div>

	<div class="content"><time datetime="2013-10-02">2 january 2013</time>

	<p><a href="#">Cras ac hendrerit dui. Duis lacus ligula, luctus ac tristique eget, posuere id erat.</a></p>
	</div>
	</li>
	<li>
	<div class="img"><a href="#"><img alt="" src="catalog/view/theme/precise/content/news-img-2.png" /></a></div>

	<div class="content"><time datetime="2013-10-01">1 january 2013</time>

	<p><a href="#">Many desktop publishing packages and web page editors now use.</a></p>
	</div>
	</li>
	<li>
	<div class="img"><a href="#"><img alt="" src="catalog/view/theme/precise/content/news-img-1.png" /></a></div>

	<div class="content"><time datetime="2013-10-01">1 january 2013</time>

	<p><a href="#">Lorem ipsum, libero sagittis nisl, a scelerisque leo nulla et lectus.</a></p>
	</div>
	</li>
</ul>
<a class="btn btn-link btn-mini" href="#">More</a>',
			'itembridge_footer_payments' => '<img alt="Visa logo" src="catalog/view/theme/precise/img/visa.png" /> <img alt="PayPal logo" src="catalog/view/theme/precise/img/paypal.png" /> <img alt="MasterCard logo" src="catalog/view/theme/precise/img/mastercard.png" /> <img alt="WesternUnion logo" src="catalog/view/theme/precise/img/westernunion.png" />',
			'itembridge_footer_social' => '<h4>Follow us on social networks</h4><span class="button"><a class="sbtnf sbtnf-circle sbtnf-icon-white sbtnf-icon-bg-black icon-facebook" href="#">facebook</a> <a class="sbtnf sbtnf-circle sbtnf-icon-white sbtnf-icon-bg-black icon-twitter" href="#">twitter</a> <a class="sbtnf sbtnf-circle sbtnf-icon-white sbtnf-icon-bg-black icon-gplus" href="#">gplus</a> <a class="sbtnf sbtnf-circle sbtnf-icon-white sbtnf-icon-bg-black icon-linkedin" href="#">linkedin</a> </span>',
			'itembridge_contact_map' => '<iframe width="100%" height="205" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com.ua/?ie=UTF8&amp;t=m&amp;ll=51.486514,-0.123596&amp;spn=0.598604,2.746582&amp;z=9&amp;output=embed"></iframe>',
			'itembridge_newsletter_title' => 'Newsletter Sign Up',
			'itembridge_newsletter_description' => 'Proin rutrum mattis libero, nec imperdie ipsum vel justo facilisis sed.',
			'itembridge_header_menu' => '<div class="nav-collapse navbar-responsive-collapse collapse">
	<ul class="nav top-main-navigation">
		<li><a href="/">Home</a></li>
		<li><a href="index.php?route=information/information&information_id=4">About Us</a></li>
		<li><a href="index.php?route=product/special">Specials</a></li>
		<li><a href="index.php?route=information/contact">Contact Us</a></li>
	</ul>
</div>',
			'itembridge_headerstyle_1' => '<div class="header-one-box">
                <ul id="header-one">
                    <li>
                        <img src="catalog/view/theme/precise/content/slider-img-1.png" alt="">
                        <div class="slider-border"><div class="border"></div></div>
                        <div class="title">
                            <span>PRECISE</span>
                            <h6>MULTIPURPOSE RESPONSIVE TEMPLATE</h6>
                            <div class="slider-button-box">
                                <div class="btn-ads-container">
                                    <a href="http://themeforest.net/item/precise-multipurpose-responsive-template/4704032?sso?WT.ac=portfolio_item&WT.seg_1=portfolio_item&WT.z_author=InfoStyle" class="btn-ads">
                                        <span class="flip-container">
                                            <span class="back">Only from $17</span>
                                            <span class="front">Buy Now</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>',
            'itembridge_headerstyle_2' => '',
            'itembridge_headerstyle_3' => '',
            'itembridge_headerstyle_4' => '<div class="header-four-box">
                <div class="image-box">
                    <div class="main-img">
                        <img src="catalog/view/theme/precise/content/header-img-1.png" alt="">
                        <div class="title">
                            <span>PRECISE</span>
                            <h3>MULTIPURPOSE RESPONSIVE TEMPLATE</h3>
                            <div class="clearfix"></div>
                            <h6>REALLY POWERFUL!</h6>
                            <div class="clearfix"></div>
                            <div class="slider-button-box">
                                <div class="btn-ads-container">
                                    <a href="http://themeforest.net/item/precise-multipurpose-responsive-template/4704032?sso?WT.ac=portfolio_item&WT.seg_1=portfolio_item&WT.z_author=InfoStyle" class="btn-ads">
                                        <span class="flip-container">
                                            <span class="back">Only from $17</span>
                                            <span class="front">Buy Now</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="sub-img">
                        <img src="catalog/view/theme/precise/content/header-img-2.png" alt="">
                    </div>
                    <div class="sub-img">
                        <img src="catalog/view/theme/precise/content/header-img-3.png" alt="">
                    </div>
                </div>
            </div>',
            'itembridge_headerstyle_5' => '<div class="header-five-box"></div>',
            'itembridge_headerstyle_6' => '<div class="header-six-box"></div>',
            'itembridge_headerstyle_7' => '<div class="header-seven-box">
                <div class="image-box">
                    <div class="main-img">
                        <img src="catalog/view/theme/precise/content/header-img-1.png" alt="">
                        <div class="title">
                            <span>PRECISE</span>
                            <h3>MULTIPURPOSE RESPONSIVE TEMPLATE</h3>
                            <div class="clearfix"></div>
                            <h6>REALLY POWERFUL!</h6>
                            <div class="clearfix"></div>
                            <div class="slider-button-box">
                                <div class="btn-ads-container">
                                    <a href="http://themeforest.net/item/precise-multipurpose-responsive-template/4704032?sso?WT.ac=portfolio_item&WT.seg_1=portfolio_item&WT.z_author=InfoStyle" class="btn-ads">
                                        <span class="flip-container">
                                            <span class="back">Only from $17</span>
                                            <span class="front">Buy Now</span>
                                        </span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="border-image"></div>
                    </div>
                    <div class="sub-img">
                        <a href="#">
                            <img src="catalog/view/theme/precise/content/header-img-2.png" alt="">
                            <div class="border-image"></div>
                        </a>
                    </div>
                    <div class="sub-img">
                        <a href="#">
                            <img src="catalog/view/theme/precise/content/header-img-3.png" alt="">
                            <div class="border-image"></div>
                        </a>
                    </div>
                </div>
            </div>',
            'itembridge_headerstyle_8' => '<div class="header-eight-box">
                <ul id="header-eight">
                    <li>
                        <img src="catalog/view/theme/precise/content/slider-img-1.png" alt="">
                        <div class="slider-border"></div>
                        <div class="title">
                            <h3>TYPOGRAPHY & BASIC STYLES</h3>
                            <div class="clearfix"></div>
                            <h6>Fundamental HTML elements styled and enhanced</h6>
                        </div>
                    </li>
                </ul>
            </div>',
            'itembridge_headerstyle_9' => '<div class="header-nine-box"></div>',

		));

		/*
		$this->load->model('design/layout');

		$this->data['layouts'] = $this->model_design_layout->getLayouts();
		*/


		$this->template = 'module/itembridge.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}


	protected function validate()
	{
		if (!$this->user->hasPermission('modify', 'module/itembridge'))
			$this->error = $this->language->get('error_permission');

		return !isset($this->error);
	}


	protected function getBaseBreadcrumbs()
	{
		return array(
			array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ''
			),
			array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			),
			array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/itembridge', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			)
		);
	}


	protected function assignTextStringsTo(&$var, array $text_strings)
	{
		foreach ($text_strings as $text)
			$var[$text] = $this->language->get($text);
	}


	protected function assignConfigTo(&$var, array $config_data)
	{
		foreach ($config_data as $conf => $default) {
			$var[$conf] = $this->getConfigByKey($conf, $default);
		}
	}


	protected function assignI18nConfigTo(&$var, array $languages, array $config_data)
	{
		foreach ($config_data as $conf => $default) {
			foreach ($languages as $language) {
				$k = $conf . '_' . $language['code'];
				$var[$k] = $this->getConfigByKey($k, $default);
			}
		}
	}


	protected function getConfigByKey($key, $default)
	{
		$config_value = $this->config->get($key);
		return isset($this->request->post[$key]) ? $this->request->post[$key] : (($config_value !== null) ? $config_value : (is_string($default) ? htmlspecialchars($default) : $default));
	}


}
