<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="page-header">
    <div class="pull-left">
      <h1><i class="fa fa-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="pull-right">
        <button type="submit" form="form-coupon" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-coupon" class="form-horizontal">
        <ul class="nav nav-tabs">
          <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
          <?php if ($coupon_id) { ?>
          <li><a href="#tab-history" data-toggle="tab"><?php echo $tab_history; ?></a></li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <div class="tab-pane active" id="tab-general">
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
              <div class="col-sm-10">
                <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control input-sm" />
                <?php if ($error_name) { ?>
                <div class="text-danger"><?php echo $error_name; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-code"><?php echo $entry_code; ?> </label>
              <div class="col-sm-10">
                <input type="text" name="code" value="<?php echo $code; ?>" id="input-code" class="form-control input-sm" />

                <?php if ($error_code) { ?>
                <div class="text-danger"><?php echo $error_code; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-type"><?php echo $entry_type; ?></label>
              <div class="col-sm-10">
                <select name="type" id="input-type" class="form-control input-sm">
                  <?php if ($type == 'P') { ?>
                  <option value="P" selected="selected"><?php echo $text_percent; ?></option>
                  <?php } else { ?>
                  <option value="P"><?php echo $text_percent; ?></option>
                  <?php } ?>
                  <?php if ($type == 'F') { ?>
                  <option value="F" selected="selected"><?php echo $text_amount; ?></option>
                  <?php } else { ?>
                  <option value="F"><?php echo $text_amount; ?></option>
                  <?php } ?>
                </select>
		 </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-discount"><?php echo $entry_discount; ?></label>
              <div class="col-sm-10">
                <input type="text" name="discount" value="<?php echo $discount; ?>" id="input-discount" class="form-control input-sm" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-total"><?php echo $entry_total; ?></label>
              <div class="col-sm-10">
                <input type="text" name="total" value="<?php echo $total; ?>" id="input-total" class="form-control input-sm" />
		</div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_logged; ?></label>
              <div class="col-sm-10">
		<div class="btn-group btn-group-sm" data-toggle="buttons">

  			<label class="btn btn-default<?php if ($logged == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="logged" id="input-status" <?php if ($logged == 1) { ?>checked<?php } ?>> <?php echo $text_yes; ?>
  			</label>
  			<label class="btn btn-default<?php if ($logged == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="logged" id="input-status" <?php if ($logged == 0) { ?>checked<?php } ?>> <?php echo $text_no; ?>
  			</label>
		</div>
		</div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label"><?php echo $entry_shipping; ?></label>
              <div class="col-sm-10">
		<div class="btn-group btn-group-sm" data-toggle="buttons">

  			<label class="btn btn-default<?php if ($shipping == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="shipping" id="input-status" <?php if ($shipping == 1) { ?>checked<?php } ?>> <?php echo $text_yes; ?>
  			</label>
  			<label class="btn btn-default<?php if ($shipping == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="shipping" id="input-status" <?php if ($shipping == 0) { ?>checked<?php } ?>> <?php echo $text_no; ?>
  			</label>
		</div>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
              <div class="col-sm-10">
                <input type="text" name="product" value="" id="input-product" class="form-control input-sm" />

                <ul id="coupon-product" class="list-unstyled">
                  <?php foreach ($coupon_product as $coupon_product) { ?>
                  <li id="coupon-product<?php echo $coupon_product['product_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $coupon_product['name']; ?>
                    <input type="hidden" name="coupon_product[]" value="<?php echo $coupon_product['product_id']; ?>" />
                  </li>
                  <?php } ?>
                </ul>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-category"><?php echo $entry_category; ?></label>
              <div class="col-sm-10">
                <input type="text" name="category" value="" id="input-category" class="form-control input-sm" />
		 <br />
                <ul id="coupon-category" class="list-unstyled">
                  <?php foreach ($coupon_category as $coupon_category) { ?>
                  <li id="coupon-category<?php echo $coupon_category['category_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $coupon_category['name']; ?>
                    <input type="hidden" name="coupon_category[]" value="<?php echo $coupon_category['category_id']; ?>" />
                  </li>
                  <?php } ?>
                </ul>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-date-start"><?php echo $entry_date_start; ?></label>
              <div class="col-sm-10">
                <input type="date" name="date_start" value="<?php echo $date_start; ?>" id="input-date-start" class="form-control input-sm" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-date-end"><?php echo $entry_date_end; ?></label>
              <div class="col-sm-10">
                <input type="date" name="date_end" value="<?php echo $date_end; ?>" id="input-date-end" class="form-control input-sm" />
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-uses-total"><?php echo $entry_uses_total; ?> </label>
              <div class="col-sm-10">
                <input type="text" name="uses_total" value="<?php echo $uses_total; ?>" id="input-uses-total" class="form-control input-sm" />
		 </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-uses-customer"><?php echo $entry_uses_customer; ?> </label>
              <div class="col-sm-10">
                <input type="text" name="uses_customer" value="<?php echo $uses_customer; ?>" id="input-uses-customer" class="form-control input-sm" />
		 </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
              <div class="col-sm-10"><div class="btn-group btn-group-sm" data-toggle="buttons">

  		<label class="btn btn-default<?php if ($status == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="status" id="input-status" <?php if ($status == 1) { ?>checked<?php } ?>> <?php echo $text_enabled; ?>
  			</label>
  			<label class="btn btn-default<?php if ($status == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="status" id="input-status" <?php if ($status == 0) { ?>checked<?php } ?>> <?php echo $text_disabled; ?>
  			</label>
		</div>
              </div>
            </div>
          </div>
          <?php if ($coupon_id) { ?>
          <div class="tab-pane" id="tab-history">
            <div id="history"></div>
          </div>
          <?php } ?>
        </div>
      </form>

</div>
<script type="text/javascript"><!--
$('input[name=\'product\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/product/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',			
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['product_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'product\']').val('');
		
		$('#coupon-product' + item['value']).remove();
		
		$('#coupon-product').append('<div id="coupon-product' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="coupon_product[]" value="' + item['value'] + '" /></div>');	
	}
});

$('#coupon-product').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});

// Category
$('input[name=\'category\']').autocomplete({
	'source': function(request, response) {
		$.ajax({
			url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
			dataType: 'json',
			success: function(json) {
				response($.map(json, function(item) {
					return {
						label: item['name'],
						value: item['category_id']
					}
				}));
			}
		});
	},
	'select': function(item) {
		$('input[name=\'category\']').val('');
		
		$('#coupon-category' + item['value']).remove();
		
		$('#coupon-category').append('<div id="coupon-category' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="coupon_category[]" value="' + item['value'] + '" /></div>');
	}	
});

$('#coupon-category').delegate('.fa-minus-circle', 'click', function() {
	$(this).parent().remove();
});
//--></script>
<?php if ($coupon_id) { ?>
<script type="text/javascript"><!--
$('#history').delegate('ul.pagination a', 'click', function() {
	$('#history').load(this.href);
	
	return false;
});			

$('#history').load('index.php?route=sale/coupon/history&token=<?php echo $token; ?>&coupon_id=<?php echo $coupon_id; ?>');
//--></script>
<?php } ?>
<?php echo $footer; ?>