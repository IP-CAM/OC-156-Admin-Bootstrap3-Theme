<div class="accordion-inner">
    <?php if ($error_warning) { ?>
        <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error"><?php echo $error_warning; ?></span><i class="icon-remove icon-white"></i></div>
    <?php } ?>

    <?php if ($shipping_methods) { ?>
        <p><?php echo $text_shipping_method; ?></p>
        
        <?php foreach ($shipping_methods as $shipping_method) { ?>
            <label><?php echo $shipping_method['title']; ?></label>
            <?php if (!$shipping_method['error']) { ?>
                <?php foreach ($shipping_method['quote'] as $quote) { ?>
                    <label class="checkbox-form">
                        <?php if ($quote['code'] == $code || !$code) { ?>
                            <?php $code = $quote['code']; ?>
                            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" checked="checked" />
                        <?php } else { ?>
                            <input type="radio" name="shipping_method" value="<?php echo $quote['code']; ?>" id="<?php echo $quote['code']; ?>" />
                        <?php } ?>
                        <?php echo $quote['title']; ?> <?php echo $quote['text']; ?>
                    </label>
                <?php } ?>
            <?php } else { ?>
                <p><?php echo $shipping_method['error']; ?></p>
            <?php } ?>
        <?php } ?>
    <?php } ?>
    <label><?php echo $text_comments; ?></label>
    <textarea name="comment" rows="8" style="width: 98%;"><?php echo $comment; ?></textarea>
    <br /><br />
    <input type="button" value="<?php echo $button_continue; ?>" id="button-shipping-method" class="btn btn-primary">
</div>
<script type="text/javascript"><!--
    $('input').styler();
//--></script>