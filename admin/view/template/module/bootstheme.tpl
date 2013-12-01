<?php echo $header; ?>
<style>
   .bt > input[type=radio]{
   display:none;
   }
   input[type=radio] + img{
   cursor:pointer;
   border:3px solid transparent;
   margin-right:10px;
   margin-bottom:10px
   }
   input[type=radio]:checked + img{
   border:3px solid #ff0000;
   }
   input[type=radio] + img:hover{
   cursor:pointer;
   border:3px solid #ccc;
   }
</style>
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
   <div class="panel panel-default">
      <div class="panel-heading">
         <div class="pull-right">
            <button type="submit" form="form-bootstheme" class="btn btn-primary btn-xs"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
            <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a>
         </div>
         <h1 class="panel-title"><i class="fa fa-edit"></i> <?php echo $heading_title; ?></h1>
      </div>
      <div class="panel-body">
         <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-bootstheme" class="form-horizontal">
            <ul class="nav nav-tabs">
               <li class="active"><a href="#tab-skins" data-toggle="tab"><?php echo $text_skins; ?></a></li>
               <li><a href="#tab-custom-css" data-toggle="tab"><?php echo $text_custom_css; ?></a></li>
               <li><a href="#tab-chart" data-toggle="tab"><?php echo $text_chart; ?></a></li>
            </ul>
            <div class="tab-content">
               <div class="tab-pane active" id="tab-skins">
                  <div class="well">
		<div class="form-group">
              <label class="col-sm-2 control-label" for="input-custom-logo"><?php echo $text_custom_logo; ?></label>
              <div class="col-sm-10"> <img src="<?php echo( $custom_logo ) ? HTTP_CATALOG .'image/' . $custom_logo : HTTP_CATALOG .'image/no_image.jpg'; ?>" alt="" id="thumb-logo"/>
                <input type="hidden" name="custom_logo" value="<?php echo $custom_logo; ?>" id="logo"/>
                <br />
                <br />
                <div class="btn-group">
                  <button class="btn btn-info" title="<?php echo $text_browse; ?>" data-toggle="modal" data-target="#dialog" onclick="image_upload('logo', 'thumb-logo');"><span class="fa fa-pencil"></span> <?php echo $text_browse; ?></button>
                  <button onclick="$(this).parent().parent().find('img').attr('src', '<?php echo HTTP_CATALOG; ?>image/no_image.jpg'); $(this).parent().parent().find('input').attr('value', ''); return false;" class="btn btn-danger"><span class="fa fa-trash-o"></span> <?php echo $text_clear; ?></button>
                </div>
              </div>
            </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-logo"><?php echo $text_adminlogo; ?></label>
                        <div class="col-sm-10">
                           <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-primary<?php if ($adminlogo == 1) { ?> active<?php } ?>">
                              <i class="fa fa-edit"></i> <input type="radio" name="adminlogo" id="input-adminlogo" value="1" <?php if ($adminlogo == 1) { ?>checked<?php } ?>> <?php echo $text_button_enabled; ?>
                              </label>
                              <label class="btn btn-primary<?php if ($adminlogo == 0) { ?> active<?php } ?>">
                              <i class="fa fa-edit"></i> <input type="radio" name="adminlogo" id="input-adminlogo" value="0" <?php if ($adminlogo == 0) { ?>checked<?php } ?>> <?php echo $text_button_disabled; ?>
                              </label>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-navbar"><?php echo $text_navbar; ?></label>
                        <div class="col-sm-10">
                           <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-primary<?php if ($navbar == 1) { ?> active<?php } ?>">
                              <i class="fa fa-edit"></i> <input type="radio" name="navbar" id="input-navbar" value="1" <?php if ($navbar == 1) { ?>checked<?php } ?>> <?php echo $text_button_default; ?>
                              </label>
                              <label class="btn btn-primary<?php if ($navbar == 0) { ?> active<?php } ?>">
                              <i class="fa fa-edit"></i> <input type="radio" name="navbar" id="input-navbar" value="0" <?php if ($navbar == 0) { ?>checked<?php } ?>> <?php echo $text_button_inverse; ?>
                              </label>
                           </div>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-position"><?php echo $text_position; ?></label>
                        <div class="col-sm-10">
                           <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-primary<?php if ($position == 1) { ?> active<?php } ?>">
                              <i class="fa fa-columns"></i> <input type="radio" name="position" id="input-position" value="1" <?php if ($position == 1) { ?>checked<?php } ?>> <?php echo $text_left; ?>
                              </label>
                              <label class="btn btn-primary<?php if ($position == 0) { ?> active<?php } ?>">
                              <i class="fa fa-list-alt"></i> <input type="radio" name="position" id="input-position" value="0" <?php if ($position == 0) { ?>checked<?php } ?>> <?php echo $text_top; ?>
                              </label>
                              <label class="btn btn-primary<?php if ($position == 2) { ?> active<?php } ?>">
                              <i class="fa fa-list-alt fa-flip-vertical"></i> <input type="radio" name="position" id="input-position" value="2" <?php if ($position == 2) { ?>checked<?php } ?>> <?php echo $text_bottom; ?>
                              </label>
                           </div>
                        </div>
                     </div>
                  </div>
                  <div class="panel panel-default">
                     <div id="bodyFontPreview_block" class="font-preview panel-body">
                        <link href='' id='bodyFontPreview' rel='stylesheet' type='text/css'>
                        Bootstrap 3 Mobile Admin Theme Google Font Dashboard and Setting
                     </div>
                  </div>
                  <div class="well">
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-position"><?php echo $text_font; ?></label>
                        <div class="col-sm-5">
                           <select name="Body_font" class="form-control">
                              <option value="0"><?php echo $text_font_none; ?></option>
                              <?php if (isset($Body_font) && $Body_font !='0'){ ?>
                              <option value="<?php echo $Body_font; ?>" selected><?php echo $text_font_default; ?></option>
                              <?php } ?>
                              <option value="ABeeZee">ABeeZee</option>
                              <option value="Abel">Abel</option>
                              <option value="Abril+Fatface">Abril Fatface</option>
                              <option value="Aclonica">Aclonica</option>
                              <option value="Acme">Acme</option>
                              <option value="Actor">Actor</option>
                              <option value="Adamina">Adamina</option>
                              <option value="Advent+Pro">Advent Pro</option>
                              <option value="Aguafina+Script">Aguafina Script</option>
                              <option value="Akronim">Akronim</option>
                              <option value="Aladin">Aladin</option>
                              <option value="Aldrich">Aldrich</option>
                              <option value="Alegreya">Alegreya</option>
                              <option value="Alegreya+SC">Alegreya SC</option>
                              <option value="Alex+Brush">Alex Brush</option>
                              <option value="Alfa+Slab+One">Alfa Slab One</option>
                              <option value="Alice">Alice</option>
                              <option value="Alike">Alike</option>
                              <option value="Alike+Angular">Alike Angular</option>
                              <option value="Allan">Allan</option>
                              <option value="Allerta">Allerta</option>
                              <option value="Allerta+Stencil">Allerta Stencil</option>
                              <option value="Allura">Allura</option>
                              <option value="Almendra">Almendra</option>
                              <option value="Almendra+Display">Almendra Display</option>
                              <option value="Almendra+SC">Almendra SC</option>
                              <option value="Amarante">Amarante</option>
                              <option value="Amaranth">Amaranth</option>
                              <option value="Amatic+SC">Amatic SC</option>
                              <option value="Amethysta">Amethysta</option>
                              <option value="Anaheim">Anaheim</option>
                              <option value="Andada">Andada</option>
                              <option value="Andika">Andika</option>
                              <option value="Angkor">Angkor</option>
                              <option value="Annie+Use+Your+Telescope">Annie Use Your Telescope</option>
                              <option value="Anonymous+Pro">Anonymous Pro</option>
                              <option value="Antic">Antic</option>
                              <option value="Antic+Didone">Antic Didone</option>
                              <option value="Antic+Slab">Antic Slab</option>
                              <option value="Anton">Anton</option>
                              <option value="Arapey">Arapey</option>
                              <option value="Arbutus">Arbutus</option>
                              <option value="Arbutus+Slab">Arbutus Slab</option>
                              <option value="Architects+Daughter">Architects Daughter</option>
                              <option value="Archivo+Black">Archivo Black</option>
                              <option value="Archivo+Narrow">Archivo Narrow</option>
                              <option value="Arimo">Arimo</option>
                              <option value="Arizonia">Arizonia</option>
                              <option value="Armata">Armata</option>
                              <option value="Artifika">Artifika</option>
                              <option value="Arvo">Arvo</option>
                              <option value="Asap">Asap</option>
                              <option value="Asset">Asset</option>
                              <option value="Astloch">Astloch</option>
                              <option value="Asul">Asul</option>
                              <option value="Atomic+Age">Atomic Age</option>
                              <option value="Aubrey">Aubrey</option>
                              <option value="Audiowide">Audiowide</option>
                              <option value="Autour+One">Autour One</option>
                              <option value="Average">Average</option>
                              <option value="Average+Sans">Average Sans</option>
                              <option value="Averia+Gruesa+Libre">Averia Gruesa Libre</option>
                              <option value="Averia+Libre">Averia Libre</option>
                              <option value="Averia+Sans+Libre">Averia Sans Libre</option>
                              <option value="Averia+Serif+Libre">Averia Serif Libre</option>
                              <option value="Bad+Script">Bad Script</option>
                              <option value="Balthazar">Balthazar</option>
                              <option value="Bangers">Bangers</option>
                              <option value="Basic">Basic</option>
                              <option value="Battambang">Battambang</option>
                              <option value="Baumans">Baumans</option>
                              <option value="Bayon">Bayon</option>
                              <option value="Belgrano">Belgrano</option>
                              <option value="Belleza">Belleza</option>
                              <option value="BenchNine">BenchNine</option>
                              <option value="Bentham">Bentham</option>
                              <option value="Berkshire+Swash">Berkshire Swash</option>
                              <option value="Bevan">Bevan</option>
                              <option value="Bigelow+Rules">Bigelow Rules</option>
                              <option value="Bigshot+One">Bigshot One</option>
                              <option value="Bilbo">Bilbo</option>
                              <option value="Bilbo+Swash+Caps">Bilbo Swash Caps</option>
                              <option value="Bitter">Bitter</option>
                              <option value="Black+Ops+One">Black Ops One</option>
                              <option value="Bokor">Bokor</option>
                              <option value="Bonbon">Bonbon</option>
                              <option value="Boogaloo">Boogaloo</option>
                              <option value="Bowlby+One">Bowlby One</option>
                              <option value="Bowlby+One+SC">Bowlby One SC</option>
                              <option value="Brawler">Brawler</option>
                              <option value="Bree+Serif">Bree Serif</option>
                              <option value="Bubblegum+Sans">Bubblegum Sans</option>
                              <option value="Bubbler+One">Bubbler One</option>
                              <option value="Buda">Buda</option>
                              <option value="Buenard">Buenard</option>
                              <option value="Butcherman">Butcherman</option>
                              <option value="Butterfly+Kids">Butterfly Kids</option>
                              <option value="Cabin">Cabin</option>
                              <option value="Cabin+Condensed">Cabin Condensed</option>
                              <option value="Cabin+Sketch">Cabin Sketch</option>
                              <option value="Caesar+Dressing">Caesar Dressing</option>
                              <option value="Cagliostro">Cagliostro</option>
                              <option value="Calligraffitti">Calligraffitti</option>
                              <option value="Cambo">Cambo</option>
                              <option value="Candal">Candal</option>
                              <option value="Cantarell">Cantarell</option>
                              <option value="Cantata+One">Cantata One</option>
                              <option value="Cantora+One">Cantora One</option>
                              <option value="Capriola">Capriola</option>
                              <option value="Cardo">Cardo</option>
                              <option value="Carme">Carme</option>
                              <option value="Carrois+Gothic">Carrois Gothic</option>
                              <option value="Carrois+Gothic+SC">Carrois Gothic SC</option>
                              <option value="Carter+One">Carter One</option>
                              <option value="Caudex">Caudex</option>
                              <option value="Cedarville+Cursive">Cedarville Cursive</option>
                              <option value="Ceviche+One">Ceviche One</option>
                              <option value="Changa+One">Changa One</option>
                              <option value="Chango">Chango</option>
                              <option value="Chau+Philomene+One">Chau Philomene One</option>
                              <option value="Chela+One">Chela One</option>
                              <option value="Chelsea+Market">Chelsea Market</option>
                              <option value="Chenla">Chenla</option>
                              <option value="Cherry+Cream+Soda">Cherry Cream Soda</option>
                              <option value="Cherry+Swash">Cherry Swash</option>
                              <option value="Chewy">Chewy</option>
                              <option value="Chicle">Chicle</option>
                              <option value="Chivo">Chivo</option>
                              <option value="Cinzel">Cinzel</option>
                              <option value="Cinzel+Decorative">Cinzel Decorative</option>
                              <option value="Clicker+Script">Clicker Script</option>
                              <option value="Coda">Coda</option>
                              <option value="Coda+Caption">Coda Caption</option>
                              <option value="Codystar">Codystar</option>
                              <option value="Combo">Combo</option>
                              <option value="Comfortaa">Comfortaa</option>
                              <option value="Coming+Soon">Coming Soon</option>
                              <option value="Concert+One">Concert One</option>
                              <option value="Condiment">Condiment</option>
                              <option value="Content">Content</option>
                              <option value="Contrail+One">Contrail One</option>
                              <option value="Convergence">Convergence</option>
                              <option value="Cookie">Cookie</option>
                              <option value="Copse">Copse</option>
                              <option value="Corben">Corben</option>
                              <option value="Courgette">Courgette</option>
                              <option value="Cousine">Cousine</option>
                              <option value="Coustard">Coustard</option>
                              <option value="Covered+By+Your+Grace">Covered By Your Grace</option>
                              <option value="Crafty+Girls">Crafty Girls</option>
                              <option value="Creepster">Creepster</option>
                              <option value="Crete+Round">Crete Round</option>
                              <option value="Crimson+Text">Crimson Text</option>
                              <option value="Croissant+One">Croissant One</option>
                              <option value="Crushed">Crushed</option>
                              <option value="Cuprum">Cuprum</option>
                              <option value="Cutive">Cutive</option>
                              <option value="Cutive+Mono">Cutive Mono</option>
                              <option value="Damion">Damion</option>
                              <option value="Dancing+Script">Dancing Script</option>
                              <option value="Dangrek">Dangrek</option>
                              <option value="Dawning+of+a+New+Day">Dawning of a New Day</option>
                              <option value="Days+One">Days One</option>
                              <option value="Delius">Delius</option>
                              <option value="Delius+Swash+Caps">Delius Swash Caps</option>
                              <option value="Delius+Unicase">Delius Unicase</option>
                              <option value="Della+Respira">Della Respira</option>
                              <option value="Denk+One">Denk One</option>
                              <option value="Devonshire">Devonshire</option>
                              <option value="Didact+Gothic">Didact Gothic</option>
                              <option value="Diplomata">Diplomata</option>
                              <option value="Diplomata+SC">Diplomata SC</option>
                              <option value="Domine">Domine</option>
                              <option value="Donegal+One">Donegal One</option>
                              <option value="Doppio+One">Doppio One</option>
                              <option value="Dorsa">Dorsa</option>
                              <option value="Dosis">Dosis</option>
                              <option value="Dr+Sugiyama">Dr Sugiyama</option>
                              <option value="Droid+Sans">Droid Sans</option>
                              <option value="Droid+Sans+Mono">Droid Sans Mono</option>
                              <option value="Droid+Serif">Droid Serif</option>
                              <option value="Duru+Sans">Duru Sans</option>
                              <option value="Dynalight">Dynalight</option>
                              <option value="EB+Garamond">EB Garamond</option>
                              <option value="Eagle+Lake">Eagle Lake</option>
                              <option value="Eater">Eater</option>
                              <option value="Economica">Economica</option>
                              <option value="Electrolize">Electrolize</option>
                              <option value="Elsie">Elsie</option>
                              <option value="Elsie+Swash+Caps">Elsie Swash Caps</option>
                              <option value="Emblema+One">Emblema One</option>
                              <option value="Emilys+Candy">Emilys Candy</option>
                              <option value="Engagement">Engagement</option>
                              <option value="Englebert">Englebert</option>
                              <option value="Enriqueta">Enriqueta</option>
                              <option value="Erica+One">Erica One</option>
                              <option value="Esteban">Esteban</option>
                              <option value="Euphoria+Script">Euphoria Script</option>
                              <option value="Ewert">Ewert</option>
                              <option value="Exo">Exo</option>
                              <option value="Expletus+Sans">Expletus Sans</option>
                              <option value="Fanwood+Text">Fanwood Text</option>
                              <option value="Fascinate">Fascinate</option>
                              <option value="Fascinate+Inline">Fascinate Inline</option>
                              <option value="Faster+One">Faster One</option>
                              <option value="Fasthand">Fasthand</option>
                              <option value="Federant">Federant</option>
                              <option value="Federo">Federo</option>
                              <option value="Felipa">Felipa</option>
                              <option value="Fenix">Fenix</option>
                              <option value="Finger+Paint">Finger Paint</option>
                              <option value="Fjalla+One">Fjalla One</option>
                              <option value="Fjord+One">Fjord One</option>
                              <option value="Flamenco">Flamenco</option>
                              <option value="Flavors">Flavors</option>
                              <option value="Fondamento">Fondamento</option>
                              <option value="Fontdiner+Swanky">Fontdiner Swanky</option>
                              <option value="Forum">Forum</option>
                              <option value="Francois+One">Francois One</option>
                              <option value="Freckle+Face">Freckle Face</option>
                              <option value="Fredericka+the+Great">Fredericka the Great</option>
                              <option value="Fredoka+One">Fredoka One</option>
                              <option value="Freehand">Freehand</option>
                              <option value="Fresca">Fresca</option>
                              <option value="Frijole">Frijole</option>
                              <option value="Fugaz+One">Fugaz One</option>
                              <option value="GFS+Didot">GFS Didot</option>
                              <option value="GFS+Neohellenic">GFS Neohellenic</option>
                              <option value="Gafata">Gafata</option>
                              <option value="Galdeano">Galdeano</option>
                              <option value="Galindo">Galindo</option>
                              <option value="Gentium+Basic">Gentium Basic</option>
                              <option value="Gentium+Book+Basic">Gentium Book Basic</option>
                              <option value="Geo">Geo</option>
                              <option value="Geostar">Geostar</option>
                              <option value="Geostar+Fill">Geostar Fill</option>
                              <option value="Germania+One">Germania One</option>
                              <option value="Gilda+Display">Gilda Display</option>
                              <option value="Give+You+Glory">Give You Glory</option>
                              <option value="Glass+Antiqua">Glass Antiqua</option>
                              <option value="Glegoo">Glegoo</option>
                              <option value="Gloria+Hallelujah">Gloria Hallelujah</option>
                              <option value="Goblin+One">Goblin One</option>
                              <option value="Gochi+Hand">Gochi Hand</option>
                              <option value="Gorditas">Gorditas</option>
                              <option value="Goudy+Bookletter+1911">Goudy Bookletter 1911</option>
                              <option value="Graduate">Graduate</option>
                              <option value="Grand+Hotel">Grand Hotel</option>
                              <option value="Gravitas+One">Gravitas One</option>
                              <option value="Great+Vibes">Great Vibes</option>
                              <option value="Griffy">Griffy</option>
                              <option value="Gruppo">Gruppo</option>
                              <option value="Gudea">Gudea</option>
                              <option value="Habibi">Habibi</option>
                              <option value="Hammersmith+One">Hammersmith One</option>
                              <option value="Hanalei">Hanalei</option>
                              <option value="Hanalei+Fill">Hanalei Fill</option>
                              <option value="Handlee">Handlee</option>
                              <option value="Hanuman">Hanuman</option>
                              <option value="Happy+Monkey">Happy Monkey</option>
                              <option value="Headland+One">Headland One</option>
                              <option value="Henny+Penny">Henny Penny</option>
                              <option value="Herr+Von+Muellerhoff">Herr Von Muellerhoff</option>
                              <option value="Holtwood+One+SC">Holtwood One SC</option>
                              <option value="Homemade+Apple">Homemade Apple</option>
                              <option value="Homenaje">Homenaje</option>
                              <option value="IM+Fell+DW+Pica">IM Fell DW Pica</option>
                              <option value="IM+Fell+DW+Pica+SC">IM Fell DW Pica SC</option>
                              <option value="IM+Fell+Double+Pica">IM Fell Double Pica</option>
                              <option value="IM+Fell+Double+Pica+SC">IM Fell Double Pica SC</option>
                              <option value="IM+Fell+English">IM Fell English</option>
                              <option value="IM+Fell+English+SC">IM Fell English SC</option>
                              <option value="IM+Fell+French+Canon">IM Fell French Canon</option>
                              <option value="IM+Fell+French+Canon+SC">IM Fell French Canon SC</option>
                              <option value="IM+Fell+Great+Primer">IM Fell Great Primer</option>
                              <option value="IM+Fell+Great+Primer+SC">IM Fell Great Primer SC</option>
                              <option value="Iceberg">Iceberg</option>
                              <option value="Iceland">Iceland</option>
                              <option value="Imprima">Imprima</option>
                              <option value="Inconsolata">Inconsolata</option>
                              <option value="Inder">Inder</option>
                              <option value="Indie+Flower">Indie Flower</option>
                              <option value="Inika">Inika</option>
                              <option value="Irish+Grover">Irish Grover</option>
                              <option value="Istok+Web">Istok Web</option>
                              <option value="Italiana">Italiana</option>
                              <option value="Italianno">Italianno</option>
                              <option value="Jacques+Francois">Jacques Francois</option>
                              <option value="Jacques+Francois+Shadow">Jacques Francois Shadow</option>
                              <option value="Jim+Nightshade">Jim Nightshade</option>
                              <option value="Jockey+One">Jockey One</option>
                              <option value="Jolly+Lodger">Jolly Lodger</option>
                              <option value="Josefin+Sans">Josefin Sans</option>
                              <option value="Josefin+Slab">Josefin Slab</option>
                              <option value="Joti+One">Joti One</option>
                              <option value="Judson">Judson</option>
                              <option value="Julee">Julee</option>
                              <option value="Julius+Sans+One">Julius Sans One</option>
                              <option value="Junge">Junge</option>
                              <option value="Jura">Jura</option>
                              <option value="Just+Another+Hand">Just Another Hand</option>
                              <option value="Just+Me+Again+Down+Here">Just Me Again Down Here</option>
                              <option value="Kameron">Kameron</option>
                              <option value="Karla">Karla</option>
                              <option value="Kaushan+Script">Kaushan Script</option>
                              <option value="Keania+One">Keania One</option>
                              <option value="Kelly+Slab">Kelly Slab</option>
                              <option value="Kenia">Kenia</option>
                              <option value="Khmer">Khmer</option>
                              <option value="Kite+One">Kite One</option>
                              <option value="Knewave">Knewave</option>
                              <option value="Kotta+One">Kotta One</option>
                              <option value="Koulen">Koulen</option>
                              <option value="Kranky">Kranky</option>
                              <option value="Kreon">Kreon</option>
                              <option value="Kristi">Kristi</option>
                              <option value="Krona+One">Krona One</option>
                              <option value="La+Belle+Aurore">La Belle Aurore</option>
                              <option value="Lancelot">Lancelot</option>
                              <option value="Lato">Lato</option>
                              <option value="League+Script">League Script</option>
                              <option value="Leckerli+One">Leckerli One</option>
                              <option value="Ledger">Ledger</option>
                              <option value="Lekton">Lekton</option>
                              <option value="Lemon">Lemon</option>
                              <option value="Libre+Baskerville">Libre Baskerville</option>
                              <option value="Life+Savers">Life Savers</option>
                              <option value="Lilita+One">Lilita One</option>
                              <option value="Limelight">Limelight</option>
                              <option value="Linden+Hill">Linden Hill</option>
                              <option value="Lobster">Lobster</option>
                              <option value="Lobster+Two">Lobster Two</option>
                              <option value="Londrina+Outline">Londrina Outline</option>
                              <option value="Londrina+Shadow">Londrina Shadow</option>
                              <option value="Londrina+Sketch">Londrina Sketch</option>
                              <option value="Londrina+Solid">Londrina Solid</option>
                              <option value="Lora">Lora</option>
                              <option value="Love+Ya+Like+A+Sister">Love Ya Like A Sister</option>
                              <option value="Loved+by+the+King">Loved by the King</option>
                              <option value="Lovers+Quarrel">Lovers Quarrel</option>
                              <option value="Luckiest+Guy">Luckiest Guy</option>
                              <option value="Lusitana">Lusitana</option>
                              <option value="Lustria">Lustria</option>
                              <option value="Macondo">Macondo</option>
                              <option value="Macondo+Swash+Caps">Macondo Swash Caps</option>
                              <option value="Magra">Magra</option>
                              <option value="Maiden+Orange">Maiden Orange</option>
                              <option value="Mako">Mako</option>
                              <option value="Marcellus">Marcellus</option>
                              <option value="Marcellus+SC">Marcellus SC</option>
                              <option value="Marck+Script">Marck Script</option>
                              <option value="Margarine">Margarine</option>
                              <option value="Marko+One">Marko One</option>
                              <option value="Marmelad">Marmelad</option>
                              <option value="Marvel">Marvel</option>
                              <option value="Mate">Mate</option>
                              <option value="Mate+SC">Mate SC</option>
                              <option value="Maven+Pro">Maven Pro</option>
                              <option value="McLaren">McLaren</option>
                              <option value="Meddon">Meddon</option>
                              <option value="MedievalSharp">MedievalSharp</option>
                              <option value="Medula+One">Medula One</option>
                              <option value="Megrim">Megrim</option>
                              <option value="Meie+Script">Meie Script</option>
                              <option value="Merienda">Merienda</option>
                              <option value="Merienda+One">Merienda One</option>
                              <option value="Merriweather">Merriweather</option>
                              <option value="Metal">Metal</option>
                              <option value="Metal+Mania">Metal Mania</option>
                              <option value="Metamorphous">Metamorphous</option>
                              <option value="Metrophobic">Metrophobic</option>
                              <option value="Michroma">Michroma</option>
                              <option value="Milonga">Milonga</option>
                              <option value="Miltonian">Miltonian</option>
                              <option value="Miltonian+Tattoo">Miltonian Tattoo</option>
                              <option value="Miniver">Miniver</option>
                              <option value="Miss+Fajardose">Miss Fajardose</option>
                              <option value="Modern+Antiqua">Modern Antiqua</option>
                              <option value="Molengo">Molengo</option>
                              <option value="Molle">Molle</option>
                              <option value="Monda">Monda</option>
                              <option value="Monofett">Monofett</option>
                              <option value="Monoton">Monoton</option>
                              <option value="Monsieur+La+Doulaise">Monsieur La Doulaise</option>
                              <option value="Montaga">Montaga</option>
                              <option value="Montez">Montez</option>
                              <option value="Montserrat">Montserrat</option>
                              <option value="Montserrat+Alternates">Montserrat Alternates</option>
                              <option value="Montserrat+Subrayada">Montserrat Subrayada</option>
                              <option value="Moul">Moul</option>
                              <option value="Moulpali">Moulpali</option>
                              <option value="Mountains+of+Christmas">Mountains of Christmas</option>
                              <option value="Mouse+Memoirs">Mouse Memoirs</option>
                              <option value="Mr+Bedfort">Mr Bedfort</option>
                              <option value="Mr+Dafoe">Mr Dafoe</option>
                              <option value="Mr+De+Haviland">Mr De Haviland</option>
                              <option value="Mrs+Saint+Delafield">Mrs Saint Delafield</option>
                              <option value="Mrs+Sheppards">Mrs Sheppards</option>
                              <option value="Muli">Muli</option>
                              <option value="Mystery+Quest">Mystery Quest</option>
                              <option value="Neucha">Neucha</option>
                              <option value="Neuton">Neuton</option>
                              <option value="New+Rocker">New Rocker</option>
                              <option value="News+Cycle">News Cycle</option>
                              <option value="Niconne">Niconne</option>
                              <option value="Nixie+One">Nixie One</option>
                              <option value="Nobile">Nobile</option>
                              <option value="Nokora">Nokora</option>
                              <option value="Norican">Norican</option>
                              <option value="Nosifer">Nosifer</option>
                              <option value="Nothing+You+Could+Do">Nothing You Could Do</option>
                              <option value="Noticia+Text">Noticia Text</option>
                              <option value="Nova+Cut">Nova Cut</option>
                              <option value="Nova+Flat">Nova Flat</option>
                              <option value="Nova+Mono">Nova Mono</option>
                              <option value="Nova+Oval">Nova Oval</option>
                              <option value="Nova+Round">Nova Round</option>
                              <option value="Nova+Script">Nova Script</option>
                              <option value="Nova+Slim">Nova Slim</option>
                              <option value="Nova+Square">Nova Square</option>
                              <option value="Numans">Numans</option>
                              <option value="Nunito">Nunito</option>
                              <option value="Odor+Mean+Chey">Odor Mean Chey</option>
                              <option value="Offside">Offside</option>
                              <option value="Old+Standard+TT">Old Standard TT</option>
                              <option value="Oldenburg">Oldenburg</option>
                              <option value="Oleo+Script">Oleo Script</option>
                              <option value="Oleo+Script+Swash+Caps">Oleo Script Swash Caps</option>
                              <option value="Open+Sans">Open Sans</option>
                              <option value="Open+Sans+Condensed">Open Sans Condensed</option>
                              <option value="Oranienbaum">Oranienbaum</option>
                              <option value="Orbitron">Orbitron</option>
                              <option value="Oregano">Oregano</option>
                              <option value="Orienta">Orienta</option>
                              <option value="Original+Surfer">Original Surfer</option>
                              <option value="Oswald">Oswald</option>
                              <option value="Over+the+Rainbow">Over the Rainbow</option>
                              <option value="Overlock">Overlock</option>
                              <option value="Overlock+SC">Overlock SC</option>
                              <option value="Ovo">Ovo</option>
                              <option value="Oxygen">Oxygen</option>
                              <option value="Oxygen+Mono">Oxygen Mono</option>
                              <option value="PT+Mono">PT Mono</option>
                              <option value="PT+Sans">PT Sans</option>
                              <option value="PT+Sans+Caption">PT Sans Caption</option>
                              <option value="PT+Sans+Narrow">PT Sans Narrow</option>
                              <option value="PT+Serif">PT Serif</option>
                              <option value="PT+Serif+Caption">PT Serif Caption</option>
                              <option value="Pacifico">Pacifico</option>
                              <option value="Paprika">Paprika</option>
                              <option value="Parisienne">Parisienne</option>
                              <option value="Passero+One">Passero One</option>
                              <option value="Passion+One">Passion One</option>
                              <option value="Patrick+Hand">Patrick Hand</option>
                              <option value="Patua+One">Patua One</option>
                              <option value="Paytone+One">Paytone One</option>
                              <option value="Peralta">Peralta</option>
                              <option value="Permanent+Marker">Permanent Marker</option>
                              <option value="Petit+Formal+Script">Petit Formal Script</option>
                              <option value="Petrona">Petrona</option>
                              <option value="Philosopher">Philosopher</option>
                              <option value="Piedra">Piedra</option>
                              <option value="Pinyon+Script">Pinyon Script</option>
                              <option value="Pirata+One">Pirata One</option>
                              <option value="Plaster">Plaster</option>
                              <option value="Play">Play</option>
                              <option value="Playball">Playball</option>
                              <option value="Playfair+Display">Playfair Display</option>
                              <option value="Playfair+Display+SC">Playfair Display SC</option>
                              <option value="Podkova">Podkova</option>
                              <option value="Poiret+One">Poiret One</option>
                              <option value="Poller+One">Poller One</option>
                              <option value="Poly">Poly</option>
                              <option value="Pompiere">Pompiere</option>
                              <option value="Pontano+Sans">Pontano Sans</option>
                              <option value="Port+Lligat+Sans">Port Lligat Sans</option>
                              <option value="Port+Lligat+Slab">Port Lligat Slab</option>
                              <option value="Prata">Prata</option>
                              <option value="Preahvihear">Preahvihear</option>
                              <option value="Press+Start+2P">Press Start 2P</option>
                              <option value="Princess+Sofia">Princess Sofia</option>
                              <option value="Prociono">Prociono</option>
                              <option value="Prosto+One">Prosto One</option>
                              <option value="Puritan">Puritan</option>
                              <option value="Purple+Purse">Purple Purse</option>
                              <option value="Quando">Quando</option>
                              <option value="Quantico">Quantico</option>
                              <option value="Quattrocento">Quattrocento</option>
                              <option value="Quattrocento+Sans">Quattrocento Sans</option>
                              <option value="Questrial">Questrial</option>
                              <option value="Quicksand">Quicksand</option>
                              <option value="Quintessential">Quintessential</option>
                              <option value="Qwigley">Qwigley</option>
                              <option value="Racing+Sans+One">Racing Sans One</option>
                              <option value="Radley">Radley</option>
                              <option value="Raleway">Raleway</option>
                              <option value="Raleway+Dots">Raleway Dots</option>
                              <option value="Rambla">Rambla</option>
                              <option value="Rammetto+One">Rammetto One</option>
                              <option value="Ranchers">Ranchers</option>
                              <option value="Rancho">Rancho</option>
                              <option value="Rationale">Rationale</option>
                              <option value="Redressed">Redressed</option>
                              <option value="Reenie+Beanie">Reenie Beanie</option>
                              <option value="Revalia">Revalia</option>
                              <option value="Ribeye">Ribeye</option>
                              <option value="Ribeye+Marrow">Ribeye Marrow</option>
                              <option value="Righteous">Righteous</option>
                              <option value="Risque">Risque</option>
                              <option value="Rochester">Rochester</option>
                              <option value="Rock+Salt">Rock Salt</option>
                              <option value="Rokkitt">Rokkitt</option>
                              <option value="Romanesco">Romanesco</option>
                              <option value="Ropa+Sans">Ropa Sans</option>
                              <option value="Rosario">Rosario</option>
                              <option value="Rosarivo">Rosarivo</option>
                              <option value="Rouge+Script">Rouge Script</option>
                              <option value="Ruda">Ruda</option>
                              <option value="Rufina">Rufina</option>
                              <option value="Ruge+Boogie">Ruge Boogie</option>
                              <option value="Ruluko">Ruluko</option>
                              <option value="Rum+Raisin">Rum Raisin</option>
                              <option value="Ruslan+Display">Ruslan Display</option>
                              <option value="Russo+One">Russo One</option>
                              <option value="Ruthie">Ruthie</option>
                              <option value="Rye">Rye</option>
                              <option value="Sacramento">Sacramento</option>
                              <option value="Sail">Sail</option>
                              <option value="Salsa">Salsa</option>
                              <option value="Sanchez">Sanchez</option>
                              <option value="Sancreek">Sancreek</option>
                              <option value="Sansita+One">Sansita One</option>
                              <option value="Sarina">Sarina</option>
                              <option value="Satisfy">Satisfy</option>
                              <option value="Scada">Scada</option>
                              <option value="Schoolbell">Schoolbell</option>
                              <option value="Seaweed+Script">Seaweed Script</option>
                              <option value="Sevillana">Sevillana</option>
                              <option value="Seymour+One">Seymour One</option>
                              <option value="Shadows+Into+Light">Shadows Into Light</option>
                              <option value="Shadows+Into+Light+Two">Shadows Into Light Two</option>
                              <option value="Shanti">Shanti</option>
                              <option value="Share">Share</option>
                              <option value="Share+Tech">Share Tech</option>
                              <option value="Share+Tech+Mono">Share Tech Mono</option>
                              <option value="Shojumaru">Shojumaru</option>
                              <option value="Short+Stack">Short Stack</option>
                              <option value="Siemreap">Siemreap</option>
                              <option value="Sigmar+One">Sigmar One</option>
                              <option value="Signika">Signika</option>
                              <option value="Signika+Negative">Signika Negative</option>
                              <option value="Simonetta">Simonetta</option>
                              <option value="Sirin+Stencil">Sirin Stencil</option>
                              <option value="Six+Caps">Six Caps</option>
                              <option value="Skranji">Skranji</option>
                              <option value="Slackey">Slackey</option>
                              <option value="Smokum">Smokum</option>
                              <option value="Smythe">Smythe</option>
                              <option value="Sniglet">Sniglet</option>
                              <option value="Snippet">Snippet</option>
                              <option value="Snowburst+One">Snowburst One</option>
                              <option value="Sofadi+One">Sofadi One</option>
                              <option value="Sofia">Sofia</option>
                              <option value="Sonsie+One">Sonsie One</option>
                              <option value="Sorts+Mill+Goudy">Sorts Mill Goudy</option>
                              <option value="Source+Code+Pro">Source Code Pro</option>
                              <option value="Source+Sans+Pro">Source Sans Pro</option>
                              <option value="Special+Elite">Special Elite</option>
                              <option value="Spicy+Rice">Spicy Rice</option>
                              <option value="Spinnaker">Spinnaker</option>
                              <option value="Spirax">Spirax</option>
                              <option value="Squada+One">Squada One</option>
                              <option value="Stalemate">Stalemate</option>
                              <option value="Stalinist+One">Stalinist One</option>
                              <option value="Stardos+Stencil">Stardos Stencil</option>
                              <option value="Stint+Ultra+Condensed">Stint Ultra Condensed</option>
                              <option value="Stint+Ultra+Expanded">Stint Ultra Expanded</option>
                              <option value="Stoke">Stoke</option>
                              <option value="Strait">Strait</option>
                              <option value="Sue+Ellen+Francisco">Sue Ellen Francisco</option>
                              <option value="Sunshiney">Sunshiney</option>
                              <option value="Supermercado+One">Supermercado One</option>
                              <option value="Suwannaphum">Suwannaphum</option>
                              <option value="Swanky+and+Moo+Moo">Swanky and Moo Moo</option>
                              <option value="Syncopate">Syncopate</option>
                              <option value="Tangerine">Tangerine</option>
                              <option value="Taprom">Taprom</option>
                              <option value="Telex">Telex</option>
                              <option value="Tenor+Sans">Tenor Sans</option>
                              <option value="Text+Me+One">Text Me One</option>
                              <option value="The+Girl+Next+Door">The Girl Next Door</option>
                              <option value="Tienne">Tienne</option>
                              <option value="Tinos">Tinos</option>
                              <option value="Titan+One">Titan One</option>
                              <option value="Titillium+Web">Titillium Web</option>
                              <option value="Trade+Winds">Trade Winds</option>
                              <option value="Trocchi">Trocchi</option>
                              <option value="Trochut">Trochut</option>
                              <option value="Trykker">Trykker</option>
                              <option value="Tulpen+One">Tulpen One</option>
                              <option value="Ubuntu">Ubuntu</option>
                              <option value="Ubuntu+Condensed">Ubuntu Condensed</option>
                              <option value="Ubuntu+Mono">Ubuntu Mono</option>
                              <option value="Ultra">Ultra</option>
                              <option value="Uncial+Antiqua">Uncial Antiqua</option>
                              <option value="Underdog">Underdog</option>
                              <option value="Unica+One">Unica One</option>
                              <option value="UnifrakturCook">UnifrakturCook</option>
                              <option value="UnifrakturMaguntia">UnifrakturMaguntia</option>
                              <option value="Unkempt">Unkempt</option>
                              <option value="Unlock">Unlock</option>
                              <option value="Unna">Unna</option>
                              <option value="VT323">VT323</option>
                              <option value="Vampiro+One">Vampiro One</option>
                              <option value="Varela">Varela</option>
                              <option value="Varela+Round">Varela Round</option>
                              <option value="Vast+Shadow">Vast Shadow</option>
                              <option value="Vibur">Vibur</option>
                              <option value="Vidaloka">Vidaloka</option>
                              <option value="Viga">Viga</option>
                              <option value="Voces">Voces</option>
                              <option value="Volkhov">Volkhov</option>
                              <option value="Vollkorn">Vollkorn</option>
                              <option value="Voltaire">Voltaire</option>
                              <option value="Waiting+for+the+Sunrise">Waiting for the Sunrise</option>
                              <option value="Wallpoet">Wallpoet</option>
                              <option value="Walter+Turncoat">Walter Turncoat</option>
                              <option value="Warnes">Warnes</option>
                              <option value="Wellfleet">Wellfleet</option>
                              <option value="Wendy+One">Wendy One</option>
                              <option value="Wire+One">Wire One</option>
                              <option value="Yanone+Kaffeesatz">Yanone Kaffeesatz</option>
                              <option value="Yellowtail">Yellowtail</option>
                              <option value="Yeseva+One">Yeseva One</option>
                              <option value="Yesteryear">Yesteryear</option>
                              <option value="Zeyada">Zeyada</option>
                           </select>
                        </div>
                        <div class="col-sm-5">
                           <select name="Body_font_size" class="form-control">
                              <option value="0"><?php echo $text_font_none; ?></option>
                              <?php if (isset($Body_font_size) && $Body_font_size !='0' ){ ?>
                              <option value="<?php echo $Body_font_size; ?>" selected><?php echo $text_font_default; ?></option>
                              <?php } ?>
                              <option value="11px">11px</option>
                              <option value="12px">12px</option>
                              <option value="13px">13px</option>
                              <option value="14px">14px</option>
                              <option value="15px">15px</option>
                              <option value="16px">16px</option>
                              <option value="17px">17px</option>
                              <option value="18px">18px</option>
                           </select>
                        </div>
                        <script>
                           $(document).ready(function(e) {
                           	var previewBox = $('#bodyFontPreview_block');
                           	var fontUrl = $('#bodyFontPreview');
                           	var selectFont = $('select[name="Body_font"]');
                           	var selectSize = $('select[name="Body_font_size"]');
                           	var selectWeight = $('select[name="Body_font_weight"]')
                           	
                           	function selectedFont(){
                           		if(selectFont.val() == '0'){
                           			previewBox.css("font-family",'');
                           			previewBox.css("display",'none');
                           		}else {
                           			var font = 	selectFont.val().replace(/\+/g," ");
                           			var link = "http://fonts.googleapis.com/css?family="+selectFont.val();
                           			fontUrl.attr('href', link);
                           			previewBox.css("font-family",'"'+font+'"');
                           			previewBox.css("display",'');
                           		}
                           		if(selectSize.val() == '0'){
                           			previewBox.css("font-size",'');	
                           		}else {
                           			previewBox.css("font-size",selectSize.val());
                           		}
                           		if(selectWeight.val() == '0'){
                           			previewBox.css("font-weight",'');	
                           		}else {
                           			previewBox.css("font-weight",selectWeight.val());
                           		}
                           	}
                           	selectedFont();
                           	
                           	selectFont.change(function(){
                           		if($(this).val() == '--'){
                           			previewBox.css("font-family",'');
                           			previewBox.css("display",'none');
                           		}else {
                           			var font = 	$(this).val().replace(/\+/g," ");
                           			var link = "http://fonts.googleapis.com/css?family="+$(this).val();
                           			fontUrl.attr('href', link);
                           			previewBox.css("font-family",'"'+font+'"');
                           			previewBox.css("display",'');
                           		}
                           	});
                           	selectSize.change(function(){
                           		if($(this).val() == '--'){
                           			previewBox.css("font-size",'');	
                           		}else {
                           			previewBox.css("font-size",$(this).val());
                           		}
                           	});
                           	selectWeight.change(function(){
                           		if($(this).val() == '--'){
                           			previewBox.css("font-weight",'');	
                           		}else {
                           			previewBox.css("font-weight",$(this).val());
                           		}
                           	});
                           });
                        </script>
                     </div>
                  </div>
                  <table id="module" class="table table-striped table-bordered table-hover">
                     <tbody>
                        <tr>
                           <td class="text-left"><?php echo $entry_bootstheme; ?></td>
                           <?php 
                              $style = array(
                              "0" => "Default",
                              "1" => "Amelia",
                              "2" => "Cerulean",
                              "3" => "Cosmo",
                              "4" => "Cyborg",
                              "5" => "Flatly",
                              "6" => "Journal",
                              "7" => "Readable",
                              "8" => "Simplex",
                              "9" => "Slate",
                              "10" => "Spacelab",
                              "11" => "United",
                              "12" => "Black White",
                              "13" => "Cirrus",
                              "14" => "Classic Gray",
                              "15" => "Dark Orange",
                              "16" => "Dron",
                              "17" => "Flat Brown",
                              "18" => "Flat Dark",
                              "19" => "Glossy Green",
                              "20" => "Robotron Yellow",
                              "21" => "Supervillain",
                              "22" => "White Blue",
                              "23" => "White Green",
                              "24" => "White Plum",
                              "25" => "Minimal Brown",
							  "26" => "iOS Bootstrap"
                              );
                              ?>
                        </tr>
                        <tr>
                           <td>
                              <?php foreach ($style as $style_key => $style_name) { ?>
                              <label class="bt" for="bt<?php echo $style_key; ?>">
                              <input id="bt<?php echo $style_key; ?>" type="radio" name="adminstyle" value="<?php echo $style_key; ?>" <?php if ($style_key == $adminstyle) echo ' checked=true';?> />
                              <img class="img-responsive" src="view/image/<?php echo $style_key; ?>.png" /><span><?php echo $style_name; ?></span>
                              </label>
                              <?php } ?>
                           </td>
                        </tr>
                     </tbody>
                  </table>
               </div>
               <!--end tab-custom-->
               <div class="tab-pane" id="tab-chart">
                  <div class="well">
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-google_api"><?php echo $text_google_api_code; ?></label>
                        <div class="col-sm-10">
                           <input type="text" name="google_api_code" value="<?php echo $google_api_code; ?>" placeholder="" id="input-google_api" class="form-control" />
                           <span class="help-block"><?php echo $help_google_api_code; ?></span>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-google_profile_id"><?php echo $text_google_profile_id; ?></label>
                        <div class="col-sm-10">
                           <input type="text" name="google_profile_id" value="<?php echo $google_profile_id; ?>" placeholder="" id="input-google_profile_id" class="form-control" />
                        </div>
                     </div>
                  </div>
		<!-- Calendar -->
		<div class="well">
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-gcal_feed"><?php echo $text_gcal_feed; ?> <a href="https://support.google.com/calendar/answer/37103"><i class="fa fa-question-circle"></i></a></label>
                        <div class="col-sm-10">
                           <input type="text" name="gcal_feed" value="<?php echo $gcal_feed; ?>" id="input-gcal_feed" class="form-control" />
				<span class="help">ex. http://www.google.com/calendar/feeds/usa__en%40holiday.calendar.google.com/public/basic</span>
                        </div>
                     </div>
                  </div>

               </div>
               <div class="tab-pane" id="tab-custom-css">
                  <div class="well">
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-custom-css"><?php echo $text_custom_css; ?></label>
                        <div class="col-sm-10">
                           <textarea name="customcss" rows="5" placeholder="/* Your custom css code here */" id="input-custom-css" class="form-control"><?php echo $customcss; ?></textarea>
                           <span class="help-block"><?php echo $text_custom_css_help; ?></span>
                           <button type="button" id="preview" class="btn btn-success"><i class="fa fa-eye"></i> <?php echo $text_button_preview; ?></button> <button type="submit" form="form-bootstheme" class="btn btn-primary"><i class="fa fa-check"></i> <?php echo $button_save; ?></button> <button type="button" id="reset" class="btn btn-primary"><i class="fa fa-rotate-right"></i> <?php echo $text_button_reset; ?></button>
                        </div>
                     </div>
                     <div class="form-group">
                        <label class="col-sm-2 control-label" for="input-subtract"><?php echo $text_status; ?></label>
                        <div class="col-sm-10">
                           <div class="btn-group" data-toggle="buttons">
                              <label class="btn btn-primary<?php if ($customskinop == 1) { ?> active<?php } ?>">
                              <i class="fa fa-check"></i> <input type="radio" name="customskinop" id="input-custom-skin-option" value="1" <?php if ($customskinop == 1) { ?>checked<?php } ?>> <?php echo $text_button_enabled; ?>
                              </label>
                              <label class="btn btn-primary<?php if ($customskinop == 0) { ?> active<?php } ?>">
                              <i class="fa fa-times"></i> <input type="radio" name="customskinop" id="input-custom-skin-option" value="0" <?php if ($customskinop == 0) { ?>checked<?php } ?>> <?php echo $text_button_disabled; ?>
                              </label>
                           </div>
                        </div>
                     </div>
                  </div>
                  <iframe width="100%" height="500px" scrolling="yes" id="screen" src="<?php echo $this->config->get('config_url'); ?>/admin/index.php?route=common/home&token=<?php echo $this->session->data['token']; ?>"></iframe>
         </form>
         <p>Thank you for purchased Bootstrap 3 Admin Theme. <i class="fa fa-smile-o-o"></i></p>
         </div>
         <div class="panel-footer">
         <div class="pull-right">
         Powered by <a class="btn btn-success btn-xs" href="http://patrickchia.com/">Patrick</a><!-- CakeDeliver http://cakedeliver.com/ --> 
         <button type="submit" form="form-bootstheme" class="btn btn-primary btn-xs"><i class="fa fa-check"></i> <?php echo $button_save; ?></button>
         <a href="<?php echo $cancel; ?>" class="btn btn-danger btn-xs"><i class="fa fa-times"></i> <?php echo $button_cancel; ?></a></div>
         <h1 class="panel-title">.</h1>
         </div>
         </div>
      </div>
   </div>
</div>
<div class="modal fade" id="dialog" data-field="" data-thumb="">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          <h4 class="modal-title"><?php echo $text_image_manager; ?></h4>
        </div>
        <div class="modal-body">
         <iframe id="fm-iframe" style="display:block; border:0; padding:0; margin:0; width:100%; height:360px; overflow:auto;"></iframe>
        </div>
        <div class="modal-footer">
	    <a href="#" id="dialog-confirm" class="btn btn-success hide"><i class="fa fa-thumbs-up"></i> Confirm</a>
	    <a href="#" class="btn btn-success" data-dismiss="modal" aria-hidden="true">Close</a>
        </div>
      </div>
    </div>
  </div>
<script>
function image_upload(field, thumb) {

	$('#dialog').attr('data-field', field);
	$('#dialog').attr('data-thumb', thumb);
	$('#dialog #fm-iframe').attr('src', 'index.php?route=common/filemanager&token=<?php echo $token; ?>&field=' + encodeURIComponent(field));
};

	$(document.body).on('show.bs.modal', '#dialog', function () {
		$(this).find('#dialog-confirm').addClass('hide');
	});

	$(document.body).on('hidden.bs.modal', '#dialog', function () {
		var field = $(this).attr('data-field');
		var thumb = $(this).attr('data-thumb');

		if ($('#' + field).attr('value')) {
			$.ajax({
				url: 'index.php?route=common/filemanager/image&token=<?php echo $token; ?>&image=' + encodeURIComponent($('#' + field).val()),
				dataType: 'text',
				success: function(data) {
					$('#' + thumb).replaceWith('<img src="' + data + '" alt="" id="' + thumb + '">');
				}
			});
		}
		$('#dialog').attr('data-field', '');
		$('#dialog').attr('data-thumb', '');
		$('#dialog #fm-iframe').attr('src', '');
	});

</script>
<script type="text/javascript">
   jQuery("#preview").on("click", function(){
   	$('iframe#screen').contents().find('head #pscreen').remove();
   	$('head #pscreen').remove();
   	var previewCSS = $('textarea#input-custom-css').val();
   
   	$('iframe#screen').contents().find('head').append('<style id="pscreen">'+previewCSS+'</style>');
   	$('head').append('<style id="pscreen">'+previewCSS+'</style>');
   });
   jQuery("#reset").on("click", function(){
   	$('iframe#screen').contents().find('head #pscreen').remove();
   	$('head #pscreen').remove();
   	//$('textarea#input-custom-css').val('');
   });
   
   jQuery('input[name="navbar"]:radio').on("change", function(){
   	if ($(this).val() == 1) {
   		$( "header" ).removeClass( "navbar-inverse" );
   		$( "header" ).addClass( "navbar-default" );
   	} else {
   		$( "header" ).removeClass( "navbar-default" );
   		$( "header" ).addClass( "navbar-inverse" );
   	}
   });
</script>
<?php echo $footer; ?>