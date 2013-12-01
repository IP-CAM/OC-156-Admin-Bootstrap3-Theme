<div class="carousel-grid home">
    <?/*<div class="title-two title-lg"><div>&nbsp;</div><div><?php echo $heading_title; ?></div><div class="carousel-pager one"></div></div>*/?>
    <div class="title-two"><div>&nbsp;</div><div>LoveStore рекомендует</div><div class="carousel-pager one"></div></div>
    <ul class="product-grid <?php $grid_style = $this->config->get('itembridge_grid_style'); if ($grid_style=='variant_2') echo 'two-vatiant'; ?>">
        <?php foreach ($products as $product) { ?>
            <li>
                <article>
                    <div class="border-top"></div>
                    <div class="border-left"></div>
                    <div class="border-right"></div>
                    <div class="border-bottom"></div>
                    <?php if ($product['thumb']) { 
                        $this->load->model('catalog/product');
                        $information_product = $this->model_catalog_product->getProduct($product['product_id']);
                        $image_size = getimagesize($this->config->get('config_url').'image/'.$information_product['image']);
                        $image_class = 'img-max-height';
                        if (($image_size[1]/$image_size[0]) >= (305/228)) {
                            $image_class = 'img-max-width';
                        };
                    ?>
                        <a href="<?php echo $product['href']; ?>"><img class="<?php echo $image_class; ?>" src="<?php echo $this->config->get('config_url').'image/'.$information_product['image']; ?>" alt="<?php echo $product['name']; ?>"></a>
                        <?php if ($product['special']) { ?>
                            <div class="label sale">&nbsp;</div>
                        <?php } ?>
                    <?php } ?>
                    <div class="product-caption">
                        <div class="price">
                            <?php if ($product['price']) { ?>
                                <span><?php echo $product['price']; ?></span>
                            <?php } ?>
                        </div>
                        <div class="inner">
                            <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
                            <div class="cart-button">
                                <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary">Add to cart</a>
                                <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="wishlist-link">Add to wishlist</a>
                                <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="compaire-link">Add to compare</a>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </article>
                <div class="product-bottom-title" style="display: <?php $grid_style = $this->config->get("itembridge_grid_style"); if ($grid_style=="variant_2") { echo "block";} else {echo "none";} ?>">
                    <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
                </div>
            </li>
        <?php } ?>
    </ul>
    <div class="carousel-prev">&lt;</div>
    <div class="carousel-next">&gt;</div>
</div>

<div class="box relative">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="sidebar-carousel">
        <ul id="baner-new" class="product-grid">
            <?php foreach ($products as $product) { ?>
                <li>
                    <article>
                        <div class="border-top"></div>
                        <div class="border-left"></div>
                        <div class="border-right"></div>
                        <?php if ($product['thumb']) { 
                        $this->load->model('catalog/product');
                        $information_product = $this->model_catalog_product->getProduct($product['product_id']);
                        $image_size = getimagesize($this->config->get('config_url').'image/'.$information_product['image']);
                        $image_class = 'img-max-height';
                        if (($image_size[1]/$image_size[0]) >= (305/228)) {
                            $image_class = 'img-max-width';
                        };
                    ?>
                        <a href="<?php echo $product['href']; ?>"><img class="<?php echo $image_class; ?>" src="<?php echo $this->config->get('config_url').'image/'.$information_product['image']; ?>" alt="<?php echo $product['name']; ?>"></a>
                        <?php if ($product['special']) { ?>
                            <div class="label sale">&nbsp;</div>
                        <?php } ?>
                    <?php } ?>
                        <div class="product-caption">
                            <div class="price">
                                <?php if ($product['price']) { ?>
                                    <span><?php echo $product['price']; ?></span>
                                <?php } ?>
                            </div>
                            <div class="inner">
                                <h3 class="title"><a href="<?php echo $product['href']; ?>" title="<?php echo $product['name']; ?>"><?php echo $product['name']; ?></a></h3>
                                <div class="cart-button">
                                    <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary">Add to cart</a>
                                    <a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="wishlist-link">Add to wishlist</a>
                                    <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="compaire-link">Add to compare</a>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                    </article>
                </li>
            <?php } ?>
        </ul>
    </div>
    <span class="baner-new-prev visible-desktop"></span>
    <span class="baner-new-next visible-desktop"></span>
    <div id="baner-new-pager"></div>
</div>