<div class="box filter">
    <div class="box-heading"><?php echo $heading_title; ?></div>
    <div class="box-content">
        <ul class="box-filter">
            <?php foreach ($filter_groups as $filter_group) { ?>
            <li>
                <br />
                <span id="filter-group<?php echo $filter_group['filter_group_id']; ?>" class="nested-header">
                    <?php echo $filter_group['name']; ?>
                </span>
                <div class="clearfix"></div>
                <ul class="option">
                    <?php foreach ($filter_group['filter'] as $filter) { ?>
                        <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
                            <li>
                                <input type="checkbox" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" checked="checked" />
                                <span><?php echo $filter['name']; ?></span>
                            </li>
                          <?php } else { ?>
                            <li>
                                <input type="checkbox" value="<?php echo $filter['filter_id']; ?>" id="filter<?php echo $filter['filter_id']; ?>" />
                                <span><?php echo $filter['name']; ?></span>
                            </li>
                        <?php } ?>
                    <?php } ?>
                </ul>
            </li>
            <?php } ?>
        </ul>
        <br />
        <a id="button-filter" class="btn btn-primary"><?php echo $button_filter; ?></a>
    </div>
</div>
<script type="text/javascript"><!--
$('#button-filter').bind('click', function() {
	filter = [];
	
	$('.box-filter input[type=\'checkbox\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});
//--></script> 
