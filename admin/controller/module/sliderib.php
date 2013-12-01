<?php

class ControllerModuleSliderib extends Controller
{
	protected $error;

	public function index()
	{
		$this->load->language('design/banner');
		$this->load->language('module/sliderib');
		$this->load->model('design/banner');
		$this->load->model('setting/setting');
		$this->load->model('tool/image');

		if ($this->request->server['REQUEST_METHOD'] == 'POST' && $this->validate()) {
			$this->model_setting_setting->editSetting('sliderib', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$this->data['error_warning'] = isset($this->error) ? $this->error : '';
		$this->document->setTitle($this->language->get('heading_title'));
		$this->data['breadcrumbs'] = $this->getBaseBreadcrumbs();
		$this->data['action'] = $this->url->link('module/sliderib', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['token'] = $this->session->data['token'];


		$this->load->model('localisation/language');
		$this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$this->assignTextStringsTo($this->data, array(
			'heading_title',
			'button_save',
			'button_cancel',
			'button_remove',
			'button_add_banner',
			'entry_status',
			'text_disabled',
			'text_enabled',
			'text_browse',
			'text_clear',
			'text_image_manager',

			'sliderib_entry_text',
			'sliderib_entry_text1',
			'sliderib_entry_text2',
			'sliderib_entry_text3',
			'sliderib_entry_button',
			'sliderib_entry_button1',
			'sliderib_entry_button2',
			'sliderib_entry_link',
			'sliderib_entry_image',
			'sliderib_entry_order',
			'sliderib_status',
			
		));

		if (isset($this->request->post['sliderib_status'])) {
			$this->data['sliderib_status'] = $this->request->post['sliderib_status'];
		} elseif ($this->config->get('sliderib_status')) { 
			$this->data['sliderib_status'] = $this->config->get('sliderib_status');
		} else {
			$this->data['sliderib_status'] = 0;
		}

		$this->data['sliderib'] = array();
		if (isset($this->request->post['sliderib'])) {
			$this->data['sliderib'] = $this->request->post['sliderib'];
		} elseif ($this->config->get('sliderib')) { 
			$this->data['sliderib'] = $this->config->get('sliderib');
		}

		foreach ($this->data['sliderib'] as $number=>$slide) {
			if ($slide['imgurl'] && file_exists(DIR_IMAGE.$slide['imgurl'])) {
				$img = $slide['imgurl'];
			} else {
				$img = 'no_image.jpg';
			}
			$this->data['sliderib'][$number]['img'] = $this->model_tool_image->resize($img, 100, 100);
			$this->data['sliderib'][$number]['imgurl'] = $img;
			//$this->data['sliderib'][$number]['imgslide'] = $this->model_tool_image->resize($img, 1114, 744);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);

		$this->template = 'module/sliderib.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);

		$this->response->setOutput($this->render());
	}


	protected function validate()
	{
		if (!$this->user->hasPermission('modify', 'module/sliderib'))
			$this->error = $this->language->get('error_permission');

		return !isset($this->error);
	}


	protected function getBaseBreadcrumbs()
	{
		return array(
			array(
				'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ''
			),
			array(
				'text'      => $this->language->get('text_module'),
				'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			),
			array(
				'text'      => $this->language->get('heading_title'),
				'href'      => $this->url->link('module/sliderib', 'token=' . $this->session->data['token'], 'SSL'),
				'separator' => ' :: '
			)
		);
	}


	protected function assignTextStringsTo(&$var, array $text_strings)
	{
		foreach ($text_strings as $text)
			$var[$text] = $this->language->get($text);
	}


	protected function assignConfigTo(&$var, array $config_data)
	{
		foreach ($config_data as $conf => $default) {
			$var[$conf] = $this->getConfigByKey($conf, $default);
		}
	}


	protected function assignI18nConfigTo(&$var, array $languages, array $config_data)
	{
		foreach ($config_data as $conf => $default) {
			foreach ($languages as $language) {
				$k = $conf . '_' . $language['code'];
				$var[$k] = $this->getConfigByKey($k, $default);
			}
		}
	}


	protected function getConfigByKey($key, $default)
	{
		$config_value = $this->config->get($key);
		return isset($this->request->post[$key]) ? $this->request->post[$key] : (($config_value !== null) ? $config_value : (is_string($default) ? htmlspecialchars($default) : $default));
	}

}
