<?php
/*

This file is auto generated from a template file

*/

class ControllerModuleBootsTheme extends Controller {
	
	private $error = array(); 
	public function index() {
		$this->load->language('module/bootstheme');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
		$this->load->model('tool/image');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			if (isset($this->request->post['customcss'])){
				$customcss = filter_input(INPUT_POST, 'customcss', FILTER_UNSAFE_RAW);
				$cssfile = DIR_APPLICATION . 'view/stylesheet/custom.css';
				// Open the file to get existing content
				//$current = file_get_contents($file);
				// Append a new person to the file
				//$current .= "John Smith\n";
				// Write the contents back to the file
				file_put_contents($cssfile, $customcss);

			}

			$this->model_setting_setting->editSetting('adminstyle', $this->request->post);		

			$this->session->data['success'] = $this->language->get('text_success');	

			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));


		}

		$text_strings = array(
				'heading_title',
				'text_enabled',
				'text_disabled',
				'text_content_top',
				'text_content_bottom',
				'text_column_left',
				'text_column_right',
				'entry_layout',
				'entry_limit',
				'entry_image',
				'entry_position',
				'entry_status',
				'entry_sort_order',
				'button_save',
				'button_cancel',
				'button_add_module',
				'button_remove',
				'text_skins',
				'text_custom_css',
				'text_custom_css_help',
				'text_button_preview',
				'text_button_reset',
				'text_status',
				'text_button_enabled',
				'text_button_disabled',
				'text_navbar',
				'text_button_default',
				'text_button_inverse',
				'text_position',
				'text_left',
				'text_top',
				'text_bottom',
				'entry_bootstheme',
				'text_google_profile_id',
				'text_google_api_code',
				'help_google_api_code',
				'text_chart',
				'text_font',
				'text_font_default',
				'text_font_none',
				'text_gcal_feed',
				'text_adminlogo',
				'text_custom_logo',
				'text_browse',
				'text_clear',
				'text_image_manager'
		);
		
		foreach ($text_strings as $text) {
			$this->data[$text] = $this->language->get($text);
		}
		$config_data = array(
			'adminstyle',
			'navbar',
			'position',
			'customskin',
			'customskinop',
			'google_api_code',
			'google_profile_id',
			'Body_font',
			'Body_font_size',
			'gcal_feed',
			'adminlogo',
			'custom_logo'
		);
		
		foreach ($config_data as $conf) {
			if (isset($this->request->post[$conf])) {
				$this->data[$conf] = $this->request->post[$conf];
			} else {
				$this->data[$conf] = $this->config->get($conf);
				if ($this->data[$conf]) {
					$this->data[$conf] = $this->data[$conf];
				}
			}
		}


		/*if ($this->config->get('custom_logo') && file_exists(DIR_IMAGE . $this->config->get('custom_logo')) && is_file(DIR_IMAGE . $this->config->get('custom_logo'))) {
                        $this->data['custom_logo'] = $this->model_tool_image->resize($this->config->get('custom_logo'), 100, 100);                
                } else {
                        $this->data['custom_logo'] = $this->config->get('custom_logo');
                }*/
	
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/bootstheme', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		$this->data['token'] = $this->session->data['token'];
		$this->data['action'] = $this->url->link('module/bootstheme', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		$cssfile = DIR_APPLICATION . 'view/stylesheet/custom.css';
		if (file_exists($cssfile)) {
			$this->data['customcss'] = file_get_contents($cssfile);
		} else {
			$this->data['customcss'] = "/* Your custom css here */";
		}

	
		//This code handles the situation where you have multiple instances of this module, for different layouts.
		$this->data['modules'] = array();
		
		if (isset($this->request->post['bootstheme_module'])) {
			$this->data['modules'] = $this->request->post['bootstheme_module'];
		} elseif ($this->config->get('bootstheme_module')) { 
			$this->data['modules'] = $this->config->get('bootstheme_module');
		}		

		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		//Choose which template file will be used to display this request.
		$this->template = 'module/bootstheme.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		//Send the output.
		$this->response->setOutput($this->render());
	}
	
	/*
	 * 
	 * This function is called to ensure that the settings chosen by the admin user are allowed/valid.
	 * You can add checks in here of your own.
	 * 
	 */
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/bootstheme')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		return (!$this->error);
	}

	public function install() {
       		$this->load->model('module/bootstheme');
       		$this->model_module_bootstheme->createTables(); 
 
       		$this->load->model('setting/setting');
			$this->model_setting_setting->editSetting('bootstheme', array('adminstyle'=>'0','navbar'=>'','position'=>'','customskin'=>'','customskinop'=>'','google_api_code' => '', 'google_profile_id' => '','Body_font' =>'', 'Body_font_size' =>''));
   	}

	public function uninstall() {
        	$this->load->model('module/bootstheme');
        	$this->model_module_bootstheme->deleteTables();

        	$this->load->model('setting/setting');
        	$this->model_setting_setting->deleteSetting('bootstheme');
    }


}
?>