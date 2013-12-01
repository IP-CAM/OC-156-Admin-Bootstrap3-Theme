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
        <?php if ($attention) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-warning"><?php echo $attention; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php if ($success) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-success"><?php echo $success; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php if ($error_warning) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error"><?php echo $error_warning; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span12">
                <h1 class="page-title">
                    <?php echo $heading_title; ?>
                    <?php if ($weight) { ?>
                        &nbsp;(<?php echo $weight; ?>)
                    <?php } ?>
                </h1>
            </div>
        </div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" name="cart_list">
            <div class="row cart-page">
                <div class="span12">
                    <div class="table-box">
                        <table class="cart-table">
                            <thead>
                                <tr>
                                    <th>&nbsp;</th>
                                    <th class="name"><?php echo $column_name; ?></th>
                                    <th><?php echo $column_model; ?></th>
                                    <th><?php echo $column_price; ?></th>
                                    <th><?php echo $column_quantity; ?></th>
                                    <th>&nbsp;</th>
                                    <th><?php echo $column_total; ?></th>
                                    <th>&nbsp;</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($products as $product) { ?>
                                    <tr>
                                        <td>
                                            <?php if ($product['thumb']) { ?>
                                                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                            <?php } ?>
                                        </td>
                                        <td class="name">
                                            <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                            <?php if (!$product['stock']) { ?>
                                                <span class="stock">***</span>
                                            <?php } ?>
                                            <div>
                                                <?php foreach ($product['option'] as $option) { ?>
                                                    - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                                                <?php } ?>
                                            </div>
                                            <?php if ($product['reward']) { ?>
                                                <small><?php echo $product['reward']; ?></small>
                                            <?php } ?>
                                        </td>
                                        <td><?php echo $product['model']; ?></td>
                                        <td><?php echo $product['price']; ?></td>
                                        <td><input type="text" name="quantity[<?php echo $product['key']; ?>]" value="<?php echo $product['quantity']; ?>" /></td>
                                        <td><i class="icon-refresh" onclick="document.forms.cart_list.submit()" title="<?php echo $button_update; ?>"></i></td>
                                        <td><?php echo $product['total']; ?></td>
                                        <td><a class="close" onclick="return location.href='<?php echo $product['remove']; ?>'" title="<?php echo $button_remove; ?>"></a></td>
                                    </tr>
                                <?php } ?>
                                <?php foreach ($vouchers as $vouchers) { ?>
                                    <tr>
                                        <td></td>
                                        <td class="name"><?php echo $vouchers['description']; ?></td>
                                        <td></td>
                                        <td><?php echo $vouchers['amount']; ?></td>
                                        <td class="quantity">
                                            <input type="text" name="" value="1" disabled="disabled" style="opacity: 0.80;" />
                                        </td>
                                        <td></td>
                                        <td class="total"><?php echo $vouchers['amount']; ?></td>
                                        <td><a class="close" onclick="return location.href='<?php echo $vouchers['remove']; ?>'" title="<?php echo $button_remove; ?>"></a></td>
                                    </tr>
                                <?php } ?>
                                <tr>
                                    <td colspan="2" class="continue"><a href="<?php echo $continue; ?>">Continue Shopping</a></td>
                                    <td colspan="6" class="update"><a onclick="document.forms.cart_list.submit()"><i class="icon-repeat"></i> Update Shopping Cart</a></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                        <div class="row">
                            <?php if ($shipping_status) { ?>
                                <div class="span4">
                                    <h4><?php echo $text_shipping_estimate; ?></h4>
                                    <p><?php echo $text_shipping_detail; ?></p>
                                    <label><?php echo $entry_country; ?> <span class="required">*</span></label>
                                    <select name="country_id">
                                        <option value=""><?php echo $text_select; ?></option>
                                        <?php foreach ($countries as $country) { ?>
                                            <?php if ($country['country_id'] == $country_id) { ?>
                                                <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
                                            <?php } else { ?>
                                                <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
                                            <?php } ?>
                                        <?php } ?>
                                    </select>
                                    <label><?php echo $entry_zone; ?> <span class="required">*</span></label>
                                    <select name="zone_id"></select>
                                    <label><?php echo $entry_postcode; ?> <span id="postcode-required" class="required">*</span></label>
                                    <input type="text" name="postcode" value="<?php echo $postcode; ?>" />
                                    <input type="button" value="<?php echo $button_quote; ?>" id="button-quote" class="btn btn-primary" />
                                </div>
                            <?php } ?>
                            <div class="span4">
                                <?php if ($coupon_status) { ?>
                                    <h4><?php echo $text_use_coupon; ?></h4>
                                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                        <p><?php echo $entry_coupon; ?></p>
                                        <input type="text" name="coupon" value="<?php echo $coupon; ?>" />
                                        <input type="hidden" name="next" value="coupon" />
                                        <input type="submit" value="<?php echo $button_coupon; ?>" class="btn btn-primary" />
                                    </form>
                                <?php } ?>
                                <?php if ($voucher_status) { ?>
                                    <br /><br /><br />
                                    <h4><?php echo $text_use_voucher; ?></h4>
                                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                        <p><?php echo $entry_voucher; ?></p>
                                        <input type="text" name="voucher" value="<?php echo $voucher; ?>" />
                                        <input type="hidden" name="next" value="voucher" />
                                        <input type="submit" value="<?php echo $button_voucher; ?>" class="btn btn-primary" />
                                    </form>
                                <?php } ?>
                                <?php if ($reward_status) { ?>
                                    <br /><br /><br />
                                    <h4><?php echo $text_use_reward; ?></h4>
                                    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                                        <p><?php echo $entry_reward; ?></p>
                                        <input type="text" name="reward" value="<?php echo $reward; ?>" />
                                        <input type="hidden" name="next" value="reward" />
                                        <input type="submit" value="<?php echo $button_reward; ?>" class="btn btn-primary" />
                                    </form>
                                <?php } ?>
                            </div>
                            <div class="span4">
                                <table>
                                    <?php foreach ($totals as $total) { ?>
                                          <tr>
                                            <td><?php echo $total['title']; ?></td>
                                            <td><b><?php echo $total['text']; ?></b></td>
                                          </tr>
                                    <?php } ?>
                                </table>
                                <a href="<?php echo $checkout; ?>" class="btn btn-info btn-large pull-right" style="float: none; display: block;"><?php echo $button_checkout; ?></a>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                </div>
            </div>
        </form>
        <?php echo $content_bottom; ?>
    </div>
</div> 


<script type="text/javascript"><!--
$('input[name=\'next\']').bind('change', function() {
	$('.cart-module > div').hide();
	
	$('#' + this.value).show();
});
//--></script>
<?php if ($shipping_status) { ?>
<script type="text/javascript"><!--
$('#button-quote').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/quote',
		type: 'post',
		data: 'country_id=' + $('select[name=\'country_id\']').val() + '&zone_id=' + $('select[name=\'zone_id\']').val() + '&postcode=' + encodeURIComponent($('input[name=\'postcode\']').val()),
		dataType: 'json',		
		beforeSend: function() {
			$('#button-quote').attr('disabled', true);
		},
		complete: function() {
			$('#button-quote').attr('disabled', false);
		},		
		success: function(json) {
			$('.success, .warning, .attention, .span4 .text-error').remove();			
						
			if (json['error']) {
				if (json['error']['warning']) {
					$('#notification').html('<div class="warning" style="display: none;">' + json['error']['warning'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');
					
					$('.warning').fadeIn('slow');
					
					$('html, body').animate({ scrollTop: 0 }, 'slow'); 
				}	
							
				if (json['error']['country']) {
					$('select[name=\'country_id\']').before('<span class="text-error">' + json['error']['country'] + '<br /></span>');
				}	
				
				if (json['error']['zone']) {
					$('select[name=\'zone_id\']').before('<span class="text-error">' + json['error']['zone'] + '<br /></span>');
				}
				
				if (json['error']['postcode']) {
					$('input[name=\'postcode\']').before('<span class="text-error">' + json['error']['postcode'] + '<br /></span>');
				}					
			}
			
			if (json['shipping_method']) {
				html  = '<h2><?php echo $text_shipping_method; ?></h2>';
				html += '<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">';
				html += '  <table class="radio">';
				
				for (i in json['shipping_method']) {
					html += '<tr>';
					html += '  <td colspan="3"><b>' + json['shipping_method'][i]['title'] + '</b></td>';
					html += '</tr>';
				
					if (!json['shipping_method'][i]['error']) {
						for (j in json['shipping_method'][i]['quote']) {
							html += '<tr class="highlight">';
							
							if (json['shipping_method'][i]['quote'][j]['code'] == '<?php echo $shipping_method; ?>') {
								html += '<td colspan="2" style="text-align: left;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '"><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" checked="checked" />';
							} else {
								html += '<td colspan="2" style="text-align: left;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '"><input type="radio" name="shipping_method" value="' + json['shipping_method'][i]['quote'][j]['code'] + '" id="' + json['shipping_method'][i]['quote'][j]['code'] + '" />';
							}
								
							html += json['shipping_method'][i]['quote'][j]['title'] + '</label></td>';
							html += '  <td style="text-align: right;"><label for="' + json['shipping_method'][i]['quote'][j]['code'] + '">' + json['shipping_method'][i]['quote'][j]['text'] + '</label></td>';
							html += '</tr>';
						}		
					} else {
						html += '<tr>';
						html += '  <td colspan="3"><div class="error">' + json['shipping_method'][i]['error'] + '</div></td>';
						html += '</tr>';						
					}
				}
				
				html += '  </table>';
				html += '  <br />';
				html += '  <input type="hidden" name="next" value="shipping" />';
				
				<?php if ($shipping_method) { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="btn btn-primary" />';	
				<?php } else { ?>
				html += '  <input type="submit" value="<?php echo $button_shipping; ?>" id="button-shipping" class="btn btn-primary" disabled="disabled" />';	
				<?php } ?>
							
				html += '</form>';
				
				$.colorbox({
					overlayClose: true,
					opacity: 0.5,
					width: '800px',
					height: '400px',
					href: false,
					html: html
				});
                $("input").styler();
				
				$('input[name=\'shipping_method\']').bind('change', function() {
					$('#button-shipping').attr('disabled', false);
				});
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=checkout/cart/country&country_id=' + this.value,
		dataType: 'json',
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#postcode-required').show();
			} else {
				$('#postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {
				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('select[name=\'zone_id\']').html(html);
            $('select[name=\'zone_id\']').trigger('refresh');
            $('select[name=\'zone_id\']').styler();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('select[name=\'country_id\']').trigger('change');
//--></script>
<?php } ?>
<?php echo $footer; ?>
