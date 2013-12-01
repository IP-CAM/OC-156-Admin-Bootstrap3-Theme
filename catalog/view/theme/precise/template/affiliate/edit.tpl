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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="content span6 no-margin-left">
                <h3><?php echo $text_your_details; ?></h3>

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
                    <span class="text-error"><?php echo $error_email; ?></span><br />
                <?php } ?>
                <input type="email" name="email" value="<?php echo $email; ?>" />

                <label><?php echo $entry_telephone; ?> <span class="required">*</span></label>
                <?php if ($error_telephone) { ?>
                    <span class="text-error"><?php echo $error_telephone; ?></span><br />
                <?php } ?>
                <input type="text" name="telephone" value="<?php echo $telephone; ?>" />

                <label><?php echo $entry_fax; ?></label>
                <input type="text" name="fax" value="<?php echo $fax; ?>" />
            </div>
            <div class="content span6 no-margin-left">
                <h3><?php echo $text_your_address; ?></h3>

                <label><?php echo $entry_company; ?></label>
                <input type="text" name="company" value="<?php echo $company; ?>" />

                <label><?php echo $entry_website; ?></label>
                <input type="text" name="website" value="<?php echo $website; ?>" />

                <label><?php echo $entry_address_1; ?> <span class="required">*</span></label>
                <?php if ($error_address_1) { ?>
                    <span class="text-error"><?php echo $error_address_1; ?></span><br />
                <?php } ?>
                <input type="text" name="address_1" value="<?php echo $address_1; ?>" />
            
                <label><?php echo $entry_address_2; ?></label>
                <input type="text" name="address_2" value="<?php echo $address_2; ?>" />

                <label><?php echo $entry_city; ?> <span class="required">*</span></label>
                <?php if ($error_city) { ?>
                    <span class="text-error"><?php echo $error_city; ?></span><br />
                <?php } ?>
                <input type="text" name="city" value="<?php echo $city; ?>" />
            
                <label><?php echo $entry_postcode; ?> <span id="postcode-required" class="required">*</span></label>
                <?php if ($error_postcode) { ?>
                    <span class="text-error"><?php echo $error_postcode; ?></span><br />
                <?php } ?>
                <input type="text" name="postcode" value="<?php echo $postcode; ?>" />

                <label><?php echo $entry_country; ?> <span class="required">*</span></label>
                <?php if ($error_country) { ?>
                    <span class="text-error"><?php echo $error_country; ?></span><br />
                <?php } ?>
                <select name="country_id">
                    <option value="false"><?php echo $text_select; ?></option>
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
            <div class="buttons">
                <input type="button" value="<?php echo $button_back; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $back; ?>'"/>
                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
            </div>
        </form>
        <?php echo $content_bottom; ?>
    </div>
</div>
<script type="text/javascript"><!--
$('select[name=\'country_id\']').bind('change', function() {
	$.ajax({
		url: 'index.php?route=affiliate/edit/country&country_id=' + this.value,
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
<?php echo $footer; ?>