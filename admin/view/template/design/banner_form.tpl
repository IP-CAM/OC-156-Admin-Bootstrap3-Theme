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
        <button type="submit" form="form-banner" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-banner" class="form-horizontal">
        <div class="form-group required">
          <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
          <div class="col-sm-10">
            <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control input-sm" />
            <?php if ($error_name) { ?>
            <div class="text-danger"><?php echo $error_name; ?></div>
            <?php } ?>
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
	<div class="table-responsive">
        <table id="images" class="table table-hover">
          <thead>
            <tr>
              <td class="text-left" style="width: 30%"><?php echo $entry_title; ?></td>
              <td class="text-left" style="width: 30%"><?php echo $entry_link; ?></td>
              <td class="text-left"><?php echo $entry_image; ?></td>
              <td></td>
            </tr>
          </thead>

		<?php $image_row = 1; ?>
		<?php foreach ($banner_images as $banner_image) { ?>
		<tbody id="image-row<?php echo $image_row; ?>">
			<tr>
				<td class="text-left"><?php foreach ($languages as $language) { ?>
					<div class="input-group pull-left"> <span class="input-group-addon input-sm"> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> </span>
						<input type="text" name="banner_image[<?php echo $image_row; ?>][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="<?php echo isset($banner_image['banner_image_description'][$language['language_id']]) ? $banner_image['banner_image_description'][$language['language_id']]['title'] : ''; ?>" class="form-control input-sm" />
					</div>
                	<?php if (isset($error_banner_image[$image_row][$language['language_id']])) { ?>
                		<div class="text-danger"><?php echo $error_banner_image[$image_row][$language['language_id']]; ?></div>
                	<?php } ?>
                <?php } ?>
				</td>

              	<td class="text-left">
					<input type="text" name="banner_image[<?php echo $image_row; ?>][link]" value="<?php echo $banner_image['link']; ?>" class="form-control input-sm"/>
				</td>
				<td class="text-left">
					<img src="<?php echo $banner_image['thumb']; ?>" id="thumb<?php echo $image_row; ?>" class="img-thumbnail"/>
					<input type="hidden" name="banner_image[<?php echo $image_row; ?>][image]" value="<?php echo $banner_image['image']; ?>" id="image<?php echo $image_row; ?>" />
                    <br/>
					<div class="btn-group btn-group-sm">
						<button onclick="image_upload('image<?php echo $image_row; ?>', 'thumb<?php echo $image_row; ?>');" class="btn-primary btn" data-toggle="modal" data-target="#dialog"><i class="fa fa-edit"></i><?php echo $text_browse; ?></button> 
						<button class="btn btn-default" onclick="$('#thumb<?php echo $image_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $image_row; ?>').attr('value', '');"><i class="fa fa-trash-o"></i> <?php echo $text_clear; ?></button></div>
					</div>
				</td>
              <td class="text-left"><button type="button" onclick="$('#image-row<?php echo $image_row; ?>').remove();" class="btn btn-danger btn-sm"><i class="fa fa-minus-circle"></i> <?php echo $button_remove; ?></button></td>
            </tr>
          </tbody>
            <?php $image_row++; ?>
            <?php } ?>
          <tfoot>
            <tr>
              <td colspan="3"></td>
              <td class="text-left"><button type="button" onclick="addImage();" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i> <?php echo $button_add_banner; ?></button></td>
            </tr>
          </tfoot>
        </table>
	</div>
      </form>

</div>
<script type="text/javascript"><!--
var image_row = <?php echo $image_row; ?>;

function addImage() {
	html  = '<tbody id="image-row' + image_row + '">';
    html += '  <tr>';
    html += '  <td class="text-left">';
	<?php foreach ($languages as $language) { ?>
	html += '    <div class="input-group">';
	html += '      <span class="input-group-addon input-sm"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span><input type="text" name="banner_image[' + image_row + '][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="" class="form-control input-sm" />';
    html += '    </div>';
	<?php } ?>
	html += '  </td>';
	html += '  <td class="text-left"><input type="text" name="banner_image[' + image_row + '][link]" value=\"\" class="form-control input-sm" /></td>';	
	html += '  <td class="text-left"><img src="<?php echo $no_image; ?>" alt="" class="img-thumbnail" id="thumb' + image_row + '"/><input type="hidden" name="banner_image[' + image_row + '][image]" value="" id="image' + image_row + '"/>';
	html += '  <br /><div class="btn-group btn-group-sm"><button type="button" data-toggle="modal" data-target="#dialog" class="btn btn-primary" onclick="image_upload(\'image' + image_row + '\', \'thumb' + image_row + '\');"><span class="fa fa-pencil"></span> <?php echo $text_browse; ?></button><button class="btn btn-default" onclick="$(\'#thumb' + image_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + image_row + '\').attr(\'value\', \'\');return false"><span class="fa fa-trash-o"></span> <?php echo $button_remove; ?></button></div></td>';
	html += '  <td class="text-left"><button type="button" onclick="$(\'#image-row' + image_row  + '\').remove();" class="btn btn-danger btn-sm"><i class="fa fa-minus-circle"></i> <?php echo $button_remove; ?></button></td>';
	html += '</tr>';
	html += '</tbody>';
	
	/* $('#images tfoot').append(html);*/
	$('#images tfoot').before(html);
	
	image_row++;
}
//--></script> 
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
<?php echo $footer; ?>