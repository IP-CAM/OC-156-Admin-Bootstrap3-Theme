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
      <button type="submit" form="form-category" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
      <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-category" class="form-horizontal">
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
              <label class="col-sm-2 control-label" for="input-name<?php echo $language['language_id']; ?>"><?php echo $entry_name; ?></label>
              <div class="col-sm-10">
                <input type="text" name="category_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['name'] : ''; ?>" id="input-name<?php echo $language['language_id']; ?>" class="form-control input-sm">
                <?php if (isset($error_name[$language['language_id']])) { ?>
                <div class="text-danger"><?php echo $error_name[$language['language_id']]; ?></div>
                <?php } ?>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-meta-description<?php echo $language['language_id']; ?>"><?php echo $entry_meta_description; ?></label>
              <div class="col-sm-10">
                <textarea name="category_description[<?php echo $language['language_id']; ?>][meta_description]" rows="5" id="input-meta-description<?php echo $language['language_id']; ?>" class="form-control input-sm"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_description'] : ''; ?></textarea>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-meta-keyword<?php echo $language['language_id']; ?>"><?php echo $entry_meta_keyword; ?></label>
              <div class="col-sm-10">
                <input type="text" name="category_description[<?php echo $language['language_id']; ?>][meta_keyword]" rows="5" id="input-meta-keyword<?php echo $language['language_id']; ?>" value="<?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['meta_keyword'] : ''; ?>" class="form-control input-sm">
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-description<?php echo $language['language_id']; ?>"><?php echo $entry_description; ?></label>
              <div class="col-sm-10">
                <textarea name="category_description[<?php echo $language['language_id']; ?>][description]" id="input-description<?php echo $language['language_id']; ?>" class="form-control input-sm"><?php echo isset($category_description[$language['language_id']]) ? $category_description[$language['language_id']]['description'] : ''; ?></textarea>
              </div>
            </div>
          </div>
          <?php } ?>
        </div>
      </div>

      <div class="tab-pane" id="tab-data">
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-parent"><?php echo $entry_parent; ?></label>
          <div class="col-sm-10">
            <input type="text" name="path" value="<?php echo $path; ?>" id="input-parent" class="form-control input-sm">
            <input type="hidden" name="parent_id" value="<?php echo $parent_id; ?>">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-filter"><?php echo $entry_filter; ?></label>
          <div class="col-sm-10">
            <input type="text" name="filter" value="" id="input-filter" class="form-control input-sm">
            <ul id="category-filter" class="list-unstyled">
              <?php foreach ($category_filters as $category_filter) { ?>
              <li id="category-filter<?php echo $category_filter['filter_id']; ?>"><i class="fa fa-minus-circle"></i> <?php echo $category_filter['name']; ?>
                <input type="hidden" name="category_filter[]" value="<?php echo $category_filter['filter_id']; ?>">
              </li>
              <?php } ?>
            </ul>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_store; ?></label>
          <div class="col-sm-10">
            <div class="checkbox">
              <label>
                <?php if (in_array(0, $category_store)) { ?>
                <input type="checkbox" name="category_store[]" value="0" checked="checked">
                <?php echo $text_default; ?>
                <?php } else { ?>
                <input type="checkbox" name="category_store[]" value="0">
                <?php echo $text_default; ?>
                <?php } ?>
              </label>
            </div>
            <?php foreach ($stores as $store) { ?>
            <div class="checkbox">
              <label>
                <?php if (in_array($store['store_id'], $category_store)) { ?>
                <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>" checked="checked">
                <?php echo $store['name']; ?>
                <?php } else { ?>
                <input type="checkbox" name="category_store[]" value="<?php echo $store['store_id']; ?>">
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
			<div class="input-group">
			<span class="input-group-addon input-sm"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>"></span>
			<input type="text" name="keyword[<?php echo $language['language_id']; ?>]" value="<?php if (isset($keyword[$language['language_id']])) { echo $keyword[$language['language_id']]; } ?>" id="keyword-<?php echo $language['language_id']; ?>" class="form-control input-sm">
			</div>
			<?php } ?>
			
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_image; ?></label>
          <div class="col-sm-10"><img src="<?php echo $thumb; ?>" alt="" class="img-thumbnail" id="thumb">
            <input type="hidden" name="image" value="<?php echo $image; ?>" id="image">
            <div class="btn-group btn-group-sm">
              <button type="button" data-toggle="modal" data-target="#dialog" class="btn btn-primary btn-xs" onclick="image_upload('image', 'thumb');"><span class="fa fa-pencil"></span> <?php echo $text_browse; ?></button>
              <button type="button" onclick="$(this).parent().parent().find('img').attr('src', '<?php echo $no_image; ?>'); $(this).parent().parent().find('input').attr('value', '');" class="btn btn-default btn-xs"><span class="fa fa-trash-o"></span> <?php echo $text_clear; ?></button>
            </div>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-top"><?php echo $entry_top; ?></label>
          <div class="col-sm-10">
            <label class="checkbox">
              <?php if ($top) { ?>
              <input type="checkbox" name="top" value="1" checked="checked" id="input-top">
              <?php } else { ?>
              <input type="checkbox" name="top" value="1" id="input-top">
              <?php } ?>
            </label>
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-column"><?php echo $entry_column; ?></label>
          <div class="col-sm-10">
            <input type="text" name="column" value="<?php echo $column; ?>" id="input-column" class="form-control input-sm">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-sort-order"><?php echo $entry_sort_order; ?></label>
          <div class="col-sm-10">
            <input type="text" name="sort_order" value="<?php echo $sort_order; ?>" id="input-sort-order" class="form-control input-sm">
          </div>
        </div>
        <div class="form-group">
          <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
          <div class="col-sm-10">
            <div class="btn-group btn-group-sm" data-toggle="buttons">
              <label class="btn btn-default<?php if ($status == 1) { ?> active<?php } ?>">
                <i class="fa fa-check"></i> <input type="radio" name="status" value="1" id="input-status" <?php if ($status == 1) { ?>checked<?php } ?>> <?php echo $text_enabled; ?>
              </label>
              <label class="btn btn-default<?php if ($status == 0) { ?> active<?php } ?>">
                <i class="fa fa-times"></i> <input type="radio" name="status" value="0" id="input-status" <?php if ($status == 0) { ?>checked<?php } ?>> <?php echo $text_disabled; ?>
              </label>
            </div>
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
                <td><select name="category_layout[0][layout_id]" class="form-control input-sm">
                  <option value=""></option>
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if (isset($category_layout[0]) && $category_layout[0] == $layout['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
              </tr>
              <?php foreach ($stores as $store) { ?>
              <tr>
                <td><?php echo $store['name']; ?></td>
                <td><select name="category_layout[<?php echo $store['store_id']; ?>][layout_id]" class="form-control input-sm">
                  <option value=""></option>
                  <?php foreach ($layouts as $layout) { ?>
                  <?php if (isset($category_layout[$store['store_id']]) && $category_layout[$store['store_id']] == $layout['layout_id']) { ?>
                  <option value="<?php echo $layout['layout_id']; ?>" selected="selected"><?php echo $layout['name']; ?></option>
                  <?php } else { ?>
                  <option value="<?php echo $layout['layout_id']; ?>"><?php echo $layout['name']; ?></option>
                  <?php } ?>
                  <?php } ?>
                </select></td>
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
  $('input[name=\'path\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/category/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',			
        success: function(json) {
          json.unshift({
            'category_id': 0,
            'name': '<?php echo $text_none; ?>'
          });

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
      $('input[name=\'path\']').val(item['label']);
      $('input[name=\'parent_id\']').val(item['value']);
    }	
  });
</script> 
<script type="text/javascript">
  $('input[name=\'filter\']').autocomplete({
    'source': function(request, response) {
      $.ajax({
        url: 'index.php?route=catalog/filter/autocomplete&token=<?php echo $token; ?>&filter_name=' +  encodeURIComponent(request),
        dataType: 'json',			
        success: function(json) {
          response($.map(json, function(item) {
            return {
              label: item['name'],
              value: item['filter_id']
            }
          }));
        }
      });
    },
    'select': function(item) {
      $('input[name=\'filter\']').val('');
      $('#category-filter' + item['value']).remove();
      $('#category-filter').append('<div id="category-filter' + item['value'] + '"><i class="fa fa-minus-circle"></i> ' + item['label'] + '<input type="hidden" name="category_filter[]" value="' + item['value'] + '"></div>');
    }	
  });

  $('#category-filter').delegate('.fa-minus-circle', 'click', function() {
    $(this).parent().remove();
 });
</script> 
<div class="modal fade" id="dialog" data-field="" data-thumb="">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title"><?php echo $text_image_manager; ?></h4>
      </div>
      <div class="modal-body">
        <iframe id="fm-iframe" style="display:block; border:0; padding:0; margin:0; width:100%; height:360px; overflow:auto;"></iframe>
      </div>
      <div class="modal-footer">
        <a href="#" id="dialog-confirm" class="btn btn-success hide"><i class="fa fa-thumbs-up"></i> Confirm</a>
        <a href="#" class="btn btn-success" data-dismiss="modal" aria-hidden="true">Close</a>
      </div>
    </div>
  </div>
</div>

<link rel="stylesheet" href="view/javascript/bootstrap-tagsinput/bootstrap-tagsinput.css">
<script src="view/javascript/bootstrap-tagsinput/bootstrap-tagsinput.min.js"></script>

<script type="text/javascript">
  function image_upload(field, thumb) {
    $('#dialog').attr('data-field', field);
    $('#dialog').attr('data-thumb', thumb);
    $('#dialog #fm-iframe').attr('src', 'index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field));
  };
  $(document.body).on('show.bs.modal', '#dialog', function () {
    $(this).find('#dialog-confirm').addClass('hide');
  });
  $(document.body).on('hidden.bs.modal', '#dialog', function () {
    var field = $(this).attr('data-field');
    var thumb = $(this).attr('data-thumb');

    if ($('#' + field).attr('value')) {
      $.ajax({
        url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
        dataType: 'text',
        success: function(data) {
          $('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '">');
        }
      });
    }
    $('#dialog').attr('data-field', '');
    $('#dialog').attr('data-thumb', '');
    $('#dialog #fm-iframe').attr('src', '');
  });
</script>
<script type="text/javascript">
  $("input#input-meta-description<?php echo $language['language_id']; ?>").val();
  $('#language a:first').tab('show');
</script> 
<?php echo $footer; ?>