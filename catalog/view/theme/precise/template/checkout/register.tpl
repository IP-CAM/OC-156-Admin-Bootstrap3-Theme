<div class="accordion-inner">
    <div class="left">
        <label><?php echo $entry_firstname; ?> <span class="required">*</span></label>
        <input type="text" name="firstname" value="" class="large-field" required />
        
        <label><?php echo $entry_lastname; ?> <span class="required">*</span></label>
        <input type="text" name="lastname" value="" class="large-field" required />

        <label><?php echo $entry_email; ?> <span class="required">*</span></label>
        <input type="text" name="email" value="" class="large-field" required />

        <label><?php echo $entry_telephone; ?> <span class="required">*</span></label>
        <input type="text" name="telephone" value="" class="large-field" required />

        <label><?php echo $entry_fax; ?></label>
        <input type="text" name="fax" value="" class="large-field" />
        
        <label><?php echo $entry_password; ?> <span class="required">*</span></label>
        <input type="password" name="password" value="" class="large-field" required />
        
        <label><?php echo $entry_confirm; ?> <span class="required">*</span></label>
        <input type="password" name="confirm" value="" class="large-field" required />
    </div>
    <div class="right">
        <label><?php echo $entry_company; ?></label>
        <input type="text" name="company" value="" class="large-field" />

        <div class="customer-groups" style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">
            <label><?php echo $entry_customer_group; ?></label>
            <?php foreach ($customer_groups as $customer_group) { ?>
                <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
                    <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked" /><?php echo $customer_group['name']; ?><br />
                <?php } else { ?>
                    <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" /><?php echo $customer_group['name']; ?><br />
                <?php } ?>
            <?php } ?>
            <br />
        </div>

        <div id="company-id-display">
            <label><?php echo $entry_company_id; ?> <span id="company-id-required" class="required">*</span></label>
            <input type="text" name="company_id" value="" class="large-field" required />
        </div>
        
        <div id="tax-id-display">
            <label><?php echo $entry_tax_id; ?> <span id="tax-id-required" class="required">*</span></label>
            <input type="text" name="tax_id" value="" class="large-field" required />
        </div>

        <label><?php echo $entry_address_1; ?> <span class="required">*</span></label>
        <input type="text" name="address_1" value="" class="large-field" required />
        
        <label><?php echo $entry_address_2; ?></label>
        <input type="text" name="address_2" value="" class="large-field" />


        <label><?php echo $entry_city; ?> <span class="required">*</span></label>
        <input type="text" name="city" value="" class="large-field" required />
       
        <label><?php echo $entry_postcode; ?> <span class="required" id="payment-postcode-required">*</span></label>
        <input type="text" name="postcode" value="<?php echo $postcode; ?>" class="large-field" required />

        <label><?php echo $entry_country; ?> <span class="required">*</span></label>
        <select name="country_id" class="large-field">
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
        <select name="zone_id" class="large-field"></select>
    </div>
    <div class="clearfix"></div>

    <label class="checkbox-form"><input type="checkbox" name="newsletter" value="1" id="newsletter" /><?php echo $entry_newsletter; ?></label>

    <?php if ($shipping_required) { ?>
        <label class="checkbox-form"><input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" /><?php echo $entry_shipping; ?></label>
    <?php } ?>
  
    <?php if ($text_agree) { ?>
        <label class="checkbox-form"><input type="checkbox" name="agree" value="1" /><?php echo $text_agree; ?></label>
    <?php } ?>
    <br />
    <input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="btn btn-primary" />
</div>


<script type="text/javascript"><!--
$('#payment-address input[name=\'customer_group_id\']:checked').live('change', function() {
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

$('#payment-address input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('#payment-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
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
			$('#payment-address select[name=\'zone_id\']').html(html);
            $('select[name=\'zone_id\']').trigger('refresh');
            $('select[name=\'zone_id\']').styler();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#payment-address select[name=\'country_id\']').trigger('change');
$('input, select').styler();
$(document).ready(function() {
    $('.colorbox').colorbox({
        width: 640,
        height: 480
    });
});

//--></script>