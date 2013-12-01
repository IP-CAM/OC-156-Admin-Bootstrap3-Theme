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
        <?php if ($error_warning) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error"><?php echo $error_warning; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span12">
                <h1 class="page-title"><?php echo $heading_title; ?></h1>
            </div>
        </div>
 
        <p><?php echo $text_account_already; ?></p>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="content span6 no-margin-left">
                <h2><?php echo $text_your_details; ?></h2>

                <label><?php echo $entry_firstname; ?> <span class="required">*</span></label>
                <?php if ($error_firstname) { ?>
                    <span class="text-error"><?php echo $error_firstname; ?></span><br />
                <?php } ?>
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" />
                
                <label><?php echo $entry_lastname; ?> <span class="required">*</span></label>
                <?php if ($error_lastname) { ?>
                    <span class="text-error"><?php echo $error_lastname; ?></span><br />
                <?php } ?>
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" />

                <label><?php echo $entry_email; ?> <span class="required">*</span></label>
                <?php if ($error_email) { ?>
                    <span class="text-error"><?php echo $error_email; ?></span>
                <?php } ?>
                <input type="text" name="email" value="<?php echo $email; ?>" />

                <label><?php echo $entry_telephone; ?> <span class="required">*</span></label>
                <?php if ($error_telephone) { ?>
                    <span class="text-error"><?php echo $error_telephone; ?></span>
                <?php } ?>
                <input type="text" name="telephone" value="<?php echo $telephone; ?>" />

                <label><?php echo $entry_fax; ?></label>
                <input type="text" name="fax" value="<?php echo $fax; ?>" />

                <br /><br />
                <h2><?php echo $text_your_password; ?></h2>

                <label><?php echo $entry_password; ?> <span class="required">*</span></label>
                <?php if ($error_password) { ?>
                    <span class="text-error"><?php echo $error_password; ?></span>
                <?php } ?>
                <input type="password" name="password" value="<?php echo $password; ?>" />
                    
                <label><?php echo $entry_confirm; ?> <span class="required">*</span></label>
                <?php if ($error_confirm) { ?>
                    <span class="text-error"><?php echo $error_confirm; ?></span>
                <?php } ?>
                <input type="password" name="confirm" value="<?php echo $confirm; ?>" />

                <br /><br />
                <h2><?php echo $text_newsletter; ?></h2>

                <label><?php echo $entry_newsletter; ?></label>
                <?php if ($newsletter) { ?>
                    <input type="radio" name="newsletter" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <input type="radio" name="newsletter" value="0" />
                    <?php echo $text_no; ?>
                <?php } else { ?>
                    <input type="radio" name="newsletter" value="1" />
                    <?php echo $text_yes; ?>
                    <input type="radio" name="newsletter" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                <?php } ?>
            </div>

            <div class="content span6">
                <h2><?php echo $text_your_address; ?></h2>

                <label><?php echo $entry_company; ?></label>
                <input type="text" name="company" value="<?php echo $company; ?>" />

                <div style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
                    <label><?php echo $entry_customer_group; ?></label>
                    <?php foreach ($customer_groups as $customer_group) { ?>
                        <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" />
                            <span for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></span>
                            <br />
                        <?php } else { ?>
                            <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
                            <span for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>"><?php echo $customer_group['name']; ?></span>
                            <br />
                        <?php } ?>
                    <?php } ?>
                </div>
                
                <div id="company-id-display">
                    <label><?php echo $entry_company_id; ?> <span id="company-id-required" class="required">*</span></label>
                    <?php if ($error_company_id) { ?>
                        <span class="text-error"><?php echo $error_company_id; ?></span>
                    <?php } ?>
                    <input type="text" name="company_id" value="<?php echo $company_id; ?>" />
                </div>

                <div id="tax-id-display">
                    <label><?php echo $entry_tax_id; ?> <span id="tax-id-required" class="required">*</span></label>
                    <?php if ($error_tax_id) { ?>
                        <span class="text-error"><?php echo $error_tax_id; ?></span>
                    <?php } ?>
                    <input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
                </div>

                <label><?php echo $entry_address_1; ?> <span class="required">*</span></label>
                <?php if ($error_address_1) { ?>
                    <span class="text-error"><?php echo $error_address_1; ?></span>
                <?php } ?>
                <input type="text" name="address_1" value="<?php echo $address_1; ?>" />
                
                <label><?php echo $entry_address_2; ?></label>
                <input type="text" name="address_2" value="<?php echo $address_2; ?>" />

                <label><?php echo $entry_city; ?> <span class="required">*</span></label>
                <?php if ($error_city) { ?>
                    <span class="text-error"><?php echo $error_city; ?></span>
                <?php } ?>
                <input type="text" name="city" value="<?php echo $city; ?>" />

                <label><?php echo $entry_postcode; ?> <span id="postcode-required" class="required">*</span></label>
                <?php if ($error_postcode) { ?>
                    <span class="text-error"><?php echo $error_postcode; ?></span>
                <?php } ?>
                <input type="text" name="postcode" value="<?php echo $postcode; ?>" />

                <label><?php echo $entry_country; ?> <span class="required">*</span></label>
                <?php if ($error_country) { ?>
                    <span class="text-error"><?php echo $error_country; ?></span><br />
                <?php } ?>
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
                <?php if ($error_zone) { ?>
                    <span class="text-error"><?php echo $error_zone; ?></span><br />
                <?php } ?>
                <select name="zone_id"></select>
            </div>

            <div class="clearfix"></div>
            <br /><br />
            <?php if ($text_agree) { ?>
                <p>
                <?php if ($agree) { ?>
                    <input type="checkbox" name="agree" value="1" checked="checked" />
                <?php } else { ?>
                    <input type="checkbox" name="agree" value="1" />
                <?php } ?>
                <?php echo $text_agree; ?></p>
            <?php } ?>
            <div class="clearfix"></div>
            <div class="buttons">
                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
            </div>            
        </form>
        <?php echo $content_bottom; ?>
    </div>
</div>



<script type="text/javascript"><!--
$('input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=account/register/country&country_id=' + this.value,
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
$(document).ready(function() {
    $('.colorbox').colorbox({
        width: 640,
        height: 480
    });
});
//--></script>
<?php echo $footer; ?>