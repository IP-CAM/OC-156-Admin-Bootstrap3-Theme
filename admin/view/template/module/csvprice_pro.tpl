<?php echo $header; ?>
<div id="content">
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
    <?php if ($success) { ?>
	<div class="success"><?php echo $success; ?></div>
    <?php } ?>
  <div class="box">
    <div class="heading">
      <h1><img src="view/image/backup.png" alt="" /> <?php echo $heading_title; ?></h1>
      <div class="buttons"><a onclick="location = '<?php echo $cancel; ?>';" class="n_button"><?php echo $button_cancel; ?></a></div>
    </div>
    
    <div class="content">
      <div id="tabs" class="htabs">
      	<a href="#tab-export"><?php echo $tab_export; ?></a>
      	<a href="#tab-import"><?php echo $tab_import; ?></a>
      	<a href="#tab-option"><?php echo $tab_setting; ?></a>
      	<a href="#tab-macros"><?php echo $tab_macros; ?></a>
      	<!-- <a href="#tab-category"><?php echo $tab_category; ?></a> -->
      	<a href="#tab-tools"><?php echo $tab_tools; ?></a>
      	<a href="#tab-help"><?php echo $tab_help; ?></a>
      </div>

<!-- BEGIN Export Detail Data -->
<div id="tab-export">
<form action="<?php echo $action_export; ?>" method="post" id="form_export" enctype="multipart/form-data" class="form-horizontal">
<fieldset>
<table border="0">
	
	<tr><td style="vertical-align: top;">

<legend><?php echo $text_export; ?></legend>
<input type="hidden" name="csv_export[file_format]" value="csv">
<!-- BEGIN Languages -->
  <div class="control-group">
    <label class="control-label"><?php echo $entry_languages; ?></label>
    <div class="controls">
      <select class="span2" name="csv_export[language_id]">
        <?php foreach ($languages as $language) { ?>
        	<?php if ( $csv_export['language_id'] == $language['language_id'] ) { ?>
        	<option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
        	<?php } else { ?>
        	<option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
	    	<?php } ?>
	    <?php } ?>
      </select>
    </div>
  </div>
<!-- END Languages -->
<!-- BEGIN Category -->
  <div class="control-group">
    <label class="control-label"><?php echo $entry_category; ?><br /><span class="help-inline"><?php echo $text_help_category; ?></span></label>
    <div class="controls">
	<div class="scrollbox" style="height: 160px;">
	    <?php $class = 'odd'; ?>
	    <?php foreach ($categories as $category) { ?>
		<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
		<div class="<?php echo $class; ?>">
		<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" />
		<?php echo $category['name']; ?>
		</div>
	    <?php } ?>
	</div>
	<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
    
    </div>
</div>
<!-- END Category -->
<!-- BEGIN Manufacturer -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_manufacturer; ?><br /><span class="help-inline"><?php echo $text_help_manufacturer; ?></span></label>
    <div class="controls">
	<div class="scrollbox" style="height: 160px;">
	    <?php $class = 'odd'; ?>
	    <?php foreach ($manufacturers as $manufacturer) { ?>
		<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
		<div class="<?php echo $class; ?>">
		<input type="checkbox" name="product_manufacturer[]" value="<?php echo $manufacturer['manufacturer_id']; ?>" />
		<?php echo $manufacturer['name']; ?>
		</div>
	    <?php } ?>
	</div>
	<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
    </div>
</div>
<!-- END Manufacturer -->
<!-- BEGIN Category Fields export -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_export_category; ?></label>
    <div class="controls">
      <select class="span3" name="csv_export[export_category]">
	        <option value="0"<?php if (!isset($csv_export['export_category']) || $csv_export['export_category'] == 0) { echo '  selected="selected"'; }?>><?php echo $text_no; ?></option>
	        <option value="1"<?php if ( isset($csv_export['export_category']) && $csv_export['export_category'] == 1 ) { echo '  selected="selected"'; }?>><?php echo $text_export_category_id; ?></option>
	        <option value="2"<?php if ( isset($csv_export['export_category']) && $csv_export['export_category'] == 2 ) { echo '  selected="selected"'; }?>><?php echo $text_export_category; ?></option>
	</select>
    </div>
</div>
<!-- END Category Fields export -->
<!-- BEGIN Delimiter Category -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_delimiter_category; ?></label>
    <div class="controls">
	<select class="span1" name="csv_export[delimiter_category]">
		<option value="|"<?php if($csv_export['delimiter_category'] == '|'){echo ' selected="selected"';}?>> | </option>
		<option value=","<?php if($csv_export['delimiter_category'] == ','){echo ' selected="selected"';}?>> , </option>
	</select>
    </div>
</div>
<!-- END Delimiter Category -->
<!-- BEGIN QTY -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_last_qty; ?></label>
    <div class="controls">
      <input type="text" class="span1" name="product_qty" value="0">
      <span class="help-inline"><?php echo $text_help_export_qty; ?></span>
    </div>
</div>
<!-- END QTY -->
<!-- BEGIN LIMIT -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_expot_limit; ?></label>
    <div class="controls">
      <input type="text" class="span1" name="csv_export[limit_start]" value="<?php echo $csv_export['limit_start']; ?>"> - <input type="text" class="span1" name="csv_export[limit_end]" value="<?php echo $csv_export['limit_end']; ?>">
      <span class="help-inline"><?php echo $text_help_export_limit; ?></span>
    </div>
</div>
<!-- END LIMIT -->
<!-- BEGIN GZ Copmpress -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_export_gzcompress; ?></label>
    <div class="controls">
      <select class="span1" name="csv_export[gzcompress]">
		<?php if ($csv_export['gzcompress']) { ?>
	        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
	        <option value="0"><?php echo $text_no; ?></option>
	        <?php } else { ?>
	        <option value="1"><?php echo $text_yes; ?></option>
	        <option value="0" selected="selected"><?php echo $text_no; ?></option>
		<?php } ?>
	</select>
    </div>
</div>
<!-- END GZ Copmpress -->
	
	</td>
	<td style="padding-left: 20px; vertical-align: top;">

<legend><?php echo $entry_fields_set; ?></legend>
<!-- BEGIN FIELD LIST -->
<div class="control-group">
	<table class="list table_fields_set">
	<?php foreach( $csv_export['fields_set_data'] as $field ) { ?>
		<tr>
		<td>
			<label class="checkbox inline" title="<?php echo $field['uid']; ?>">
			<input class="fields_set" <?php	if (array_key_exists($field['uid'], $csv_export['fields_set']) || $field['uid'] == '_ID_') echo 'checked="checked"';?> <?php	if ($field['uid'] == '_ID_') echo ' disabled="disabled" id="field_product_id" ';?> type="checkbox" name="csv_export[fields_set][<?php echo $field['uid']; ?>]" value="1"><?php echo $field['name']; ?>
			</label>
		</td>
		<td><span class="help-inline"><?php echo $fields_set_help[$field['uid']]; ?></span></td>
		<td><span style="color: #003A88;"><?php echo $field['uid']; ?></span></td>
		</tr>
	<?php } ?>
	</table>
	<input type="hidden" name="csv_export[fields_set][_ID_]" value="1">
    <a onclick="$(this).parent().find(':checkbox').attr('checked', true);initFieldsSet();"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);initFieldsSet();"><?php echo $text_unselect_all; ?></a>
</div>	
<!-- END FIELD LIST -->
	
	</td></tr>

</table>

<hr>
<div align="left"><a class="n_button" onclick="$('#form_export').submit();"><?php echo $button_export; ?></a></div>

</fieldset>
</form>
</div> <!-- END Export Detail Data -->

<!-- BGIN IMPORT Detail Data -->
<div id="tab-import">
<form action="<?php echo $action_import; ?>" method="post" id="form_import" enctype="multipart/form-data" class="form-horizontal">
<fieldset>

<table border="0">
	
	<tr><td style="vertical-align: top;">

<legend><?php echo $text_import; ?></legend>
<input type="hidden" name="csv_import[file_format]" value="csv">

<!-- BEGIN IMPORT MODE -->
<div class="control-group">
	<label class="control-label"><?php echo $entry_import_mode; ?></label>
	<div class="controls">
		<select name="csv_import[mode]">
        	<option value="1" <?php if ( $csv_import['mode'] == 1 ) echo 'selected'; ?>><?php echo $text_import_mode_both; ?></option>
        	<option value="2" <?php if ( $csv_import['mode'] == 2 ) echo 'selected'; ?>><?php echo $text_import_mode_update; ?></option>
        	<option value="3" <?php if ( $csv_import['mode'] == 3 ) echo 'selected'; ?>><?php echo $text_import_mode_insert; ?></option>
      </select>
	</div>
</div>
<!-- END IMPORT MODE -->
<!-- BEGIN Languages -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_languages; ?></label>
    <div class="controls">
      <select class="span2" name="csv_import[language_id]">
        <?php foreach ($languages as $language) { ?>
        	<?php if ( $csv_import['language_id'] == $language['language_id'] ) { ?>
        	<option value="<?php echo $language['language_id']; ?>" selected="selected"><?php echo $language['name']; ?></option>
        	<?php } else { ?>
        	<option value="<?php echo $language['language_id']; ?>"><?php echo $language['name']; ?></option>
	    	<?php } ?>
	    <?php } ?>
      </select>
    </div>
</div>
<!-- END Languages -->
<!-- BEGIN KEY FIELD -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_key_field; ?></label>
    <div class="controls">
      <select class="span2" name="csv_import[key_field]">
        <option value="_ID_"<?php if ($csv_import['key_field'] == '_ID_')echo ' selected="selected"';?>>Product ID</option>
        <option value="_MODEL_"<?php if ($csv_import['key_field'] == '_MODEL_')echo ' selected="selected"';?>>Product Model</option>
        <option value="_SKU_"<?php if ($csv_import['key_field'] == '_SKU_')echo ' selected="selected"';?>>Product SKU</option>
        <option value="_NAME_"<?php if ($csv_import['key_field'] == '_NAME_')echo ' selected="selected"';?>>Product Name</option>
      </select>
    </div>
</div>
<!-- END KEY FIELD -->
<!-- BEGIN Delimiter Category -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_delimiter_category; ?></label>
    <div class="controls">
	<select class="span1" name="csv_import[delimiter_category]">
		<option value="|"<?php if($csv_import['delimiter_category'] == '|'){echo ' selected="selected"';}?>> | </option>
		<option value=","<?php if($csv_import['delimiter_category'] == ','){echo ' selected="selected"';}?>> , </option>
	</select>
    </div>
</div>
<!-- END Delimiter Category -->
<!-- BEGIN Fill Parent Category -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_fill_category; ?></label>
    <div class="controls">
	<select class="span1" name="csv_import[fill_category]">
		<?php if (isset($csv_import['fill_category']) && $csv_import['fill_category'] == 1) { ?>
	        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
	        <option value="0"><?php echo $text_no; ?></option>
	        <?php } else { ?>
	        <option value="1"><?php echo $text_yes; ?></option>
	        <option value="0" selected="selected"><?php echo $text_no; ?></option>
		<?php } ?>
	</select>
    </div>
</div>
<!-- END Fill Parent Category -->
<!-- BEGIN Product OFF -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_product_disable; ?></label>
    <div class="controls">
		<select class="span1" name="csv_import[product_disable]">
		<?php if (isset($csv_import['product_disable']) && $csv_import['product_disable'] == 1) { ?>
	        <option value="1" selected="selected"><?php echo $text_yes; ?></option>
	        <option value="0"><?php echo $text_no; ?></option>
	        <?php } else { ?>
	        <option value="1"><?php echo $text_yes; ?></option>
	        <option value="0" selected="selected"><?php echo $text_no; ?></option>
		<?php } ?>
		</select>
    </div>
</div>
<!-- END Product OFF -->
<!-- BEGIN Calc Mode -->
<div class="control-group">
	<label class="control-label"><?php echo $entry_import_calc_mode; ?></label>
	<div class="controls">
		<select class="span2" name="csv_import[calc_mode]">
			<option value="0" <?php if ( $csv_import['calc_mode'] == 0 ) echo 'selected'; ?>><?php echo $text_import_calc_mode_off; ?></option>
        	<option value="1" <?php if ( $csv_import['calc_mode'] == 1 ) echo 'selected'; ?>><?php echo $text_import_calc_mode_multiply; ?></option>
        	<option value="2" <?php if ( $csv_import['calc_mode'] == 2 ) echo 'selected'; ?>><?php echo $text_import_calc_mode_pluse; ?></option>
      </select>
	</div>
</div>
<!-- END Calc Mode -->
<!-- BEGIN Calc Mode VALUE -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_calc_value; ?></label>
    <div class="controls">
		<input class="span1" type="text" name="csv_import[calc_value][]" value="<?php if(isset($csv_import['calc_value'][0]))echo $csv_import['calc_value'][0];?>" size="2"/>
		<input class="span1" type="text" name="csv_import[calc_value][]" value="<?php if(isset($csv_import['calc_value'][1]))echo $csv_import['calc_value'][1];?>" size="2"/>
    </div>
</div>
<!-- END Calc Mode VALUE -->
<!-- BEGIN Iterator Mode -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_iter_limit; ?></label>
    <div class="controls">
  		<input class="span1" type="text" name="csv_import[iter_limit]" value="<?php echo $csv_import['iter_limit'];?>" size="2"/> <span class="help-inline"><?php echo $text_help_import_iter_limit; ?></span>
    </div>
</div>
<!-- END Iterator Mode -->
<!-- BGIN FILE UPLOAD -->
  <div class="control-group">
	<label class="control-label"><?php echo $entry_import; ?></label>
	<div class="controls"><input type="file" name="import" /></div>
</div>
<!-- END FILE UPLOAD -->
	
	</td>
	<td style="padding-left: 20px; vertical-align: top;">

<legend>&nbsp;</legend>
<!-- BEGIN Manufacturer -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_manufacturer; ?></label>
    <div class="controls"><input type="hidden" value="0" name="csv_import[skip_manufacturer]">
    <label class="checkbox"><input type="checkbox" value="1" name="csv_import[skip_manufacturer]"<?php if($csv_import['skip_manufacturer']) echo ' checked';?> /> <?php echo $text_import_skip; ?></label>
	<select name="product_manufacturer">
		<option value="0" selected="selected"><?php echo $text_none; ?></option>
	    <?php foreach ($manufacturers as $manufacturer) { ?>
		<option value="<?php echo $manufacturer['manufacturer_id']; ?>"><?php echo $manufacturer['name']; ?></option>
	    <?php } ?>
	</select>
    </div>
</div>
<!-- END Manufacturer -->
<!-- BEGIN Main Category -->
<?php if($core_type == 'ocstore') { ?>
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_main_category; ?></label>
    <div class="controls"><input type="hidden" value="0" name="csv_import[skip_main_category]">
    <label class="checkbox"><input type="checkbox" value="1" name="csv_import[skip_main_category]"<?php if($csv_import['skip_main_category']) echo ' checked';?> /> <?php echo $text_import_skip; ?></label>
	<select name="main_category_id">
		<option value="0" selected="selected"><?php echo $text_none; ?></option>
	    <?php foreach ($categories as $category) { ?>
		<option value="<?php echo $category['category_id']; ?>"><?php echo $category['name']; ?></option>
	    <?php } ?>
	</select>
    </div>
</div>
<?php } ?>
<!-- END Main Category -->
<!-- BEGIN Category -->
<div class="control-group">
    <label class="control-label"><?php echo $entry_import_category; ?></label>
    <div class="controls"><input type="hidden" value="0" name="csv_import[skip_category]">
    <label class="checkbox"><input type="checkbox" value="1" name="csv_import[skip_category]"<?php if($csv_import['skip_category']) echo ' checked';?> /> <?php echo $text_import_skip; ?></label>
	<div class="scrollbox" style="height: 400px;">
	    <?php $class = 'odd'; ?>
	    <?php foreach ($categories as $category) { ?>
		<?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
		<div class="<?php echo $class; ?>">
		<input type="checkbox" name="product_category[]" value="<?php echo $category['category_id']; ?>" />
		<?php echo $category['name']; ?>
		</div>
	    <?php } ?>
	</div>
	<a onclick="$(this).parent().find(':checkbox').attr('checked', true);"><?php echo $text_select_all; ?></a> / <a onclick="$(this).parent().find(':checkbox').attr('checked', false);"><?php echo $text_unselect_all; ?></a>
    </div>
</div>
<!-- END Category -->

	</td></tr>

</table>
</fieldset>
</form>
<hr>
<div align="left"><a class="n_button" onclick="$('#form_import').submit();"><?php echo $button_import; ?></a></div>
</div>
<!-- END IMPORT Detail Data -->

<!-- BEGIN MACROS -->
<div id="tab-macros">

<form action="<?php echo $action_save;?>" method="post" id="form_macros" enctype="multipart/form-data" class="form-horizontal">
<!-- BEGIN CUSTOM FIELDS -->
<input type="hidden" name="form_macros_status" value="1" />
<table id="table-custom-fields" class="list" style="width:600px">
	<thead>
		<tr>
			<td class="left"><?php echo $entry_custom_fields_table; ?></td>
			<td class="left"><?php echo $entry_custom_fields_name; ?></td>
			<td class="left"><?php echo $entry_custom_fields_csv_name; ?></td>
			<td class="left"><?php echo $entry_custom_fields_caption; ?></td>
			<td class="center"><?php echo $button_remove; ?></td>
		</tr>
	</thead>
	<?php $field_row = 0; ?>
	<?php foreach ($csv_macros['custom_fields'] as $fields) { ?>
	<tbody id="custom-fields-row<?php echo $field_row; ?>">
		<tr>
			<td class="left"><input type="hidden" name="csv_macros[custom_fields][<?php echo $field_row; ?>][tbl_name]" value="<?php echo $fields['tbl_name']; ?>" size="1" /><?php echo $fields['tbl_name']; ?></td>
			<td class="left"><input type="hidden" name="csv_macros[custom_fields][<?php echo $field_row; ?>][field_name]" value="<?php echo $fields['field_name']; ?>" size="1" /><?php echo $fields['field_name']; ?></td>
			<td class="left"><input type="hidden" name="csv_macros[custom_fields][<?php echo $field_row; ?>][csv_name]" value="<?php echo $fields['csv_name']; ?>" size="1" /><?php echo $fields['csv_name']; ?></td>
			<td class="left"><input type="hidden" name="csv_macros[custom_fields][<?php echo $field_row; ?>][csv_caption]" value="<?php echo $fields['csv_caption']; ?>" size="1" /><?php echo $fields['csv_caption']; ?></td>
			<td class="center"><a onclick="$('#custom-fields-row<?php echo $field_row; ?>').remove();" class="n_button"><?php echo $button_remove; ?></a></td>
		</tr>
	</tbody>
	<?php $field_row++; ?>
	<?php } ?>
	<tfoot></tfoot>
</table>
</form>

<!-- BEGIN CustomFields FROM -->
<form class="form-actions">
<fieldset>
<div class="control-group">
	<label class="control-label"><?php echo $entry_custom_fields_table; ?></label>
	<div class="controls">
		<select id="tbl_name" class="span2" onchange="getCustomFields();">
			<option value="<?php echo DB_PREFIX;?>product"><?php echo DB_PREFIX;?>product</option>
			<option value="<?php echo DB_PREFIX;?>product_description"><?php echo DB_PREFIX;?>product_description</option>
		</select>
	</div>
</div>
<div class="control-group">
	<label class="control-label"><?php echo $entry_custom_fields_name; ?></label>
	<div class="controls"><select id="custom_fields"></select></div>
</div>
<div class="control-group">
	<label class="control-label"><?php echo $entry_custom_fields_csv_name; ?></label>
	<div class="controls"><input class="span3" type="text" id="csv_name" value="" size="40"></div>
</div>
<div class="control-group">
	<label class="control-label"><?php echo $entry_custom_fields_caption; ?></label>
	<div class="controls"><input class="span3" type="text" id="csv_caption" value="" size="40"></div>
</div>
<div class="control-group">
	<div class="controls"><div class="buttons"><a onclick="add_CF();" class="n_button"><?php echo $button_insert; ?></a></div></div>
</div>
</fieldset>
</form>
<!-- END CustomFields FROM -->

<hr>
<div align="left"><a class="n_button" onclick="$('#form_macros').submit();"><?php echo $button_save; ?></a></div>
<!-- END CUSTOM FIELDS -->
</div>
<!-- END MACROS -->

<div id="tab-option">

<form action="<?php echo $action_save; ?>" method="post" id="form_option" enctype="multipart/form-data" class="form-horizontal">
<fieldset>

<!-- BEGIN IMPORT SETTING -->
<legend><?php echo $text_import_setting; ?></legend>

<div class="control-group">
	<label class="control-label"><?php echo $entry_store; ?></label>
	<div class="controls">
              <div class="scrollbox">
                  <?php $class = 'even'; ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array(0, $csv_setting['product_store'])) { ?>
                    <input type="checkbox" name="csv_setting[product_store][]" value="0" checked="checked" />
                    <?php echo $text_default; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="csv_setting[product_store][]" value="0" />
                    <?php echo $text_default; ?>
                    <?php } ?>
                  </div>
                  <?php foreach ($stores as $store) { ?>
                  <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
                  <div class="<?php echo $class; ?>">
                    <?php if (in_array($store['store_id'], $csv_setting['product_store'])) { ?>
                    <input type="checkbox" name="csv_setting[product_store][]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                    <?php echo $store['name']; ?>
                    <?php } else { ?>
                    <input type="checkbox" name="csv_setting[product_store][]" value="<?php echo $store['store_id']; ?>" />
                    <?php echo $store['name']; ?>
                    <?php } ?>
                  </div>
                  <?php } ?>
                </div>
	</div>
</div>

<div class="control-group">
	<label class="control-label"><?php echo $entry_tax_class; ?></label>
	<div class="controls">
              <select name="csv_setting[tax_class_id]">
                  <option value="0"><?php echo $text_none; ?></option>
                  <?php foreach ($tax_classes as $tax_class) { ?>
                  <?php if ($tax_class['tax_class_id'] == $csv_setting['tax_class_id']) { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>" selected="selected"><?php echo $tax_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $tax_class['tax_class_id']; ?>"><?php echo $tax_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
	</div>
</div>
<div class="control-group">
	<label class="control-label"><?php echo $entry_minimum; ?></label>
	<div class="controls">
		<input class="span1" type="text" name="csv_setting[minimum]" value="<?php echo $csv_setting['minimum']; ?>" size="2" />
	</div>
</div>

<div class="control-group">
	<label class="control-label"><?php echo $entry_subtract; ?></label>
	<div class="controls">
		<select class="span1" name="csv_setting[subtract]">
                  <?php if ($csv_setting['subtract']) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
		</select>
	</div>
</div>

<div class="control-group">
	<label class="control-label"><?php echo $entry_stock_status; ?></label>
	<div class="controls">
		<select class="span2" name="csv_setting[stock_status_id]">
                  <?php foreach ($stock_statuses as $stock_status) { ?>
                  <?php if ($stock_status['stock_status_id'] == $csv_setting['stock_status_id']) { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>" selected="selected"><?php echo $stock_status['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $stock_status['stock_status_id']; ?>"><?php echo $stock_status['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
		</select>
	</div>
</div>

<div class="control-group">
	<label class="control-label"><?php echo $entry_shipping; ?></label>
	<div class="controls">
		<select class="span1" name="csv_setting[shipping]">
                  <?php if ($csv_setting['shipping']) { ?>
                  <option value="1" selected="selected"><?php echo $text_yes; ?></option>
                  <option value="0"><?php echo $text_no; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_yes; ?></option>
                  <option value="0" selected="selected"><?php echo $text_no; ?></option>
                  <?php } ?>
		</select>
	</div>
</div>

<div class="control-group">
	<label class="control-label"><?php echo $entry_length; ?></label>
	<div class="controls">
		<select class="span2" name="csv_setting[length_class_id]">
                  <?php foreach ($length_classes as $length_class) { ?>
                  <?php if ($length_class['length_class_id'] == $csv_setting['length_class_id']) { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>" selected="selected"><?php echo $length_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $length_class['length_class_id']; ?>"><?php echo $length_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
	</div>
</div>

<div class="control-group">
	<label class="control-label"><?php echo $entry_weight_class; ?></label>
	<div class="controls">
		<select class="span2" name="csv_setting[weight_class_id]">
                  <?php foreach ($weight_classes as $weight_class) { ?>
                  <?php if ($weight_class['weight_class_id'] == $csv_setting['weight_class_id']) { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>" selected="selected"><?php echo $weight_class['title']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $weight_class['weight_class_id']; ?>"><?php echo $weight_class['title']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select>
	</div>
</div>

<div class="control-group">
	<label class="control-label"><?php echo $entry_status; ?></label>
	<div class="controls">
		<select class="span2" name="csv_setting[status]">
                  <?php if ($csv_setting['status']) { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                </select>
	</div>
</div>
<!-- END IMPORT SETTING -->

<hr>
<div align="left"><a class="n_button" onclick="$('#form_option').submit();"><?php echo $button_save; ?></a></div>

</fieldset>
</form>
        
</div>

<!-- <div id="tab-category">
	<form class="form-actions">
		<fieldset>
	В разработке...
		</fieldset>
	</form>
</div>
-->


<div id="tab-tools">
<form action="<?php echo $action_tools; ?>" method="post" id="form_tools" enctype="multipart/form-data" class="form-horizontal">
<fieldset>
    <label><input type="checkbox" value="1" name="manufacturer" /> <?php echo $text_clear_manufacturer_cache; ?></label>
    <label><input type="checkbox" value="2" name="category" /> <?php echo $text_clear_category_cache; ?></label>
    <label><input type="checkbox" value="3" name="product" /> <?php echo $text_clear_product_cache; ?></label>
    <span class="help-inline"><?php echo $text_help_clear_manufacturer_cache; ?></span>
<hr>
<div align="left"><a class="n_button" onclick="$('#form_tools').submit();"><?php echo $button_apply; ?></a></div>	
</fieldset>
</form>

<legend><?php echo $text_backups_setting;?></legend>
<form action="<?php echo $action_tools; ?>" method="post" id="form_tools_setting" enctype="multipart/form-data" class="form-actions">
<fieldset> В разработке...
<!-- BGIN FILE UPLOAD SETTING -->
<!--<div class="control-group">
	<label class="control-label"><?php echo $entry_upload_setting; ?></label>
	<div class="controls"><input type="file" name="upload_setting" /></div>
	<div align="left"><a class="n_button" onclick="$('#form_tools_setting').submit();"><?php echo $button_apply; ?></a></div>	
</div>-->
</fieldset>
<!-- END FILE UPLOAD SETTING -->
</form>

</div>


<div id="tab-help">
<?php echo $text_help; ?>
</div>
    </div>
<div style="padding:10px;text-align:center; color:#666666;"><strong>CSV Price Pro import/export v<?php echo $csvprice_pro_version; ?></strong></div>
  </div>
</div>
<div class="msg_error" style="display: none"></div>
<script type="text/javascript"><!--
function setBackgroundColor(obj) {
	if($(obj).attr('checked') == 'checked'){
		$(obj).parent().parent().parent().css('background-color', '#EEEEEE');
	} else {
		$(obj).parent().parent().parent().css('background-color', '');
	}
}

function initFieldsSet() {
	$('.fields_set').each(function() {
		setBackgroundColor(this);
	});
	$('#field_product_id').attr('checked', 'checked');
}

$(document).ready(initFieldsSet);

$('.fields_set').click(function(){
	setBackgroundColor(this);
});

$( ".msg_error" ).dialog({       
        modal: true,
        title: 'Error',
        resizable: false,
        autoOpen: false,
        buttons: {
            Close: function() {
                $(this).dialog('close');                                
            } 
        }
});

$('#tabs a').tabs();

$('#form_export').submit(function() {
	var status = 0;
	var msg = '';
	$('.fields_set:checked').each(function() {
			status ++;
	});
	
	if (status == 0) {
		msg = msg + "<br />" + '<?php echo $error_export_fields_set; ?>
		';
		}

		if (msg != '') {
		$('.msg_error div').empty();
		$('.msg_error').append('<div style="text-align:center;">'+msg+'<div>');
		$('.msg_error').dialog('open');
		return false;
		}

		return true;
});

function getCustomFields() {
	var url = '<?php echo $action_get_custom; ?>';
	url = url.replace( /\&amp;/g, '&' );

    $.ajax({
        type:'POST',
        url: url,
        dataType:'json',
        data:{tbl_name: $('#tbl_name option:selected').val()},
        success:function(json){
            $('#custom_fields').get(0).options.length = 0;
            $('#custom_fields').get(0).options[0] = new Option("-- Select Field --", "-1");
            $.each(json, function(i,item) {
				$("#custom_fields").get(0).options[$("#custom_fields").get(0).options.length] = new Option(item.name, item.name);
			});
        },
        error:function(){alert("Failed to load Fields!");}
    });

    return false;
}
var field_row = <?php echo $field_row; ?>;

function add_CF() {
        var tbl_name = $('#tbl_name option:selected').val();
        var field_name = $('#custom_fields option:selected').val();
        var csv_name = $('#csv_name').val();
        var csv_caption = $('#csv_caption').val();
        var html;

        if( field_name == -1 || csv_name == '' ) {
                alert("Error!");
                return;
        }
        html  = '<tbody id="custom-fields-row' + field_row + '">';
        html += '  <tr>';
        html += '    <td class="left"><input type="hidden" name="csv_macros[custom_fields][' + field_row + '][tbl_name]" value="' + tbl_name + '" size="1" />' + tbl_name + '</td>';
        html += '    <td class="left"><input type="hidden" name="csv_macros[custom_fields][' + field_row + '][field_name]" value="' + field_name + '" size="1" />' + field_name + '</td>';
        html += '    <td class="left"><input type="hidden" name="csv_macros[custom_fields][' + field_row + '][csv_name]" value="' + csv_name + '" size="1" />' + csv_name + '</td>';
        html += '    <td class="left"><input type="hidden" name="csv_macros[custom_fields][' + field_row + '][csv_caption]" value="' + csv_caption + '" size="1" />' + csv_caption + '</td>';
        html += '    <td class="center"><a onclick="$(\'#custom-fields-row' + field_row + '\').remove();" class="n_button"><?php echo $button_remove; ?></a></td>';
        html += '  </tr>';
        html += '</tbody>';
        $('#table-custom-fields tfoot').before(html);

        field_row++;
}
$(document).ready(getCustomFields);

//--></script>
<?php echo $footer; ?>