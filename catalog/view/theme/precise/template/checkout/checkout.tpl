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
            </div>
        </div>
		<div class="row checkout">
            <div class="span9">
                <div class="accordion">
                    <div class="accordion-group" id="checkout">
                        <div class="accordion-heading checkout-heading">
                        	<a class="accordion-toggle"><?php echo $text_checkout_option; ?></a>
                        </div>
                        <div class="accordion-body in checkout-content"></div>
                    </div>
                    <?php if (!$logged) { ?>
                    <div class="accordion-group" id="payment-address">
                        <div class="accordion-heading checkout-heading">
                        	<a class="accordion-toggle"><?php echo $text_checkout_account; ?></a>
                        </div>
                        <div class="accordion-body in checkout-content"></div>
                    </div>
                    <?php } else { ?>
                    <div class="accordion-group" id="payment-address">
                        <div class="accordion-heading checkout-heading">
                        	<a class="accordion-toggle"><?php echo $text_checkout_payment_address; ?></a>
                        </div>
                        <div class="accordion-body in checkout-content"></div>
                    </div>
                    <?php } ?>
                    <?php if ($shipping_required) { ?>
                    <div class="accordion-group" id="shipping-address">
                        <div class="accordion-heading checkout-heading">
                        	<a class="accordion-toggle"><?php echo $text_checkout_shipping_address; ?></a>
                        </div>
                        <div class="accordion-body in checkout-content"></div>
                    </div>
                    <div class="accordion-group" id="shipping-method">
                        <div class="accordion-heading checkout-heading">
                        	<a class="accordion-toggle"><?php echo $text_checkout_shipping_method; ?></a>
                        </div>
                        <div class="accordion-body in checkout-content"></div>
                    </div>
                    <?php } ?>
                    <div class="accordion-group" id="payment-method">
                        <div class="accordion-heading checkout-heading">
                        	<a class="accordion-toggle"><?php echo $text_checkout_payment_method; ?></a>
                        </div>
                        <div class="accordion-body in checkout-content"></div>
                    </div>
                    <div class="accordion-group" id="confirm">
                        <div class="accordion-heading checkout-heading">
                        	<a class="accordion-toggle"><?php echo $text_checkout_confirm; ?></a>
                        </div>
                        <div class="accordion-body in checkout-content"></div>
                    </div>
                </div>
            </div>
             <div class="span3">
                <div class="progress-box">
                    <ol>
                    	<li><?php echo $text_checkout_option; ?></li>
	                    <?php if (!$logged) { ?>
	                    	<li><?php echo $text_checkout_account; ?></li>
	                    <?php } else { ?>
	                    	<li><?php echo $text_checkout_payment_address; ?></li>
	                    <?php } ?>
	                    <?php if ($shipping_required) { ?>
	                    	<li><?php echo $text_checkout_shipping_address; ?></li>
	                    	<li><?php echo $text_checkout_shipping_method; ?></li>
	                    <?php } ?>
                    	<li><?php echo $text_checkout_payment_method; ?></li>
                        <li><?php echo $text_checkout_confirm; ?></li>
                    </ol>
                </div>
            </div>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<script type="text/javascript"><!--
$('#checkout .checkout-content input[name=\'account\']').live('change', function() {
	if ($(this).attr('value') == 'register') {
		$('#payment-address .checkout-heading a').html('<?php echo $text_checkout_account; ?>');
		$('.progress-box ol li:eq(1)').html('<?php echo $text_checkout_account; ?>');
	} else {
		$('#payment-address .checkout-heading a').html('<?php echo $text_checkout_payment_address; ?>');
		$('.progress-box ol li:eq(1)').html('<?php echo $text_checkout_payment_address; ?>');
	}
});

$('.checkout-heading a > span').live('click', function() {
	$('.checkout-content').slideUp('slow');
	$(this).parent().parent().parent().find('.checkout-content').slideDown('slow');
	$(this).parent().parent().parent().nextAll().find('.checkout-heading a > span').remove();
	$('.accordion-group').attr('class','accordion-group');
	$(this).parent().parent().parent().attr('class','accordion-group active');
	$(this).remove();

});
<?php if (!$logged) { ?> 
$(document).ready(function() {
	$.ajax({
		url: 'index.php?route=checkout/login',
		dataType: 'html',
		success: function(html) {
			$('#checkout .checkout-content').html(html);
			$('.accordion-inner input').styler();
			$('#checkout .checkout-content').slideDown('slow');
			$('.accordion-group').attr('class','accordion-group');
			$('#checkout').attr('class','accordion-group active');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});		
<?php } else { ?>
$(document).ready(function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_address',
		dataType: 'html',
		success: function(html) {
			$('#payment-address .checkout-content').html(html);
				
			$('#payment-address .checkout-content').slideDown('slow');
			$('.accordion-group').attr('class','accordion-group');
			$('#payment-address').attr('class','accordion-group active');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
<?php } ?>

// Checkout
$('#button-account').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/' + $('input[name=\'account\']:checked').attr('value'),
		dataType: 'html',
		beforeSend: function() {
			$('#button-account').attr('disabled', true);
		},		
		complete: function() {
			$('#button-account').attr('disabled', false);
		},			
		success: function(html) {
			$('.warning, .error, .alert').remove();
			$('#payment-address .checkout-content').html(html);
			$('#checkout .checkout-content').slideUp('slow');
			$('#payment-address .checkout-content').slideDown('slow');
			$('.accordion-group').attr('class','accordion-group');
			$('#payment-address').attr('class','accordion-group active');
			$('.checkout-heading a > span').remove();
			$('#checkout .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

// Login
$('#button-login').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/login/validate',
		type: 'post',
		data: $('#checkout #login :input'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-login').attr('disabled', true);

		},	
		complete: function() {
			$('#button-login').attr('disabled', false);
		},				
		success: function(json) {
			$('.warning, .error, .alert').remove();
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				$('#checkout .checkout-content .accordion-inner').prepend('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + json['error']['warning'] + '</span><i class="icon-remove icon-white"></i></div>');
				$('.alert').fadeIn('slow');
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Register
$('#button-register').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/register/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-register').attr('disabled', true);
		},	
		complete: function() {
			$('#button-register').attr('disabled', false);
		},			
		success: function(json) {
			$('.warning, .text-error, .alert').remove();
						
			if (json['redirect']) {
				location = json['redirect'];				
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content .accordion-inner').prepend('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + json['error']['warning'] + '</span><i class="icon-remove icon-white"></i></div>');
					
					$('.warning').fadeIn('slow');
				}
				
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').before('<span class="text-error">' + json['error']['firstname'] + '<br /></span>');
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').before('<span class="text-error">' + json['error']['lastname'] + '<br /></span>');
				}	
				
				if (json['error']['email']) {
					$('#payment-address input[name=\'email\']').before('<span class="text-error">' + json['error']['email'] + '<br /></span>');
				}
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').before('<span class="text-error">' + json['error']['telephone'] + '<br /></span>');
				}	
					
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').before('<span class="text-error">' + json['error']['company_id'] + '<br /></span>');
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').before('<span class="text-error">' + json['error']['tax_id'] + '<br /></span>');
				}	
																		
				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').before('<span class="text-error">' + json['error']['address_1'] + '<br /></span>');
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').before('<span class="text-error">' + json['error']['city'] + '<br /></span>');
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').before('<span class="text-error">' + json['error']['postcode'] + '<br /></span>');
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').before('<span class="text-error">' + json['error']['country'] + '<br /></span>');
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').before('<span class="text-error">' + json['error']['zone'] + '<br /></span>');
				}
				
				if (json['error']['password']) {
					$('#payment-address input[name=\'password\']').before('<span class="text-error">' + json['error']['password'] + '<br /></span>');
				}	
				
				if (json['error']['confirm']) {
					$('#payment-address input[name=\'confirm\']').before('<span class="text-error">' + json['error']['confirm'] + '<br /></span>');
				}																																	
			} else {

				$.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-address .checkout-content').html(html);
						$('#payment-address .checkout-heading a').html('<?php echo $text_checkout_payment_address; ?>');
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});

				<?php if ($shipping_required) { ?>				
					var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
					
					if (shipping_address) {
						$.ajax({
							url: 'index.php?route=checkout/shipping_method',
							dataType: 'html',
							success: function(html) {
								
								$('#shipping-method .checkout-content').html(html);
								$('#payment-address .checkout-content').slideUp('slow');
								$('#shipping-address .checkout-content').slideUp('slow');
								$('#shipping-method .checkout-content').slideDown('slow');

								$('.accordion-group').attr('class','accordion-group');
								$('#shipping-method').attr('class','accordion-group active');
								
								$('#checkout .checkout-heading a > span').remove();
								$('#payment-address .checkout-heading a > span').remove();
								$('#shipping-address .checkout-heading a > span').remove();
								$('#shipping-method .checkout-heading a > span').remove();
								$('#payment-method .checkout-heading a > span').remove();											
								
								$('#shipping-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');									
								$('#payment-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	

								$.ajax({
									url: 'index.php?route=checkout/shipping_address',
									dataType: 'html',
									success: function(html) {
										$('#shipping-address .checkout-content').html(html);
									},
									error: function(xhr, ajaxOptions, thrownError) {
										alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
									}
								});	
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});	
					} else {
						$.ajax({
							url: 'index.php?route=checkout/shipping_address',
							dataType: 'html',
							success: function(html) {

								$('#shipping-address .checkout-content').html(html);
								
								$('#payment-address .checkout-content').slideUp('slow');
								
								$('#shipping-address .checkout-content').slideDown('slow');
								$('.accordion-group').attr('class','accordion-group');
								$('#shipping-address').attr('class','accordion-group active');
								
								$('#checkout .checkout-heading a > span').remove();
								$('#payment-address .checkout-heading a > span').remove();
								$('#shipping-address .checkout-heading a > span').remove();
								$('#shipping-method .checkout-heading a > span').remove();
								$('#payment-method .checkout-heading a > span').remove();							

								$('#payment-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});			
					}
				<?php } else { ?>
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {

						$('#payment-method .checkout-content').html(html);
						
						$('#payment-address .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');
						$('.accordion-group').attr('class','accordion-group');
						$('#payment-method').attr('class','accordion-group active');
						
						$('#checkout .checkout-heading a > span').remove();
						$('#payment-address .checkout-heading a > span').remove();
						$('#payment-method .checkout-heading a > span').remove();								
						
						$('#payment-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
				<?php } ?>

				
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Payment Address	
$('#button-payment-address').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_address/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'password\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-address').attr('disabled', true);
		},	
		complete: function() {
			$('#button-payment-address').attr('disabled', false);
		},			
		success: function(json) {
			$('.warning, .text-error, .alert').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-address .checkout-content .accordion-inner').prepend('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + json['error']['warning'] + '</span><i class="icon-remove icon-white"></i></div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').before('<span class="text-error">' + json['error']['firstname'] + '<br /></span>');
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').before('<span class="text-error">' + json['error']['lastname'] + '<br /></span>');
				}	
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').before('<span class="text-error">' + json['error']['telephone'] + '<br /></span>');
				}		
				
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').before('<span class="text-error">' + json['error']['company_id'] + '<br /></span>');
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').before('<span class="text-error">' + json['error']['tax_id'] + '<br /></span>');
				}	
														
				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').before('<span class="text-error">' + json['error']['address_1'] + '<br /></span>');
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').before('<span class="text-error">' + json['error']['city'] + '<br /></span>');
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').before('<span class="text-error">' + json['error']['postcode'] + '<br /></span>');
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').before('<span class="text-error">' + json['error']['country'] + '<br /></span>');
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').before('<span class="text-error">' + json['error']['zone'] + '<br /></span>');
				}
			} else {
				<?php if ($shipping_required) { ?>
				$.ajax({
					url: 'index.php?route=checkout/shipping_address',
					dataType: 'html',
					success: function(html) {
						$('#shipping-address .checkout-content').html(html);
					
						$('#payment-address .checkout-content').slideUp('slow');
						
						$('#shipping-address .checkout-content').slideDown('slow');
						$('.accordion-group').attr('class','accordion-group');
						$('#shipping-address').attr('class','accordion-group active');
						
						$('#payment-address .checkout-heading a > span').remove();
						$('#shipping-address .checkout-heading a > span').remove();
						$('#shipping-method .checkout-heading a > span').remove();
						$('#payment-method .checkout-heading a > span').remove();
						
						$('#payment-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
				<?php } else { ?>
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
					
						$('#payment-address .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');
						$('.accordion-group').attr('class','accordion-group');
						$('#payment-method').attr('class','accordion-group active');
						
						$('#payment-address .checkout-heading a > span').remove();
						$('#payment-method .checkout-heading a > span').remove();
													
						$('#payment-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				<?php } ?>
				
				$.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-address .checkout-content').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}	  
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Shipping Address			
$('#button-shipping-address').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping_address/validate',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address input[type=\'password\'], #shipping-address input[type=\'checkbox\']:checked, #shipping-address input[type=\'radio\']:checked, #shipping-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-address').attr('disabled', true);
		},	
		complete: function() {
			$('#button-shipping-address').attr('disabled', false);
		},			
		success: function(json) {
			$('.warning, .text-error, .alert').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-address .checkout-content .accordion-inner').prepend('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + json['error']['warning'] + '</span><i class="icon-remove icon-white"></i></div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').before('<span class="text-error">' + json['error']['firstname'] + '<br /></span>');
				}
				
				if (json['error']['lastname']) {
					$('#shipping-address input[name=\'lastname\']').before('<span class="text-error">' + json['error']['lastname'] + '<br /></span>');
				}	
				
				if (json['error']['email']) {
					$('#shipping-address input[name=\'email\']').before('<span class="text-error">' + json['error']['email'] + '<br /></span>');
				}
				
				if (json['error']['telephone']) {
					$('#shipping-address input[name=\'telephone\']').before('<span class="text-error">' + json['error']['telephone'] + '<br /></span>');
				}		
										
				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').before('<span class="text-error">' + json['error']['address_1'] + '<br /></span>');
				}	
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').before('<span class="text-error">' + json['error']['city'] + '<br /></span>');
				}	
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').before('<span class="text-error">' + json['error']['postcode'] + '<br /></span>');
				}	
				
				if (json['error']['country']) {
					$('#shipping-address select[name=\'country_id\']').before('<span class="text-error">' + json['error']['country'] + '<br /></span>');
				}	
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').before('<span class="text-error">' + json['error']['zone'] + '<br /></span>');
				}
			} else {
				$.ajax({
					url: 'index.php?route=checkout/shipping_method',
					dataType: 'html',
					success: function(html) {
						$('#shipping-method .checkout-content').html(html);
						
						$('#shipping-address .checkout-content').slideUp('slow');
						
						$('#shipping-method .checkout-content').slideDown('slow');
						$('.accordion-group').attr('class','accordion-group');
						$('#shipping-method').attr('class','accordion-group active');
						
						$('#shipping-address .checkout-heading a > span').remove();
						$('#shipping-method .checkout-heading a > span').remove();
						$('#payment-method .checkout-heading a > span').remove();
						
						$('#shipping-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');							
						
						$.ajax({
							url: 'index.php?route=checkout/shipping_address',
							dataType: 'html',
							success: function(html) {
								$('#shipping-address .checkout-content').html(html);
							},
							error: function(xhr, ajaxOptions, thrownError) {
								alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
							}
						});
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
				
				$.ajax({
					url: 'index.php?route=checkout/payment_address',
					dataType: 'html',
					success: function(html) {
						$('#payment-address .checkout-content').html(html);
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Guest
$('#button-guest').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/guest/validate',
		type: 'post',
		data: $('#payment-address input[type=\'text\'], #payment-address input[type=\'checkbox\']:checked, #payment-address input[type=\'radio\']:checked, #payment-address input[type=\'hidden\'], #payment-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-guest').attr('disabled', true);
		},	
		complete: function() {
			$('#button-guest').attr('disabled', false); 
		},			
		success: function(json) {
			$('.warning, .text-error, .alert').remove();
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					alert('ТУТ');
					$('#payment-address .checkout-content .accordion-inner').prepend('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + json['error']['warning'] + '</span><i class="icon-remove icon-white"></i></div>');
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#payment-address input[name=\'firstname\']').before('<span class="text-error">' + json['error']['firstname'] + '<br /></span>');
				}
				
				if (json['error']['lastname']) {
					$('#payment-address input[name=\'lastname\']').before('<span class="text-error">' + json['error']['lastname'] + '<br /></span>');
				}	
				
				if (json['error']['email']) {
					$('#payment-address input[name=\'email\']').before('<span class="text-error">' + json['error']['email'] + '<br /></span>');
				}
				
				if (json['error']['telephone']) {
					$('#payment-address input[name=\'telephone\']').before('<span class="text-error">' + json['error']['telephone'] + '<br /></span>');
				}	
					
				if (json['error']['company_id']) {
					$('#payment-address input[name=\'company_id\']').before('<span class="text-error">' + json['error']['company_id'] + '<br /></span>');
				}	
				
				if (json['error']['tax_id']) {
					$('#payment-address input[name=\'tax_id\']').before('<span class="text-error">' + json['error']['tax_id'] + '<br /></span>');
				}	
																		
				if (json['error']['address_1']) {
					$('#payment-address input[name=\'address_1\']').before('<span class="text-error">' + json['error']['address_1'] + '<br /></span>');
				}	
				
				if (json['error']['city']) {
					$('#payment-address input[name=\'city\']').before('<span class="text-error">' + json['error']['city'] + '<br /></span>');
				}	
				
				if (json['error']['postcode']) {
					$('#payment-address input[name=\'postcode\']').before('<span class="text-error">' + json['error']['postcode'] + '<br /></span>');
				}	
				
				if (json['error']['country']) {
					$('#payment-address select[name=\'country_id\']').before('<span class="text-error">' + json['error']['country'] + '<br /></span>');
				}	
				
				if (json['error']['zone']) {
					$('#payment-address select[name=\'zone_id\']').before('<span class="text-error">' + json['error']['zone'] + '<br /></span>');
				}
			} else {
				<?php if ($shipping_required) { ?>	
				var shipping_address = $('#payment-address input[name=\'shipping_address\']:checked').attr('value');
				
				if (shipping_address) {
					$.ajax({
						url: 'index.php?route=checkout/shipping_method',
						dataType: 'html',
						success: function(html) {
							$('#shipping-method .checkout-content').html(html);
							
							$('#payment-address .checkout-content').slideUp('slow');
							$('#shipping-address .checkout-content').slideUp('slow');
							$('#shipping-method .checkout-content').slideDown('slow');
							$('.accordion-group').attr('class','accordion-group');
							$('#shipping-method').attr('class','accordion-group active');
							
							$('#payment-address .checkout-heading a > span').remove();
							$('#shipping-address .checkout-heading a > span').remove();
							$('#shipping-method .checkout-heading a > span').remove();
							$('#payment-method .checkout-heading a > span').remove();		
															
							$('#payment-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	
							$('#shipping-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');									
							$.ajax({
								url: 'index.php?route=checkout/guest_shipping',
								dataType: 'html',
								success: function(html) {
									$('#shipping-address .checkout-content').html(html);
								},
								error: function(xhr, ajaxOptions, thrownError) {
									alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
								}
							});
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});					
				} else {
					$.ajax({
						url: 'index.php?route=checkout/guest_shipping',
						dataType: 'html',
						success: function(html) {
							$('#shipping-address .checkout-content').html(html);
							
							$('#payment-address .checkout-content').slideUp('slow');
							
							$('#shipping-address .checkout-content').slideDown('slow');
							$('.accordion-group').attr('class','accordion-group');
							$('#shipping-address').attr('class','accordion-group active');
							
							$('#payment-address .checkout-heading a > span').remove();
							$('#shipping-address .checkout-heading a > span').remove();
							$('#shipping-method .checkout-heading a > span').remove();
							$('#payment-method .checkout-heading a > span').remove();
							
							$('#payment-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	
						},
						error: function(xhr, ajaxOptions, thrownError) {
							alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
						}
					});
				}
				<?php } else { ?>				
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#payment-address .checkout-content').slideUp('slow');
							
						$('#payment-method .checkout-content').slideDown('slow');
						$('.accordion-group').attr('class','accordion-group');
						$('#payment-method').attr('class','accordion-group active');
							
						$('#payment-address .checkout-heading a > span').remove();
						$('#payment-method .checkout-heading a > span').remove();
														
						$('#payment-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});
				<?php } ?>
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

// Guest Shipping
$('#button-guest-shipping').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/guest_shipping/validate',
		type: 'post',
		data: $('#shipping-address input[type=\'text\'], #shipping-address select'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-guest-shipping').attr('disabled', true);
		},	
		complete: function() {
			$('#button-guest-shipping').attr('disabled', false);
		},			
		success: function(json) {
			$('.warning, .text-error, .alert').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-address .checkout-content .accordion-inner').prepend('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + json['error']['warning'] + '</span><i class="icon-remove icon-white"></i></div>');
					
					$('.warning').fadeIn('slow');
				}
								
				if (json['error']['firstname']) {
					$('#shipping-address input[name=\'firstname\']').before('<span class="text-error">' + json['error']['firstname'] + '<br /></span>');
				}
				
				if (json['error']['lastname']) {
					$('#shipping-address input[name=\'lastname\']').before('<span class="text-error">' + json['error']['lastname'] + '<br /></span>');
				}	
										
				if (json['error']['address_1']) {
					$('#shipping-address input[name=\'address_1\']').before('<span class="text-error">' + json['error']['address_1'] + '<br /></span>');
				}	
				
				if (json['error']['city']) {
					$('#shipping-address input[name=\'city\']').before('<span class="text-error">' + json['error']['city'] + '<br /></span>');
				}	
				
				if (json['error']['postcode']) {
					$('#shipping-address input[name=\'postcode\']').before('<span class="text-error">' + json['error']['postcode'] + '<br /></span>');
				}	
				
				if (json['error']['country']) {
					$('#shipping-address select[name=\'country_id\']').before('<span class="text-error">' + json['error']['country'] + '<br /></span>');
				}	
				
				if (json['error']['zone']) {
					$('#shipping-address select[name=\'zone_id\']').before('<span class="text-error">' + json['error']['zone'] + '<br /></span>');
				}
			} else {
				$.ajax({
					url: 'index.php?route=checkout/shipping_method',
					dataType: 'html',
					success: function(html) {
						$('#shipping-method .checkout-content').html(html);
						
						$('#shipping-address .checkout-content').slideUp('slow');
						
						$('#shipping-method .checkout-content').slideDown('slow');
						$('.accordion-group').attr('class','accordion-group');
						$('#shipping-method').attr('class','accordion-group active');
						
						$('#shipping-address .checkout-heading a > span').remove();
						$('#shipping-method .checkout-heading a > span').remove();
						$('#payment-method .checkout-heading a > span').remove();
							
						$('#shipping-address .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});				
			}	 
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$('#button-shipping-method').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/shipping_method/validate',
		type: 'post',
		data: $('#shipping-method input[type=\'radio\']:checked, #shipping-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-shipping-method').attr('disabled', true);
		},	
		complete: function() {
			$('#button-shipping-method').attr('disabled', false);
		},			
		success: function(json) {
			$('.warning, .text-error, .alert').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#shipping-method .checkout-content .accordion-inner').prepend('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + json['error']['warning'] + '</span><i class="icon-remove icon-white"></i></div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/payment_method',
					dataType: 'html',
					success: function(html) {
						$('#payment-method .checkout-content').html(html);
						
						$('#shipping-method .checkout-content').slideUp('slow');
						
						$('#payment-method .checkout-content').slideDown('slow');
						$('.accordion-group').attr('class','accordion-group');
						$('#payment-method').attr('class','accordion-group active');

						$('#shipping-method .checkout-heading a > span').remove();
						$('#payment-method .checkout-heading a > span').remove();
						
						$('#shipping-method .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});					
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});

$('#button-payment-method').live('click', function() {
	$.ajax({
		url: 'index.php?route=checkout/payment_method/validate', 
		type: 'post',
		data: $('#payment-method input[type=\'radio\']:checked, #payment-method input[type=\'checkbox\']:checked, #payment-method textarea'),
		dataType: 'json',
		beforeSend: function() {
			$('#button-payment-method').attr('disabled', true);
		},	
		complete: function() {
			$('#button-payment-method').attr('disabled', false);
		},			
		success: function(json) {
			$('.warning, .text-error, .alert').remove();
			
			if (json['redirect']) {
				location = json['redirect'];
			} else if (json['error']) {
				if (json['error']['warning']) {
					$('#payment-method .checkout-content .accordion-inner').prepend('<div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error">' + json['error']['warning'] + '</span><i class="icon-remove icon-white"></i></div>');
					
					$('.warning').fadeIn('slow');
				}			
			} else {
				$.ajax({
					url: 'index.php?route=checkout/confirm',
					dataType: 'html',
					success: function(html) {
						$('#confirm .checkout-content').html(html);
						
						$('#payment-method .checkout-content').slideUp('slow');
						
						$('#confirm .checkout-content').slideDown('slow');
						$('.accordion-group').attr('class','accordion-group');
						$('#confirm').attr('class','accordion-group active');
						
						$('#payment-method .checkout-heading a > span').remove();
						
						$('#payment-method .checkout-heading a').append('<span class="pull-right"><i class="icon-pencil"></i><span><?php echo $text_modify; ?></span></span>');	
					},
					error: function(xhr, ajaxOptions, thrownError) {
						alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
					}
				});	
			}
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});	
});
//--></script> 
<?php echo $footer; ?>
