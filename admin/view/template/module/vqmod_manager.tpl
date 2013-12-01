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
      <a onclick="location = '<?php echo $cancel; ?>';" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

  <?php if ($vqmod_is_installed == true) { ?>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">

    <ul class="nav nav-tabs">
      <li class="active"><a href="#tab-scripts" data-toggle="tab"><?php echo $tab_scripts; ?></a></li>
      <li><a href="#tab-settings" data-toggle="tab"><?php echo $tab_settings; ?></a></li>
      <li><a href="#tab-error" data-toggle="tab"><?php echo $tab_error_log; ?></a></li>
      <li><a href="#tab-about" data-toggle="tab"><?php echo $tab_about; ?></a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane active" id="tab-scripts">

      <table class="table table-hover">
        <thead>
          <tr>
            <td class="text-left"><?php echo $column_file_name; ?> <small><em>(<?php echo $column_id; ?>)</em></small></td>
            <td class="text-center"><?php echo $column_version; ?></td>
            <td class="text-center"><?php echo $column_vqmver; ?></td>
            <td class="text-center"><?php echo $column_author; ?></td>
            <td class="text-center"><?php echo $column_status; ?></td>
            <td class="text-center"><?php echo $column_action; ?></td>
            <td class="text-center"><?php echo $column_delete; ?></td>
          </tr>
        </thead>
        <tbody>
          <?php if ($vqmods) { ?>
          <?php $class = 'row-odd'; ?>
          <?php foreach ($vqmods as $vqmod) { ?>
          <tr>
            <td class="text-left"><strong><?php echo $vqmod['file_name']; ?></strong><br /><div class="description"><?php echo $vqmod['id']; ?><br /><?php echo $vqmod['invalid_xml']; ?></div></td>
            <td class="text-center"><?php echo $vqmod['version']; ?></td>
            <td class="text-center"><?php echo $vqmod['vqmver']; ?></td>
            <td class="text-center"><?php echo $vqmod['author']; ?></td>
            <td class="text-center"><?php echo $vqmod['status'] ?></td>
            <td class="action"><?php foreach ($vqmod['action'] as $action) { ?>
              <a class="btn btn-info btn-xs" href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a>
            <?php } ?></td>
            <td class="action">
              <a class="btn btn-danger btn-xs" href="<?php echo $vqmod['delete'] ?>"><?php echo $text_delete; ?></a>
            </td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="text-center" colspan="7"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </tbody>
      </table>

      <div class="form-group">
          <label class="col-sm-2 control-label" for="input-parent"><?php echo $entry_upload; ?></label>
          <div class="col-sm-10">
            <input type="file" name="vqmod_file" /><input type="submit" name="upload" value="<?php echo $text_upload; ?>" />
          </div>
      </div>


    </div>
    <div class="tab-pane" id="tab-settings">


      <div class="form-group">
          <label class="col-sm-2 control-label" for="vqcache"><?php echo $entry_vqcache; ?><br /><small class="text-muted"><?php echo $text_vqcache_help; ?></small></label>
          <div class="col-sm-10">
             <select multiple="multiple" size="7" id="vqcache">
               <?php foreach ($vqcache as $vqcache_file) { ?>
                <option><?php echo $vqcache_file; ?></option>
               <?php } ?>
             </select><br />
             <a href="<?php echo $clear_vqcache; ?>" class="btn btn-default btn-sm"><span><?php echo $button_clear; ?></span></a>
             <?php if ($ziparchive) { ?>
             <a href="<?php echo $download_vqcache; ?>" class="btn btn-default btn-sm"><span><?php echo $button_vqcache_dump; ?></span></a>
             <?php } ?>
          </div>
      </div>

      <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_backup; ?></label>
          <div class="col-sm-10">
             <?php if ($ziparchive) { ?>
             <a href="<?php echo $download_scripts; ?>" class="btn btn-default btn-sm"><span><?php echo $button_backup; ?></span></a>
             <?php } else { ?>
             <?php echo $error_ziparchive; ?>
             <?php } ?>
          </div>
      </div>

      <div class="form-group">
          <label class="col-sm-2 control-label"><?php echo $entry_vqmod_path; ?></label>
          <div class="col-sm-10">
             <?php echo $vqmod_path; ?>
          </div>
      </div>

      <?php if ($vqmod_vars) { ?>
      <?php foreach ($vqmod_vars as $vqmod_var) { ?>
      <div class="form-group">
        <label class="col-sm-2 control-label"><?php echo $vqmod_var['setting']; ?></label>
        <div class="col-sm-10"><?php echo $vqmod_var['value']; ?></div>
      </div>
      <?php } ?>
      <?php } ?>

    </div>
    <div class="tab-pane" id="tab-error">

        <textarea rows="20" cols="160" id="error-log"><?php echo $log; ?></textarea>
      <?php if ($ziparchive) { ?><a href="<?php echo $download_log; ?>" class="btn btn-default btn-sm"><span><?php echo $button_download_log; ?></span></a><?php } ?> <a href="<?php echo $clear_log; ?>" class="btn btn-default btn-sm"><span><?php echo $button_clear; ?></span></a>

    </div>
    <div class="tab-pane" id="tab-about">
      <table class="table">
        <tr>
          <td><?php echo $entry_ext_version; ?></td>
          <td><?php echo $vqmod_manager_version; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_author; ?></td>
          <td><?php echo $vqmod_manager_author; ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_website; ?></td>
          <td><a class="about" href="http://opencarthelp.com" target="_blank">http://opencarthelp.com</a></td>
        </tr>
        <tr>
          <td><?php echo $entry_ext_store; ?></td>
          <td><a class="about" href="http://www.opencart.com/index.php?route=extension/extension/info&amp;extension_id=2969&amp;filter_username=rph" target="_blank">http://www.opencart.com/index.php?route=extension/extension/info&amp;extension_id=2969</a></td>
        </tr>
        <tr>
          <td><?php echo $entry_forum; ?></td>
          <td><a class="about" href="http://forum.opencart.com/viewtopic.php?t=36235" target="_blank">http://forum.opencart.com/viewtopic.php?t=36235</a></td>
        </tr>
        <tr>
          <td><?php echo $entry_license; ?></td>
          <td><a class="about" href="http://creativecommons.org/licenses/by-nc-sa/3.0/legalcode" target="_blank"><?php echo $vqmod_manager_license; ?></a></td>
        </tr>
      </table>
    </div>
    </div>
    </form>
  <?php } else { ?>
    <span><?php echo $vqmod_installation_error; ?></span>
  <?php } ?>

</div>
<script type="text/javascript">
$(document).ready(function(){
	// Confirm Delete
	$('a').click(function(){
		if ($(this).attr('href') != null && $(this).attr('href').indexOf('delete',1) != -1) {
			if (!confirm ('<?php echo $warning_vqmod_delete; ?>')) {
				return false;
			}
		}
	});

	// Confirm vqmod_opencart.xml Uninstall
	$('a').click(function(){
		if ($(this).attr('href') != null && $(this).attr('href').indexOf('vqmod_opencart',1) != -1 && $(this).attr('href').indexOf('uninstall',1) != -1) {
			if (!confirm ('<?php echo $warning_required_uninstall; ?>')) {
				return false;
			}
		}
	});

	// Confirm vqmod_opencart.xml Delete
	$('a').click(function(){
		if ($(this).attr('href') != null && $(this).attr('href').indexOf('vqmod_opencart',1) != -1 && $(this).attr('href').indexOf('delete',1) != -1) {
			if (!confirm ('<?php echo $warning_required_delete; ?>')) {
				return false;
			}
		}
	});
});
</script>
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script>
<?php echo $footer; ?>