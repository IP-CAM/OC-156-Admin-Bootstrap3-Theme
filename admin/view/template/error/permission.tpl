<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="page-header">
    <h1><i class="fa fa-warning"></i> <?php echo $heading_title; ?></h1>
  </div>

      <p class="text-center"><?php echo $text_permission; ?></p>

</div>
<?php echo $footer; ?>