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
            <?php echo $content_top; ?>
            <div class="span12">
                <h1 class="page-title"><?php echo $heading_title; ?></h1>
            </div>
        </div>
        <div class="row">
            <div class="span6 contact">
                <h3><?php echo $text_address; ?></h3>
                <address><?php echo $store; ?><br /><?php echo $address; ?></address>
                <hr>
                <?php if ($telephone) { ?>
                    <h3><?php echo $text_telephone; ?></h3>
                    <span><?php echo $telephone; ?></span><br>
                    <hr>
                <?php } ?>
                <?php if ($fax) { ?>
                    <h3><?php echo $text_fax; ?></h3>
                    <span><?php echo $fax; ?></span><br>
                    <hr>
                <?php } ?>
                <h3><?php echo $entry_email; ?></h3>
                <span><a href="mailto:<?php echo nl2br($this->config->get('config_email')) ?>"><?php echo nl2br($this->config->get('config_email')) ?></a></span><br>
            </div>
            <div class="span6 contact-form">
                <h2><?php echo $text_contact; ?></h2>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    
                    <label><?php echo $entry_name; ?> <span class="required">*</span></label>
                    <?php if ($error_name) { ?>
                        <span class="text-error"><?php echo $error_name; ?></span><br />
                    <?php } ?>
                    <input type="text" name="name" value="<?php echo $name; ?>" />
                    
                    <label><?php echo $entry_email; ?> <span class="required">*</span></label>
                    <?php if ($error_email) { ?>
                        <span class="text-error"><?php echo $error_email; ?></span><br />
                    <?php } ?>
                    <input type="email" name="email" value="<?php echo $email; ?>" />

                    <label><?php echo $entry_enquiry; ?> <span class="required">*</span></label>
                    <?php if ($error_enquiry) { ?>
                        <span class="text-error"><?php echo $error_enquiry; ?></span><br />
                    <?php } ?>
                    <textarea name="enquiry" cols="40" rows="10" style="width: 100%;"><?php echo $enquiry; ?></textarea>

                    <label><?php echo $entry_captcha; ?> <span class="required">*</span></label>
                    <?php if ($error_captcha) { ?>
                        <span class="text-error"><?php echo $error_captcha; ?></span><br />
                    <?php } ?>
                    <img src="index.php?route=information/contact/captcha" alt="" />
                    <input type="text" name="captcha" value="<?php echo $captcha; ?>" />

                    <div class="clearfix"></div>
                    <div class="buttons">
                        <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                    </div>
                </form>
            </div>
        </div>
        <div class="row">
            <div class="span12 map">
                <?php echo str_replace('&nbsp;', '', get_ibi18n_conf('contact_map')) ?>
            </div>
        </div>
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
                    <input type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary" onclick="return location.href='index.php?route=account/newsletter'"/>
                </div>
            </div>
        </div>
    </div>
</div>
<?php echo $footer; ?>