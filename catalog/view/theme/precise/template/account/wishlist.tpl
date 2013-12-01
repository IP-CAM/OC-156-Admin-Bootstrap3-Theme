<?php echo $header; ?>
<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
    <div class="header-six-box <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; ?>">
    </div>
</div>
<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
    <ul class="breadcrumb container-box">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
            <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
    </ul>
</div>
<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
    <div class="container entry-content">
        <div id="notification"></div>
        <?php if ($success) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-success"><?php echo $success; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span12">
                <h1 class="page-title"><?php echo $heading_title; ?></h1>
            </div>
        </div>

        <?php if ($products) { ?>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th class="image"><?php echo $column_image; ?></th>
                        <th class="name"><?php echo $column_name; ?></th>
                        <th class="model"><?php echo $column_model; ?></th>
                        <th class="stock"><?php echo $column_stock; ?></th>
                        <th class="price"><?php echo $column_price; ?></th>
                        <th class="action"><?php echo $column_action; ?></th>
                    </tr>
                </thead>
                <tbody id="wishlist-row<?php echo $product['product_id']; ?>">
                    <?php foreach ($products as $product) { ?>
                        <tr class="prd-list">
                            <td class="image">
                                <?php if ($product['thumb']) { ?>
                                    <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" /></a>
                                <?php } ?>
                            </td>
                            <td class="name prd-list-name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></td>
                            <td class="model"><?php echo $product['model']; ?></td>
                            <td class="stock"><?php echo $product['stock']; ?></td>
                            <td class="price">
                                <?php if ($product['price']) { ?>
                                    <div class="price">
                                        <?php if (!$product['special']) { ?>
                                            <span class="price-new"><?php echo $product['price']; ?></span>
                                        <?php } else { ?>
                                            <span class="price-new"><?php echo $product['special']; ?></span>
                                            <span class="price-old"><?php echo $product['price']; ?></span>
                                        <?php } ?>
                                    </div>
                                <?php } ?>
                            </td>
                            <td class="action">
                                <i class="icon-shopping-cart" title="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" ></i>&nbsp;&nbsp;&nbsp;
                                <a href="<?php echo $product['remove']; ?>" title="<?php echo $button_remove; ?>" ><i class="icon-trash"></i></a>
                            </td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        <?php } else { ?>
            <div class="content"><?php echo $text_empty; ?></div>
        <?php } ?>

        <div class="clearfix"></div>
        <div class="buttons">
            <input type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $continue; ?>'"/>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>





  