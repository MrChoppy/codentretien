<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Administration extends CI_Controller{

	public function __construct(){
		parent::__construct();
		$this->userID = 0;
		if(isset($this->session->userdata['logged_in'])){
			$this->userID = $this->session->userdata['logged_in']['id'];
		}
	}

	public function index(){
			if($this->permission->user_as_permission($this->userID, 1)){

				echo 'oui';			
			}else{
				echo 'accès refusé';
			}
		}
}
?>