<div class="accordion-inner">
    <div class="left">
        <h6><?php echo $text_new_customer; ?></h6>
        <p><?php echo $text_checkout; ?></p>
        <ol>
            <li><label class="radio">
                <?php if ($account == 'register') { ?>
                    <input type="radio" name="account" value="register" id="register" checked="checked" />
                <?php } else { ?>
                    <input type="radio" name="account" value="register" id="register" />
                <?php } ?>
                <?php echo $text_register; ?>
            </label></li>
            <?php if ($guest_checkout) { ?>
                <li><label class="radio">
                    <?php if ($account == 'guest') { ?>
                        <input type="radio" name="account" value="guest" id="guest" checked="checked" />
                    <?php } else { ?>
                        <input type="radio" name="account" value="guest" id="guest" />
                    <?php } ?>
                    <?php echo $text_guest; ?>
                </label></li>
            <?php } ?>  
        </ol>
        <p><?php echo $text_register_account; ?></p>
        <a class="btn btn-primary" id="button-account"><?php echo $button_continue; ?></a>
    </div>
    <div class="right" id="login">
        <form action="#">
            <h6><?php echo $text_returning_customer; ?></h6>
            <p><?php echo $text_i_am_returning_customer; ?></p>
            <label><?php echo $entry_email; ?> <span class="required">*</span></label>
            <input type="email" name="email" value="" />
            <label><?php echo $entry_password; ?> <span class="required">*</span></label>
            <input type="password" name="password" value="" />
            <div class="clearfix"></div>
            <a class="btn btn-primary" id="button-login"><?php echo $button_login; ?></a>
            <a href="<?php echo $forgotten; ?>" class="forgot"><?php echo $text_forgotten; ?></a>
        </form>
    </div>
    <div class="clearfix"></div>
</div>