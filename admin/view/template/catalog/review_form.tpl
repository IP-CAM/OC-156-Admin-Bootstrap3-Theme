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
      <button type="submit" form="form-review" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
      <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-review" class="form-horizontal">
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-author"><?php echo $entry_author; ?></label>
          <div class="col-sm-10">
            <input type="text" name="author" value="<?php echo $author; ?>" id="input-author" class="form-control input-sm" />
            <?php if ($error_author) { ?>
            <div class="text-danger"><?php echo $error_author; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-product"><?php echo $entry_product; ?></label>
          <div class="col-sm-10">
            <input type="text" name="product" value="<?php echo $product; ?>" id="input-product" class="form-control input-sm" />
            <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />

            <?php if ($error_product) { ?>
            <div class="text-danger"><?php echo $error_product; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-text"><?php echo $entry_text; ?></label>
          <div class="col-sm-10">
            <textarea name="text" cols="60" rows="8" id="input-text" class="form-control input-sm"><?php echo $text; ?></textarea>
            <?php if ($error_text) { ?>
            <div class="text-danger"><?php echo $error_text; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_rating; ?></label>
          <div class="col-sm-10">
        <div class="btn-group btn-group-xs" data-toggle="buttons">
  			<label class="btn btn-info<?php if ($rating == 1) { ?> active<?php } ?>">
    				<i class="fa fa-star"></i> <input type="radio" name="rating" id="input-rating" value="1" <?php if ($rating == 1) { ?>checked<?php } ?>>
  			</label>
  			<label class="btn btn-info<?php if ($rating == 2) { ?> active<?php } ?>">
    				<i class="fa fa-star"></i> <input type="radio" name="rating" id="input-rating" value="2" <?php if ($rating == 2) { ?>checked<?php } ?>>
  			</label>
  			<label class="btn btn-info<?php if ($rating == 3) { ?> active<?php } ?>">
    				<i class="fa fa-star"></i> <input type="radio" name="rating" id="input-rating" value="3" <?php if ($rating == 3) { ?>checked<?php } ?>>
  			</label>
  			<label class="btn btn-info<?php if ($rating == 4) { ?> active<?php } ?>">
    				<i class="fa fa-star"></i> <input type="radio" name="rating" id="input-rating" value="4" <?php if ($rating == 4) { ?>checked<?php } ?>>
  			</label>
  			<label class="btn btn-info<?php if ($rating == 5) { ?> active<?php } ?>">
    				<i class="fa fa-star"></i> <input type="radio" name="rating" id="input-rating" value="5" <?php if ($rating == 5) { ?>checked<?php } ?>>
  			</label>
            <?php if ($error_rating) { ?>
            <div class="text-danger"><?php echo $error_rating; ?></div>
            <?php } ?>

		</div>


          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
                <div class="btn-group btn-group-sm" data-toggle="buttons">
  			<label class="btn btn-default<?php if ($status == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="status" id="input-status" <?php if ($status == 1) { ?>checked<?php } ?>> <?php echo $text_enabled; ?>
  			</label>
  			<label class="btn btn-default<?php if ($status == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="status" id="input-status" <?php if ($status == 0) { ?>checked<?php } ?>> <?php echo $text_disabled; ?>
  			</label>
		</div>
          </div>
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
		$('input[name=\'product\']').val(item['label']);
		$('input[name=\'product_id\']').val(item['value']);		
	}	
});
//--></script> 
<?php echo $footer; ?>