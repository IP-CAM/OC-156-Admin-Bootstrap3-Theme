<?php $this->language->load('common/footer'); ?>


<div class="span12">
    <div class="carousel-grid home brands">
        <div class="title-two"><div>&nbsp;</div><div><?php echo nl2br($this->language->get('text_manufacturer')); ?></div><div class="carousel-pager one"></div></div>
        <ul class="content-list">
        	<?php foreach ($banners as $banner) { ?>
	            <li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>"></a></li>
	        <?php } ?>
        </ul>
        <div class="carousel-prev">&lt;</div>
        <div class="carousel-next">&gt;</div>
    </div>
</div>