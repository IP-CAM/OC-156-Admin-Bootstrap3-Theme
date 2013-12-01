<li id="cart" class="dropdown">
    <a href="<?php echo $cart; ?>" data-toggle="dropdown" id="cart-total"><?php $q_text=explode(" ",$text_items); echo trim($q_text[1]); ?><span class="arrow"></span></a>
    <div class="dropdown-menu">
        <?php if ($products || $vouchers) { ?>
            <?php foreach ($products as $product) { ?>
                <div class="clearfix">
                    <div class="mini-cart-img pull-left">
                        <a href="<?php echo $product['href']; ?>">
                            <?php if ($product['thumb']) { ?>
                                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
                            <?php } ?>
                        </a>
                    </div>
                    <div class="mini-cart-content pull-left">
                        <a href="<?php echo $product['href']; ?>" class="title"><?php echo $product['name']; ?></a>
                        <span><?php echo $product['quantity']; ?> x </span><span class="price"><?php echo $product['price']; ?></span>
                        <a class="close" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $product['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $product['key']; ?>' + ' #cart > *');" >&nbsp;</a>
                    </div>
                </div>
            <?php } ?>
            <?php foreach ($vouchers as $voucher) { ?>
                <div class="clearfix">
                    <div class="mini-cart-img pull-left">
                        <a href="<?php echo $product['href']; ?>">
                        </a>
                    </div>
                    <div class="mini-cart-content pull-left">
                        <a class="title"><?php echo $voucher['description']; ?></a>
                        <span>1 x </span><span class="price"><?php echo $voucher['amount']; ?></span>
                        <a class="close" onclick="(getURLVar('route') == 'checkout/cart' || getURLVar('route') == 'checkout/checkout') ? location = 'index.php?route=checkout/cart&remove=<?php echo $voucher['key']; ?>' : $('#cart').load('index.php?route=module/cart&remove=<?php echo $voucher['key']; ?>' + ' #cart > *');" >&nbsp;</a>
                    </div>
                </div>
            <?php } ?>
            <a href="<?php echo $cart; ?>" class="btn btn-primary">Моя корзина</a><a href="<?php echo $checkout; ?>" class="btn btn-info">Заказать</a>
        <?php } else { ?>
            <div class="empty"><?php echo $text_empty; ?></div>
        <?php } ?>
    </div>
</li>
