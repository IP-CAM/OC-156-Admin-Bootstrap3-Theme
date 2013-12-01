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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <h2><?php echo $text_edit_address; ?></h2>
            <div class="content span6 no-margin-left">
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
                    
                <label><?php echo $entry_company; ?></label>
                <input type="text" name="company" value="<?php echo $company; ?>" />

                <?php if ($company_id_display) { ?>
                    <label><?php echo $entry_company_id; ?></label>
                    <?php if ($error_company_id) { ?>
                        <span class="text-error"><?php echo $error_company_id; ?></span><br />
                    <?php } ?>
                    <input type="text" name="company_id" value="<?php echo $company_id; ?>" />
                <?php } ?>
                
                <?php if ($tax_id_display) { ?>
                    <label><?php echo $entry_tax_id; ?>
                    <?php if ($error_tax_id) { ?>
                        <span class="text-error"><?php echo $error_tax_id; ?></span><br />
                    <?php } ?>
                    <input type="text" name="tax_id" value="<?php echo $tax_id; ?>" />
                <?php } ?>
                
                <label><?php echo $entry_address_1; ?> <span class="required">*</span></label>
                <?php if ($error_address_1) { ?>
                    <span class="text-error"><?php echo $error_address_1; ?></span><br />
                <?php } ?>
                <input type="text" name="address_1" value="<?php echo $address_1; ?>" />
                
                <label><?php echo $entry_address_2; ?></label>
                <input type="text" name="address_2" value="<?php echo $address_2; ?>" />
            </div>
            <div class="content span6">
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

                <label><?php echo $entry_default; ?></label>
                <?php if ($default) { ?>
                    <input type="radio" name="default" value="1" checked="checked" />
                    <?php echo $text_yes; ?>
                    <input type="radio" name="default" value="0" />
                    <?php echo $text_no; ?>
                <?php } else { ?>
                    <input type="radio" name="default" value="1" />
                    <?php echo $text_yes; ?>
                    <input type="radio" name="default" value="0" checked="checked" />
                    <?php echo $text_no; ?>
                <?php } ?>
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
        url: 'index.php?route=account/address/country&country_id=' + this.value,
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