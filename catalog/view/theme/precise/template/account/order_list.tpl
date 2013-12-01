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
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span12">
                <h1 class="page-title"><?php echo $heading_title; ?></h1>
            </div>
        </div>
        <?php if ($orders) { ?>
            <?php foreach ($orders as $order) { ?>
                <div class="order-list">
                    <div class="order-id"><b><?php echo $text_order_id; ?></b> #<?php echo $order['order_id']; ?></div>
                    <div class="order-status"><b><?php echo $text_status; ?></b> <?php echo $order['status']; ?></div>
                    <div class="order-content">
                        <div><b><?php echo $text_date_added; ?></b> <?php echo $order['date_added']; ?><br />
                            <b><?php echo $text_products; ?></b> <?php echo $order['products']; ?></div>
                        <div><b><?php echo $text_customer; ?></b> <?php echo $order['name']; ?><br />
                            <b><?php echo $text_total; ?></b> <?php echo $order['total']; ?></div>
                        <div class="order-info"><a href="<?php echo $order['href']; ?>"><i class="icon-list-alt" title="<?php echo $button_view; ?>" /></i></a>&nbsp;&nbsp;<a href="<?php echo $order['reorder']; ?>"><i class="icon-repeat" title="<?php echo $button_reorder; ?>" /></i></a></div>
                    </div>
                </div><hr />
            <?php } ?>
            <div class="pagination"><?php echo $pagination; ?></div>
        <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
        <?php } ?>
        <div class="clearfix"></div>
        <div class="buttons">
            <input type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $continue; ?>'"/>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>