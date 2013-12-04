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
        <div class="row">
	        <div class="span3">
	            <?php echo $column_left; ?>
	        </div>
	        <div class="span9">
		        <?php echo $content_top; ?>
		        <div class="row">
		        	<div class="span9">
		            	<h1><?php echo $heading_title; ?></h1>

				<?php if ($description) { ?>
				  <div class="category-info">
					<?php echo $description; ?>					
				  </div>
				<?php } ?>
			
		        	</div>    	
		        </div>
		        <?php if ($products) { ?>
		            <div class="toolbar">
		                <div class="left-side pull-left">
		                    <div class="view-mode">
		                        <a onclick="display('grid');" title="<?php echo $text_grid; ?>" class="grid"></a>
                                <strong title="<?php echo $text_list; ?>" class="list"></strong>
		                    </div>
		                </div>
		                <div class="right-side pull-right">
		                    <div class="sort-by pull-left">
		                        <label><?php echo $text_sort; ?></label>
		                        <select onchange="location = this.value;" style="width:100px;">
		                            <?php foreach ($sorts as $sorts) { ?>
		                                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
		                                    <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
		                                <?php } else { ?>
		                                    <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
		                                <?php } ?>
		                            <?php } ?>
		                        </select>
		                        <div class="clearfix"></div>
		                    </div>
		                    <div class="limiter pull-left">
		                        <label><?php echo $text_limit; ?></label>
		                        <select onchange="location = this.value;">
		                            <?php foreach ($limits as $limits) { ?>
		                                <?php if ($limits['value'] == $limit) { ?>
		                                    <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
		                                <?php } else { ?>
		                                    <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
		                                <?php } ?>
		                            <?php } ?>
		                        </select>
		                    </div>
		                </div>
		            </div>
                    <div class="product-set">
    		            <ul class="product-list">
    		                <?php foreach ($products as $product) { ?>
    		                    <li>
    		                        <div class="row">
    		                            <a href="<?php echo $product['href']; ?>" class="img span3">
    		                                <?php if ($product['thumb']) { ?>
    		                                    <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>">
    		                                    <?php if ($product['special']) { ?>
    		                                        <div class="label sale">&nbsp;</div>
    		                                    <?php } ?>
    		                                <?php } ?>
    		                            </a>
    		                            <div class="product-caption span6">
    		                                <a href="<?php echo $product['href']; ?>" class="title"><?php echo $product['name']; ?></a>
    		                                <p><?php echo $product['description']; ?></p>
    		                                <hr>
    		                                <div class="price pull-left">
    		                                    <?php if ($product['price']) { ?>
    		                                        <?php if (!$product['special']) { ?>
    		                                            <span class="price-new"><?php echo $product['price']; ?></span>
    		                                        <?php } else { ?>
    		                                            <span class="price-old"><?php echo $product['price']; ?></span>
    		                                            <span class="price-new"><?php echo $product['special']; ?></span>
    		                                        <?php } ?>
    		                                        <?php if ($product['tax']) { ?>
    		                                            <br />
    		                                            <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
    		                                        <?php } ?>
    		                                    <?php } ?>
    		                                </div>
    		                                <div class="pull-right">
    		                                    <?php if ($product['rating']) { ?>
    		                                        <div class="stars pull-left" style="background-position: <?php echo (100-20*$product['rating']); ?>%;"></div>
    		                                        <a href="<?php echo $product['href']; ?>" class="pull-left"><?php echo $product['reviews']; ?></a>
    		                                    <?php } ?>
    		                                </div>
    		                                <div class="clearfix"></div>
    		                                <hr>
    		                                <div class="cart-button">
    		                                    <a onclick="addToCart('<?php echo $product['product_id']; ?>');" class="btn btn-primary pull-left"><?php echo $button_cart; ?></a>
    		                                    <div class="pull-left">
    		                                        <a class="wishlist-link" onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a>
    		                                        <a class="compaire-link" onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a>
    		                                    </div>
    		                                </div>
    		                            </div>
    		                        </div>
    		                    </li>
    		                <?php } ?>
    		            </ul>
                    </div>
		            <div class="clearfix"></div>
		            <div class="pagination">
		                <?php echo $pagination; ?>
		            </div>
				<?php } else { ?>
			  		<p><?php echo $text_empty; ?></p>
			  		<div class="clearfix"></div>
			        <div class="buttons">
			            <input type="button" value="<?php echo $button_continue; ?>" class="btn btn-primary" onclick="return location.href='<?php echo $continue; ?>'"/>
			        </div>
			  	<?php }?>
		        <?php echo $content_bottom; ?>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript"><!--
$(document).ready(function(){
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
    }
});
function display(view) {
    if (view == 'list') {
        $('.product-set .product-grid').attr('class', 'product-list');
        
        $('.product-set .product-list > li').each(function(index, element) {

            link = $(element).find('article a').attr('href');
            img = $(element).find('article a').html();
            price = $(element).find('article .product-caption .price > span').html();
            pricex = $(element).find('.priceall').html();
            title = $(element).find('.title a').html();
            reviews = $(element).find('.reviews').html();
            description = $(element).find('.description').html();

            wishlist = $(element).find('.wishlist-link').attr('onclick');
            wishlistx = $(element).find('.wishlist-link').html();
            compare = $(element).find('.compaire-link').attr('onclick');
            comparex = $(element).find('.compaire-link').html();
            cart = $(element).find('.cart-button > a').attr('onclick');
            cartx = $(element).find('.cart-button > a').html();

            html  = '';
            html += '<div class="row">';
            html += '    <a href="'+link+'" class="img span3">'+img+'</a>';
            html += '    <div class="product-caption span6">';
            html += '        <a href="'+link+'" class="title">'+title+'</a>';
            html += '        <p>'+description+'</p>';
            html += '        <hr>';
            html += '        <div class="price pull-left">'+pricex+'</div>';
            html += '        <div class="pull-right">'+reviews+'</div>';
            html += '        <div class="clearfix"></div>';
            html += '        <hr>';
            html += '        <div class="cart-button">';
            html += '            <a onclick="'+cart+'" class="btn btn-primary pull-left">'+cartx+'</a>';
            html += '            <div class="pull-left">';
            html += '                <a onclick="'+wishlist+'" class="wishlist-link">'+wishlistx+'</a>';
            html += '                <a onclick="'+compare+'" class="compaire-link">'+comparex+'</a>';
            html += '            </div>';
            html += '        </div>';
            html += '    </div>';
            html += '</div>';
           
            html += '';           
            $(element).html(html);
        });     
        
        $('.view-mode').html('<a onclick="display(\'grid\');" title="<?php echo $text_grid; ?>" class="grid"></a><strong title="<?php echo $text_list; ?>" class="list"></strong>');
        
        $.totalStorage('view-mode', 'list'); 
    } else {
        $('.product-set .product-list').attr('class', 'product-grid <?php $grid_style = $this->config->get('itembridge_grid_style'); if ($grid_style=='variant_2') echo 'two-vatiant'; ?>');
        
        $('.product-set .product-grid > li').each(function(index, element) {
            
            link = $(element).find('.row > a.img').attr('href');
            img = $(element).find('.row > a.img').html();
            price = $(element).find('.price-new').html();
            priceall = $(element).find('.price').html();
            title = $(element).find('.title').html();
            description = $(element).find('.product-caption > p').html();
            reviews = $(element).find('.pull-right').html();
            wishlist = $(element).find('.wishlist-link').attr('onclick');
            wishlistx = $(element).find('.wishlist-link').html();
            compare = $(element).find('.compaire-link').attr('onclick');
            comparex = $(element).find('.compaire-link').html();
            cart = $(element).find('.cart-button a').attr('onclick');
            cartx = $(element).find('.cart-button a').html();

            html = '';
            html += '<article>';
            html += '   <div class="border-top"></div>';
            html += '   <div class="border-left"></div>';
            html += '   <div class="border-right"></div>';
            html += '   <div class="border-bottom"></div>';
            html += '   <a href="'+link+'">'+img+'</a>';
            html += '   <div class="product-caption">';
            html += '       <div class="price">';
            html += '           <span>'+price+'</span>';
            html += '           <span class="priceall"style="display:none;">'+priceall+'</span>';
            html += '       </div>';
            html += '       <div class="reviews" style="display:none;">'+reviews+'</div>';
            html += '        <div class="inner">';
            html += '            <h3 class="title"><a href="'+link+'" title="'+title+'">'+title+'</a></h3>';
            html += '            <p class="description" style="display:none;">'+description+'</p>';
            html += '            <div class="cart-button">';
            html += '                <a onclick="'+cart+'" class="btn btn-primary">'+cartx+'</a>';
            html += '                <a onclick="'+wishlist+'" class="wishlist-link">'+wishlistx+'</a>';
            html += '                <a onclick="'+compare+'" class="compaire-link">'+comparex+'</a>';
            html += '                <div class="clearfix"></div>';
            html += '            </div>';
            html += '        </div>';
            html += '    </div>';
            html += '</article>';
            html += '<div class="product-bottom-title" style="display: <?php $grid_style = $this->config->get("itembridge_grid_style"); if ($grid_style=="variant_2") { echo "block";} else {echo "none";} ?>">';
            html += '<h3 class="title"><a href="'+link+'" title="'+title+'">'+title+'</a></h3>';
            html += '</div>';            

            $(element).html(html);
        }); 
                    
        $('.view-mode').html('<strong title="<?php echo $text_grid; ?>" class="grid"></strong><a onclick="display(\'list\');" title="<?php echo $text_list; ?>" class="list"></a>');
        
        $.totalStorage('view-mode', 'grid');
    }
}

view = $.totalStorage('view-mode');

if (view) {
    if (view != 'list') {
        display('grid');
    } else {
        display('grid');
        display('list');
    }
}
//--></script>
<?php echo $footer; ?>