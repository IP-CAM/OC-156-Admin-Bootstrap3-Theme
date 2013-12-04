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
      <h1><i class="fa fa-puzzle-piece"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="pull-right">
      <button type="submit" form="form" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
      <a onclick="location = '<?php echo $cancel; ?>';" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
      
      <table id="module" class="table table-hover">
        <thead>
          <tr>
            <td>KeyWord(s) or Sentence </td>
            <td>Link / ToolTip Text</td>
            <td>Target</td>
            <td>Tooltip</td>
			<td></td>
          </tr>
        </thead>
        <?php $link_row = 0; ?>
        <?php if (isset($autolinks)) {foreach ($autolinks as $autolink) { ?>
        <tbody id="link-row<?php echo $link_row; ?>">
          <tr>
            <td><input type="text" name="autolinks[<?php echo $link_row; ?>][keyword]" value="<?php echo $autolink['keyword']; ?>" class="form-control input-sm"></td>
            <td><input type="text" name="autolinks[<?php echo $link_row; ?>][link]" value="<?php echo $autolink['link']; ?>" class="form-control input-sm"></td>
            <td>
				<select name="autolinks[<?php echo $link_row; ?>][target]">
                                <option value="" <?php if ($autolink['target'] == '') echo 'selected="selected"'; ?>></option>
                                <option value="_blank" <?php if ($autolink['target'] == '_blank') echo 'selected="selected"'; ?>>_blank</option>
                                <option value="_self" <?php if ($autolink['target'] == '_self') echo 'selected="selected"'; ?>>_self</option>
                                <option value="_parent" <?php if ($autolink['target'] == '_parent') echo 'selected="selected"'; ?>>_parent</option>
                                <option value="_top" <?php if ($autolink['target'] == '_top') echo 'selected="selected"'; ?>>_top</option>
                </select></td>
			<td>
				<?php if (isset($autolink['tooltip'])) { ?>
                <input type="checkbox" name="autolinks[<?php echo $link_row; ?>][tooltip]" value="1" checked="checked" />
                <?php } else { ?>
                <input type="checkbox" name="autolinks[<?php echo $link_row; ?>][tooltip]" value="1" />
                <?php } ?></td>
            <td><a onclick="$('#link-row<?php echo $link_row; ?>').remove();" class="btn btn-danger btn-sm">Remove</a></td>
          </tr>
        </tbody>
        <?php $link_row++; ?>
        <?php } }?>
        <tfoot>
          <tr>
            <td colspan="4"></td>
            <td><a onclick="addModule();" class="btn btn-primary btn-sm">Add Link</a></td>
          </tr>
        </tfoot>
      </table>
    </form>

</div>
<script type="text/javascript"><!--
var link_row = <?php echo $link_row; ?>;

function addModule() {	
	html  = '<tbody id="link-row' + link_row + '">';
	html += '  <tr>';
	html += '    <td><input type="text" name="autolinks[' + link_row + '][keyword]" value="" class="form-control input-sm"></td>';
	html += '    <td><input type="text" name="autolinks[' + link_row + '][link]" value="http://" class="form-control input-sm"></td>';
	html += '     <td>';
	html += '			<select name="autolinks[' + link_row + '][target]" class="form-control input-sm">';
    html += '                            <option value=""></option>';
    html += '                            <option value="_blank">_blank</option>';
    html += '                            <option value="_self">_self</option>';
    html += '                            <option value="_parent">_parent</option>';
    html += '                            <option value="_top">_top</option>';
    html += '            </select></td>';
    html += '    <td><input type="checkbox" name="autolinks[' + link_row + '][tooltip]" value="1" /></td>';
	html += '    <td><a onclick="$(\'#link-row' + link_row + '\').remove();" class="btn btn-danger btn-sm">Remove</a></td>';
	html += '  </tr>';
	html += '</tbody>';
	
	$('#module tfoot').before(html);
	
	link_row++;
}
//--></script>
<?php echo $footer; ?>