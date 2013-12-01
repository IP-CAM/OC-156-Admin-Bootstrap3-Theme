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

        <?php foreach ($downloads as $download) { ?>
            <div class="download-list">
                <div class="download-id"><b><?php echo $text_order; ?></b> <?php echo $download['order_id']; ?></div>
                <div class="download-status"><b><?php echo $text_size; ?></b> <?php echo $download['size']; ?></div>
                <div class="download-content">
                    <div><b><?php echo $text_name; ?></b> <?php echo $download['name']; ?><br />
                    <b><?php echo $text_date_added; ?></b> <?php echo $download['date_added']; ?></div>
                    <div><b><?php echo $text_remaining; ?></b> <?php echo $download['remaining']; ?></div>
                    <div class="download-info">
                        <?php if ($download['remaining'] > 0) { ?>
                            <a href="<?php echo $download['href']; ?>"><i class="icon-download" title="<?php echo $button_download; ?>"></i></a>
                        <?php } ?>
                    </div>
                </div>
            </div>
        <?php } ?>
        <div class="pagination"><?php echo $pagination; ?></div>
        <div class="clearfix"></div>
        <div class="buttons">
            <input type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $continue; ?>'"/>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>