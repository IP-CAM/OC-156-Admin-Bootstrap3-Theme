<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <?php if ($error_warning) { ?>
  <div class="warning"><?php echo $error_warning; ?></div>
  <?php } ?>
  <div class="page-header">
    <div class="pull-left">
      <h1>
        <i class="fa fa-edit"></i>
        <?php echo $heading_title; ?>
      </h1>
    </div>
    <div class="pull-right">
      <button type="submit" form="form-information" class="btn btn-primary btn-sm"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
      <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-sm"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
    </div>
    <div class="clearfix"></div>
  </div>

      <form id="form" action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
          <table class="table table-hover">
              <tr>
                  <td><span class="required">*</span> <?php echo $entry_name ?></td>
                  <td>
                      <?php foreach ($languages as $language): ?>
                        <input name="profile_description[<?php echo $language['language_id']; ?>][name]" value="<?php echo isset($profile_description[$language['language_id']]) ? $profile_description[$language['language_id']]['name'] : ''; ?>" />
                        <img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /><br />
                        <?php if (isset($error_name[$language['language_id']])): ?>
                            <span class="error"><?php echo $error_name[$language['language_id']]; ?></span><br />
                        <?php endif; ?>
                      <?php endforeach; ?>
                  </td>
              </tr>
              <tr>
                  <td><?php echo $entry_sort_order ?></td>
                  <td><input name="sort_order" value="<?php echo $sort_order ?>" /></td>
              </tr>
              <tr>
                  <td colspan="2">
                      <?php echo $text_recurring_help ?>
                  </td>
              </tr>
              <tr>
                  <td><?php echo $entry_status ?></td>
                  <td>
                      <select name="status">
                          <?php if ($status): ?>
                              <option value="0"><?php echo $text_disabled ?></option>
                              <option value="1" selected="selected"><?php echo $text_enabled ?></option>
                          <?php else: ?>
                              <option value="0" selected="selected"><?php echo $text_disabled ?></option>
                              <option value="1"><?php echo $text_enabled ?></option>
                          <?php endif; ?>
                    </select>
                  </td>
              </tr>
              <tr>
                  <td><?php echo $entry_price ?></td>
                  <td><input name="price" value="<?php echo $price ?>" /></td>
              </tr>
              <tr>
                  <td><?php echo $entry_duration ?></td>
                  <td><input name="duration" value="<?php echo $duration ?>" /></td>
              </tr>
              <tr>
                  <td><?php echo $entry_cycle ?></td>
                  <td><input name="cycle" value="<?php echo $cycle ?>" /></td>
              </tr>
              <tr>
                  <td><?php echo $entry_frequency ?></td>
                  <td>
                      <select name="frequency">
                          <?php foreach ($frequencies as $key => $title): ?>
                              <?php if ($frequency == $key): ?>    
                                  <option value="<?php echo $key ?>" selected="selected"><?php echo $title ?></option>
                              <?php else: ?>
                                  <option value="<?php echo $key ?>"><?php echo $title ?></option>
                              <?php endif; ?>
                          <?php endforeach; ?>
                      </select>
                  </td>
              </tr>
              <tr>
                  <td><?php echo $entry_trial_status ?></td>
                  <td>
                      <select name="trial_status">
                          <?php if ($trial_status): ?>
                              <option value="0"><?php echo $text_disabled ?></option>
                              <option value="1" selected="selected"><?php echo $text_enabled ?></option>
                          <?php else: ?>
                              <option value="0" selected="selected"><?php echo $text_disabled ?></option>
                              <option value="1"><?php echo $text_enabled ?></option>
                          <?php endif; ?>
                    </select>
                  </td>
              </tr>
              <tr>
                  <td><?php echo $entry_trial_price ?></td>
                  <td><input name="trial_price" value="<?php echo $trial_price ?>" /></td>
              </tr>
              <tr>
                  <td><?php echo $entry_trial_duration ?></td>
                  <td><input name="trial_duration" value="<?php echo $trial_duration ?>" /></td>
              </tr>
              <tr>
                  <td><?php echo $entry_trial_cycle ?></td>
                  <td><input name="trial_cycle" value="<?php echo $trial_cycle ?>" /></td>
              </tr>
              <tr>
                  <td><?php echo $entry_trial_frequency ?></td>
                  <td>
                      <select name="trial_frequency">
                          <?php foreach ($frequencies as $key => $title): ?>
                              <?php if ($trial_frequency == $key): ?>    
                                  <option value="<?php echo $key ?>" selected="selected"><?php echo $title ?></option>
                              <?php else: ?>
                                  <option value="<?php echo $key ?>"><?php echo $title ?></option>
                              <?php endif; ?>
                          <?php endforeach; ?>
                      </select>
                  </td>
              </tr>
          </table>
      </form>

</div>
<script text="text/javascript"><!--
$('#button-add').click(function(){
    count++;
    var html = '';
    html += '<tr id="row' +  count + '">';
    html += ' <td class="right">';
    html += '   <select name="profile_prices[' + count + '][status]">';
    html += '     <option value="0"><?php echo $text_disabled ?></option>';
    html += '     <option value="1"><?php echo $text_enabled ?></option>';
    html += '   </select>';
    html += ' </td>';
    html += ' <td class="left">';
    html += '   <input style="width: 60px" name="profile_prices[' + count + '][price]" />';
    html += ' </td>';
    html += ' <td class="left">';
    html += '   <input style="width: 60px" name="profile_prices[' + count + '][duration]" />';
    html += ' </td>';
    html += ' <td class="left">';
    html += '   <input style="width: 60px" name="profile_prices[' + count + '][cycle]" />';
    html += ' </td>';
    html += ' <td class="left">';
    html += '   <select name="profile_prices[' + count + '][frequency]">';
    <?php foreach ($frequencies as $frequency => $frequencyName): ?>
        
        html += '<option value="<?php echo $frequency ?>"><?php echo $frequencyName ?></option>';
        
    <?php endforeach;?>
    html += '   </select>';
    html += ' </td>';
    html += ' <td class="left">';
    html += '   <select name="profile_prices[' + count + '][trial_status]">';
    html += '     <option value="0"><?php echo $text_disabled ?></option>';
    html += '     <option value="1"><?php echo $text_enabled ?></option>';
    html += '   </select>';
    html += ' </td>';
    html += ' <td class="right">';
    html += '   <input style="width: 60px" name="profile_prices[' + count + '][trial_price]" />';
    html += ' </td>';
    html += ' <td class="left">';
    html += '   <input style="width: 60px" name="profile_prices[' + count + '][trial_duration]" />';
    html += ' </td>';
    html += ' <td class="left">';
    html += '   <input style="width: 60px" name="profile_prices[' + count + '][trial_frequency]" />';
    html += ' </td>';
    html += ' <td class="left">';
    html += '   <select name="profile_prices[' + count + '][trial_frequency]">';
    <?php foreach ($frequencies as $frequency => $frequencyName): ?>
        
        html += '<option value="<?php echo $frequency ?>"><?php echo $frequencyName ?></option>';
        
    <?php endforeach;?>
    html += '   </select>';
    html += ' </td>';
    html += ' <td><a class="button" onclick="$(\'#row' + count + '\').remove()"><?php echo $button_remove ?></a></td>';
    html += '</tr>';
    
    $('table.list tbody').append(html);
});
//--></script>
<?php echo $footer; ?>