<?php
    
    $this->load->model('catalog/product');
    $this->load->model('tool/image');
    $Products_BestSeller = array();
    $setting_bestseller = $this->config->get('bestseller_module');
    $results = $this->model_catalog_product->getBestSellerProducts($setting_bestseller[0]['limit']);
    foreach ($results as $result) {
        if ($result['image']) {
            $image = $this->model_tool_image->resize($result['image'], 228, 305);
        } else {
            $image = false;
        }
        if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
            $price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
        } else {
            $price = false;
        }      
        if ((float)$result['special']) {
            $special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
        } else {
            $special = false;
        }   
        if ($this->config->get('config_review_status')) {
            $rating = $result['rating'];
        } else {
            $rating = false;
        } 
                        
        $Products_BestSeller[] = array(
            'product_id' => $result['product_id'],
            'thumb'      => $image,
            'name'       => $result['name'],
            'price'      => $price,
            'special'    => $special,
            'rating'     => $rating,
            'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
            'href'       => $this->url->link('product/product', 'product_id=' . $result['product_id']),
        );
    }


	$this->language->load('information/contact');
    $about = get_ibi18n_conf('home_about');
    $news = get_ibi18n_conf('home_latest_news');
    $social = get_ibi18n_conf('home_social');
    $this->load->model('tool/image');
    
    $id_language = '';
    foreach ($this->model_localisation_language->getLanguages() as $value) {
        if ($value['code'] == $this->session->data['language']) {
                $id_language = $value['language_id'];
           }
    }
?>
<?php echo $header; ?>

<?php if (($this->config->get('itembridge_header_style') != '2')&&($this->config->get('itembridge_header_style') != '3')) { ?>
<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
<?php } ?>

<?php if ($this->config->get('itembridge_header_style') == '1') { echo html_entity_decode($this->config->get('itembridge_headerstyle_1_'.$this->session->data['language'])); }; ?>
<?php if ($this->config->get('itembridge_header_style') == '3') { echo html_entity_decode($this->config->get('itembridge_headerstyle_3_'.$this->session->data['language'])); }; ?>
<?php if ($this->config->get('itembridge_header_style') == '4') { echo html_entity_decode($this->config->get('itembridge_headerstyle_4_'.$this->session->data['language'])); }; ?>
<?php if ($this->config->get('itembridge_header_style') == '5') { echo html_entity_decode($this->config->get('itembridge_headerstyle_5_'.$this->session->data['language'])); }; ?>
<?php if ($this->config->get('itembridge_header_style') == '6') { echo html_entity_decode($this->config->get('itembridge_headerstyle_6_'.$this->session->data['language'])); }; ?>
<?php if ($this->config->get('itembridge_header_style') == '7') { echo html_entity_decode($this->config->get('itembridge_headerstyle_7_'.$this->session->data['language'])); }; ?>
<?php if ($this->config->get('itembridge_header_style') == '8') { echo html_entity_decode($this->config->get('itembridge_headerstyle_8_'.$this->session->data['language'])); }; ?>
<?php if ($this->config->get('itembridge_header_style') == '9') { echo html_entity_decode($this->config->get('itembridge_headerstyle_9_'.$this->session->data['language'])); }; ?>

<?php if (($this->config->get('itembridge_header_style') != '2')&&($this->config->get('itembridge_header_style') != '3')) { ?>
</div>
<?php } ?>


<?php if ($this->config->get('itembridge_header_style') == '2') { ?>
    <?php if($this->config->get('sliderib_status')!=0) { ?>
        <div id="boxed" class="header-two-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>">
            <ul id="header-two">
                <?php
                    $sliders = $this->config->get('sliderib'); 
                    $sort_order = array();
                    foreach ($sliders as $key => $value) {
                        $sort_order[$key] = $value['order'];
                    }
                    array_multisort($sort_order, SORT_ASC, $sliders);
                ?>
                <?php foreach ($sliders as $slide) { ?>
                    <li>
                        <img src="<?php echo $this->model_tool_image->resize($slide['imgurl'], 1114, 744); ?>" alt="<?php echo $slide['text2']; ?>">
                        <div class="slider-border"><div class="border"></div></div>
                        <div class="title">
                            <span><?php echo $slide['text1'][$id_language]; ?></span>
                            <h3><?php echo $slide['text2'][$id_language]; ?></h3>
                            <div class="clearfix"></div>
                            <h6><?php echo $slide['text3'][$id_language]; ?></h6> 
                            <div class="slider-button-box">
                                <div class="btn-ads-container">
                                    <?php if ($slide['link']) { ?>
                                        <a href="<?php echo $slide['link']; ?>" class="btn-ads">
                                        <span class="flip-container">
                                            <span class="back"><?php echo $slide['button2'][$id_language]; ?></span>
                                            <span class="front"><?php echo $slide['button1'][$id_language]; ?></span>
                                        </span>
                                        </a>
                                    <?php } ?>
                                </div>
                            </div>
                        </div>
                    </li>
                <?php } ?>
            </ul>
            <div class="header-two-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>-prev"></div>
            <div class="header-two-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>-next"></div>
            <div class="header-two-prev visible-desktop"></div>
            <div class="header-two-next visible-desktop"></div>
            <div class="header-two-pager"></div>
        </div>
    <?php } ?>
<?php } ?>
<?php if ($this->config->get('itembridge_header_style') == '3') { ?>
    <?php if($this->config->get('sliderib_status')!=0) { ?>
        <div class="header-third-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>">
            <ul id="header-third">
                <?php
                    $sliders = $this->config->get('sliderib'); 
                    $sort_order = array();
                    foreach ($sliders as $key => $value) {
                        $sort_order[$key] = $value['order'];
                    }
                    array_multisort($sort_order, SORT_ASC, $sliders);
                ?>
                <?php foreach ($sliders as $slide) { ?>
                    <li>
                        <img src="<?php echo $this->model_tool_image->resize($slide['imgurl'], 1114, 744); ?>" alt="<?php echo $slide['text2']; ?>">
                        <div class="slider-border"><div class="border"></div></div>
                        <div class="title">
                            <span><?php echo $slide['text1'][$id_language]; ?></span>
                            <h3><?php echo $slide['text2'][$id_language]; ?></h3>
                            <div class="clearfix"></div>
                            <h6><?php echo $slide['text3'][$id_language]; ?></h6>
                            <div class="clearfix"></div>
                            <div class="slider-button-box">
                                <div class="btn-ads-container">
                                    <?php if ($slide['link']) { ?>
                                        <a href="<?php echo $slide['link']; ?>" class="btn-ads">
                                        <span class="flip-container">
                                            <span class="back"><?php echo $slide['button2'][$id_language]; ?></span>
                                            <span class="front"><?php echo $slide['button1'][$id_language]; ?></span>
                                        </span>
                                        </a>
                                    <?php } ?>
                                </div>
                            </div>
                            <div class="nested-header-box">
                                <div class="slider-header">
                                    <div class="left">&nbsp;</div>
                                    <div class="slider-title">Bestsellers</div>
                                    <div class="nested-header-pager right"></div>
                                </div>
                                <ul class="nested-header-slider product-grid">
                                    <?php foreach ($Products_BestSeller as $product) { ?>
                                        <li>
                                            <article>
                                                <div class="border-top"></div>
                                                <div class="border-left"></div>
                                                <div class="border-right"></div>
                                                <div class="border-bottom"></div>
                                                <?php if ($product['thumb']) { ?>
                                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
                                                <?php } ?>
                                                <div class="product-caption">
                                                    <div class="price">
                                                        <span><?php if ($product['price']) { echo $product['price']; }; ?></span>
                                                    </div>
                                                    <div class="inner">
                                                        <h3 class="title"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h3>
                                                        <div class="cart-button">
                                                            <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary">Add to cart</a>
                                                            <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="wishlist-link">Add to wishlist</a>
                                                            <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="compaire-link">Add to compare</a>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                        </li>
                                    <?php } ?>
                                </ul>
                            </div>
                        </div>
                    </li>
                <?php } ?>
            </ul>
            <div class="header-third-box-prev <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>-prev"></div>
            <div class="header-third-box-next <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>-next"></div>
            <div class="header-third-prev visible-desktop"></div>
            <div class="header-third-next visible-desktop"></div>
            <div class="header-third-pager"></div>
        </div>
    <?php } ?>
<?php } ?>


<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
    <div class="container entry-content">
        <div class="row">
            <div class="span12">
                <?php echo str_replace('&nbsp;', '', get_ibi18n_conf('home_banners')) ?>
                <?php echo $content_top; ?>
            </div>
            <?php echo str_replace('&nbsp;', '', get_ibi18n_conf('home_banners_2')) ?>
            <div class="clearfix"></div>
            <?php echo $content_bottom; ?>
        </div>
        <div class="row home-bottom-block-box">
            <div class="span12 home-bottom-block">
                <div class=row>
                    <div class="span4 about-us">
                        <?php echo $about; ?>
                    </div>
                    <div class="span4 news">
                        <?php echo $news; ?>
                    </div>
                    <div class="span4 follow-us">
                        <?php echo $social; ?>
                    </div>
                </div>
            </div>
        </div>
        <div class="row call-us-box">
            <div class="span12 call-us">
                <span><i class="fa fa-mobile-phone fa-lg"></i> Звоните: <?php echo nl2br($this->config->get('config_telephone')) ?></span>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>