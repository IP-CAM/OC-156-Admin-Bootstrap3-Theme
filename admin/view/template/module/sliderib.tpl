
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
        <button type="submit" form="form" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
        <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
      </div>
    <div class="clearfix"></div>
  </div>

            <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
                <div class="form-group">
                    <label><?php echo $entry_status; ?></label>
                    <select class="form-control input-sm" name="sliderib_status">
                        <?php if ($sliderib_status) { ?>
                            <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                            <option value="0"><?php echo $text_disabled; ?></option>
                        <?php } else { ?>
                            <option value="1"><?php echo $text_enabled; ?></option>
                            <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                        <?php } ?>
                    </select>
                </div>

                <table id="sliders" class="table table-hover">
                    <thead>
                        <tr>
                            <td class="left"><?php echo $sliderib_entry_text; ?></td>
                            <td class="left"><?php echo $sliderib_entry_button; ?></td>
                            <td class="left"><?php echo $sliderib_entry_link; ?></td>
                            <td class="left"><?php echo $sliderib_entry_order; ?></td>
                            <td class="left"><?php echo $sliderib_entry_image; ?></td>
                            <td></td>
                        </tr>
                    </thead>
                    <?php $slide_row = 0; ?>
                    <?php foreach ($this->data['sliderib'] as $slide) { ?>
                        <tbody id="slide_row<?php echo $slide_row; ?>">
                            <tr>
                                <td>

                                    <div class="form-group">
                                        <label><?php echo $sliderib_entry_text1; ?></label>
                                        <?php foreach ($languages as $language) { ?>
                                        <div class="input-group input-group-sm">
                                          <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                          <input class="form-control" type="text" name="sliderib[<?php echo $slide_row; ?>][text1][<?php echo $language['language_id']; ?>]" value="<?php echo $slide['text1'][$language['language_id']];?>" />
                                        </div>
                                        <?php } ?>
                                    </div>

                                    <div class="form-group">
                                        <label><?php echo $sliderib_entry_text2; ?></label>
                                        <?php foreach ($languages as $language) { ?>
                                        <div class="input-group input-group-sm">
                                          <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                          <input class="form-control" type="text" name="sliderib[<?php echo $slide_row; ?>][text2][<?php echo $language['language_id']; ?>]" value="<?php echo $slide['text2'][$language['language_id']];?>" />
                                        </div>
                                        <?php } ?>
                                    </div>

                                    <div class="form-group">
                                        <label><?php echo $sliderib_entry_text3; ?></label>
                                        <?php foreach ($languages as $language) { ?>
                                        <div class="input-group input-group-sm">
                                          <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                          <input class="form-control" type="text" name="sliderib[<?php echo $slide_row; ?>][text3][<?php echo $language['language_id']; ?>]" value="<?php echo $slide['text3'][$language['language_id']];?>" />
                                        </div>
                                        <?php } ?>
                                    </div>

                                </td>
                                <td>

                                    <div class="form-group">
                                        <label><?php echo $sliderib_entry_button1; ?></label>
                                        <?php foreach ($languages as $language) { ?>
                                        <div class="input-group input-group-sm">
                                          <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                          <input class="form-control" type="text" name="sliderib[<?php echo $slide_row; ?>][button1][<?php echo $language['language_id']; ?>]" value="<?php echo $slide['button1'][$language['language_id']];?>" />
                                        </div>
                                        <?php } ?>
                                    </div>

                                    <div class="form-group">
                                        <label><?php echo $sliderib_entry_button2; ?></label>
                                        <?php foreach ($languages as $language) { ?>
                                        <div class="input-group input-group-sm">
                                          <span class="input-group-addon"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /></span>
                                          <input class="form-control" type="text" name="sliderib[<?php echo $slide_row; ?>][button2][<?php echo $language['language_id']; ?>]" value="<?php echo $slide['button2'][$language['language_id']];?>" />
                                        </div>
                                        <?php } ?>
                                    </div>

                                </td>
                                <td>
                                    <br>
                                    <input class="form-control input-sm" type="text" name="sliderib[<?php echo $slide_row; ?>][link]" value="<?php echo $slide['link']; ?>" />
                                </td>
                                <td>
                                    <br>
                                    <input class="form-control input-sm" type="text" name="sliderib[<?php echo $slide_row; ?>][order]" value="<?php echo $slide['order']; ?>" />
                                </td>
                                <td>
                                    <br>

                                    <img src="<?php echo $slide['img']; ?>" alt="" class="img-thumbnail" id="thumb<?php echo $slide_row; ?>" />
                                    <input type="hidden" name="sliderib[<?php echo $slide_row; ?>][imgurl]" value="<?php echo $slide['imgurl']; ?>" id="image<?php echo $slide_row; ?>" />

            <div class="btn-group btn-group-xs">
              <button type="button" data-toggle="modal" data-target="#dialog" class="btn btn-primary" onclick="image_upload('image<?php echo $slide_row; ?>', 'thumb<?php echo $slide_row; ?>');"><span class="fa fa-pencil"></span> <?php echo $text_browse; ?></button>
              <button type="button" onclick="$('#thumb<?php echo $slide_row; ?>').attr('src', '<?php echo $no_image; ?>'); $('#image<?php echo $slide_row; ?>').attr('value', '');" class="btn btn-default"><span class="fa fa-trash-o"></span> <?php echo $text_clear; ?></button>
            </div>

                                </td>
                                <td>
                                    <br>
                                    <a onclick="$('#slide_row<?php echo $slide_row; ?>').remove();" class="btn btn-danger btn-sm"><?php echo $button_remove; ?></a>
                                </td>
                            </tr>
                        </tbody>
                        <?php $slide_row++; ?>
                    <?php } ?>
                    <tfoot>
                        <tr>
                            <td colspan="5"></td>
                            <td><a onclick="addImage();" class="btn btn-primary btn-sm"><i class="fa fa-plus-circle"></i> <?php echo $button_add_banner; ?></a></td>
                        </tr>
                    </tfoot>
                </table>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript"><!--
var slide_row = <?php echo $slide_row; ?>;

function addImage() {
    html  = '<tbody id="slide_row' + slide_row + '">';
    html += '<tr>';
    html += '<td class="left">';
    html +=     '<p><b><?php echo $sliderib_entry_text1; ?></b></p>';
    <?php foreach ($languages as $language) { ?>
        html += '<input class="form-control input-sm" type="text" name="sliderib[' + slide_row + '][text1][<?php echo $language['language_id']; ?>]" value="" />';
        html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php } ?>
    html +=     '<p><b><?php echo $sliderib_entry_text2; ?></b></p>';
    <?php foreach ($languages as $language) { ?>
        html += '<input class="form-control input-sm" type="text" name="sliderib[' + slide_row + '][text2][<?php echo $language['language_id']; ?>]" value="" />';
        html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php } ?>
    html +=     '<p><b><?php echo $sliderib_entry_text3; ?></b></p>';
    <?php foreach ($languages as $language) { ?>
        html += '<input class="form-control input-sm" type="text" name="sliderib[' + slide_row + '][text3][<?php echo $language['language_id']; ?>]" value="" />';
        html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php } ?>
    html += '</td>';

    html += '<td class="left">';
    html += '   <p><b><?php echo $sliderib_entry_button1; ?></b></p>';
    <?php foreach ($languages as $language) { ?>
        html += '<input class="form-control input-sm" type="text" name="sliderib[' + slide_row + '][button1][<?php echo $language['language_id']; ?>]" value="" />';
        html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php } ?>
    html += '   <p><b><?php echo $sliderib_entry_button2; ?></b></p>';
    <?php foreach ($languages as $language) { ?>
        html += '<input class="form-control input-sm" type="text" name="sliderib[' + slide_row + '][button2][<?php echo $language['language_id']; ?>]" value="" />';
        html += '<img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php } ?>
    html += '</td>';

    html += '<td class="left"><br /><input class="form-control input-sm" type="text" name="sliderib[' + slide_row + '][link]" value="" /></td>';
    html += '<td class="left"><br /><input class="form-control input-sm" type="text" name="sliderib[' + slide_row + '][order]" value="" /></td>';
    html += '<td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + slide_row + '" /><input type="hidden" name="sliderib[' + slide_row + '][imgurl]" value="<?php echo $no_image; ?>" id="image' + slide_row + '" /><br /><a onclick="image_upload(\'image' + slide_row + '\', \'thumb' + slide_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + slide_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + slide_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
    html += '<td class="left"><a onclick="$(\'#slide_row' + slide_row + '\').remove();" class="btn btn-danger btn-sm"><?php echo $button_remove; ?></a></td>';


    <?php //foreach ($languages as $language) { ?>
//    html += '<input type="text" name="banner_image[' + slide_row + '][banner_image_description][<?php echo $language['language_id']; ?>][title]" value="" /> <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />';
    <?php //} ?>
//    html += '</td>';    
//    html += '<td class="left"><input type="text" name="banner_image[' + slide_row + '][link]" value="" /></td>';    
//    html += '<td class="left"><div class="image"><img src="<?php echo $no_image; ?>" alt="" id="thumb' + slide_row + '" /><input type="hidden" name="banner_image[' + slide_row + '][image]" value="" id="image' + slide_row + '" /><br /><a onclick="image_upload(\'image' + slide_row + '\', \'thumb' + slide_row + '\');"><?php echo $text_browse; ?></a>&nbsp;&nbsp;|&nbsp;&nbsp;<a onclick="$(\'#thumb' + slide_row + '\').attr(\'src\', \'<?php echo $no_image; ?>\'); $(\'#image' + slide_row + '\').attr(\'value\', \'\');"><?php echo $text_clear; ?></a></div></td>';
//    html += '<td class="left"><a onclick="$(\'#image-row' + slide_row  + '\').remove();" class="button"><?php echo $button_remove; ?></a></td>';
    html += '</tr>';
    html += '</tbody>'; 
    
    $('#sliders tfoot').before(html);
    
    slide_row++;
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