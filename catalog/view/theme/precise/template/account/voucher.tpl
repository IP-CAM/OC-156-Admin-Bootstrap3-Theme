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


        <p><?php echo $text_description; ?></p>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <div class="content span6 no-margin-left">
                <label><?php echo $entry_to_name; ?> <span class="required">*</span></label>
                <?php if ($error_to_name) { ?>
                    <span class="text-error"><?php echo $error_to_name; ?></span><br />
                <?php } ?>    
                <input type="text" name="to_name" value="<?php echo $to_name; ?>" />
              
                <label><?php echo $entry_to_email; ?> <span class="required">*</span></label>
                <?php if ($error_to_email) { ?>
                    <span class="text-error"><?php echo $error_to_email; ?></span><br />
                <?php } ?>
                <input type="text" name="to_email" value="<?php echo $to_email; ?>" />
            
                <label><?php echo $entry_from_name; ?> <span class="required">*</span></label>
                <?php if ($error_from_name) { ?>
                    <span class="text-error"><?php echo $error_from_name; ?></span><br />
                <?php } ?>
                <input type="text" name="from_name" value="<?php echo $from_name; ?>" />

                <label><?php echo $entry_from_email; ?> <span class="required">*</span></label>
                <?php if ($error_from_email) { ?>
                    <span class="text-error"><?php echo $error_from_email; ?></span><br />
                <?php } ?>
                <input type="text" name="from_email" value="<?php echo $from_email; ?>" />

                <label><?php echo $entry_theme; ?> <span class="required">*</span></label>
                <?php if ($error_theme) { ?>
                        <span class="text-error"><?php echo $error_theme; ?></span><br />
                <?php } ?>
                <?php foreach ($voucher_themes as $voucher_theme) { ?>
                    <?php if ($voucher_theme['voucher_theme_id'] == $voucher_theme_id) { ?>
                        <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" checked="checked" /> <?php echo $voucher_theme['name']; ?>
                    <?php } else { ?>
                        <input type="radio" name="voucher_theme_id" value="<?php echo $voucher_theme['voucher_theme_id']; ?>" id="voucher-<?php echo $voucher_theme['voucher_theme_id']; ?>" /> <?php echo $voucher_theme['name']; ?>
                    <?php } ?>
                    <br />
                <?php } ?>
                <br />
          
                <label><?php echo $entry_message; ?></label>
                <textarea name="message" cols="40" rows="5"><?php echo $message; ?></textarea>
          
                <label><?php echo $entry_amount; ?> <span class="required">*</span></label>
                <?php if ($error_amount) { ?>
                    <span class="text-error"><?php echo $error_amount; ?></span><br />
                <?php } ?>
                <input type="text" name="amount" value="<?php echo $amount; ?>" size="5" />

                <p><?php echo $text_agree; ?>
                <?php if ($agree) { ?>
                    <input type="checkbox" name="agree" value="1" checked="checked" />
                <?php } else { ?>
                    <input type="checkbox" name="agree" value="1" />
                <?php } ?>

                <div class="clearfix"></div>
                <div class="buttons">
                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                </div>
            </div>
        </form>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>