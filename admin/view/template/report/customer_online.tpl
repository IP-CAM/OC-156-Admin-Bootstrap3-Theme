<?php echo $header; ?>
<div id="content" class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="page-header">
    <h1><i class="fa fa-bar-chart-o"></i> <?php echo $heading_title; ?></h1>
  </div>
      <div class="table-responsive">
        <table class="table table-hover">
          <thead>
            <tr>
              <td class="text-left"><?php echo $column_ip; ?></td>
              <td class="text-left"><?php echo $column_customer; ?></td>
              <td class="text-left"><?php echo $column_url; ?></td>
              <td class="text-left"><?php echo $column_referer; ?></td>
              <td class="text-left"><?php echo $column_date_added; ?></td>
              <td class="text-right"><?php echo $column_action; ?></td>
            </tr>
          </thead>
          <tbody>
            <tr class="filter">
              <td class="text-left"><input type="text" name="filter_ip" value="<?php echo $filter_ip; ?>" class="form-control input-sm" /></td>
              <td class="text-left"><input type="text" name="filter_customer" value="<?php echo $filter_customer; ?>" class="form-control input-sm" /></td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td>&nbsp;</td>
              <td class="text-right"><button type="button" id="button-filter" class="btn btn-primary btn-sm"><i class="fa fa-search"></i> <?php echo $button_filter; ?></button></td>
            </tr>
            <?php if ($customers) { ?>
            <?php foreach ($customers as $customer) { ?>
            <tr>
              <td class="text-left"><a href="http://whatismyipaddress.com/ip/<?php echo $customer['ip']; ?>" target="_blank"><?php echo $customer['ip']; ?></a></td>
              <td class="text-left"><?php echo $customer['customer']; ?></td>
              <td class="text-left"><a href="<?php echo $customer['url']; ?>" target="_blank"><?php echo implode('<br/>', str_split($customer['url'], 30)); ?></a></td>
              <td class="text-left"><?php if ($customer['referer']) { ?>
                <a href="<?php echo $customer['referer']; ?>" target="_blank"><?php echo implode('<br/>', str_split($customer['referer'], 30)); ?></a>
                <?php } ?></td>
              <td class="text-left"><?php echo $customer['date_added']; ?></td>
              <td class="text-right"><?php foreach ($customer['action'] as $action) { ?>
                <a href="<?php echo $action['href']; ?>" class="btn btn-default btn-xs"><i class="fa fa-user fa-lg"></i> <?php echo $action['text']; ?></a>
                <?php } ?></td>
            </tr>
            <?php } ?>
            <?php } else { ?>
            <tr>
              <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="text-center"><?php 
if ($pagination){
$str = $pagination;

$str1 = str_replace('<div class="links">', '<ul class="pagination">', $str);
$str2 = str_replace('</div>', '</ul>', $str1);
$str3 = str_replace('<a', '<li><a', $str2);
$str4 = str_replace('</a>', '</a></li>', $str3);
$str5 = str_replace('<b>', '<li class="active"><a>', $str4);
$str6 = str_replace('</b>', '<span class="sr-only">(current)</span></a></li>', $str5);
$str7 = str_replace('&gt;|', '<i class="fa fa-angle-double-right"></i>', $str6);
$str8 = str_replace('&gt;', '<i class="fa fa-angle-right"></i>', $str7);
$str9 = str_replace('|&lt;', '<i class="fa fa-angle-double-left"></i>', $str8);
$str10 = str_replace('&lt;', '<i class="fa fa-angle-left"></i>', $str9);
$str11 = str_replace('....', '<li class="disabled"><span>....</span></li>', $str10);
echo $str11; 
}
?></div>

</div>
<script type="text/javascript"><!--
$('#button-filter').on('click', function() {
	url = 'index.php?route=report/customer_online&token=<?php echo $token; ?>';
	
	var filter_customer = $('input[name=\'filter_customer\']').val();
	
	if (filter_customer) {
		url += '&filter_customer=' + encodeURIComponent(filter_customer);
	}
		
	var filter_ip = $('input[name=\'filter_ip\']').val();
	
	if (filter_ip) {
		url += '&filter_ip=' + encodeURIComponent(filter_ip);
	}
				
	location = url;
});
//--></script> 
<?php echo $footer; ?>