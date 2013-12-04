<?php echo $header; ?>
<script type="text/javascript">
function clearseo(data, link){						
	if (!confirm('Are you sure you want to delete ALL ' + data + '?\n\nA database backup is recommended! \n\nThis action will delete ALL ' + data + '!!!')) 
		{
			return false;
		}
		else 
		{
			location = link;
		}
	}
</script>
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
      <button type="submit" form="form" class="btn btn-success btn-sm"><i class="fa fa-check"></i> Save Parameters</button>
    </div>
    <div class="clearfix"></div>
  </div>

	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
		   <table class="table table-hover">
            <thead>
              <tr>
                <td>Extension</td>
				<td>About</td>
				<td>Parameters</td>
				<td class="text-right">Action</td>
              </tr>
            </thead>
            
			<tbody>
              <tr>
                <td><strong>SEO Images Generator</strong></td>
                <td><p>SEO Images Generator automatically generates product's image names from relevant words in product(%p) names.<br><br>
				<strong>Parameters</strong><br>
				You can add keywords from product's model(%m), sku(%s), upc(%u) or brand(%b).<br>
				Available Parameters: %p, %c, %m, %s and %u. Use them withat spaces or any other characters.<br>
				<strong>Example: %p%c%m%u</strong> - will generate seo image names from product name, category name, model and product's upc.<br>				
				<i>Before generating seo image names, if you have modified parameters, don't forget to save them using Save Parameters button.</i>	 </p>
				<p class="text-danger">A database and image folder <strong>backup is recommended</strong> before generating image seo names!</p>
				<p class="text-danger">If product images aren't displayed in modules or categories, Opencart may cache old file names. Try to clear Opencart's cache (delete the content of system/cache folder).</p>
				</td>
                <td><input type="text" name="seoimageparameters[keywords]" value="<?php echo $seoimageparameters['keywords'];?>" class="form-control input-sm"></td>
                <td class="text-right">
					<?php if (file_exists(DIR_APPLICATION.'rename_files.php')) { ?>
					<a onclick="location = 'rename_files.php?token=<?php echo $this->session->data['token']; ?>'" class="btn btn-default btn-sm">Generate</a>
					<?php } else { ?>
					<a onclick="alert('SEO Images Generator is not installed!\nYou can purchase SEO Images Generator from\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=5084\nor you can purchase the whole Opencart SEO Pack:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4653');" class="btn btn-default btn-sm">Generate</a>
					<?php } ?>
				</td>
              </tr>
            </tbody>
			
            
          </table>
	</form>
</div>
<?php echo $footer; ?>