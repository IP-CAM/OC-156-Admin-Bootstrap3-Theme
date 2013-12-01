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
        <?php if ($error_warning) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error"><?php echo $error_warning; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span12">
                <h1 class="page-title"><?php echo $heading_title; ?></h1>
            </div>
        </div>
        <div class="row">
            <div class="span6 new-costumers">
                <h2><?php echo $text_new_customer; ?></h2>
                <p><?php echo $text_register_account; ?></p>
                <a href="<?php echo $register; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
            </div>
            <div class="span6 login">
                <h2><?php echo $text_returning_customer; ?></h2>
                <p><?php echo $text_i_am_returning_customer; ?></p>
                <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
                    <label><?php echo $entry_email; ?> <span class="required">*</span></label>
                    <input type="email" name="email" value="<?php echo $email; ?>" />
                    <label><?php echo $entry_password; ?> <span class="required">*</span></label>
                    <input type="password" name="password" value="<?php echo $password; ?>" />
                    <br /><br />
                    <input type="submit" value="<?php echo $button_login; ?>" class="btn btn-primary">
                    <a href="<?php echo $forgotten; ?>" class="forgot pull-right"><?php echo $text_forgotten; ?></a>
                    <div class="clearfix"></div>
                    <?php if ($redirect) { ?>
                        <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
                    <?php } ?>
                </form>
            </div>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
<?php echo $footer; ?>