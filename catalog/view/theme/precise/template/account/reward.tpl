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

        <p><?php echo $text_total; ?><b> <?php echo $total; ?></b>.</p>
        <table class="list">
            <thead>
                <tr>
                    <th class="left"><?php echo $column_date_added; ?></th>
                    <th class="left"><?php echo $column_description; ?></th>
                    <th class="right"><?php echo $column_points; ?></th>
                </tr>
            </thead>
            <tbody>
                <?php if ($rewards) { ?>
                    <?php foreach ($rewards  as $reward) { ?>
                        <tr>
                            <td class="left"><?php echo $reward['date_added']; ?></td>
                            <td class="left"><?php if ($reward['order_id']) { ?>
                              <a href="<?php echo $reward['href']; ?>"><?php echo $reward['description']; ?></a>
                              <?php } else { ?>
                              <?php echo $reward['description']; ?>
                              <?php } ?></td>
                            <td class="right"><?php echo $reward['points']; ?></td>
                        </tr>
                    <?php } ?>
                <?php } else { ?>
                    <tr>
                        <td class="center" colspan="5"><?php echo $text_empty; ?></td>
                    </tr>
                <?php } ?>
            </tbody>
        </table>
        <div class="pagination"><?php echo $pagination; ?></div>
        <div class="clearfix"></div>
        <div class="buttons">
            <input type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $continue; ?>'"/>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>