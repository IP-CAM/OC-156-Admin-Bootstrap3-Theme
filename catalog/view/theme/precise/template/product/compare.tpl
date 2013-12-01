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
            <div class="row">
                <div class="span12 compare-page">
                    <div class="table-box">
                        <table>
                            <thead>
                                <tr>
                                    <td></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td><a href="<?php echo $product['remove']; ?>" class="close">&nbsp;</a></td>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <th><?php echo $text_name; ?></th>
                                    <?php foreach ($products as $product) { ?>
                                        <th><a href="<?php echo $products[$product['product_id']]['href']; ?>"><?php echo $products[$product['product_id']]['name']; ?></a></th>
                                    <?php } ?>
                                </tr>
                            </thead>
                            <tbody>
                                <tr class="image">
                                    <th><?php echo $text_image; ?></th>
                                    <?php foreach ($products as $product) { ?>
                                    <td><?php if ($products[$product['product_id']]['thumb']) { ?>
                                        <a href="<?php echo $products[$product['product_id']]['href']; ?>"><img src="<?php echo $products[$product['product_id']]['thumb']; ?>" alt="<?php echo $products[$product['product_id']]['name']; ?>"></a>
                                      <?php } ?></td>
                                    <?php } ?>
                                </tr>
                                <tr class="price">
                                    <th><?php echo $text_price; ?></th>                                   
                                    <?php foreach ($products as $product) { ?>
                                        <td>
                                            <?php if ($products[$product['product_id']]['price']) { ?>
                                                <div class="price">
                                                <?php if (!$products[$product['product_id']]['special']) { ?>
                                                    <span class="price-new"><?php echo $products[$product['product_id']]['price']; ?></span>
                                                <?php } else { ?>
                                                    <span class="price-new"><?php echo $products[$product['product_id']]['special']; ?></span>
                                                    <span class="price-old"><?php echo $products[$product['product_id']]['price']; ?></span>
                                                <?php } ?>
                                                </div>
                                            <?php } ?>
                                        </td>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <th><?php echo $text_model; ?></th>
                                    <?php foreach ($products as $product) { ?>
                                        <td><?php echo $products[$product['product_id']]['model']; ?></td>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <th><?php echo $text_manufacturer; ?></th>
                                    <?php foreach ($products as $product) { ?>
                                        <td><?php echo $products[$product['product_id']]['manufacturer']; ?></td>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <th><?php echo $text_availability; ?></th>
                                    <?php foreach ($products as $product) { ?>
                                        <td><?php echo $products[$product['product_id']]['availability']; ?></td>
                                    <?php } ?>
                                </tr>
                                <?php if ($review_status) { ?>
                                    <tr class="rating">
                                        <th><?php echo $text_rating; ?></th>
                                        <?php foreach ($products as $product) { ?>
                                            <td>
                                                <div class="stars" title="<?php echo $text_rating; ?>" style="background-position: <?php echo (100-20*$products[$product['product_id']]['rating']); ?>%;"></div>
                                            </td>
                                        <?php } ?>
                                    </tr>
                                <?php } ?>
                                <tr class="description">
                                    <th><?php echo $text_summary; ?></th>
                                    <?php foreach ($products as $product) { ?>
                                        <td class="description"><?php echo $products[$product['product_id']]['description']; ?></td>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <th><?php echo $text_weight; ?></th>
                                    <?php foreach ($products as $product) { ?>
                                        <td><?php echo $products[$product['product_id']]['weight']; ?></td>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <th><?php echo $text_dimension; ?></th>
                                    <?php foreach ($products as $product) { ?>
                                        <td><?php echo $products[$product['product_id']]['length']; ?> x <?php echo $products[$product['product_id']]['width']; ?> x <?php echo $products[$product['product_id']]['height']; ?></td>
                                    <?php } ?>
                                </tr>

                                <?php foreach ($attribute_groups as $attribute_group) { ?>
                                    <tr>
                                        <th colspan="<?php echo count($products)+1;?>" style="text-align:center;"><?php echo $attribute_group['name']; ?></th>
                                        
                                    </tr>
                                    <?php foreach ($attribute_group['attribute'] as $key => $attribute) { ?>
                                        <tr>
                                            <th><?php echo $attribute['name']; ?></th>
                                            <?php foreach ($products as $product) { ?>
                                                <?php if (isset($products[$product['product_id']]['attribute'][$key])) { ?>
                                                    <td><?php echo $products[$product['product_id']]['attribute'][$key]; ?></td>
                                                <?php } else { ?>
                                                    <td></td>
                                                <?php } ?>
                                            <?php } ?>
                                        </tr>
                                    <?php } ?>
                                <?php } ?>
                                <tr class="button">
                                    <th></th>
                                    <?php foreach ($products as $product) { ?>
                                        <td><a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary btn-small"><?php echo $button_cart; ?></a></td>
                                    <?php } ?>
                                </tr>
                                <tr>
                                    <td></td>
                                    <?php foreach ($products as $product) { ?>
                                        <td><a href="<?php echo $product['remove']; ?>" class="close">&nbsp;</a></td>
                                    <?php } ?>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
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