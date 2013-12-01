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
            <h3><?php echo $text_your_payment; ?></h3>

            <label><?php echo $entry_tax; ?></label>
            <input type="text" name="tax" value="<?php echo $tax; ?>" />

            <label><?php echo $entry_payment; ?></label>
            <?php if ($payment == 'cheque') { ?>
                <input type="radio" name="payment" value="cheque" id="cheque" checked="checked" />
            <?php } else { ?>
                <input type="radio" name="payment" value="cheque" id="cheque" />
            <?php } ?><?php echo $text_cheque; ?><br />
            <?php if ($payment == 'paypal') { ?>
                <input type="radio" name="payment" value="paypal" id="paypal" checked="checked" />
            <?php } else { ?>
                <input type="radio" name="payment" value="paypal" id="paypal" />
            <?php } ?><?php echo $text_paypal; ?><br />
            <?php if ($payment == 'bank') { ?>
                <input type="radio" name="payment" value="bank" id="bank" checked="checked" />
            <?php } else { ?>
                <input type="radio" name="payment" value="bank" id="bank" />
            <?php } ?><?php echo $text_bank; ?><br /><br />
            <div id="payment-cheque" class="payment">
                <label><?php echo $entry_cheque; ?></label>
                <input type="text" name="cheque" value="<?php echo $cheque; ?>" />
            </div>    
            <div class="payment" id="payment-paypal">
                <label><?php echo $entry_paypal; ?></label>
                <input type="text" name="paypal" value="<?php echo $paypal; ?>" />
            </div>
            <div id="payment-bank" class="payment">
                <label><?php echo $entry_bank_name; ?></label>
                <input type="text" name="bank_name" value="<?php echo $bank_name; ?>" />

                <label><?php echo $entry_bank_branch_number; ?></label>
                <input type="text" name="bank_branch_number" value="<?php echo $bank_branch_number; ?>" />

                <label><?php echo $entry_bank_swift_code; ?></label>
                <input type="text" name="bank_swift_code" value="<?php echo $bank_swift_code; ?>" />

                <label><?php echo $entry_bank_account_name; ?></label>
                <input type="text" name="bank_account_name" value="<?php echo $bank_account_name; ?>" />

                <label><?php echo $entry_bank_account_number; ?></label>
                <input type="text" name="bank_account_number" value="<?php echo $bank_account_number; ?>" />
            </div>
            <div class="clearfix"></div>
            <div class="buttons">
                <input type="button" value="<?php echo $button_back; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $back; ?>'"/>
                <input type="submit" value="<?php echo $button_continue; ?>" class="btn btn-primary" />
            </div>
        </form>
        <?php echo $content_bottom; ?>
    </div>
</div>
<script type="text/javascript"><!--
$('input[name=\'payment\']').bind('change', function() {
    $('.payment').hide();
    $('#payment-' + this.value).show();
});
$('input[name=\'payment\']:checked').trigger('change');
//--></script>
<?php echo $footer; ?> 