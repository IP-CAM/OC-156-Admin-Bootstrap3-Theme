<div class="box">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="sidebar-list-products">
        <ul>
            <?php foreach ($products as $product) { ?>
                <li>
                    <div class="img-box">
                        <div class="img">
                            <?php if ($product['thumb']) { ?>
                                <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>"></a>
                            <?php } ?>
                        </div>
                    </div>
                    <div class="content">
                        <a href="<?php echo $product['href']; ?>" class="title"><?php echo $product['name']; ?></a>
                        <?php if ($product['rating']) { ?>
                            <div class="stars" style="background-position: <?php echo (100-20*$product['rating']); ?>%;"></div>
                        <?php } ?>
                        <div class="price">
                            <?php if ($product['price']) { ?>
                                <?php if (!$product['special']) { ?>
                                    <span class="price-new"><?php echo $product['price']; ?></span>
                                <?php } else { ?>
                                    <span class="price-old"><?php echo $product['price']; ?></span>
                                    <span class="price-new"><?php echo $product['special']; ?></span>
                                <?php } ?>    
                            <?php } ?>
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </li>
            <?php } ?>
        </ul>
    </div>
</div>