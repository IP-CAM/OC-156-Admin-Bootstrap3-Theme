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
        <?php if(strpos($description, 'itembridge_include_html')) { ?>
            <?php $itembridge_path=explode('=',trim(strip_tags($description)));?>
            <?php echo file_get_contents($itembridge_path[1]); ?>
        <?php } else {?>
            <div class="row">
                <div class="span12">
                    <h1 class="page-title"><?php echo $heading_title; ?></h1>
                </div>
            </div>
            <div class="tooltip-container"><?php echo $description; ?>            
        <?php } ?>
        <?php echo $content_bottom; ?>
    </div>
</div>
<div class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; ?>">
    <div class="container newsletter-bottom-block">
        <div class="row">
            <div class="span12">
                <div class="image pull-left"></div>
                <div class="title pull-left">
                    <h4><?php echo str_replace('&nbsp;', '', get_ibi18n_conf('newsletter_title')) ?></h4>
                    <p><?php echo str_replace('&nbsp;', '', get_ibi18n_conf('newsletter_description')) ?></p>
                </div>
                <div class="form pull-left">
                    <button class="btn btn-primary" type="button" onclick="return location.href='index.php?route=account/newsletter'"><?php echo $button_continue; ?></button>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>