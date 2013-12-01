<div id="boxed" class="header-two-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>">
    <ul id="header-two">
        <?php foreach ($banners as $banner) { ?>
            <li>
                <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>">
                <div class="slider-border"><div class="border"></div></div>
                <div class="title">
                    <span>&nbsp;</span>
                    <h3><?php echo $banner['title']; ?></h3>
                    <div class="clearfix"></div>
                    
                    <div class="slider-button-box">
                        <div class="btn-ads-container">
                            <?php if ($banner['link']) { ?>
                                <a href="<?php echo $banner['link']; ?>" class="btn-ads">
                                <span class="flip-container">
                                    <span class="back">Only from $17</span>
                                    <span class="front">Buy Now</span>
                                </span>
                                </a>
                            <?php } ?>
                        </div>
                    </div>
                </div>
            </li>
        <?php } ?>
    </ul>
    <div class="header-two-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>-prev"></div>
    <div class="header-two-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>-next"></div>
    <div class="header-two-prev visible-desktop"></div>
    <div class="header-two-next visible-desktop"></div>
    <div class="header-two-pager"></div>
</div>