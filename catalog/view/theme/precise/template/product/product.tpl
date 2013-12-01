<?php echo $header; ?>
<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
    <div class="header-six-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>">
    </div>
</div>
<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
    <ul class="breadcrumb container-box">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>
<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
    <div class="container entry-content">
        <div id="notification"></div>
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span12">
                <h1 class="page-title"><?php echo $heading_title; ?></h1>
                <div class="row product-viev product-info">
                    <div class="span4 image">
                        <?php if ($special) { ?>
                            <div class="label sale">&nbsp;</div>
                        <?php } ?>
                        <?php if ($thumb) { 
                            $this->load->model('catalog/product');
                            $information_product = $this->model_catalog_product->getProduct($product_id);
                            $image_size = getimagesize($this->config->get('config_url').'image/'.$information_product['image']);
                            $image_class = 'img-max-height';
                            if (($image_size[1]/$image_size[0]) >= (342/312)) {
                                $image_class = 'img-max-width';
                            };
                        ?>
                            <div style="width: 100%;">
                                <img style="width: 100%;" id="main-product-image" class="<?php echo $image_class; ?>" src="<?php echo $this->config->get('config_url').'image/'.$information_product['image']; ?>" data-zoom-image="<?php echo $popup; ?>" alt="<?php echo $heading_title; ?>" id="image" />
                            </div>
                        <?php } ?>
                        <?php if ($images) { ?>
                            <div id="product-images">
                                <a href="#" data-image="<?php echo $this->config->get('config_url').'image/'.$information_product['image']; ?>" data-zoom-image="<?php echo $this->config->get('config_url').'image/'.$information_product['image']; ?>">
                                    <img src="<?php echo $this->config->get('config_url').'image/'.$information_product['image']; ?>" alt="<?php echo $heading_title; ?>">
                                </a>
                                <?php 
                                    $this->load->model('catalog/product');
                                    $set_image = $this->model_catalog_product->getProductImages($product_id);
                                    foreach ($set_image as $image) { 
                                        $this->load->model('catalog/product');
                                ?>
                                    <a href="#" data-image="<?php echo $this->config->get('config_url').'image/'.$image['image']; ?>" data-zoom-image="<?php echo $this->config->get('config_url').'image/'.$image['image']; ?>">
                                        <img src="<?php echo $this->config->get('config_url').'image/'.$image['image']; ?>" >
                                    </a>
                                <?php
                                    };
                                ?>
                            </div>
                            <div class="carousel-prev product-prev">&nbsp;</div>
                            <div class="carousel-next product-next">&nbsp;</div>
                        <?php } ?>
                    </div>
                    <div class="span8 product-caption">
                        <?php if ($review_status) { ?>
                            <div class="row">
                                <div class="top span8">
                                    <div class="stars" title="<?php echo $reviews; ?>" style="background-position: <?php echo (100-20*$rating); ?>%;"></div> <a onclick="$('a[href=\'#tab-review\']').trigger('click');" class="count-review"><?php echo $reviews; ?></a> | <a onclick="$('a[href=\'#tab-review\']').trigger('click');" class="add-review"><?php echo $text_write; ?></a>
                                </div>
                            </div>
                            <hr>
                        <?php } ?>
                        <div class="row product-options-one">
                            <div class="span3 pull-left">
                                <?php if ($manufacturer) { ?>
                                    <span class="availabillity"><?php echo $text_manufacturer; ?></span> <a class="sku-status" href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
                                <?php } ?>
                                <span class="availabillity"><?php echo $text_model; ?></span> <span class="sku-status"><?php echo $model; ?></span><br />
                                <?php if ($reward) { ?>
                                    <span class="availabillity"><?php echo $text_reward; ?></span> <span class="sku-status"><?php echo $reward; ?></span><br />
                                <?php } ?>
                                <?php /*
                                <span class="availabillity"><?php echo $text_stock; ?></span> <span class="sku-status"><?php echo $stock; ?></span>
                                */?>
                            </div>
                        </div>
                        <div class="clearfix"></div>
                        <hr>
                        <div class="row product-price-box">
                            <?php if ($price) { ?>
                                <div class="span3 pull-left">
                                    <div class="price">
                                        <?php if (!$special) { ?>
                                            <div class="price-new"><?php echo $price; ?></div>
                                        <?php } else { ?>
                                            <div class="price-old"><?php echo $price; ?></div>
                                            <div class="price-new"><?php echo $special; ?></div>
                                        <?php } ?>  
                                        <?php if ($tax) { ?>
                                            <br />
                                            <span class="from-price"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
                                        <?php } ?>
                                        <?php if ($points) { ?>
                                            <span><?php echo $text_points; ?> <?php echo $points; ?></span><br />
                                        <?php } ?>
                                        <span class="sku-status"><?php echo $stock; ?></span>
                                        <?php if ($discounts) { ?>
                                            <br />
                                            <div class="discount">
                                                <ul class="rate-list">
                                                    <?php foreach ($discounts as $discount) { ?>
                                                        <li>
                                                            <span class="arrow">&nbsp;</span>
                                                            <?php echo sprintf($text_discount, '<span class="rate">'.$discount['quantity'].'</span>', '<span class="rate-price">'.$discount['price'].'</span>'); ?>
                                                        </li>
                                                    <?php } ?>
                                                </ul>
                                            </div>
                                        <?php } ?>
                                    </div>
                                </div>
                            <?php } ?>
                            <div class="span5 pull-right product-button">
                                <div class="pull-left">
                                    <a onclick="addToWishList('<?php echo $product_id; ?>');" class="wishlist-link"><?php echo $button_wishlist; ?></a><br>
                                    <a onclick="addToCompare('<?php echo $product_id; ?>');" class="compaire-link"><?php echo $button_compare; ?></a>
                                </div>
                                <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button btn btn-primary pull-right" />
                                <label class="product-qty pull-right"><?php echo $text_qty; ?> <input type="text" name="quantity" size="2" value="<?php echo $minimum; ?>"></label><input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
                            </div>
                        </div>
                        <hr>
                        <?php if ($options) { ?>
                            <div class="product-options-seven">
                                <h4><?php echo $text_option; ?></h4>
                                <?php foreach ($options as $option) { ?>
                                    <?php if ($option['type'] == 'select') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <select name="option[<?php echo $option['product_option_id']; ?>]">
                                                <option value=""><?php echo $text_select; ?></option>
                                                <?php foreach ($option['option_value'] as $option_value) { ?>
                                                    <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                                                        <?php if ($option_value['price']) { ?>
                                                            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                                                        <?php } ?>
                                                    </option>
                                                <?php } ?>
                                            </select>
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'radio') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="radio">
                                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                    <?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                        <span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
                                                    <?php } ?>
                                                </label>
                                            <?php } ?>
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'checkbox') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>" class="checkbox">
                                                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                    <?php echo $option_value['name']; ?>
                                                    <?php if ($option_value['price']) { ?>
                                                        <span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
                                                    <?php } ?>
                                                </label>
                                            <?php } ?>
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'image') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <?php foreach ($option['option_value'] as $option_value) { ?>
                                                <label class="radio input-img" for="option-value-<?php echo $option_value['product_option_value_id']; ?>">
                                                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
                                                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" />&nbsp;
                                                        <?php echo $option_value['name']; ?>
                                                        <?php if ($option_value['price']) { ?>
                                                            <span>(<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)</span>
                                                        <?php } ?>
                                                </label>
                                            <?php } ?>
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'text') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'textarea') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'file') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <input type="button" value="<?php echo $button_upload; ?>" id="button-option-<?php echo $option['product_option_id']; ?>" class="btn btn-primary">
                                            <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'date') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'datetime') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
                                        </div>
                                        <br />
                                    <?php } ?>
                                    <?php if ($option['type'] == 'time') { ?>
                                        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
                                            <b><?php echo $option['name']; ?>:&nbsp;</b><?php if ($option['required']) { ?><span class="required">*</span><?php } ?><br />
                                            <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
                                        </div>
                                        <br />
                                    <?php } ?>
                                <?php } ?>
                            </div>
                        <?php } ?>
                    </div>
                    <div class="clearfix"></div>
                    <div class="span12 product-tab">
                        <div id="tabs" class="htabs">
                            <ul class="nav nav-tabs" id="product_tab">
                                <li class="active"><a href="#tab-description"><?php echo $tab_description; ?></a></li>
                                <li>
                                    <?php if ($attribute_groups) { ?>
                                        <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
                                    <?php } ?>
                                </li>
                                <li>
                                    <?php if ($review_status) { ?>
                                        <a href="#tab-review"><?php echo $tab_review; ?></a>
                                    <?php } ?>
                                </li>
                            </ul>
                        </div>
                        <div class="tab-content">
                            <div id="tab-description" class="tab-pane active">
                                <h3><?php echo $tab_description; ?></h3>
                                <p><?php echo $description; ?></p>
                            </div>
                            <?php if ($attribute_groups) { ?>
                                <div id="tab-attribute" class="tab-pane">
                                    <h3><?php echo $tab_attribute; ?></h3>
                                    <table class="table table-hover">
                                        <?php foreach ($attribute_groups as $attribute_group) { ?>
                                            <thead><tr><th colspan="2" style="text-align:center;"><?php echo $attribute_group['name']; ?></th></tr></thead>
                                            <tbody>
                                                <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                                                    <tr>
                                                        <td><?php echo $attribute['name']; ?></td>
                                                        <td><?php echo html_entity_decode(str_replace(';','<br>',$attribute['text'])); ?></td>
                                                    </tr>
                                                <?php } ?>
                                            </tbody>
                                        <?php } ?>
                                    </table>
                                </div>
                            <?php } ?>
                            <?php if ($review_status) { ?>
                                <div id="tab-review" class="tab-pane product-reviews">
                                    <h3><?php echo $tab_review; ?></h3>
                                    <div id="review"></div>
                                    <div class="profuct-form-reviews">
                                        <h3 id="review-title"><?php echo $text_write; ?></h3>
                                        <form action="#">
                                            <div class="rating-input">
                                                <label class="rating"><?php echo $entry_rating; ?> <span class="required">*</span></label>
                                                <label><input type="radio" name="rating" value="1" /><br>1</label>
                                                <label><input type="radio" name="rating" value="2" /><br>2</label>
                                                <label><input type="radio" name="rating" value="3" /><br>3</label>
                                                <label><input type="radio" name="rating" value="4" /><br>4</label>
                                                <label><input type="radio" name="rating" value="5" /><br>5</label>
                                                <div class="visible-440"></div>
                                            </div>
                                            <div class="left">
                                                <label><?php echo $entry_name; ?> <span class="required">*</span></label>
                                                <input type="text" name="name" value="" />
                                                <label><?php echo $entry_captcha; ?> <span class="required">*</span></label>
                                                <input type="text" name="captcha" value="" style="width: 167px; vertical-align: baseline;"/>
                                                <img src="index.php?route=product/product/captcha" alt="" id="captcha" />
                                            </div>
                                            <div class="right">
                                                <label><?php echo $entry_review; ?> <span class="required">*</span></label>
                                                <textarea name="text"></textarea>
                                                <div class="note"><?php echo strip_tags($text_note); ?></div>
                                            </div>
                                            <div class="clearfix"></div>
                                            <input id="button-review" type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary">
                                        </form>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            <?php } ?>
                        </div>
                        <?php if ($products) { ?>
                            <div class="carousel-grid">
                                <div class="title-one"><span><?php echo $tab_related; ?></span><div class="carousel-pager one pull-right"></div></div>
                                <ul class="product-grid <?php $grid_style = $this->config->get('itembridge_grid_style'); if ($grid_style=='variant_2') echo 'two-vatiant'; ?>">
                                    <?php foreach ($products as $product) { ?>
                                        <li>
                                            <article>
                                                <div class="border-top"></div>
                                                <div class="border-left"></div>
                                                <div class="border-right"></div>
                                                <div class="border-bottom"></div>
                                                <?php if ($product['thumb']) { 
                                                    $this->load->model('catalog/product');
                                                    $information_product = $this->model_catalog_product->getProduct($product['product_id']);
                                                    $image_size = getimagesize($this->config->get('config_url').'image/'.$information_product['image']);
                                                    $image_class = 'img-max-height';
                                                    if (($image_size[1]/$image_size[0]) >= (305/228)) {
                                                        $image_class = 'img-max-width';
                                                    };
                                                ?>
                                                    <a href="<?php echo $product['href']; ?>"><img class="<?php echo $image_class; ?>" src="<?php echo $this->config->get('config_url').'image/'.$information_product['image']; ?>" alt="<?php echo $product['name']; ?>">
                                                        <?php if ($product['special']) { ?>
                                                            <div class="label sale">&nbsp;</div>
                                                        <?php } ?>
                                                    </a>
                                                <?php } ?>
                                                <div class="product-caption">
                                                    <div class="price">
                                                        <?php if ($product['price']) { ?>
                                                            <span><?php echo $product['price']; ?></span>
                                                        <?php } ?>
                                                    </div>
                                                    <div class="inner">
                                                        <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
                                                        <div class="cart-button">
                                                            <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary">Add to cart</a>
                                                            <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="wishlist-link">Add to wishlist</a>
                                                            <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="compaire-link">Add to compare</a>
                                                            <div class="clearfix"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </article>
                                            <div class="product-bottom-title" style="display: <?php $grid_style = $this->config->get("itembridge_grid_style"); if ($grid_style=="variant_2") { echo "block";} else {echo "none";} ?>">
                                                <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
                                            </div>
                                        </li>
                                    <?php } ?>
                                </ul>
                                <div class="carousel-prev">&lt;</div>
                                <div class="carousel-next">&gt;</div>
                            </div>
                        <?php } ?>
                    </div>
                </div>
                <?php if ($tags) { ?>
                  <div class="tags"><b><?php echo $text_tags; ?></b>
                    <?php for ($i = 0; $i < count($tags); $i++) { ?>
                    <?php if ($i < (count($tags) - 1)) { ?>
                    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
                    <?php } else { ?>
                    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
                    <?php } ?>
                    <?php } ?>
                  </div>
                <?php } ?>
            </div>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<script src="catalog/view/theme/precise/js/jquery.elevateZoom-2.5.5.min.js"></script>
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {
    $.ajax({
        url: 'index.php?route=checkout/cart/add',
        type: 'post',
        data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
        dataType: 'json',
        success: function(json) {
            $('.success, .warning, .attention, information, .text-error, .alert').remove();
            if (json['error']) {
                if (json['error']['option']) {
                    for (i in json['error']['option']) {
                        $('#option-' + i + ' > br').before('<span class="text-error"> ' + json['error']['option'][i] + '</span>');
                    }
                }
            }
            if (json['success']) {
                $('#notification').html('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-success">' + json['success'] + '</span><i class="icon-remove icon-white"></i></div>');   
                $('.success').fadeIn('slow');
                q_text=json['total'].split(' ');
                $('#cart-total').html(q_text[0]);
                $('html, body').animate({ scrollTop: 0 }, 'slow');
                $('#cart').load('index.php?route=module/cart #cart > *'); 
            }   
        }
    });
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
    action: 'index.php?route=product/product/upload',
    name: 'file',
    autoSubmit: true,
    responseType: 'json',
    onSubmit: function(file, extension) {
        $('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/default/image/loading.gif" class="loading" style="padding-left: 5px;" />');
        $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', true);
    },
    onComplete: function(file, json) {
        $('#button-option-<?php echo $option['product_option_id']; ?>').attr('disabled', false);
        $('.text-error').remove();
        if (json['success']) {
            alert(json['success']);
            $('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json['file']);
        }
        if (json['error']) {
            $('#option-<?php echo $option['product_option_id']; ?>').before('<span class=".text-error">' + json['error'] + '</span>');
        }
        $('.loading').remove(); 
    }
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
    $('#review').fadeOut('slow');  
    $('#review').load(this.href);
    $('#review').fadeIn('slow');
    return false;
});
$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');
$('#button-review').bind('click', function() {
    $.ajax({
        url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
        type: 'post',
        dataType: 'json',
        data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
        beforeSend: function() {
            $('.alert').remove();
            $('#button-review').attr('disabled', true);
        },
        complete: function() {
            $('#button-review').attr('disabled', false);
        },
        success: function(data) {
            if (data['error']) {
                $('#review-title').after('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + data['error'] + '</span><i class="icon-remove icon-white"></i></div>');
            }
            if (data['success']) {
                $('#review-title').after('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-success">' + data['success'] + '</span><i class="icon-remove icon-white"></i></div>');
                $('input[name=\'name\']').val('');
                $('textarea[name=\'text\']').val('');
                $('input[name=\'rating\']:checked').attr('checked', '');
                $('input[name=\'captcha\']').val('');
            }
        }
    });
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script>
<script type="text/javascript"><!--
$(document).ready(function() {
    if ($.browser.msie && $.browser.version == 6) {
        $('.date, .datetime, .time').bgIframe();
    }
    $('.date').datepicker({dateFormat: 'yy-mm-dd'});
    $('.datetime').datetimepicker({
        dateFormat: 'yy-mm-dd',
        timeFormat: 'h:m'
    });
    $('.time').timepicker({timeFormat: 'h:m'});
});
//--></script>
<?php echo $footer; ?>