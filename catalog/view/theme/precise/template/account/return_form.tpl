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
            <div class="span6 no-margin-left">
                <h3><?php echo $text_order; ?></h3>
                
                <label><?php echo $entry_firstname; ?> <span class="required">*</span></label>
                <?php if ($error_firstname) { ?>
                    <span class="text-error"><?php echo $error_firstname; ?></span><br />
                <?php } ?>
                <input type="text" name="firstname" value="<?php echo $firstname; ?>" class="large-field" />
            
                <label><?php echo $entry_lastname; ?> <span class="required">*</span></label>
                <?php if ($error_lastname) { ?>
                    <span class="text-error"><?php echo $error_lastname; ?></span><br />
                <?php } ?>
                <input type="text" name="lastname" value="<?php echo $lastname; ?>" class="large-field" />
            
                <label><?php echo $entry_email; ?> <span class="required">*</span></label>
                <?php if ($error_email) { ?>
                    <span class="text-error"><?php echo $error_email; ?></span><br />
                <?php } ?>
                <input type="text" name="email" value="<?php echo $email; ?>" class="large-field" />

                <label><?php echo $entry_telephone; ?> <span class="required">*</span></label>
                <?php if ($error_telephone) { ?>
                    <span class="text-error"><?php echo $error_telephone; ?></span><br />
                <?php } ?>    
                <input type="text" name="telephone" value="<?php echo $telephone; ?>" class="large-field" />
                    
                <label><?php echo $entry_order_id; ?> <span class="required">*</span></label>
                <?php if ($error_order_id) { ?>
                    <span class="text-error"><?php echo $error_order_id; ?></span><br />
                <?php } ?>
                <input type="text" name="order_id" value="<?php echo $order_id; ?>" class="large-field" />

                <label><?php echo $entry_date_ordered; ?></label>
                <input type="text" name="date_ordered" value="<?php echo $date_ordered; ?>" class="large-field date" />
            </div>
            <div class="span6 no-margin-left">
                <h3><?php echo $text_product; ?></h3>
                <label><?php echo $entry_product; ?> <span class="required">*</span></label>
                <?php if ($error_product) { ?>
                    <span class="text-error"><?php echo $error_product; ?></span><br />
                <?php } ?>
                <input type="text" name="product" value="<?php echo $product; ?>" />
                
                <label><?php echo $entry_model; ?> <span class="required">*</span></label>
                <?php if ($error_model) { ?>
                    <span class="text-error"><?php echo $error_model; ?></span><br />
                <?php } ?>
                <input type="text" name="model" value="<?php echo $model; ?>" />
               
                <label><?php echo $entry_quantity; ?></label>
                <input type="text" name="quantity" value="<?php echo $quantity; ?>" />
                
                <label><?php echo $entry_reason; ?> <span class="required">*</span></label>
                <?php if ($error_reason) { ?>
                    <span class="text-error"><?php echo $error_reason; ?></span><br />
                <?php } ?>
                <?php foreach ($return_reasons as $return_reason) { ?>
                    <?php if ($return_reason['return_reason_id'] == $return_reason_id) { ?>
                        <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" checked="checked" /><span><?php echo $return_reason['name']; ?></span><br />
                    <?php } else { ?>
                        <input type="radio" name="return_reason_id" value="<?php echo $return_reason['return_reason_id']; ?>" id="return-reason-id<?php echo $return_reason['return_reason_id']; ?>" /><span><?php echo $return_reason['name']; ?></span><br />
                    <?php  } ?>
                <?php  } ?>
                <br />
                        
                <label><?php echo $entry_opened; ?></label>
                <?php if ($opened) { ?>
                    <input type="radio" name="opened" value="1" id="opened" checked="checked" />
                <?php } else { ?>
                    <input type="radio" name="opened" value="1" id="opened" />
                <?php } ?>
                <span><?php echo $text_yes; ?></span><br />
                <?php if (!$opened) { ?>
                    <input type="radio" name="opened" value="0" id="unopened" checked="checked" />
                <?php } else { ?>
                    <input type="radio" name="opened" value="0" id="unopened" />
                <?php } ?>
                <span><?php echo $text_no; ?></span><br /><br />
                
                <label><?php echo $entry_fault_detail; ?></label>
                <textarea name="comment" cols="150" rows="6"><?php echo $comment; ?></textarea>
            </div>
            <div class="span6 no-margin-left">      
                <label><?php echo $entry_captcha; ?> <span class="required">*</span></label>
                <?php if ($error_captcha) { ?>
                    <span class="text-error"><?php echo $error_captcha; ?></span><br />
                <?php } ?>
                <input type="text" name="captcha" value="<?php echo $captcha; ?>" style="width: 167px; vertical-align: baseline;" />
                <img src="index.php?route=account/return/captcha" alt="" />

                <?php if ($text_agree) { ?>
                    <p><?php echo $text_agree; ?>
                        <?php if ($agree) { ?>
                            <input type="checkbox" name="agree" value="1" checked="checked" />
                        <?php } else { ?>
                            <input type="checkbox" name="agree" value="1" />
                        <?php } ?>
                    </p>
                <?php } ?>
            
                <div class="clearfix"></div>
                <div class="buttons">
                    <input type="button" value="<?php echo $button_back; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $back; ?>'"/>
                    <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
                </div>
            </div>
        </form>
        <?php echo $content_bottom; ?>
    </div>
</div>
<script type="text/javascript"><!--
$(document).ready(function() {
    $('.date').datepicker({dateFormat: 'yy-mm-dd'});
});
//--></script>
<?php echo $footer; ?>