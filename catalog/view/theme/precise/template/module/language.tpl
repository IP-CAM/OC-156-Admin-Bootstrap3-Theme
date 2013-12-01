<?php if (count($languages) > 1) { ?>
	<li class="dropdown">
  		<a data-toggle="dropdown"><?php echo $language_code; ?><span class="arrow"></span></a>
  		<ul class="dropdown-menu language">
    		<?php foreach ($languages as $language) { ?>
    			<li><a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $(this).parent().parent().next().submit();"><?php echo $language['name']; ?></a></li>
    		<?php } ?>
    	</ul>
	    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
	    	<input type="hidden" name="language_code" value="" />
	    	<input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
		</form>
	</li>
<?php } ?>
