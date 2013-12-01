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
        <?php if ($error_warning) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error"><?php echo $error_warning; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span12">
                <h1 class="page-title"><?php echo $heading_title; ?></h1>
            </div>
        </div>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <h2><?php echo $text_your_details; ?></h2>

            <label><?php echo $entry_firstname; ?> <span class="required">*</span></label>
            <?php if ($error_firstname) { ?>
                <span class="text-error"><?php echo $error_firstname; ?></span><br />
            <?php } ?>
            <input type="text" name="firstname" value="<?php echo $firstname; ?>" />
            
            <label><?php echo $entry_lastname; ?> <span class="required">*</span></label>
            <?php if ($error_lastname) { ?>
                <span class="text-error"><?php echo $error_lastname; ?></span><br />
            <?php } ?>
            <input type="text" name="lastname" value="<?php echo $lastname; ?>" />
             
            <label><?php echo $entry_email; ?> <span class="required">*</span></label>
            <?php if ($error_email) { ?>
                <span class="text-error"><?php echo $error_email; ?></span><br />
            <?php } ?>
            <input type="text" name="email" value="<?php echo $email; ?>" />
            
            <label><?php echo $entry_telephone; ?> <span class="required">*</span></label>
            <?php if ($error_telephone) { ?>
                <span class="text-error"><?php echo $error_telephone; ?></span><br />
            <?php } ?>
            <input type="text" name="telephone" value="<?php echo $telephone; ?>" />
            
            <label><?php echo $entry_fax; ?></label>
            <input type="text" name="fax" value="<?php echo $fax; ?>" />

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





  