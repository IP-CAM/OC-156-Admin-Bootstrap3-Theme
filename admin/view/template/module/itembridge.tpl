<?php echo $header ?>

<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <?php if ($error_warning) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
    <button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>

  <div class="page-header">
    <div class="pull-left">
      <h1><i class="fa fa-puzzle-piece"></i> <?php echo $heading_title; ?></h1>
    </div>
    <div class="pull-right">
      <a onclick="$('#form').submit()" class="btn btn-success btn-sm"><i class="fa fa-check"></i> <?php echo $button_save ?></a>
      <a onclick="location.href = '<?php echo $cancel ?>'" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

  <form action="<?php echo $action ?>" method="post" enctype="multipart/form-data" id="form" class="form-horizontal">
    <ul class="nav nav-tabs">
      <li class="active"><a href="#home-page-tab" data-toggle="tab">Home Page</a></li>
      <li><a href="#footer-tab" data-toggle="tab">Footer</a></li>
      <li><a href="#contacts-tab" data-toggle="tab">Contacts</a></li>
      <li><a href="#colors-tab" data-toggle="tab">Customization</a></li>
      <li><a href="#localization-tab" data-toggle="tab">Localization</a></li>
      <li><a href="#header-tab" data-toggle="tab">Header</a></li>
    </ul>

    <div class="tab-content">
      <div class="tab-pane active" id="home-page-tab">

        <ul class="nav nav-tabs" id="home-language">
          <?php foreach ($languages as $language): ?>
            <li><a href="#home-language-<?php echo $language['code'] ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a></li>
          <?php endforeach ?>
        </ul>


        <div class="tab-content">
          <?php foreach ($languages as $language): ?>
            <div class="tab-pane" id="home-language-<?php echo $language['code'] ?>">

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_home_banners_<?php echo $language['code'] ?>"><?php echo $home_banners ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_home_banners_<?php echo $language['code'] ?>" id="itembridge_home_banners_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_home_banners_$language[code]"} ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_home_banners_2_<?php echo $language['code'] ?>"><?php echo $home_banners_2 ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_home_banners_2_<?php echo $language['code'] ?>" id="itembridge_home_banners_2_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_home_banners_2_$language[code]"} ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_home_about_<?php echo $language['code'] ?>"><?php echo $home_about ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_home_about_<?php echo $language['code'] ?>" id="itembridge_home_about_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_home_about_$language[code]"} ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_home_latest_news_<?php echo $language['code'] ?>"><?php echo $home_latest_news ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_home_latest_news_<?php echo $language['code'] ?>" id="itembridge_home_latest_news_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_home_latest_news_$language[code]"} ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_home_social_<?php echo $language['code'] ?>"><?php echo $home_social ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_home_social_<?php echo $language['code'] ?>" id="itembridge_home_social_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_home_social_$language[code]"} ?></textarea>
                </div>
              </div>

            </div>
          <?php endforeach ?>
        </div>
      </div>


      <div class="tab-pane" id="footer-tab">

        <ul class="nav nav-tabs" id="footer-language">
          <?php foreach ($languages as $language): ?>
            <li><a href="#footer-language-<?php echo $language['code'] ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a></li>
          <?php endforeach ?>
        </ul>

        <div class="tab-content">
          <?php foreach ($languages as $language): ?>
            <div class="tab-pane" id="footer-language-<?php echo $language['code'] ?>">

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_footer_payments_<?php echo $language['code'] ?>"><?php echo $footer_payments ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_footer_payments_<?php echo $language['code'] ?>" id="itembridge_footer_payments_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_footer_payments_$language[code]"} ?></textarea>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_footer_social_<?php echo $language['code'] ?>"><?php echo $footer_social ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_footer_social_<?php echo $language['code'] ?>" id="itembridge_footer_social_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_footer_social_$language[code]"} ?></textarea>
                </div>
              </div>

            </div>
          <?php endforeach ?>
        </div>
      </div>


      <div class="tab-pane" id="contacts-tab">

        <ul class="nav nav-tabs" id="contacts-language">
          <?php foreach ($languages as $language): ?>
            <li><a href="#contacts-language-<?php echo $language['code'] ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a></li>
          <?php endforeach ?>
        </ul>

        <div class="tab-content">
          <?php foreach ($languages as $language): ?>
            <div class="tab-pane" id="contacts-language-<?php echo $language['code'] ?>">

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_contact_map_<?php echo $language['code'] ?>"><?php echo $contact_map ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_contact_map_<?php echo $language['code'] ?>" id="itembridge_contact_map_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_contact_map_$language[code]"} ?></textarea>
                </div>
              </div>

            </div>
          <?php endforeach ?>
        </div>
      </div>


      <div class="tab-pane" id="colors-tab">

              <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                  <div class="checkbox">
                    <label>
                      <input type="checkbox" class="itembridge_enabled_setting_checkbox" <?php if($itembridge_enabled_setting == 1) { echo ' checked';}?>> <?php echo $text_enabled_setting; ?>
                      <input type="text" name="itembridge_enabled_setting" value="<?php echo $itembridge_enabled_setting ?>" class="itembridge_enabled_setting hidden">
                    </label>
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_main_color"><?php echo $main_color ?></label>
                <div class="col-sm-10">
                  <input id="itembridge_main_color" type="color" name="itembridge_main_color" value="<?php echo $itembridge_main_color ?>">
                  <br />
                  <br />
                  <input id="button_itembridge_main_color" type="button" value="<?php echo $text_default ?>" class="btn btn-default btn-sm">
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_main_pattern"><?php echo $main_pattern ?></label>
                <div class="col-sm-10">
                  <input id="itembridge_main_pattern" name="itembridge_main_pattern" type="hidden" value="<?php echo $itembridge_main_pattern ?>">
                  <input name="itembridge_main_color_default" type="hidden" value="<?php echo $itembridge_main_color_default ?>">
                  <div style="display:inline-block; width:330px;">
                    <?php foreach ($itembridge_main_pattern_array as $value) { ?>
                    <div class="pattern-scheme" style="display:inline-block; width: 20px; height: 20px; border: solid 1px #cccccc; float: left; margin-left: 10px; margin-bottom: 10px; box-shadow: inset 0 9px 0 rgba(255, 255, 255, .1); cursor: pointer; background: url('../<?php echo $value ?>');" data-pattern="<?php echo $value ?>"></div>
                    <?php } ?>
                  </div>
                  <div id="preview-pattern" style="vertical-align: top; display:inline-block; width:150px; height:150px; background: url('../<?php echo $itembridge_main_pattern ?>');">
                  </div>
                  <div style="display:inline-block; width:100%;">
                    <input id="button_itembridge_main_pattern" type="button" name="pattern_default" value="<?php echo $text_default ?>" class="btn btn-default btn-sm">
                  </div>
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_main_layout"><?php echo $main_layout ?></label>
                <div class="col-sm-10">
                  <input class="itembridge_main_layout" type="radio" name="itembridge_main_layout" value="<?php echo $text_standart; ?>"><?php echo $text_standart; ?><br />
                  <input class="itembridge_main_layout" type="radio" name="itembridge_main_layout" value="<?php echo $text_boxed; ?>"><?php echo $text_boxed; ?><br />
                  <input class="itembridge_main_layout" type="radio" name="itembridge_main_layout" value="<?php echo $text_wide; ?>"><?php echo $text_wide; ?><br />
                  <br />
                  <input id="button_itembridge_main_layout" type="button" value="<?php echo $text_default ?>" class="btn btn-default btn-sm">
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $footer_style ?></label>
                <div class="col-sm-10">
                  <input class="itembridge_footer_style" type="radio" name="itembridge_footer_style" value="<?php echo $text_footer_style_normal; ?>"><?php echo $text_footer_style_normal; ?><br />
                  <input class="itembridge_footer_style" type="radio" name="itembridge_footer_style" value="<?php echo $text_footer_style_dark; ?>"><?php echo $text_footer_style_dark; ?><br />
                  <br />
                  <input id="button_itembridge_footer_style" type="button" value="<?php echo $text_default ?>" class="btn btn-default btn-sm">
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $grid_style ?></label>
                <div class="col-sm-10">
                  <input class="itembridge_grid_style" type="radio" name="itembridge_grid_style" value="<?php echo $grid_style_normal; ?>"><?php echo $text_grid_style_normal; ?><br />
                  <input class="itembridge_grid_style" type="radio" name="itembridge_grid_style" value="<?php echo $grid_style_two; ?>"><?php echo $text_grid_style_two; ?><br />
                  <br />
                  <input id="button_itembridge_grid_style" type="button" value="<?php echo $text_default ?>" class="btn btn-default btn-sm">
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label"><?php echo $header_style ?></label>
                <div class="col-sm-10">              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="1"><?php echo $text_header_style_1; ?><br />
              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="2"><?php echo $text_header_style_2; ?><br />
              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="3"><?php echo $text_header_style_3; ?><br />
              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="4"><?php echo $text_header_style_4; ?><br />
              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="5"><?php echo $text_header_style_5; ?><br />
              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="6"><?php echo $text_header_style_6; ?><br />
              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="7"><?php echo $text_header_style_7; ?><br />
              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="8"><?php echo $text_header_style_8; ?><br />
              <input class="itembridge_header_style" type="radio" name="itembridge_header_style" value="9"><?php echo $text_header_style_9; ?><br />

              <div class="div_all_header" style="position: absolute; top: 0px; padding: 10px; left: 150px; width: 70%;">
                <div class="div_header_style_1" style="display: none;">
                  <div class="htabs">
                    <?php foreach ($languages as $language): ?>
                      <a href="#headerstyle-1-language-<?php echo $language['code'] ?>"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a>
                    <?php endforeach ?>
                  </div>
                  <?php foreach ($languages as $language): ?>
                    <div id="headerstyle-1-language-<?php echo $language['code'] ?>">
                      <table class="form">
                        <tr>
                          <td>
                            <textarea name="itembridge_headerstyle_1_<?php echo $language['code'] ?>" id="itembridge_headerstyle_1_<?php echo $language['code'] ?>" style="width: 100%; height: 200px;" style="width: 100%; height: 150px;"><?php echo ${"itembridge_headerstyle_1_$language[code]"} ?></textarea>
                          </td>
                        </tr>

                      </table>
                    </div>
                  <?php endforeach ?>
                </div>
                <div class="div_header_style_2" style="display: none;">

                </div>
                <div class="div_header_style_3" style="display: none;">

                </div>
                <div class="div_header_style_4" style="display: none;">
                  <div class="htabs">
                    <?php foreach ($languages as $language): ?>
                      <a href="#headerstyle-4-language-<?php echo $language['code'] ?>"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a>
                    <?php endforeach ?>
                  </div>
                  <?php foreach ($languages as $language): ?>
                    <div id="headerstyle-4-language-<?php echo $language['code'] ?>">
                      <table class="form">
                        <tr>
                          <td>
                            <textarea name="itembridge_headerstyle_4_<?php echo $language['code'] ?>" id="itembridge_headerstyle_4_<?php echo $language['code'] ?>" style="width: 100%; height: 200px;" style="width: 100%; height: 150px;"><?php echo ${"itembridge_headerstyle_4_$language[code]"} ?></textarea>
                          </td>
                        </tr>

                      </table>
                    </div>
                  <?php endforeach ?>
                </div>
                <div class="div_header_style_5" style="display: none;">
                  <div class="htabs">
                    <?php foreach ($languages as $language): ?>
                      <a href="#headerstyle-5-language-<?php echo $language['code'] ?>"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a>
                    <?php endforeach ?>
                  </div>
                  <?php foreach ($languages as $language): ?>
                    <div id="headerstyle-5-language-<?php echo $language['code'] ?>">
                      <table class="form">
                        <tr>
                          <td>
                            <textarea name="itembridge_headerstyle_5_<?php echo $language['code'] ?>" id="itembridge_headerstyle_5_<?php echo $language['code'] ?>" style="width: 100%; height: 200px;" style="width: 100%; height: 150px;"><?php echo ${"itembridge_headerstyle_5_$language[code]"} ?></textarea>
                          </td>
                        </tr>

                      </table>
                    </div>
                  <?php endforeach ?>
                </div>
                <div class="div_header_style_6" style="display: none;">
                  <div class="htabs">
                    <?php foreach ($languages as $language): ?>
                      <a href="#headerstyle-6-language-<?php echo $language['code'] ?>"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a>
                    <?php endforeach ?>
                  </div>
                  <?php foreach ($languages as $language): ?>
                    <div id="headerstyle-6-language-<?php echo $language['code'] ?>">
                      <table class="form">
                        <tr>
                          <td>
                            <textarea name="itembridge_headerstyle_6_<?php echo $language['code'] ?>" id="itembridge_headerstyle_6_<?php echo $language['code'] ?>" style="width: 100%; height: 200px;" style="width: 100%; height: 150px;"><?php echo ${"itembridge_headerstyle_6_$language[code]"} ?></textarea>
                          </td>
                        </tr>

                      </table>
                    </div>
                  <?php endforeach ?>
                </div>
                <div class="div_header_style_7" style="display: none;">
                  <div class="htabs">
                    <?php foreach ($languages as $language): ?>
                      <a href="#headerstyle-7-language-<?php echo $language['code'] ?>"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a>
                    <?php endforeach ?>
                  </div>
                  <?php foreach ($languages as $language): ?>
                    <div id="headerstyle-7-language-<?php echo $language['code'] ?>">
                      <table class="form">
                        <tr>
                          <td>
                            <textarea name="itembridge_headerstyle_7_<?php echo $language['code'] ?>" id="itembridge_headerstyle_7_<?php echo $language['code'] ?>" style="width: 100%; height: 200px;" style="width: 100%; height: 150px;"><?php echo ${"itembridge_headerstyle_7_$language[code]"} ?></textarea>
                          </td>
                        </tr>

                      </table>
                    </div>
                  <?php endforeach ?>
                </div>
                <div class="div_header_style_8" style="display: none;">
                  <div class="htabs">
                    <?php foreach ($languages as $language): ?>
                      <a href="#headerstyle-8-language-<?php echo $language['code'] ?>"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a>
                    <?php endforeach ?>
                  </div>
                  <?php foreach ($languages as $language): ?>
                    <div id="headerstyle-8-language-<?php echo $language['code'] ?>">
                      <table class="form">
                        <tr>
                          <td>
                            <textarea name="itembridge_headerstyle_8_<?php echo $language['code'] ?>" id="itembridge_headerstyle_8_<?php echo $language['code'] ?>" style="width: 100%; height: 200px;" style="width: 100%; height: 150px;"><?php echo ${"itembridge_headerstyle_8_$language[code]"} ?></textarea>
                          </td>
                        </tr>
                      </table>
                    </div>
                  <?php endforeach ?>
                </div>
                <div class="div_header_style_9" style="display: none;">
                  <div class="htabs">
                    <?php foreach ($languages as $language): ?>
                      <a href="#headerstyle-9-language-<?php echo $language['code'] ?>"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a>
                    <?php endforeach ?>
                  </div>
                  <?php foreach ($languages as $language): ?>
                    <div id="headerstyle-9-language-<?php echo $language['code'] ?>">
                      <table class="form">
                        <tr>
                          <td>
                            <textarea name="itembridge_headerstyle_9_<?php echo $language['code'] ?>" id="itembridge_headerstyle_9_<?php echo $language['code'] ?>" style="width: 100%; height: 200px;" style="width: 100%; height: 150px;"><?php echo ${"itembridge_headerstyle_9_$language[code]"} ?></textarea>
                          </td>
                        </tr>

                      </table>
                    </div>
                  <?php endforeach ?>
                </div>
              </div>
              <br />
              <input id="button_itembridge_header_style" type="button" value="<?php echo $text_default ?>" class="btn btn-default btn-sm">
                </div>
              </div>

      </div>


      <div class="tab-pane" id="localization-tab">

        <ul class="nav nav-tabs" id="localization-language">
          <?php foreach ($languages as $language): ?>
            <li><a href="#localization-language-<?php echo $language['code'] ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a></li>
          <?php endforeach ?>
        </ul>

        <div class="tab-content">
          <?php foreach ($languages as $language): ?>
            <div class="tab-pane" id="localization-language-<?php echo $language['code'] ?>">

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_newsletter_title_<?php echo $language['code'] ?>"><?php echo $newsletter_title ?></label>
                <div class="col-sm-10">
                  <input name="itembridge_newsletter_title_<?php echo $language['code'] ?>" id="itembridge_newsletter_title_<?php echo $language['code'] ?>" class="form-control input-sm" value="<?php echo ${"itembridge_newsletter_title_$language[code]"} ?>">
                </div>
              </div>

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_newsletter_description_<?php echo $language['code'] ?>"><?php echo $newsletter_description ?></label>
                <div class="col-sm-10">
                  <input name="itembridge_newsletter_description_<?php echo $language['code'] ?>" id="itembridge_newsletter_description_<?php echo $language['code'] ?>" class="form-control input-sm" value="<?php echo ${"itembridge_newsletter_description_$language[code]"} ?>">
                </div>
              </div>

            </div>
          <?php endforeach ?>
        </div>
      </div>


      <div class="tab-pane" id="header-tab">

        <ul class="nav nav-tabs" id="header-language">
          <?php foreach ($languages as $language): ?>
            <li><a href="#header-language-<?php echo $language['code'] ?>" data-toggle="tab"><img src="view/image/flags/<?php echo $language['image'] ?>" title="<?php echo $language['name'] ?>" /> <?php echo $language['name'] ?></a></li>
          <?php endforeach ?>
        </ul>

        <div class="tab-content">
          <?php foreach ($languages as $language): ?>
            <div class="tab-pane" id="header-language-<?php echo $language['code'] ?>">

              <div class="form-group">
                <label class="col-sm-2 control-label" for="itembridge_header_menu_<?php echo $language['code'] ?>"><?php echo $header_menu ?></label>
                <div class="col-sm-10">
                  <textarea name="itembridge_header_menu_<?php echo $language['code'] ?>" id="itembridge_header_menu_<?php echo $language['code'] ?>" class="form-control input-sm" rows="6"><?php echo ${"itembridge_header_menu_$language[code]"} ?></textarea>
                </div>
              </div>

            </div>
          <?php endforeach ?>
        </div>
      </div>


    </div>

  </form>

</div>


<script type="text/javascript" src="view/javascript/ckeditor/ckeditor.js"></script>

<script type="text/javascript">//<!--



  $('.itembridge_enabled_setting_checkbox').click(function () {
    if($(".itembridge_enabled_setting_checkbox").prop("checked")) {
      $(".itembridge_enabled_setting").attr('value','1');
    } else {
      $(".itembridge_enabled_setting").attr('value','0');
    }
  });


  $('#button_itembridge_main_color').click(function () {
    $('#itembridge_main_color').attr('value', '<?php echo $itembridge_main_color_default ?>');
  });

  $('.pattern-scheme').click(function () {
    $('.pattern-scheme').css('border-color','#cccccc');
    $(this).css('border-color','#c40a0a');
    $('#preview-pattern').css('background',$(this).css('background'));
    $('#itembridge_main_pattern').attr('value', $(this).attr('data-pattern'));
  });
  $('#button_itembridge_main_pattern').click(function () {
    $('#itembridge_main_pattern').attr('value', '<?php echo $itembridge_main_pattern_default ?>');
    $('#preview-pattern').css('background','url(../<?php echo $itembridge_main_pattern_default ?>)');
  });

  $('.itembridge_main_layout[value=<?php echo $itembridge_main_layout;?>]').attr('checked',true);
  $('#button_itembridge_main_layout').click(function () {
    $('.itembridge_main_layout[value=<?php echo $itembridge_main_layout_default;?>]').attr('checked',true);
  });

  $('.itembridge_footer_style[value=<?php echo $itembridge_footer_style;?>]').attr('checked',true);
  $('#button_itembridge_footer_style').click(function () {
    $('.itembridge_footer_style[value=<?php echo $itembridge_footer_style_default;?>]').attr('checked',true);
  });

  $('.itembridge_grid_style[value=<?php echo $itembridge_grid_style;?>]').attr('checked',true);
  $('#button_itembridge_grid_style').click(function () {
    $('.itembridge_grid_style[value=<?php echo $itembridge_grid_style_default;?>]').attr('checked',true);
  });

  $('.itembridge_header_style[value=<?php echo $itembridge_header_style;?>]').attr('checked',true);
  $('.div_header_style_<?php echo $itembridge_header_style;?>').css('display','block');
  $('#button_itembridge_header_style').click(function () {
    $('.itembridge_header_style[value=<?php echo $itembridge_header_style_default;?>]').attr('checked',true);
    $('.div_all_header > div').css('display','none');
    $('.div_header_style_<?php echo $itembridge_header_style_default;?>').css('display','block');
  });
  <?php for ($ind=1; $ind<10; $ind++) { ?>
    $('.itembridge_header_style[value=<?php echo $ind; ?>]').change(function(){ 
      if($(this).attr("checked")){
        $('.div_all_header > div').css('display','none');
        $('.div_header_style_<?php echo $ind; ?>').css('display','block');
      }
    });
    <?php } ?>



    //--></script>

<script type="text/javascript">//<!--

  <?php foreach ($languages as $language): ?>
  //setWysiwyg('itembridge_home_banners_<?php echo $language["code"] ?>');
  //setWysiwyg('itembridge_home_about_<?php echo $language["code"] ?>');
  //setWysiwyg('itembridge_home_latest_news_<?php echo $language["code"] ?>');
  //setWysiwyg('itembridge_home_social_<?php echo $language["code"] ?>');
  
  //setWysiwyg('itembridge_footer_payments_<?php echo $language["code"] ?>');
  //setWysiwyg('itembridge_footer_social_<?php echo $language["code"] ?>');
<?php endforeach ?>

function setWysiwyg(id)
{
  var file_browser_url = 'index.php?route=common/filemanager&token=<?php echo $this->session->data['token'] ?>';
  CKEDITOR.replace(id, {
    filebrowserBrowseUrl: file_browser_url,
    filebrowserImageBrowseUrl: file_browser_url,
    filebrowserFlashBrowseUrl: file_browser_url,
    filebrowserUploadUrl: file_browser_url,
    filebrowserImageUploadUrl: file_browser_url,
    filebrowserFlashUploadUrl: file_browser_url
  });
}
//--></script>
<script type="text/javascript"><!--
  $("input#input-keyword, input#input-meta-description<?php echo $language['code']; ?>").val();
  $('.tab-pane .nav-tabs').each(function () {
    $(this).find('a:first').tab('show')
  });
  //--></script> 

<?php echo $footer ?>