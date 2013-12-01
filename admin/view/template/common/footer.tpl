</div>
<hr>
<footer>
  <p class="text-center"><?php echo $text_footer; ?></p>
</footer>
<?php if ($this->user->isLogged()){ ?>
<!-- Back To Top/Right Menu -->
<div id="toTop" class="btn-group">
  <button type="button" id="Home" class="btn btn-success"><i class="fa fa-home fa-light fa-fw fa-lg"></i></button>
  <button type="button" id="Off" class="btn btn-primary"><i class="fa fa-power-off fa-light fa-fw fa-lg"></i></button>
<?php if ($this->user->hasPermission('access', 'module/recipient')) { ?>
  <button type="button" id="Pod" class="btn btn-primary"><i class="fa fa-truck fa-light fa-fw fa-lg"></i></button>
<?php } ?>
<?php if ( isset($this->request->get['route']) && $this->request->get['route'] != 'common/home' ) { ?>
  <button type="button" class="btn btn-primary" onclick="javascript:window.history.back(-1);return false;"><i class="fa fa-angle-left fa-light fa-fw fa-lg"></i></button>
<?php } ?>
  <button type="button" id="Top" class="btn btn-primary"><i class="fa fa-angle-up fa-light fa-fw fa-lg"></i></button>
</div>

<script type="text/javascript">
jQuery(document).ready(function(){
	jQuery(window).scroll(function(){

	if(jQuery(this).scrollTop()>100){
		jQuery("#toTop").fadeIn()
		jQuery("#pod").fadeIn()
	}else{
		jQuery("#toTop").fadeOut()
		jQuery("#pod").fadeOut()
	}
});

	jQuery("#Top").click(function(){
		jQuery("html, body").animate({scrollTop:1},600);
		return false;
	})
	<?php if ($this->user->hasPermission('access', 'module/recipient')) { ?>
	<!-- POD Quick Link -->
	jQuery("#Pod").click(function(){
		window.location.replace("index.php?route=module/recipient&token=<?php echo $this->session->data['token']; ?>");
		return false;
	})
	<?php } ?>
	jQuery("#Off").click(function(){
		window.location.replace("index.php?route=common/logout&token=<?php echo $this->session->data['token']; ?>");
		return false;
	})
	jQuery("#Home").click(function(){
		window.location.replace("index.php?route=common/home&token=<?php echo $this->session->data['token']; ?>");
		return false;
	})
	// Desktop Switch
	var responsivecss = true;

	$('#switch').click(function (){
            if(responsivecss) {
		$('#responsivecss').remove();
		$(this).text('<i class="fa fa-tablet"></i>');           
		responsivecss = false;

	} else {
		$('head').append('<link href="bootstrap-responsive.css" rel="stylesheet" id="responsivecss">');
		$(this).text('<i class="fa fa-desktop"></i>');
		responsivecss = true;
	}    
        });
	<?php if (($this->config->get('position') != null) && ($this->config->get('position') == 1)){ ?>
	var activePage = window.location.href;
	$('.sidebar-nav li a[href="' + activePage + '"]').parent().addClass('active').parent().addClass('active').parent().addClass('active');

	$("#menu-toggle").click(function(e) {
        e.preventDefault();
        $("#wrapper").toggleClass("active");
	if($("#wrapper").hasClass('active')){
		$('body').css('overflow','hidden');
	} else{
		$('body').css('overflow','auto');
	}
    });
	jQuery(function($){
		var sidebar = $('.sidebar-nav');  // cache sidebar to a variable for performance
	
		sidebar.delegate('li a.top','click',function(){
			  	if($(this).hasClass('active')){
				   $(this).removeClass('active');
				   $(this).addClass('inactive');
	
			 }else{
				  sidebar.find('.active').removeClass('active');
				  $(this).removeClass('inactive');
				  $(this).addClass('active');
				  sidebar.find('ul.in').removeClass("in").addClass('collapse');
			 }
		});
	});
	<?php } // position ?>
})
</script>

	<?php if (($this->config->get('position') != null) && ($this->config->get('position') == 1)){ ?>

	</div>
        </div>
      </div>
      
    </div>

	<?php } // position ?>

<?php } // isLogged?>
</body></html>