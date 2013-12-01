<div class="accordion-inner">
    <?php if ($error_warning) { ?>
        <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error"><?php echo $error_warning; ?></span><i class="icon-remove icon-white"></i></div>
    <?php } ?>

    <?php if ($payment_methods) { ?>
        <p><?php echo $text_payment_method; ?></p>

        <?php foreach ($payment_methods as $payment_method) { ?>
            <label class="checkbox-form">
                <?php if ($payment_method['code'] == $code || !$code) { ?>
                    <?php $code = $payment_method['code']; ?>
                    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" checked="checked" />
                <?php } else { ?>
                    <input type="radio" name="payment_method" value="<?php echo $payment_method['code']; ?>" id="<?php echo $payment_method['code']; ?>" />
                <?php } ?>
                <?php echo $payment_method['title']; ?>
            </label>
        <?php } ?>
    <?php } ?>

    <label><?php echo $text_comments; ?></label>
    <textarea name="comment" rows="8" style="width: 98%;"><?php echo $comment; ?></textarea>
    <br />
    <?php if ($text_agree) { ?>
        <?php if ($agree) { ?>
            <input type="checkbox" name="agree" value="1" checked="checked" />
        <?php } else { ?>
            <input type="checkbox" name="agree" value="1" />
        <?php } ?>
        <?php echo $text_agree; ?>
    <?php } ?>
    <br /><br />
    <input type="button" value="<?php echo $button_continue; ?>" id="button-payment-method" class="btn btn-primary" />
</div>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});
$('input').styler();
//--></script> 