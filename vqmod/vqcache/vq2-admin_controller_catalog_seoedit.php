<?php 
class ControllerCatalogSeoEdit extends Controller { 
	
	public function index() {
	
		if($_POST['id'])
		{
		$id=mysql_escape_String($_POST['id']);
		$keyword = $this->db->escape($_POST['keyword']);
$custom_title = $this->db->escape($_POST['custom_title']);
		$meta_keyword = $this->db->escape($_POST['meta_keyword']);
		$meta_description = $this->db->escape($_POST['meta_description']);
		$tags = $this->db->escape($_POST['tags']);
		$language_id = $this->db->escape($_POST['lang']);

		if (strpos('x'.$id, 'Product') != false)
			{
			$id = str_replace('Product','',$id);
			$id = (int)$id;
			
			$query = $this->db->query("delete from " . DB_PREFIX . "url_alias where language_id = $language_id and query = 'product_id=$id';");
			if ($keyword<>'') {$query = $this->db->query("insert into " . DB_PREFIX . "url_alias(language_id, query, keyword) values($language_id,'product_id=$id','$keyword');");}
			
$query = $this->db->query("update " . DB_PREFIX . "product_description set custom_title = '$custom_title' where product_id = $id and language_id = $language_id;");
			$query = $this->db->query("update " . DB_PREFIX . "product_description set meta_keyword = '$meta_keyword' where product_id = $id and language_id = $language_id;");
			$query = $this->db->query("update " . DB_PREFIX . "product_description set meta_description = '$meta_description' where product_id = $id and language_id = $language_id;");
			$query = $this->db->query("update " . DB_PREFIX . "product_description set tag = '$tags' where product_id = $id and language_id = $language_id;");
			
			
			
			
			}

		if (strpos('x'.$id, 'Category') != false)
			{
			$id = str_replace('Category','',$id);
			$id = (int)$id;
			
			$query = $this->db->query("delete from " . DB_PREFIX . "url_alias where language_id = $language_id and query = 'category_id=$id';");
			if ($keyword<>'') {$query = $this->db->query("insert into " . DB_PREFIX . "url_alias(language_id, query, keyword) values($language_id,'category_id=$id','$keyword');");}
			
			$query = $this->db->query("update " . DB_PREFIX . "category_description set meta_keyword = '$meta_keyword' where category_id = $id and language_id = $language_id;");
			$query = $this->db->query("update " . DB_PREFIX . "category_description set meta_description = '$meta_description' where category_id = $id and language_id = $language_id;");
				
			}
			
		if (strpos('x'.$id, 'Information') != false)
			{
			$id = str_replace('Information','',$id);
			$id = (int)$id;
			
			$query = $this->db->query("delete from " . DB_PREFIX . "url_alias where language_id = $language_id and query = 'information_id=$id';");
			if ($keyword<>'') {$query = $this->db->query("insert into " . DB_PREFIX . "url_alias(language_id, query, keyword) values($language_id,'information_id=$id','$keyword');");}
					
			}
			
		if (strpos('x'.$id, 'Manufacturer') != false)
			{
			$id = str_replace('Manufacturer','',$id);
			$id = (int)$id;
			
			$query = $this->db->query("delete from " . DB_PREFIX . "url_alias where language_id = $language_id and query = 'manufacturer_id=$id';");
			if ($keyword<>'') {$query = $this->db->query("insert into " . DB_PREFIX . "url_alias(language_id, query, keyword) values($language_id,'manufacturer_id=$id','$keyword');");}
					
			}
	

	
		}	
		 
	}
	

	
}
?>