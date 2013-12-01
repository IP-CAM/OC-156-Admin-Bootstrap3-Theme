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
        <?php if ($success) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-success"><?php echo $success; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php if ($error_warning) { ?>
            <div class="alert alert-info"><i class="ib-icon-horn icon-alert"></i><span class="text-error"><?php echo $error_warning; ?></span><i class="icon-remove icon-white"></i></div>
        <?php } ?>
        <?php echo $content_top; ?>
        <div class="row">
            <div class="span12">
                <h1 class="page-title"><?php echo $heading_title; ?></h1>
            </div>
        </div>

        <h2><?php echo $text_address_book; ?></h2>
        <?php foreach ($addresses as $result) { ?>
            <div class="content">
                <table style="width: 100%;" class="table-striped">
                    <tr>
                        <td><?php echo $result['address']; ?></td>
                        <td style="text-align: right;">
                            <input type="button" value="<?php echo $button_edit; ?>" class="btn btn-primary btn-mini" onclick="return location.href='<?php echo $result['update']; ?>'"/>
                            <input type="button" value="<?php echo $button_delete; ?>" class="btn btn-primary btn-mini" onclick="return location.href='<?php echo $result['delete']; ?>'"/>
                        </td>
                    </tr>
                </table>
            </div>
        <?php } ?>

        <div class="clearfix"></div>
        <div class="buttons">
            <input type="button" value="<?php echo $button_back; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $back; ?>'"/>
            <input type="button" value="<?php echo $button_new_address; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $insert; ?>'"/>
        </div>
        <?php echo $content_bottom; ?>
    </div>
</div>
<?php echo $footer; ?>