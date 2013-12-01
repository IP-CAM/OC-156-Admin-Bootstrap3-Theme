<div class="accordion-inner">
    <?php if ($addresses) { ?>
    <label class="checkbox-form">
    <input type="radio" name="shipping_address" value="existing" id="shipping-address-existing" checked="checked" />
    <?php echo $text_address_existing; ?>
    </label>
    <div id="shipping-existing">
      <select name="address_id" style="width: 100%; margin-bottom: 15px;" size="5">
        <?php foreach ($addresses as $address) { ?>
        <?php if ($address['address_id'] == $address_id) { ?>
        <option value="<?php echo $address['address_id']; ?>" selected="selected"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $address['address_id']; ?>"><?php echo $address['firstname']; ?> <?php echo $address['lastname']; ?>, <?php echo $address['address_1']; ?>, <?php echo $address['city']; ?>, <?php echo $address['zone']; ?>, <?php echo $address['country']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
    <p>
        <label class="checkbox-form">
        <input type="radio" name="shipping_address" value="new" id="shipping-address-new" />
        <?php echo $text_address_new; ?></label>
    </p>
    <?php } ?>
    <div id="shipping-new" style="display: <?php echo ($addresses ? 'none' : 'block'); ?>;">

        <label><?php echo $entry_firstname; ?> <span class="required">*</span></label>
        <input type="text" name="firstname" value="" class="large-field" />

        <label><?php echo $entry_lastname; ?> <span class="required">*</span></label>
        <input type="text" name="lastname" value="" class="large-field" />

        <label><?php echo $entry_company; ?></label>
        <input type="text" name="company" value="" class="large-field" />


        <label><?php echo $entry_address_1; ?> <span class="required">*</span></label>
        <input type="text" name="address_1" value="" class="large-field" />

        <label><?php echo $entry_address_2; ?></label>
        <input type="text" name="address_2" value="" class="large-field" />

        <label><?php echo $entry_city; ?> <span class="required">*</span></label>
        <input type="text" name="city" value="" class="large-field" />

        <label><?php echo $entry_postcode; ?> <span id="shipping-postcode-required" class="required">*</span></label>
        <input type="text" name="postcode" value="" class="large-field" />

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

    <br />
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-address" class="btn btn-primary" />     
</div>
<script type="text/javascript"><!--
$('#shipping-address input[name=\'shipping_address\']').live('change', function() {
	if (this.value == 'new') {
		$('#shipping-existing').hide();
		$('#shipping-new').show();
	} else {
		$('#shipping-existing').show();
		$('#shipping-new').hide();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('#shipping-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#shipping-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#shipping-postcode-required').show();
			} else {
				$('#shipping-postcode-required').hide();
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
			
			$('#shipping-address select[name=\'zone_id\']').html(html);
            $('#shipping-address select[name=\'zone_id\']').trigger('refresh');
            $('#shipping-address select[name=\'zone_id\']').styler();
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#shipping-address select[name=\'country_id\']').trigger('change');
$('input, select.large-field').styler();
//--></script>