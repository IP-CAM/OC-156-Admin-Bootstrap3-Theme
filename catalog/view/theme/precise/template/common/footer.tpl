<?php

global $config_object, $language_object;
$config_object = $this->config;
$language_object = $this->language;

function get_ibconfs(array $keys){
    global $config_object;
    $confs = array();
    foreach ($keys as $k)
        $confs[$k] = $config_object->get('itembridge_' . $k);
    return $confs;
}

function get_ibi18n_conf($key){
    global $config_object, $language_object;
    return htmlspecialchars_decode($config_object->get('itembridge_' . $key . '_' . $language_object->get('code')));}

?>
    <footer class="site-container <?php $layout = $this->config->get('itembridge_main_layout'); if ($layout=='Boxed') echo 'boxed'; if ($layout=='Wide') echo 'wide'; $footer_style = $this->config->get('itembridge_footer_style'); if ($footer_style=='Dark') echo 'dark'; ?>">
      <div class="container <?php $footer_style = $this->config->get('itembridge_footer_style'); if ($footer_style=='Dark') echo 'dark'; ?>">
        <div class="row">
          <div class="span12">
            <div class="row">
                <div class="span9">
                    <div class="row">
                        <div class="span2">
                            <?php if ($informations) { ?>
                                <h4><?php echo $text_information; ?></h4>
                                <ul>
                                    <?php foreach ($informations as $information) { ?>
                                        <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
                                    <?php } ?>
                                </ul>
                            <?php } ?>
                        </div>
                        <div class="span2">
                            <h4><?php echo $text_service; ?></h4>
                            <ul>
                                <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
                                <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
                                <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
                            </ul>
                        </div>
                        <div class="span4 hidden-desktop clearfix"></div>
                        <div class="span2">
                            <h4><?php echo $text_extra; ?></h4>
                            <ul>
                                <li><a href="<?php echo $manufacturer; ?>"><?php echo $text_manufacturer; ?></a></li>
                                <li><a href="<?php echo $voucher; ?>"><?php echo $text_voucher; ?></a></li>
                                <li><a href="<?php echo $affiliate; ?>"><?php echo $text_affiliate; ?></a></li>
                                <li><a href="<?php echo $special; ?>"><?php echo $text_special; ?></a></li>
                            </ul>
                        </div>
                        <div class="span2">
                            <h4><?php echo $text_account; ?></h4>
                            <ul>
                                <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
                                <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
                                <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
                                <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="span3 block-right">
                        <?php echo get_ibi18n_conf('footer_social') ?>
                </div>
            </div>
         </div>
        </div>
      </div>
    </footer>
        <div class="container footer-second">
            <div class="row">
            <div class="span3">&copy; The Lovestory, 2013</div>
            <address class="span3 img adress"><?php echo nl2br($this->config->get('config_address')) ?></address>
            <div class="span3 img phone"><?php echo nl2br($this->config->get('config_telephone')) ?></div>
            <div class="span3 payments">
                <?php echo get_ibi18n_conf('footer_payments') ?>
            </div>
            </div>
        </div>
    </body>
</html>