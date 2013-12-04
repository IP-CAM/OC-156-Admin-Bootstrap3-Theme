<?php
class ControllerFeedGoogleSitemapExtra extends Controller {
   public function index() {
	  if ($this->config->get('google_sitemap_status')) {
		 $output  = '<?xml version="1.0" encoding="UTF-8"?>';
		 $output .= '<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">';
		 
		 $fields = array();
		 $query = $this->db->query("SELECT DISTINCT ua.keyword FROM " . DB_PREFIX . "url_alias ua INNER JOIN " . DB_PREFIX . "language l on l.language_id = ua.language_id where l.code = '". $_GET["language"] ."';");
		 $fields = $query->rows;
		 $squery = $this->db->query("SELECT `value` FROM `" . DB_PREFIX . "setting` WHERE `key` = 'config_language'");
		 
		 foreach ($fields as $field) {
			$output .= '<url>';
			$output .= '<loc>' . HTTP_SERVER . (($_GET["language"] <> $squery->row['value']) ? ($_GET["language"] . '/') : '') . $field['keyword'] . '</loc>';
			$output .= '<changefreq>weekly</changefreq>';
			$output .= '<priority>1.0</priority>';
			$output .= '</url>';   
		 }
		 
		 $output .= '</urlset>';
		 
		 $this->response->addHeader('Content-Type: application/xml');
		 $this->response->setOutput($output);
	  }
   }  
     
}
?>