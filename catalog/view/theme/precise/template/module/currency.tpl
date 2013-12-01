
<?php if (count($currencies) > 1) { ?>
    <li class="dropdown">
        <a href="#" data-toggle="dropdown"><?php echo $currency_code ?><span class="arrow"></span></a>
        <ul class="dropdown-menu currency">
            <?php foreach ($currencies as $currency) { ?>
                <li>
                    <?php if ($currency['code'] == $currency_code) { ?>
                        <?php if ($currency['symbol_left']) { ?>
                            <a title="<?php echo $currency['title']; ?>"><?php echo $currency['code']; ?></a>
                        <?php } else { ?>
                            <a title="<?php echo $currency['title']; ?>"><?php echo $currency['code']; ?></a>
                        <?php } ?>
                    <?php } else { ?>
                        <?php if ($currency['symbol_left']) { ?>
                            <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().next().submit();"><?php echo $currency['code']; ?></a>
                        <?php } else { ?>
                            <a title="<?php echo $currency['title']; ?>" onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $(this).parent().parent().next().submit();"><?php echo $currency['code']; ?></a>
                        <?php } ?>
                    <?php } ?>
                </li>
            <?php } ?>
        </ul>
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
            <input type="hidden" name="currency_code" value="" />
            <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" />
        </form>
    </li>
<?php } ?>
