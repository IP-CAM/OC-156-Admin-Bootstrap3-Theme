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
        <?php if ($categories) { ?>
            <div class="manufacturer">
                <p>
                    <b><?php echo $text_index; ?></b>
                    <?php foreach ($categories as $category) { ?>
                        &nbsp;&nbsp;&nbsp;<a href="index.php?route=product/manufacturer#<?php echo $category['name']; ?>"><b><?php echo $category['name']; ?></b></a>
                    <?php } ?>
                </p>
                <?php foreach ($categories as $category) { ?>
                    <div class="manufacturer-list">
                        <div class="manufacturer-heading"><h4><?php echo $category['name']; ?></h4><a id="<?php echo $category['name']; ?>"></a></div>
                        <div class="manufacturer-content">
                            <?php if ($category['manufacturer']) { ?>
                                <?php for ($i = 0; $i < count($category['manufacturer']);) { ?>
                                    <ul>
                                        <?php $j = $i + ceil(count($category['manufacturer']) / 4); ?>
                                        <?php for (; $i < $j; $i++) { ?>
                                            <?php if (isset($category['manufacturer'][$i])) { ?>
                                                <li><a href="<?php echo $category['manufacturer'][$i]['href']; ?>"><?php echo $category['manufacturer'][$i]['name']; ?></a></li>
                                            <?php } ?>
                                        <?php } ?>
                                    </ul>
                                <?php } ?>
                            <?php } ?>
                        </div>
                    </div>
                <?php } ?>
            </div>
        <?php } else { ?>
            <p><?php echo $text_empty; ?></p>
            <div class="clearfix"></div>
            <div class="buttons">
                <input type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $continue; ?>'"/>
            </div>
        <?php } ?>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>