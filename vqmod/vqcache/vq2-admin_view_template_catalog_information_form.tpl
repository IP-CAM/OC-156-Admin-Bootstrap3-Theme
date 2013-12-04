<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="alert alert-danger">
    <i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <div class="page-header">
    <div class="pull-left">
      <h1><i class="fa fa-edit"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="pull-right">
      <button type="submit" form="form-information" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
      <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-information" class="form-horizontal">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#tab-general" data-toggle="tab"><?php echo $tab_general; ?></a></li>
      <li><a href="#tab-data" data-toggle="tab"><?php echo $tab_data; ?></a></li>
      <li><a href="#tab-design" data-toggle="tab"><?php echo $tab_design; ?></a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tab-general">
        <ul class="nav nav-tabs" id="language">
          <?php foreach ($languages as $language) { ?>
          <li><a href="#language<?php echo $language['language_id']; ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"> <?php echo $language['name']; ?></a></li>
          <?php } ?>
        </ul>
        <div class="tab-content">
          <?php foreach ($languages as $language) { ?>
          <div class="tab-pane" id="language<?php echo $language['language_id']; ?>">
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-title<?php echo $language['language_id']; ?>"><?php echo $entry_title; ?></label>
              <div class="col-sm-10">
                <input type="text" name="information_description[<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['title'] : ''; ?>" id="input-title<?php echo $language['language_id']; ?>" class="form-control input-sm">
                <?php if (isset($error_title[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_title[$language['language_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group required">
              <label class="col-sm-2 control-label" for="input-description"><?php echo $entry_description; ?></label>
              <div class="col-sm-10">
                <textarea name="information_description[<?php echo $language['language_id']; ?>][description]" id="input-description<?php echo $language['language_id']; ?>" class="form-control input-sm"><?php echo isset($information_description[$language['language_id']]) ? $information_description[$language['language_id']]['description'] : ''; ?></textarea>
                <?php if (isset($error_description[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_description[$language['language_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>

      <div class="tab-pane" id="tab-data">
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
          <div class="col-sm-10">
            <div class="checkbox">
              <label>
                <?php if (in_array(0, $information_store)) { ?>
                <input type="checkbox" name="information_store[]" value="0" checked="checked">
                <?php echo $text_default; ?>
                <?php } else { ?>
                <input type="checkbox" name="information_store[]" value="0">
                <?php echo $text_default; ?>
                <?php } ?>
              </label>
            </div>
            <?php foreach ($stores as $store) { ?>
            <div class="checkbox">
              <label>
                <?php if (in_array($store['store_id'], $information_store)) { ?>
                <input type="checkbox" name="information_store[]" value="<?php echo $store['store_id']; ?>" checked="checked">
                <?php echo $store['name']; ?>
                <?php } else { ?>
                <input type="checkbox" name="information_store[]" value="<?php echo $store['store_id']; ?>">
                <?php echo $store['name']; ?>
                <?php } ?>
              </label>
            </div>
            <?php } ?>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-keyword"><?php echo $entry_keyword; ?></label>
          <div class="col-sm-10">
            
			<?php foreach ($languages as $language) { ?>
			<input type="text" name="keyword[<?php echo $language['language_id']; ?>]" value="<?php if (isset($keyword[$language['language_id']])) { echo $keyword[$language['language_id']]; } ?>" id="keyword-<?php echo $language['language_id']; ?>" class="form-control input-sm">
			<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"><br>
			<?php } ?>
			
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-bottom"><?php echo $entry_bottom; ?></label>
          <div class="col-sm-10">
            <label class="checkbox inline">
              <?php if ($bottom) { ?>
              <input type="checkbox" name="bottom" value="1" checked="checked" id="input-bottom">
              <?php } else { ?>
              <input type="checkbox" name="bottom" value="1" id="input-bottom">
              <?php } ?>
            </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
            <div class="btn-group btn-group-sm" data-toggle="buttons">
              <label class="btn btn-default<?php if ($status == 1) { ?> active<?php } ?>">
                <i class="fa fa-check"></i> <input type="radio" name="status" id="input-status" value="1" <?php if ($status == 1) { ?>checked<?php } ?>> <?php echo $text_enabled; ?>
              </label>
              <label class="btn btn-default<?php if ($status == 0) { ?> active<?php } ?>">
                <i class="fa fa-times"></i> <input type="radio" name="status" id="input-status" value="0" <?php if ($status == 0) { ?>checked<?php } ?>> <?php echo $text_disabled; ?>
              </label>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
          <div class="col-sm-10">
            <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" id="input-sort-order" class="form-control input-sm">
          </div>
        </div>
      </div>

      <div class="tab-pane" id="tab-design">
        <div class="table-responsive">
          <table class="table table-hover">
            <thead>
              <tr>
                <td><?php echo $entry_store; ?></td>
                <td><?php echo $entry_layout; ?></td>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td><?php echo $text_default; ?></td>
                <td>
                  <select name="information_layout[0][layout_id]" class="form-control input-sm">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($information_layout[0]) && $information_layout[0] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </td>
              </tr>
              <?php foreach ($stores as $store) { ?>
              <tr>
                <td><?php echo $store['name']; ?></td>
                <td>
                  <select name="information_layout[<?php echo $store['store_id']; ?>][layout_id]" class="form-control input-sm">
                    <option value=""></option>
                    <?php foreach ($layouts as $layout) { ?>
                    <?php if (isset($information_layout[$store['store_id']]) && $information_layout[$store['store_id']] == $layout['layout_id']) { ?>
                    <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                    <?php } else { ?>
                    <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                    <?php } ?>
                    <?php } ?>
                  </select>
                </td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </form>
</div>

<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script> 
<script type="text/javascript">
<?php foreach ($languages as $language) { ?>
  CKEDITOR.replace('input-description<?php echo $language['language_id']; ?>', {
    filebrowserBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashBrowseUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserImageUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>',
    filebrowserFlashUploadUrl: 'index.php?route=common/filemanager&token=<?php echo $token; ?>'
  });
<?php } ?>
</script> 
<script type="text/javascript">
  $('#language a:first').tab('show');
</script> 
<?php echo $footer; ?>