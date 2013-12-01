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
  <?php if ($success) { ?>
  <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="page-header">
    <div class="pull-left">
      <h1><i class="fa fa-list"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="pull-right">
        <a href="<?php echo $insert; ?>" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo $button_insert; ?></a>
        <div class="btn-group">
          <button type="button" class="btn btn-danger dropdown-toggle btn-sm" data-toggle="dropdown"><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?> <i class="fa fa-caret-down"></i></button>
          <ul class="dropdown-menu pull-right">
            <li><a onclick="$('#form-store').submit();"><?php echo $button_delete; ?></a></li>
          </ul>
        </div>
    </div>
    <div class="clearfix"></div>
  </div>

      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-store">
        <div class="table-responsive">
          <table class="table table-hover">
            <thead>
              <tr>
                <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                <td class="text-left"><?php echo $column_name; ?></td>
                <td class="text-left"><?php echo $column_url; ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($stores) { ?>
              <?php foreach ($stores as $store) { ?>
              <tr>
                <td class="text-center"><?php if ($store['selected']) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $store['store_id']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $store['store_id']; ?>" />
                  <?php } ?></td>
                <td class="text-left"><?php echo $store['name']; ?></td>
                <td class="text-left"><?php echo $store['url']; ?></td>
                <td class="text-right"><?php foreach ($store['action'] as $action) { ?>
                  <a href="<?php echo $action['href']; ?>" class="btn btn-default btn-xs"><i class="fa fa-edit"></i> <?php echo $action['text']; ?></a>
                  <?php } ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="text-center" colspan="4"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </form>

</div>
<?php echo $footer; ?> 