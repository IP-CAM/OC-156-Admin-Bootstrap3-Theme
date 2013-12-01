<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="page-header">
    <div class="pull-left">
      <h1 class="text-danger"><i class="fa fa-warning"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="pull-right">
        <a href="<?php echo $clear; ?>" class="btn btn-default btn-sm"><i class="fa fa-eraser"></i> <?php echo $button_clear; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

  <textarea wrap="off" rows="15" readonly="readonly" class="form-control input-sm"><?php echo $log; ?></textarea>
</div>
<?php echo $footer; ?>