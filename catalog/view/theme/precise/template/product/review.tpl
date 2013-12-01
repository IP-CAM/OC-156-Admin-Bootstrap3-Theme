<?php if ($reviews) { ?>
	<ul>
		<?php foreach ($reviews as $review) { ?>
			<li>
                <div class="title">
                    <span><?php echo $review['author']; ?>,</span><time datetime="2013-11-03"><?php echo $review['date_added']; ?></time>
                </div>
                <div class="review-rating">
                    <span><?php echo nl2br($this->language->get('entry_rating')); ?> <span class="stars" style="background-position: <?php echo (100-20*$review['rating']); ?>%;"></span></span>
                </div>
                <p><?php echo $review['text']; ?></p>
            </li>
		<?php } ?>
	</ul>
	<div class="pagination"><?php echo $pagination; ?></div>
<?php } else { ?>
	<p><?php echo $text_no_reviews; ?></p>
<?php } ?>

<script type="text/javascript"><!--
$(document).ready(function(){
    $('#searchform input[name=\'search\']').keydown(function(e) {
        if (e.keyCode == 13) {
            $('#searchform .search-button').trigger('click');
        }
    });
    if($('.pagination > .links').length > 0){
        $('.pagination .links').html($('.pagination .links').html().replace(' .... ', '<a>...</a>'));
        $('.pagination .links').html($('.pagination .links').html().replace('<b>', '<a class="active">'));
        $('.pagination .links').html($('.pagination .links').html().replace('</b>', '</a>'));
        $('.pagination a').wrap('<li></li>');
        $('.pagination .links').html('<ul>'+$('.pagination .links').html()+'</ul>');
        $('.pagination').html($('.pagination .links').html());
        $('.pagination a').each(function(index, element){
            if(($(element).html()=='|&lt;')||($(element).html()=='&gt;|')){
                $(element).css('display','none');
            }
            if($(element).html()=='&lt;'){
                $(element).attr('class','prev');
            }
            if($(element).html()=='&gt;'){
                $(element).attr('class','next');
            }
        });
    }else{
        $('.pagination').html('');
    };
});
//--></script>