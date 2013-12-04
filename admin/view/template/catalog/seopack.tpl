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
                <td><strong>Keywords Generator</strong></td>
                <td>
                	<p>
                		Keywords Generator generates meta keywords from relevant words from product(%p) and category(%c) names.<br><br>
						<strong>Parameters</strong><br>
						You can add keywords from product's model(%m), sku(%s), upc(%u) or brand(%b).<br>
						Available parameters: %p, %c, %m, %s and %u. Use them withat spaces or any other characters.<br>
						<strong>Example: %p%c%m%u</strong> - will generate keywords from product name, category name, model and product's upc.<br>				
						<i>Before generating keywords, if you have modified parameters, don't forget to save them using Save Parameters button.</i>
					</p>
				</td>
                <td><input type="text" name="parameters[keywords]" value="<?php echo $parameters['keywords'];?>" class="form-control input-sm"></td>
                <td class="text-right">
					<?php if (file_exists(DIR_APPLICATION.'keywords_generator.php')) { ?>
					<a onclick="location = 'keywords_generator.php?token=<?php echo $this->session->data['token']; ?>'" class="btn btn-default btn-sm">Generate</a>
					<?php } else { ?>
					<a onclick="alert('Keywords Generator is not installed!\nYou can purchase Keywords Generator from\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4281\nor you can purchase the whole Opencart SEO Pack:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4653');" class="btn btn-default btn-sm" style="background:lightgrey">Generate</a>
					<?php } ?>
				</td>
              </tr>

              <tr>
                <td><strong>Meta Description Generator</strong></td>
                <td><p> Meta Description Generator generates meta description for products using a pattern which is set in Parameters.<br>
				The default pattern is '%p - %f' which means product's name, followed by ' - ', followed by the first sentence from product's description.<br>
				<strong>Parameters</strong><br>
				The are available the following parameters and they will be replaced by their actual value: <strong>%p</strong> - product's name, <strong>%c</strong> - category's name, <strong>%m</strong> - model, <strong>%s</strong> - product's sku, <strong>%u</strong> - product's upc, <strong>%b</strong> - product's brand, <strong>%$</strong> - product's price and <strong>%f</strong> - the first sentence from product's description.<br>
				<strong>Example: %p (%m) - %f (by www.mysite.com)</strong> - will generate the following meta description for a product called 'iPod' with model = 'iPod4': <strong>iPod (iPod4) - The first sentence from iPod's description. (by www.mysite.com)</strong>.<br>				
				<i>Before generating meta descriptions, if you have modified parameters, don't forget to save them using Save Parameters button.</i>
				</p></td>
                <td><input type="text" name="parameters[metas]" value="<?php echo $parameters['metas'];?>" class="form-control input-sm"></td>
                <td class="text-right">
					<?php if (file_exists(DIR_APPLICATION.'meta_description_generator.php')) { ?>
					<a onclick="location = 'meta_description_generator.php?token=<?php echo $this->session->data['token']; ?>'" class="btn btn-default btn-sm">Generate</a>
					<?php } else { ?>
					<a onclick="alert('Meta Description Generator is not installed!\nYou can purchase Meta Description Generator from\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4283\nor you can purchase the whole Opencart SEO Pack:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4653');" class="btn btn-default btn-sm" style="background:lightgrey">Generate</a>
					<?php } ?>
				</td>				
              </tr>

              <tr>
                <td><strong>Tags Generator</strong></td>
                <td><p>Tag Generator generates product tags from relevant keywords from product(%p) and category(%c) names.<br><br>
				<strong>Parameters</strong><br>
				You can add tags from product's model(%m), sku(%s) upc(%u) or brand(%b).<br>
				Available parameters: %p, %c, %m, %s and %u. Use them withat spaces or any other characters.<br>
				<strong>Example: %p%c%m</strong> - will generate tags from product name, category name and model.<br>				
				<i>Before generating tags, if you have modified parameters, don't forget to save them using Save Parameters button.</i>	
				</p></td>
                <td><input type="text" name="parameters[tags]" value="<?php echo $parameters['tags'];?>" class="form-control input-sm"></td>
                <td class="text-right">
					<?php if (file_exists(DIR_APPLICATION.'tag_generator.php')) { ?>
					<a onclick="location = 'tag_generator.php?token=<?php echo $this->session->data['token']; ?>'" class="btn btn-default btn-sm">Generate</a>
					<?php } else { ?>
					<a onclick="alert('Tags Generator is not installed!\nYou can purchase Tags Generator from\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4165\nor you can purchase the whole Opencart SEO Pack:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4653');" class="btn btn-default btn-sm" style="background:lightgrey">Generate</a>
					<?php } ?>
				</td>
              </tr>

              <tr>
                <td><strong>Related Products Generator</strong></td>
                <td><p> Related Products Generator, based on a complex algorithm, is a powerful tool which generates up to 5 related product for each product.<br><br>
				<strong>Parameters</strong><br>
				You can change the default number (5) of related products in parameters field for Related Products Generator. <br>
				<i>Before generating related products, if you have modified parameters, don't forget to save them using Save Parameters button.</i>				
				</p></td>
				<td><input type="text" name="parameters[related]" value="<?php echo $parameters['related'];?>" class="form-control input-sm"></td>
                <td class="text-right">
					<?php if (file_exists(DIR_APPLICATION.'rp_generator.php')) { ?>
					<a onclick="location = 'rp_generator.php?token=<?php echo $this->session->data['token']; ?>'" class="btn btn-default btn-sm">Generate</a>
					<?php } else { ?>
					<a onclick="alert('Related Products Generator is not installed!\nYou can purchase Related Products Generator from\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4593\nor you can purchase the whole Opencart SEO Pack:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4653');" class="btn btn-default btn-sm" style="background:lightgrey">Generate</a>
					<?php } ?>					
				</td>
              </tr>

              <tr>
                <td><strong>SEO Urls Generator</strong></td>
                <td><p> SEO URLS Generator generates SEO URLS for products, categories, manufacturers and information. 
				<strong>Parameters</strong><br>
				You can change the default extension (.html) of generated urls. <br>
				<i>Before generating SEO URLs, if you have modified parameters, don't forget to save them using Save Parameters button.</i></p></td>
				<td><input type="text" name="parameters[ext]" value="<?php if (isset($parameters['ext'])) {echo $parameters['ext'];} ?>"  class="form-control input-sm"></td>
                <td class="text-right">
					<?php if ($seourls) { ?>
					<a onclick="location = '<?php echo $seourls; ?>'" class="btn btn-default btn-sm">Generate</a>
					<?php } else { ?>
					<a onclick="alert('SEO Urls Generator is not installed!\nYou can purchase the whole Opencart SEO Pack:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4653');" class="btn btn-default btn-sm" style="background:lightgrey">Generate</a>
					<?php } ?>					
				</td>
              </tr>
            </tbody>
            
			<tbody>
              <tr>
                <td><strong>SEO Friendly Urls Generator</strong></td>
                <td><p> SEO Friendly URLs Generator transforms non-SEO friendly links like:<br>
				<i>yoursite.com/index.php?route=account/login</i><br>
				into SEO friendly links:<br>
				<i>yoursite.com/login</i></p></td>
                <td class="text-right" colspan="2">
					<?php if ($friendlyurls) { ?>
					<a onclick="location = '<?php echo $friendlyurls; ?>'" class="btn btn-default btn-sm">Generate</a>
					<?php } else { ?>
					<a onclick="alert('SEO Friendly Urls Generator is not installed!\nYou can purchase the whole Opencart SEO Pack:\n http://www.opencart.com/index.php?route=extension/extension/info&extension_id=4653');" class="btn btn-default btn-sm" style="background:lightgrey">Generate</a>
					<?php } ?>					
				</td>
              </tr>
            </tbody>
            
            <tbody>
              <tr>
                <td><strong>Clear SEO</strong></td>
                <td>
					<p> With Clear SEO you can easily delete ALL:<br><br>
					- product tags<br>
					- meta descriptions<br>
					- meta keywords<br>
					- seo urls<br>
					- related products<br>
					<br>
					<span class="text-danger">A database backup is recommended before using Clear SEO, because you may lose SEO data!</span><br>
					</p></td>
                <td class="text-right" colspan="2">
					<p><a onclick="clearseo('Products Keywords', '<?php echo $clearkeywords; ?>');" class="btn btn-danger btn-sm">Clear Keywords</a></p>
					<p><a onclick="clearseo('Products Meta Descriptions', '<?php echo $clearmetas; ?>');" class="btn btn-danger btn-sm">Clear Meta Description</a></p>
					<p><a onclick="clearseo('Products Tags', '<?php echo $cleartags; ?>');" class="btn btn-danger btn-sm">Clear Tags</a></p>
					<p><a onclick="clearseo('SEO Urls', '<?php echo $clearurls; ?>');" class="btn btn-danger btn-sm">Clear SEO Urls</a></p>
					<p><a onclick="clearseo('Related Products', '<?php echo $clearproducts; ?>');" class="btn btn-danger btn-sm">Clear Related Products</a>
				</td>
              </tr>
            </tbody>
            
            
          </table>
	</form>

</div>
<?php echo $footer; ?>