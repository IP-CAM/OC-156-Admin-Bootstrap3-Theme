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
      <h1>
        <i class="fa fa-list"></i>
        <?php echo $heading_title; ?>
      </h1>
    </div>
    <div class="pull-right"><a href="<?php echo $insert; ?>" class="btn btn-primary btn-sm"><i class="fa fa-plus"></i> <?php echo $button_insert; ?></a>
      <div class="btn-group btn-group-sm">
        <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-trash-o"></i> <?php echo $button_delete; ?> <i class="fa fa-caret-down"></i></button>
        <ul class="dropdown-menu pull-right">
          <li><a onclick="$('#form-filter').submit();"><?php echo $button_delete; ?></a></li>
        </ul>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>

      <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="form-filter">
        <div class="table-responsive">
          <table class="table table-hover">
            <thead>
              <tr>
                <td width="1" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                <td class="text-left"><?php if ($sort == 'fgd.name') { ?>
                  <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_group; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_name; ?>"><?php echo $column_group; ?></a>
                  <?php } ?></td>
                <td class="text-right"><?php if ($sort == 'fg.sort_order') { ?>
                  <a href="<?php echo $sort_sort_order; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_sort_order; ?></a>
                  <?php } else { ?>
                  <a href="<?php echo $sort_sort_order; ?>"><?php echo $column_sort_order; ?></a>
                  <?php } ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($filters) { ?>
              <?php foreach ($filters as $filter) { ?>
              <tr>
                <td class="text-center"><?php if ($filter['selected']) { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $filter['filter_group_id']; ?>" checked="checked" />
                  <?php } else { ?>
                  <input type="checkbox" name="selected[]" value="<?php echo $filter['filter_group_id']; ?>" />
                  <?php } ?></td>
                <td class="text-left"><?php echo $filter['name']; ?></td>
                <td class="text-right"><?php echo $filter['sort_order']; ?></td>
                <td class="text-right"><?php foreach ($filter['action'] as $action) { ?>
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
      <div class="text-center"><?php 
if ($pagination){
$str = $pagination;

$str1 = str_replace('<div class="links">', '<ul class="pagination">', $str);
$str2 = str_replace('</div>', '</ul>', $str1);
$str3 = str_replace('<a', '<li><a', $str2);
$str4 = str_replace('</a>', '</a></li>', $str3);
$str5 = str_replace('<b>', '<li class="active"><a>', $str4);
$str6 = str_replace('</b>', '<span class="sr-only">(current)</span></a></li>', $str5);
$str7 = str_replace('&gt;|', '<i class="fa fa-angle-double-right"></i>', $str6);
$str8 = str_replace('&gt;', '<i class="fa fa-angle-right"></i>', $str7);
$str9 = str_replace('|&lt;', '<i class="fa fa-angle-double-left"></i>', $str8);
$str10 = str_replace('&lt;', '<i class="fa fa-angle-left"></i>', $str9);
$str11 = str_replace('....', '<li class="disabled"><span>....</span></li>', $str10);
echo $str11; 
}
?></div>
</div>
<?php echo $footer; ?>