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


        <table class="list">
            <thead>
                <tr>
                    <th class="left" colspan="2"><?php echo $text_return_detail; ?></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="left" style="width: 50%;"><b><?php echo $text_return_id; ?></b> #<?php echo $return_id; ?><br />
                        <b><?php echo $text_date_added; ?></b> <?php echo $date_added; ?></td>
                    <td class="left" style="width: 50%;"><b><?php echo $text_order_id; ?></b> #<?php echo $order_id; ?><br />
                    <b><?php echo $text_date_ordered; ?></b> <?php echo $date_ordered; ?></td>
                </tr>
            </tbody>
        </table>
        <h3><?php echo $text_product; ?></h3>
        <table class="list">
            <thead>
                <tr>
                    <th class="left" style="width: 33.3%;"><?php echo $column_product; ?></th>
                    <th class="left" style="width: 33.3%;"><?php echo $column_model; ?></th>
                    <th class="right" style="width: 33.3%;"><?php echo $column_quantity; ?></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="left"><?php echo $product; ?></td>
                    <td class="left"><?php echo $model; ?></td>
                    <td class="right"><?php echo $quantity; ?></td>
                </tr>
            </tbody>
        </table>
        <table class="list">
            <thead>
                <tr>
                    <th class="left" style="width: 33.3%;"><?php echo $column_reason; ?></th>
                    <th class="left" style="width: 33.3%;"><?php echo $column_opened; ?></th>
                    <th class="left" style="width: 33.3%;"><?php echo $column_action; ?></th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td class="left"><?php echo $reason; ?></td>
                    <td class="left"><?php echo $opened; ?></td>
                    <td class="left"><?php echo $action; ?></td>
                </tr>
            </tbody>
        </table>
        <?php if ($comment) { ?>
            <table class="list">
                <thead>
                    <tr>
                        <th class="left"><?php echo $text_comment; ?></th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td class="left"><?php echo $comment; ?></td>
                    </tr>
                </tbody>
            </table>
        <?php } ?>
        <?php if ($histories) { ?>
            <h2><?php echo $text_history; ?></h2>
            <table class="list">
                <thead>
                    <tr>
                        <th class="left" style="width: 33.3%;"><?php echo $column_date_added; ?></th>
                        <th class="left" style="width: 33.3%;"><?php echo $column_status; ?></th>
                        <th class="left" style="width: 33.3%;"><?php echo $column_comment; ?></th>
                    </tr>
                </thead>
                <tbody>
                    <?php foreach ($histories as $history) { ?>
                        <tr>
                            <td class="left"><?php echo $history['date_added']; ?></td>
                            <td class="left"><?php echo $history['status']; ?></td>
                            <td class="left"><?php echo $history['comment']; ?></td>
                        </tr>
                    <?php } ?>
                </tbody>
            </table>
        <?php } ?>
        <div class="clearfix"></div>
        <div class="buttons">
            <input type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $continue; ?>'"/>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>