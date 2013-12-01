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
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <h3><?php echo $text_password; ?></h3>
            <label><?php echo $entry_password; ?> <span class="required">*</span></label>
            <?php if ($error_password) { ?>
                <span class="text-error"><?php echo $error_password; ?></span><br />
            <?php } ?>
            <input type="password" name="password" value="<?php echo $password; ?>" />
            <label><?php echo $entry_confirm; ?> <span class="required">*</span></label>
            <?php if ($error_confirm) { ?>
                <span class="text-error"><?php echo $error_confirm; ?></span><br />
            <?php } ?>
            <input type="password" name="confirm" value="<?php echo $confirm; ?>" />
            <div class="clearfix"></div>
            <div class="buttons">
                <input type="button" value="<?php echo $button_back; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $back; ?>'"/>
                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
            </div>
        </form>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>