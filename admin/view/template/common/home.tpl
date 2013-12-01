<?php echo $header; ?>
<div id="content" class="container">
    <?php if ($error_install) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_install; ?><button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_image) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_image; ?><button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_image_cache) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_image_cache; ?><button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_cache) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_cache; ?><button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_download) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_download; ?><button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>
  <?php if ($error_logs) { ?>
  <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_logs; ?><button type="button" class="close" data-dismiss="alert">&times;</button>
  </div>
  <?php } ?>

  <div class="page-header">
    <h1><i class="fa fa-eye"></i> <?php echo $heading_title; ?></h1>
  </div>

  <div class="row">

		<?php if ($this->config->get('google_api_code') != null && $this->config->get('google_profile_id') != null) { ?>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<span class="label label-info"><?php echo $text_week; ?></span>
					<div style="width:100%;" data-oochart='bar' data-oochart-start-date='7d' data-oochart-metrics='ga:visits,Visits,ga:newVisits,New Visits' data-oochart-dimension='ga:continent' data-oochart-profile='<?php echo $this->config->get('google_profile_id'); ?>'></div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
			<div class="panel panel-default">
				<div class="panel-body">
					<span class="label label-primary"><?php echo $text_month; ?></span>
					<div style="width:100%;" data-oochart='timeline' data-oochart-start-date='30d' data-oochart-metrics='ga:visits,Visits,ga:newVisits,New Visits' data-oochart-profile='<?php echo $this->config->get('google_profile_id'); ?>'></div>
				</div>
			</div>
		</div>	
		<?php } ?>
        <div class="col-sm-3">
			<div class="alert alert-success">
				<i class="fa fa-thumbs-o-up fa-3x pull-right front-b"></i>
				<h2><?php echo $total_sale; ?></h2>
				<?php echo $text_total_sale; ?>
			</div>
			
			<div class="alert alert-success">
				<i class="fa fa-bar-chart-o fa-3x pull-right front-b"></i>
				<h2><?php echo $total_sale_year; ?></h2>
				<?php echo $text_total_sale_year; ?>
			</div>
        </div>
        <div class="col-sm-3">
			<div class="alert alert-info">
				<i class="fa fa-shopping-cart fa-3x pull-right front-b"></i>
				<h2><?php echo $total_order; ?></h2>
				<?php echo $text_total_order; ?>
			</div>
			<div class="alert alert-info">
				<i class="fa fa-user fa-3x pull-right front-b"></i>
				<h2><?php echo $total_customer_approval; ?></h2>
				<?php echo $text_total_customer_approval; ?>
			</div>
        </div>
        <div class="col-sm-3">
			<div class="alert alert-warning">
				<i class="fa fa-smile-o fa-3x pull-right front-b"></i>
				<h2><?php echo $total_customer; ?></h2>
				<?php echo $text_total_customer; ?>
			</div>
			<div class="alert alert-warning">
				<i class="fa fa-comments fa-3x pull-right front-b"></i>
				<h2><?php echo $total_review_approval; ?></h2>
				<?php echo $text_total_review_approval; ?>
			</div>

        </div>
        <div class="col-sm-3">
			<div class="alert alert-danger">
				<i class="fa fa-group fa-3x pull-right front-b"></i>
				<h2><?php echo $total_affiliate; ?></h2>
				<?php echo $text_total_affiliate; ?>
			</div>
			<div class="alert alert-danger">
				<i class="fa fa-money fa-3x pull-right front-b"></i>
				<h2><?php echo $total_affiliate_approval; ?></h2>
				<?php echo $text_total_affiliate_approval; ?>
			</div>
      </div>
      </div>
      <br />
      <ul class="nav nav-tabs">
        <li><a href="#tab-sale" data-toggle="tab"><?php echo $text_statistics; ?></a></li>
        <li class="active"><a href="#tab-latest" data-toggle="tab"><?php echo $text_latest_10_orders; ?></a></li>
        <li></li>
      </ul>
      <div class="tab-content">
        <div class="tab-pane" id="tab-sale">
          <div class="text-right">
            <div class="btn-group btn-group-xs" data-toggle="buttons">
              <label class="btn btn-info active">
                <input type="radio" name="sale" value="day" />
                <?php echo $text_day; ?></label>
              <label class="btn btn-info">
                <input type="radio" name="sale" value="week" />
                <?php echo $text_week; ?></label>
              <label class="btn btn-info">
                <input type="radio" name="sale" value="month" />
                <?php echo $text_month; ?></label>
              <label class="btn btn-info">
                <input type="radio" name="sale" value="year" />
                <?php echo $text_year; ?></label>
            </div>
          </div>
          <div id="chart-sale" class="chart" style="width: 100%; height: 250px;"></div>
        </div>

        <div class="tab-pane active" id="tab-latest">
         <div class="table-responsive">
	    	<table class="table table-hover">
            <thead>
              <tr>
                <td class="text-right"><?php echo $column_order; ?></td>
                <td class="text-left"><?php echo $column_customer; ?></td>
                <td class="text-left hidden-xs"><?php echo $column_status; ?></td>
                <td class="text-left hidden-xs"><?php echo $column_date_added; ?></td>
                <td class="text-right"><?php echo $column_total; ?></td>
                <td class="text-right"><?php echo $column_action; ?></td>
              </tr>
            </thead>
            <tbody>
              <?php if ($orders) { ?>
              <?php foreach ($orders as $order) { ?>
              <tr<?php /*if (isset($order_status['name']) && $order_status['name'] != $order['status'] ) { echo " class='warning'"; }*/ ?>>
                <td class="text-right"><?php echo $order['order_id']; ?></td>
                <td class="text-left"><?php echo $order['customer']; ?></td>
                <td class="text-left hidden-xs"><?php echo $order['status']; ?></td>
                <td class="text-left hidden-xs"><?php echo $order['date_added']; ?></td>
                <td class="text-right"><?php echo $order['total']; ?></td>
                <td class="text-right"><?php foreach ($order['action'] as $action) { ?>
                  <a class="btn btn-default btn-xs" href="<?php echo $action['href']; ?>"><?php echo $action['text']; ?></a>
                  <?php } ?></td>
              </tr>
              <?php } ?>
              <?php } else { ?>
              <tr>
                <td class="center" colspan="6"><?php echo $text_no_results; ?></td>
              </tr>
              <?php } ?>
            </tbody>
          </table>
		    </div>
      </div>
    </div>
  </div>

</div>
<script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.js"></script> 
<script type="text/javascript" src="view/javascript/jquery/flot/jquery.flot.resize.min.js"></script> 
<script type="text/javascript"><!--
$('input[name=\'sale\']').on('change', function() {
	$.ajax({
		type: 'get',
		url: 'index.php?route=common/home/chart&token=<?php echo $token; ?>&range=' + this.value,
		dataType: 'json',
		success: function(json) {
			var option = {	
				shadowSize: 0,
				bars: { 
					show: true,
					fill: true,
					lineWidth: 1,
					barColor: '#000000'
				},
				grid: {
					backgroundColor: '#FFFFFF',
					hoverable: true
				},
				points: {
					show: false				
				},
				xaxis: {
					show: true,
            		ticks: json['xaxis']
				}
			}
			
			$.plot('#chart-sale', [json['order'], json['customer']], option);	
					
			$('#chart-sale').bind('plothover', function(event, pos, item) {
				$('.tooltip').remove();
			  
				if (item) {
					$('<div id="tooltip" class="tooltip top in"><div class="tooltip-arrow"></div><div class="tooltip-inner">' + item.datapoint[1].toFixed(2) + '</div></div>').prependTo('body');
					
					$('#tooltip').css({
						position: 'absolute',
						left: item.pageX - ($('#tooltip').outerWidth() / 2),
						top: item.pageY - $('#tooltip').outerHeight(),
						pointer: 'cusror'
					}).fadeIn('slow');	
					
					$('#chart-sale').css('cursor', 'pointer');		
			  	} else {
					$('#chart-sale').css('cursor', 'auto');
				}
			});
		}
	});
});

$('a[data-toggle=\'tab\']').on('shown.bs.tab', function(e) {
	if ($(this).attr('href') == '#tab-sale') {
		$('.active input[name=\'sale\']').trigger('change');
	}
		
	if ($(this).attr('href') == '#tab-marketing') {
		$('.active input[name=\'marketing\']').trigger('change');
	}
	
	if ($(this).attr('href') == '#tab-online') {
		$('#button-refresh').trigger('click');
	}	
});
//--></script> 
<?php echo $footer; ?>