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
        <div class="content span6 no-margin-left">
            <h2><?php echo $text_my_account; ?></h2>
            <a href="<?php echo $edit; ?>"><?php echo $text_edit; ?></a><br />
            <a href="<?php echo $password; ?>"><?php echo $text_password; ?></a><br />
            <a href="<?php echo $address; ?>"><?php echo $text_address; ?></a><br />
            <a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a><br /><br />
        </div>
        <div class="content span6 no-margin-left">
            <h2><?php echo $text_my_orders; ?></h2>
            <a href="<?php echo $order; ?>"><?php echo $text_order; ?></a><br />
            <a href="<?php echo $download; ?>"><?php echo $text_download; ?></a><br />
            <?php if ($reward) { ?>
                <a href="<?php echo $reward; ?>"><?php echo $text_reward; ?></a><br />
            <?php } ?>
            <a href="<?php echo $return; ?>"><?php echo $text_return; ?></a><br />
            <a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a><br /><br />
            <h2><?php echo $text_my_newsletter; ?></h2>
            <a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a><br />
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>