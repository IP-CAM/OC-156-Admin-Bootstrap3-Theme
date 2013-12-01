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
        <button type="submit" form="form-currency" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-currency" class="form-horizontal">
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-title"><?php echo $entry_title; ?></label>
          <div class="col-sm-10">
            <input type="text" name="title" value="<?php echo $title; ?>" id="input-title" class="form-control input-sm" />
            <?php if ($error_title) { ?>
            <div class="text-danger"><?php echo $error_title; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-code"><?php echo $entry_code; ?></label>
          <div class="col-sm-10">
            <input type="text" name="code" value="<?php echo $code; ?>" id="input-code" class="form-control input-sm" />

            <?php if ($error_code) { ?>
            <div class="text-danger"><?php echo $error_code; ?></div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-symbol-left"><?php echo $entry_symbol_left; ?></label>
          <div class="col-sm-10">
            <input type="text" name="symbol_left" value="<?php echo $symbol_left; ?>" id="input-symbol-left" class="form-control input-sm" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-symbol-right"><?php echo $entry_symbol_right; ?></label>
          <div class="col-sm-10">
            <input type="text" name="symbol_right" value="<?php echo $symbol_right; ?>" id="input-symbol-right" class="form-control input-sm" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-decimal-place"><?php echo $entry_decimal_place; ?></label>
          <div class="col-sm-10">
            <input type="text" name="decimal_place" value="<?php echo $decimal_place; ?>" id="input-decimal-place" class="form-control input-sm" />
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-value"><?php echo $entry_value; ?></label>
          <div class="col-sm-10">
            <input type="text" name="value" value="<?php echo $value; ?>" id="input-value" class="form-control input-sm" />
		</div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
            		<div class="btn-group btn-group-sm" data-toggle="buttons">

  			<label class="btn btn-default<?php if ($status == 1) { ?> active<?php } ?>">
    				<i class="fa fa-check"></i> <input type="radio" name="status" value="1" <?php if ($status == 1) { ?>checked="checked"<?php } ?>> <?php echo $text_enabled; ?>
  			</label>
  			<label class="btn btn-default<?php if ($status == 0) { ?> active<?php } ?>">
    				<i class="fa fa-times"></i> <input type="radio" name="status" value="0" <?php if ($status == 0) { ?>checked="checked"<?php } ?>> <?php echo $text_disabled; ?>
  			</label>
		</div>
          </div>
        </div>
      </form>

</div>
<?php echo $footer; ?>