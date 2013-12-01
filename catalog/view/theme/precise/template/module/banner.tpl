<div class="box">
    <div class="sidebar-carousel">
        <div id="sidebar-baners">
            <?php foreach ($banners as $banner) { ?>
                <div>
                    <img src="<?php echo $banner['image']; ?>">
                    <h6 class="caption"><?php echo $banner['title']; ?></h6>
                </div>
            <?php } ?>    
        </div>
    </div>
    <div id="sidebar-baners-pager"></div>
</div>