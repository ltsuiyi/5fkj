<?php


namespace app\admin\controller;


use app\BaseController;
use think\App;
use think\Request;

class Base extends BaseController
{

    protected $post;
    protected $get;
    public function initialize()
    {
        $this->post = request()->isPost();
        $this->get  = request()->isGet();

    }
}